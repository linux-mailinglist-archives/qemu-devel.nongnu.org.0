Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1487B3DD457
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 12:53:48 +0200 (CEST)
Received: from localhost ([::1]:48652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAVZq-0006SN-Sv
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 06:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAVYn-0005Gu-PU; Mon, 02 Aug 2021 06:52:41 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAVYl-0000qU-Vb; Mon, 02 Aug 2021 06:52:41 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso602912wmg.4; 
 Mon, 02 Aug 2021 03:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9GimfLYnQCRCHIrNKgo4MU6P4mx9AMt56xu1KvkAGuQ=;
 b=o5R9voNI5hAiTNYWsW35Jj2qpiUuW237poD/lnXF4DvPnMN7soeszZ2onpHZ1e0llI
 kwjeQH1bihbMiqgABmq3CaNOd00oDAbvYDx1Om+GCs7z9D7kYzN8o6rvCKs8bMU85a7N
 AMiaUZRoi4G19pOpUZt8Uf48N4rc+Bs0ZNYqDYd/3GFewRFTebdYI6jwdEPUYp1aAa+E
 84BcEIWgIl06afOP2A9SiV3ncDnEKbVRBu/Q7FWFoXAoGEPKs8VFoxQ/lwbFPCXd+wiC
 8IU8gNQlo0ug2UoDoaBY5erQpnBbEN+IfUYkcoB9tJmjYPYtymRSJrpEfR1RLw0U5muz
 Uw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9GimfLYnQCRCHIrNKgo4MU6P4mx9AMt56xu1KvkAGuQ=;
 b=SCJ6hixGmGrmiCcll5UP56NfRDdoR6zFhsfvn448GUcaNK6NpDx47zSzoJAnRp2Ewm
 HWjjTzwKg/0fvw+9JirYhTTqenyQCSgxIn6bRrAsZTasDDtupTrHn4kQYLll/wthGz+d
 epmMvkPJKK2cXFl+ZsyCUl03BvNWtgMRPeRldBiP1r6pjCDFCgoWFXudpGazUB/8z3ph
 gHtflwUIcQLAW2yDxuRaDYDUc6ROGAEshOTFWpKK+Pq/pJOZwLufTPjAMmyG+xWSdnx1
 JAPr44wHENNWP2qyRSi4p/vOXX2meiqFPSAj7v3liGVIUcEGk32FIzWHn+ZseJPguP7J
 026g==
X-Gm-Message-State: AOAM530HYGwdw1SmdHb5JrtcnTGNkIcPLsneYBnh9ZmkW8O2weyiLQat
 HDtZHIT/z/ZR42mAxL4HDwYooj+nEhaEWw==
X-Google-Smtp-Source: ABdhPJyiX/JcG2c22qMeyoKUVhvEAbOPDnDgBr118MuWmdgfIMS8IQKUyJ0iOVgU1aaXH9lrW7ZNOA==
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr4793187wmq.16.1627901557133; 
 Mon, 02 Aug 2021 03:52:37 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id x15sm10067566wmc.13.2021.08.02.03.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 03:52:36 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 2/3] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@windriver.com>
References: <20210728181728.2012952-1-f4bug@amsat.org>
 <20210728181728.2012952-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9e33073e-4eea-de86-acbb-752657b1f2dd@amsat.org>
Date: Mon, 2 Aug 2021 12:52:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728181728.2012952-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.08,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 qemu-stable@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter, Bin, could you review this (trivial) patch?
This is a regression since 6.1 I'd like to get fixed
for v6.1.0-rc2.

On 7/28/21 8:17 PM, Philippe Mathieu-Daudé wrote:
> OSS-Fuzz found sending illegal addresses when querying the write
> protection bits triggers the assertion added in commit 84816fb63e5
> ("hw/sd/sdcard: Assert if accessing an illegal group"):
> 
>   qemu-fuzz-i386-target-generic-fuzz-sdhci-v3: ../hw/sd/sd.c:824: uint32_t sd_wpbits(SDState *, uint64_t):
>   Assertion `wpnum < sd->wpgrps_size' failed.
>   #3 0x7f62a8b22c91 in __assert_fail
>   #4 0x5569adcec405 in sd_wpbits hw/sd/sd.c:824:9
>   #5 0x5569adce5f6d in sd_normal_command hw/sd/sd.c:1389:38
>   #6 0x5569adce3870 in sd_do_command hw/sd/sd.c:1737:17
>   #7 0x5569adcf1566 in sdbus_do_command hw/sd/core.c:100:16
>   #8 0x5569adcfc192 in sdhci_send_command hw/sd/sdhci.c:337:12
>   #9 0x5569adcfa3a3 in sdhci_write hw/sd/sdhci.c:1186:9
>   #10 0x5569adfb3447 in memory_region_write_accessor softmmu/memory.c:492:5
> 
> It is legal for the CMD30 to query for out-of-range addresses.
> Such invalid addresses are simply ignored in the response (write
> protection bits set to 0).
> 
> Note, we had an off-by-one in the wpgrps_size check since commit
> a1bb27b1e98. Since we have a total of 'wpgrps_size' bits, the latest
> valid group bit is 'wpgrps_size - 1'.
> 
> Since we now check the group bit is in range, remove the assertion.
> 
> Include the qtest reproducer provided by Alexander Bulekov:
> 
>   $ make check-qtest-i386
>   ...
>   Running test qtest-i386/fuzz-sdcard-test
>   qemu-system-i386: ../hw/sd/sd.c:824: sd_wpbits: Assertion `wpnum < sd->wpgrps_size' failed.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: OSS-Fuzz (Issue 29225)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/495
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sd/sd.c                     |  4 ++--
>  tests/qtest/fuzz-sdcard-test.c | 36 ++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 707dcc12a14..273af75c1be 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -820,8 +820,8 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
>  
>      wpnum = sd_addr_to_wpnum(addr);
>  
> -    for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
> -        assert(wpnum < sd->wpgrps_size);
> +    for (i = 0; i < 32 && wpnum < sd->wpgrps_size - 1;
> +                i++, wpnum++, addr += WPGROUP_SIZE) {
>          if (addr >= sd->size) {
>              /*
>               * If the addresses of the last groups are outside the valid range,
> diff --git a/tests/qtest/fuzz-sdcard-test.c b/tests/qtest/fuzz-sdcard-test.c
> index 96602eac7e5..ae14305344a 100644
> --- a/tests/qtest/fuzz-sdcard-test.c
> +++ b/tests/qtest/fuzz-sdcard-test.c
> @@ -52,6 +52,41 @@ static void oss_fuzz_29225(void)
>      qtest_quit(s);
>  }
>  
> +/*
> + * https://gitlab.com/qemu-project/qemu/-/issues/495
> + * Used to trigger:
> + *  Assertion `wpnum < sd->wpgrps_size' failed.
> + */
> +static void oss_fuzz_36217(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init(" -display none -m 32 -nodefaults -nographic"
> +                   " -device sdhci-pci,sd-spec-version=3 "
> +                   "-device sd-card,drive=d0 "
> +                   "-drive if=none,index=0,file=null-co://,format=raw,id=d0");
> +
> +    qtest_outl(s, 0xcf8, 0x80001010);
> +    qtest_outl(s, 0xcfc, 0xe0000000);
> +    qtest_outl(s, 0xcf8, 0x80001004);
> +    qtest_outw(s, 0xcfc, 0x02);
> +    qtest_bufwrite(s, 0xe000002c, "\x05", 0x1);
> +    qtest_bufwrite(s, 0xe000000f, "\x37", 0x1);
> +    qtest_bufwrite(s, 0xe000000a, "\x01", 0x1);
> +    qtest_bufwrite(s, 0xe000000f, "\x29", 0x1);
> +    qtest_bufwrite(s, 0xe000000f, "\x02", 0x1);
> +    qtest_bufwrite(s, 0xe000000f, "\x03", 0x1);
> +    qtest_bufwrite(s, 0xe0000005, "\x01", 0x1);
> +    qtest_bufwrite(s, 0xe000000f, "\x06", 0x1);
> +    qtest_bufwrite(s, 0xe000000c, "\x05", 0x1);
> +    qtest_bufwrite(s, 0xe000000e, "\x20", 0x1);
> +    qtest_bufwrite(s, 0xe000000f, "\x08", 0x1);
> +    qtest_bufwrite(s, 0xe000000b, "\x3d", 0x1);
> +    qtest_bufwrite(s, 0xe000000f, "\x1e", 0x1);
> +
> +    qtest_quit(s);
> +}
> +
>  int main(int argc, char **argv)
>  {
>      const char *arch = qtest_get_arch();
> @@ -60,6 +95,7 @@ int main(int argc, char **argv)
>  
>     if (strcmp(arch, "i386") == 0) {
>          qtest_add_func("fuzz/sdcard/oss_fuzz_29225", oss_fuzz_29225);
> +        qtest_add_func("fuzz/sdcard/oss_fuzz_36217", oss_fuzz_36217);
>     }
>  
>     return g_test_run();
> 

