Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441A55BCC28
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 14:50:37 +0200 (CEST)
Received: from localhost ([::1]:34496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGEM-0002U3-9I
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 08:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaG8k-0006to-D4
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:44:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaG8g-0007wN-Mc
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663591481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1oF5ARrecMtl5bfkwvkwnfdfKckouF8gCHnHbzzDS8k=;
 b=FudBKENu7g20S8WAgpYy3u0yeUVBde5/ghpd4FteMa/rT3DH9+/y6Q9lkhIKdRZrFNok0n
 ilaqIeOfm7p1p2zmtVPuZ5jhd/d644mCH3wkLdGtQxjGqclcSo9dOh4Bc42wwNUEQLxhfG
 gvyGd4nZAv2RAOp/b1hBvXctXQK41h0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-8JV5h6laO--R6l3o5X15zQ-1; Mon, 19 Sep 2022 08:44:40 -0400
X-MC-Unique: 8JV5h6laO--R6l3o5X15zQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 e18-20020adfa452000000b00228a420c389so6512089wra.16
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 05:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1oF5ARrecMtl5bfkwvkwnfdfKckouF8gCHnHbzzDS8k=;
 b=pghsY8nL9Olgc4zeHCLT3s6d5syt34c2Q7Bp01MzOHMrEeJTNXn/wjcgwkS8qQEHvx
 e2jgPLk16ECKQrZywJQqNAtHFZvvWpLAuMvy2KCIEoIlHOR165X36yE9lyDUSjZrq1sP
 j6AiBHq10xI8L+plUqI3Umr3zpwlrOh5dayCh9swn/+mD9pl9pqWJwrRMtnyuYYbIKrL
 /J2BxKT0e/vFPMrbIkyOOSlAWHf0JTg0S/Aecnp1di5kwd3iBdXMBg9ErKR3Jjq/qrtD
 AIq3si6a3GF33UdtuZa0dfnmrlYLCLuDmSQj1a7Kir9ztuP9iB4wtS20N8Au0P6QTeSL
 TShQ==
X-Gm-Message-State: ACrzQf0Dispzyvh6bkywB6Q4Gn3G/gHp4KzzBaeezUxjTgcnsrEgexlF
 Qm+1gYRph/8u95c/L4nW6i/DKEfY7RJjRvKh1M1kqprvhsdDWrHWOVPIRHaV2FM7PRnWkKdvPFM
 Sw5ra8wO1QqzGL60=
X-Received: by 2002:a5d:6dad:0:b0:22a:ec41:309c with SMTP id
 u13-20020a5d6dad000000b0022aec41309cmr6412453wrs.127.1663591478922; 
 Mon, 19 Sep 2022 05:44:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Ds/H4ANPmB7CrzlFtEj5kF6JQRNMvPLZdVZnAP9sDeQLVOQ82TRxWqFCgBrDbXgCCJaHeSw==
X-Received: by 2002:a5d:6dad:0:b0:22a:ec41:309c with SMTP id
 u13-20020a5d6dad000000b0022aec41309cmr6412428wrs.127.1663591478553; 
 Mon, 19 Sep 2022 05:44:38 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-127.web.vodafone.de.
 [109.43.177.127]) by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b003a601a1c2f7sm14786996wms.19.2022.09.19.05.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 05:44:38 -0700 (PDT)
Message-ID: <98b23697-00ec-2952-31c1-258419bd5440@redhat.com>
Date: Mon, 19 Sep 2022 14:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tests/qtest: npcm7xx-emc-test: Skip checking MAC
Content-Language: en-US
To: Patrick Venture <venture@google.com>, lvivier@redhat.com
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
References: <20220906163138.2831353-1-venture@google.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220906163138.2831353-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.952, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/09/2022 18.31, Patrick Venture wrote:
> The register tests walks all the registers to verify they are initially
> 0 when appropriate.  However, if the MAC address is set in the register
>    space, this should not be checked against 0.
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Change-Id: I02426e39bdab33ceedd42c49d233e8680d4ec058

What's that change-id good for?

> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>   tests/qtest/npcm7xx_emc-test.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
> index 7c435ac915..207d8515b7 100644
> --- a/tests/qtest/npcm7xx_emc-test.c
> +++ b/tests/qtest/npcm7xx_emc-test.c
> @@ -378,7 +378,8 @@ static void test_init(gconstpointer test_data)
>   
>   #undef CHECK_REG
>   
> -    for (i = 0; i < NUM_CAMML_REGS; ++i) {
> +    /* Skip over the MAC address registers, which is BASE+0 */
> +    for (i = 1; i < NUM_CAMML_REGS; ++i) {
>           g_assert_cmpuint(emc_read(qts, mod, REG_CAMM_BASE + i * 2), ==,
>                            0);
>           g_assert_cmpuint(emc_read(qts, mod, REG_CAML_BASE + i * 2), ==,

Basically ack, but one question: Where should that non-zero MAC address come 
from / when did you hit a problem here? If QEMU is started without any mac 
settings at all (like it is done here), the register never contains a 
non-zero value, does it?

  Thomas


