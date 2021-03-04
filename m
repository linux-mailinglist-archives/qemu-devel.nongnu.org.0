Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59D32DDE8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 00:38:44 +0100 (CET)
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHxYI-0004lD-NC
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 18:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHxXE-0004DU-LJ
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 18:37:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHxXC-00023P-1R
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 18:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614901052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7eV53P6gPt+EMTD3bVRy/OL+MjoNT2g91ST5pIJ/uTc=;
 b=DFwpQ0FBKi+GS//MCcNs4r1GchKjFTEEZD8/KeYitC762DoIwet6I5ag+Ti7J0GZz0nD8a
 9LCDrwpXPEva7IN+aoq4ZFYNJekfLZI/fnHvolYFHcjF2sevlSXT2Hm8CMRBKSBygs/jSQ
 CBWjxoLWPsCsE0DvGOSipPV3QOcY2dA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-_cjHBxxdNia9giW0A7ABEA-1; Thu, 04 Mar 2021 18:37:29 -0500
X-MC-Unique: _cjHBxxdNia9giW0A7ABEA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5778F1084C97;
 Thu,  4 Mar 2021 23:37:28 +0000 (UTC)
Received: from [10.10.118.103] (ovpn-118-103.rdu2.redhat.com [10.10.118.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82ABB19C48;
 Thu,  4 Mar 2021 23:37:27 +0000 (UTC)
Subject: Re: [PATCH] hw/sd/sdhci: Report error when guest access protected
 registers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210218175648.1636219-1-f4bug@amsat.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <fdac84ee-8c86-036b-1db5-a174cb8f530c@redhat.com>
Date: Thu, 4 Mar 2021 18:37:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218175648.1636219-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 12:56 PM, Philippe Mathieu-Daudé wrote:
> The SDHC_SYSAD and SDHC_BLKSIZE can not be accessed while a
> transaction is in progress, see 'SD Host Controller Simplified
> Specification'
> 
>    1.5) SD Command Generation
> 
>    The Host Driver should not read the SDMA System Address, Block
>    Size and Block Count registers during a data transaction unless
>    the transfer is stopped because the value is changing and not
>    stable.
> 

Naive question: Is this an RFC2119 "SHOULD NOT"? (i.e., does it have a 
defined behavior that you are simply encouraged to avoid?)

Is it really an error?

> Report guest intents as errors.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/sd/sdhci.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 5b8678110b0..98928c18542 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1136,6 +1136,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>                       sdhci_sdma_transfer_single_block(s);
>                   }
>               }
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Transfer already in progress,"
> +                          " can not update SYSAD", __func__);
>           }
>           break;
>       case SDHC_BLKSIZE:
> @@ -1163,8 +1167,11 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>               if (blksize != s->blksize) {
>                   s->data_count = 0;
>               }
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Transfer already in progress,"
> +                          " can not update BLKSIZE", __func__);
>           }
> -
>           break;
>       case SDHC_ARGUMENT:
>           MASKED_WRITE(s->argument, mask, value);
> 


