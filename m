Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A19317E754
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 19:38:30 +0100 (CET)
Received: from localhost ([::1]:47906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBNIL-0003rR-7t
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 14:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1jBNGl-0002dS-Op
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alxndr@bu.edu>) id 1jBNGj-0003Nk-E8
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:36:51 -0400
Received: from relay68.bu.edu ([128.197.228.73]:60383)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alxndr@bu.edu>) id 1jBNGi-0003Mi-Eo
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:36:49 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 029Ia3nQ004630
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 9 Mar 2020 14:36:07 -0400
Date: Mon, 9 Mar 2020 14:36:03 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Subject: Re: [RFC PATCH] audio: proper support for float samples in mixeng
Message-ID: <20200309183603.mimjt2vexogcq5ya@mozz.bu.edu>
References: <8a8b0b5698401b78d3c4c8ec90aef83b95babb06.1580672076.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a8b0b5698401b78d3c4c8ec90aef83b95babb06.1580672076.git.DirtY.iCE.hu@gmail.com>
User-Agent: NeoMutt/20180716
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by relay68.bu.edu id
 029Ia3nQ004630
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 128.197.228.73
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Markus Armbruster <armbru@redhat.com>, rth@redhat.com,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,
On 200202 2038, K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n wrote:
> -void conv_natural_float_to_stereo(struct st_sample *dst, const void *s=
rc,
> -                                  int samples)
> +#ifdef FLOAT_MIXENG
> +#define FLOAT_CONV_TO(x) (x)
> +#define FLOAT_CONV_FROM(x) (x)
> +#else
> +static const float float_scale =3D UINT_MAX;
> +#define FLOAT_CONV_TO(x) ((x) * float_scale)
> +
> +#ifdef RECIPROCAL
> +static const float float_scale_reciprocal =3D 1.f / UINT_MAX;
> +#define FLOAT_CONV_FROM(x) ((x) * float_scale_reciprocal)
> +#else
> +#define FLOAT_CONV_FROM(x) ((x) / float_scale)
> +#endif
> +#endif

This brings up errors, when building with clang-10+:
error: implicit conversion from 'unsigned int' to 'float' changes value f=
rom 4294967295 to 4294967296 [-Werror,-Wimplicit-int-float-conversion]
static const float float_scale =3D UINT_MAX;

Would this work?
#include <math.h>
#define FLOAT_CONV_TO(x) ((x) * nextafter(0x1p32, 0));
#define FLOAT_CONV_FROM(x) ((x) / nextafter(0x1p32, 0));

I asked on IRC about this and with Richard's help, I tried:
FLOAT_CONV_TO(x) ((x) * (int64_t)UINT32_MAX)
FLOAT_CONV_FROM(x) ((x) / UINT32_MAX)

since dst->l,r are integers when !FLOAT_MIXENG, this might avoid an
int->float->int conversion , but this still raises warning since *in is
a float.

Thanks
-Alex

