Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D75623DB0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 09:42:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot38W-0006cr-HL; Thu, 10 Nov 2022 03:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot38M-0006aG-MT
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:42:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot38L-0003No-7O
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668069720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjG9CdLG8sgwONgHrpMJ1Gjmyv65c9CxHNl1wRVAcEQ=;
 b=JHcS7DZnKSsEUOLos1yofeEdAW+Z5FoC2UTysNmPqu/nW3Q3Alj8lgjEOmj8VdqyBy4oFB
 rY2YJBHTMY3B7Ns0ZFNVCWFLGiOPynARLpA2cEzlB88esjegdSOs4eg7j0tl4G0uELnzPP
 Qe2DutPPRekvI+IdSTuPGkuN5dQGmjc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-KEyatlALNYGTgO25LRSYpg-1; Thu, 10 Nov 2022 03:41:58 -0500
X-MC-Unique: KEyatlALNYGTgO25LRSYpg-1
Received: by mail-pj1-f71.google.com with SMTP id
 oo18-20020a17090b1c9200b0020bdba475afso3057488pjb.4
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 00:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mjG9CdLG8sgwONgHrpMJ1Gjmyv65c9CxHNl1wRVAcEQ=;
 b=aQxsDC5kvzd/E0P5bjxERjATPE3y6jhh6Q+mnhVrMB+QYbf3RXzc+kGucmArbdAi6X
 fXUBiuTbjVPyCxjx35KIGWpmhKVouTWlG3bgsiWkoBc3JtlrVTtCDC5x3QNiLTS2IU93
 k1qnMgyzHDoqhEoQEvpiwFAJqqaCoAoGBOrBU8PL+6BuKL5cmXfctRUXwKW6CbjzpjvT
 no6tjmMseBWrdx31OycODw8GujAffMeAO4WKQgLVVMgftqh3IF0cUTENcixNVRq/kUBX
 srtaSxGE3ZmMfBZ33fLz+aVliz/jgoJzk8bFIsyViteFusNl5q3jEzCrKfynbwKZOX43
 0HQQ==
X-Gm-Message-State: ACrzQf1BKSMvTFHRCRxGI95uEaAXxbh+kkLd3xmTj0XVHlOXm+27BEXV
 YWa2pS4hklxi2+cQ5dVXnnw/in8girkSfPXCUDen2/dNL4KlV+jnRmuD/DemwtMFOgjFpIPQCvw
 oO8TnDzfi+I8315Q=
X-Received: by 2002:a63:454d:0:b0:43c:e834:ec0 with SMTP id
 u13-20020a63454d000000b0043ce8340ec0mr56906743pgk.270.1668069717476; 
 Thu, 10 Nov 2022 00:41:57 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6jOXDEDijanHATm5UPYim3hNODDRjQhMjdGMXWzAIiXgbamoQ1p8j8rAr4NYGN+1Zs7nj7lA==
X-Received: by 2002:a63:454d:0:b0:43c:e834:ec0 with SMTP id
 u13-20020a63454d000000b0043ce8340ec0mr56906734pgk.270.1668069717165; 
 Thu, 10 Nov 2022 00:41:57 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 b5-20020aa79505000000b0056bfd4a2702sm9592130pfp.45.2022.11.10.00.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 00:41:56 -0800 (PST)
Message-ID: <071437fe-49c6-8d4f-9061-416071a2a9fb@redhat.com>
Date: Thu, 10 Nov 2022 09:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] tulip: Remove unused variable
Content-Language: en-US
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <cover.1668009030.git.mrezanin@redhat.com>
 <02e1560d115c208df32236df8916fed98429fda1.1668009030.git.mrezanin@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <02e1560d115c208df32236df8916fed98429fda1.1668009030.git.mrezanin@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/11/2022 16.57, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Variable n used in tulip_idblock_crc function is only incremented but never read.
> This causes 'Unused but set variable' warning on Clang 15.0.1 compiler.
> 
> Removing the variable to prevent the warning.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   hw/net/tulip.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> index b9e42c322a..c2b3b1bdfa 100644
> --- a/hw/net/tulip.c
> +++ b/hw/net/tulip.c
> @@ -870,11 +870,10 @@ static const MemoryRegionOps tulip_ops = {
>   
>   static void tulip_idblock_crc(TULIPState *s, uint16_t *srom)
>   {
> -    int word, n;
> +    int word;
>       int bit;
>       unsigned char bitval, crc;
>       const int len = 9;
> -    n = 0;
>       crc = -1;
>   
>       for (word = 0; word < len; word++) {
> @@ -887,7 +886,6 @@ static void tulip_idblock_crc(TULIPState *s, uint16_t *srom)
>                   srom[len - 1] = (srom[len - 1] & 0xff00) | (unsigned short)crc;
>                   break;
>               }
> -            n++;
>               bitval = ((srom[word] >> bit) & 1) ^ ((crc >> 7) & 1);
>               crc = crc << 1;
>               if (bitval == 1) {

Reviewed-by: Thomas Huth <thuth@redhat.com>


