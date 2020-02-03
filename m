Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DB71502DF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 10:00:23 +0100 (CET)
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyXag-0008Ou-Ur
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 04:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vr_qemu@t-online.de>) id 1iyXZf-00079Q-Mw
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 03:59:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vr_qemu@t-online.de>) id 1iyXZe-00076t-Ip
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 03:59:19 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:32814)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vr_qemu@t-online.de>) id 1iyXZe-00074H-C9
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 03:59:18 -0500
Received: from fwd01.aul.t-online.de (fwd01.aul.t-online.de [172.20.27.147])
 by mailout02.t-online.de (Postfix) with SMTP id C9FD741E5360;
 Mon,  3 Feb 2020 09:59:15 +0100 (CET)
Received: from [192.168.211.200]
 (TJyVLOZG8hv+tc3Q8NDqocNBRgJ3Zi4cnFZx92F4zI1++Q5deHNRklB1be6as1fZuN@[93.236.154.40])
 by fwd01.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1iyXZb-2S8ifY0; Mon, 3 Feb 2020 09:59:15 +0100
Subject: Re: [RFC PATCH] audio: proper support for float samples in mixeng
To: =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
References: <8a8b0b5698401b78d3c4c8ec90aef83b95babb06.1580672076.git.DirtY.iCE.hu@gmail.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Message-ID: <417d2c7a-b3d9-a7e3-d36d-6664f7b07318@t-online.de>
Date: Mon, 3 Feb 2020 09:59:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <8a8b0b5698401b78d3c4c8ec90aef83b95babb06.1580672076.git.DirtY.iCE.hu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-ID: TJyVLOZG8hv+tc3Q8NDqocNBRgJ3Zi4cnFZx92F4zI1++Q5deHNRklB1be6as1fZuN
X-TOI-MSGID: 5e1ae014-f6e9-4df1-b36f-23afb32a8274
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 194.25.134.17
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> This adds proper support for float samples in mixeng by adding a new
> audio format for it.
>
> Limitations: only native endianness is supported.
>
> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.c=
om>
> ---
>
> This patch is meant to be applied on top of "[PATCH] coreaudio: fix cor=
eaudio
> playback" by Volker R=C3=BCmelin, available at:
> https://lists.nongnu.org/archive/html/qemu-devel/2020-02/msg00114.html
>
> For more information, please refer to that thread.
>

Hi Zolt=C3=A1n,

I like this patch. This is something I had in mind for 5.1. I will test a=
nd review the patch,=C2=A0 but I need a few days.

With best regards,
Volker

