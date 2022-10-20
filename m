Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904AC605F7E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 13:57:25 +0200 (CEST)
Received: from localhost ([::1]:60000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUAT-00073r-S5
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:57:06 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTrF-0002MQ-U2
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTEm-0006js-Pi
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:57:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTEl-0008UL-3y
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:57:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id bv10so33685541wrb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EF8OjhrYu/hVyDOPfsX0RBb0o+HBEomyd0T1PfIj4C8=;
 b=dUlOA9nFarJEaFBQwuaVbLRWfEdgIWbEVgqDAii3cPSYmuMOooXTrC0p/NV6CoJArj
 zB6oNascpOJxW3g7LOX4shucKDHosJRoU5CVACayXBUmiDOl/KL1ZxG6/G7EBGzqn3pi
 qScxes0a1ikdmqE7x57CGZ53XXpteAM2FCX4ii3+EbmN/LJ3gXmKxuvFkaApE7D6RKgJ
 yASPzHuHeL8fTEUOrFFHkKnjRMTQKVvtFnpc6y3/HuiTQCd2wC0L7zf9WPmk9v8WMO0L
 5SWBb1pHRAT3+fVt9P1gfLWZzSmoYm4br+hhANNKe5UEoCrmUbc10/DaNpPxNLKLDjwh
 qJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EF8OjhrYu/hVyDOPfsX0RBb0o+HBEomyd0T1PfIj4C8=;
 b=BJTs2nk1gox/AcmQeYlpfUJvw/OyCgeUdQKhTebVcRts0aUuq+FrUJijy5If/yq6FT
 BaZFYSyqIZP39F3GF/35WjU2sGvOOuaslc+zweP9dpE4lzL5CM7RWxLQvWti+bWi9Vu6
 w9yo701weLC9c14lzL+bEiW35YSSe07QOr/e0EXhG31ctPRnb0R5NSP8tKFLgP7T62LA
 honY0Mx/PYTB1E0zdkJWrono1BZ/Td1L0OB5lbkUSRHEdMtlW2sAo5awcEolitTo0aGi
 CLTNaJHVw6CsiMne6Ycl9U6aLFK9QCytQSi9IEoPn4qj4vzUG3aoh4rr9Dqy/8fVtIMl
 VcnA==
X-Gm-Message-State: ACrzQf3tDEOZ359PknfX8czdi9Df9Kce/D7v/amo2m1eNkLTldFDH1ow
 Au4k6rwfd2X5R0UFkhJNrY5JcA==
X-Google-Smtp-Source: AMsMyM5lSKq2vjeI0IHbuM/27Md4n4BJum8UMPo3W0HrsvaqKLkOOgIE9D40fWsiSaNa+I1+3OAh2w==
X-Received: by 2002:a05:6000:1683:b0:230:d0b5:72c9 with SMTP id
 y3-20020a056000168300b00230d0b572c9mr8662141wrd.336.1666263437304; 
 Thu, 20 Oct 2022 03:57:17 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 o13-20020adfe80d000000b0023580e7a2c4sm1826739wrm.86.2022.10.20.03.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 03:57:16 -0700 (PDT)
Message-ID: <ef5ffebf-1e5c-aaf3-2b6f-87c140858351@linaro.org>
Date: Thu, 20 Oct 2022 12:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH] tests/avocado: raspi2_initrd: Wait for guest shutdown
 message before stopping
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>
References: <20221020102012.3015662-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020102012.3015662-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 20/10/22 12:20, Peter Maydell wrote:
> The avocado test
>   tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
> finishes wiith

Typo "with"

> 
>      exec_command(self, 'halt')
>      # Wait for VM to shut down gracefully
>      self.vm.wait()
> 
> In theory this should be fine. In practice it runs into two bugs:
> 
>   * when the test calls self.vm.wait() Avocado closes the socket
>     connection to the guest serial console immediately, so the
>     avocado logs don't have the last part of the guest output:
>     https://gitlab.com/qemu-project/qemu/-/issues/1265
>   * when the socket is closed, a bug in the QEMU socket chardev
>     means that it loses any data that the guest UART has not
>     yet consumed. This means that the guest doesn't always read
>     the full 'halt' command string, so the test intermittently
>     fails with a timeout:
>     https://gitlab.com/qemu-project/qemu/-/issues/1264
> 
> Work around both of these by waiting for the guest to print the
> string that means it has completed the shutdown process.  This fixes
> a very long standing intermittent failure in this test.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index ca9d09b0d7c..eed4b49e6e4 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -489,7 +489,7 @@ def test_arm_raspi2_initrd(self):
>                                                   'BCM2835')
>           exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
>                                                   '/soc/cprman@7e101000')
> -        exec_command(self, 'halt')
> +        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')

Yeah :(

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


