Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF5BD8EE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 09:19:16 +0200 (CEST)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD1Zz-0002SM-1s
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 03:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD1Db-0008Uf-E5
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 02:56:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD1DZ-0000Pw-S3
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 02:56:06 -0400
Received: from 16.mo5.mail-out.ovh.net ([87.98.174.144]:33448)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD1DZ-0000Nw-JK
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 02:56:05 -0400
Received: from player755.ha.ovh.net (unknown [10.109.159.62])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 1472624FC92
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 08:56:02 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player755.ha.ovh.net (Postfix) with ESMTPSA id CE371A494910;
 Wed, 25 Sep 2019 06:55:51 +0000 (UTC)
Subject: Re: [PATCH 01/20] xics: Use incomplete type for XICSFabric
To: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20190925064534.19155-1-david@gibson.dropbear.id.au>
 <20190925064534.19155-2-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f20d189d-14ea-28e7-741b-68186ea608a8@kaod.org>
Date: Wed, 25 Sep 2019 08:55:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190925064534.19155-2-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1117455659759340504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.174.144
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 groug@kaod.org, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/09/2019 08:45, David Gibson wrote:
> Interface instances should never be directly dereferenced.  So, the common
> practice is to make them incomplete types to make sure no-one does that.
> XICSFrabric, however, had a dummy type which is less safe.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  include/hw/ppc/xics.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
> index 64a2c8862a..1ae34ce9cd 100644
> --- a/include/hw/ppc/xics.h
> +++ b/include/hw/ppc/xics.h
> @@ -147,9 +147,7 @@ struct ICSIRQState {
>      uint8_t flags;
>  };
>  
> -struct XICSFabric {
> -    Object parent;
> -};
> +typedef struct XICSFabric XICSFabric;
>  
>  #define TYPE_XICS_FABRIC "xics-fabric"
>  #define XICS_FABRIC(obj)                                     \
> 

you should also change :

#define XICS_FABRIC(obj)                                     \
    OBJECT_CHECK(XICSFabric, (obj), TYPE_XICS_FABRIC)


and use INTERFACE_CHECK()

C.

