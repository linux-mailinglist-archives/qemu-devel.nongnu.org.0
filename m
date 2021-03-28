Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9034034BD8F
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:28:20 +0200 (CEST)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQZD1-0005gz-Lo
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZ9l-0004dL-UR
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:24:57 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:41850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZ9k-0000GO-3H
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:24:57 -0400
Received: by mail-oi1-x22b.google.com with SMTP id z15so10972760oic.8
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bOfA1pt8Ek6xcXS+qav+W7zbze0Jc4VZRSJqSr1QDqU=;
 b=jASbZ/WtJoCGLvmL9RXmb0p4otgo5+AzEduWFMfSNzD9kIjXLEfgm+eCiAXxZkaADu
 kEhPddSHCETcqBb4P+SEyFBS/t+DI92t7Rrt1ZdB0XNtjX9mIDitZ0uahbTgNCwD7ubx
 Zm678Jsxd3jLYQQgkCRQxWigz4C2dndRCwJ1xVNDF8kqFVE34PBRmV3c3uL9biYep7Ww
 Zf2vu/eFvqb1wN5QtK7OYzPPzdoaUD37W/AqDv3SmOp4dB8OuuZaaYivQJSIGUm55Nc3
 8fwZ3NfcWAi+l7+ViSfxFdZcdrQuA4ntFBPO9ow84hKSB9qao4CXn4p42dCvWaLXKK1l
 AJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bOfA1pt8Ek6xcXS+qav+W7zbze0Jc4VZRSJqSr1QDqU=;
 b=dG9Dhk68eHBPmGItXGTI/xdnK6CSiNj3vqT6KCTRdoLOmQeObRSupIpS6cPp5VNc1z
 /7aGcxf6kGI2rVFU6Nz6LnXT7jKN9tgJUmEp9eA+Y08vVxprevbauQddJy5V1Nssm7Lb
 OxkN6WoI7+RbrWXltdzx9/waWC2uhRtceRZUbCerrogC63RFFXhrJXJGgxl3ExPOMPTz
 U5WUsG7iXBZSOQVRtTM6j8H3S+SsLUxiB0CUW/B2IevvOt4fvp320FtaCxlLBJgok+FS
 LT7cXGAptcqyZ/XUapyFRZPwYeMjTs8nhDxIkwHv8K7vmMc3UR/G9+jrYQI/PlO4KxzU
 JDLw==
X-Gm-Message-State: AOAM531rwUf9bNdiNJc1pCp0RjDmGDVTWI2fpxk6CAZ6TuCtbXI8DrdC
 /u9coi8Pqfwigf/xRMkr51oFnA==
X-Google-Smtp-Source: ABdhPJxutOhk5c3f6x7oX54+yBy27ncqZGvfW1vhzvd7+fB/6d4hNBEtrG4SRmWZ18MW4Gj7IY82Ow==
X-Received: by 2002:aca:482:: with SMTP id 124mr16246415oie.21.1616952293370; 
 Sun, 28 Mar 2021 10:24:53 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id r2sm3728100otk.55.2021.03.28.10.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:24:53 -0700 (PDT)
Subject: Re: [RFC v12 42/65] tests: do not run test-hmp on all machines for
 ARM KVM-only
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-43-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <229ecb37-af91-4092-5b01-8f56c0fe10c7@linaro.org>
Date: Sun, 28 Mar 2021 11:24:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-43-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> on ARM we currently list and build all machines, even when
> building KVM-only, without TCG.
> 
> Until we fix this (and we only list and build machines that are
> compatible with KVM), only test specifically using the "virt"
> machine in this case.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/qtest/test-hmp.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
> index 413eb95d2a..1d4b4f2f0e 100644
> --- a/tests/qtest/test-hmp.c
> +++ b/tests/qtest/test-hmp.c
> @@ -157,8 +157,28 @@ int main(int argc, char **argv)
>   
>       g_test_init(&argc, &argv, NULL);
>   
> +    /*
> +     * XXX currently we build also boards for ARM that are incompatible with KVM.
> +     * We therefore need to check this explicitly, and only test virt for kvm-only
> +     * arm builds.
> +     * After we do the work of Kconfig etc to ensure that only KVM-compatible boards
> +     * are built for the kvm-only build, we could remove this.
> +     */
> +#ifndef CONFIG_TCG

I don't think you need the ifdef, then you can use an else and no goto.

> +    {
> +        const char *arch = qtest_get_arch();
> +
> +        if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
> +            add_machine_test_case("virt");
> +            goto add_machine_test_done;
> +        }
> +    }
> +#endif /* !CONFIG_TCG */
> +
>       qtest_cb_for_every_machine(add_machine_test_case, g_test_quick());
> +    goto add_machine_test_done;
>   
> + add_machine_test_done:
>       /* as none machine has no memory by default, add a test case with memory */
>       qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
>   
> 


