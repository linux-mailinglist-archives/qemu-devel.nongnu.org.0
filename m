Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910C6DB703
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:13:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkvGV-0001my-Is; Fri, 07 Apr 2023 19:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvGT-0001la-U6
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:13:05 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvGS-0002ts-3N
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:13:05 -0400
Received: by mail-pj1-x1035.google.com with SMTP id v9so4809151pjk.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680909182;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aYIkZBIFK2ZpHWvSfO0jyCWHXEmHKEa00eKczku2HgE=;
 b=vKfScPpZZuTSQjVvlLzoq0nu/oNEzhegH0VN4qBbTDX1lF4jluykpN2c1wbw5Qjmnj
 Rb66ndQEM5IDPq+PkYMGfaYi9++yYdHMhB0dAtUmxQ0utcdT4d11dzuZmSQZmMmkR0YZ
 f19qZTPpNtjEBVCVK7fCUEY08KnyfjOg+z/5iwxAqvdo+K6M9MEOq/E2MXr0jeAqB+Kq
 suEXAJqiAwgQTQ/MyX+nLK78aB5JsXiZWTSWLDWgP46FZ/9UiE6oqKOC79oVNQyZQwyZ
 gs3Q/speYE/HWvXViIfmClwbFvilbHwN6YPaYwEE4apNDw1NyVzvGBqI622hYSkVaakq
 kurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680909182;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aYIkZBIFK2ZpHWvSfO0jyCWHXEmHKEa00eKczku2HgE=;
 b=OsxdgegiWHeknOXAs1mkIUHPXRMJcYauP0u5NiQb9dWqd4jdq/6zpfITHeL06AfpyM
 76isMEqXTucor8nW/CKO7F/c3pb1EjNWXYjT48DuXX3uBpGlSs4vYx1ECiK2BwaR1RWz
 TZzai9lRHSfWqMhepLaXcrkNAT6CGT6sGUMEmz4OCIvQUBrSX1nBJHTXb00J92VL8+fV
 QVrM7lXwJYAi3dR4ifgObTfBR/FKRlRtgcq/S2GGFzReE5ocB02ZBK6dpk097rOHzg7A
 E1gnnmS1JKMreO9grDTi0wg6fYaE8Q5pri+yV03QD8PlA9EitwCX49447vO/F/9uTUUy
 p2RQ==
X-Gm-Message-State: AAQBX9fherKMywAvai+4oJg3qnJdCLo3wHQ9VF+Aiax2R9JF5Gm4xFSb
 erme2IALAQY09uw8versbRnVvA==
X-Google-Smtp-Source: AKy350bDgHCmk88fi7lKmF1o3TyQSTwibPI+P0wHGQ0hTOjZ8sVom4CqWEwPGykeBzb76cAn0hafQQ==
X-Received: by 2002:a05:6a20:4ca3:b0:d9:dbb6:2e67 with SMTP id
 fq35-20020a056a204ca300b000d9dbb62e67mr4159798pzb.31.1680909182482; 
 Fri, 07 Apr 2023 16:13:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a63dd58000000b004fcda0e59c3sm3091950pgj.69.2023.04.07.16.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:13:02 -0700 (PDT)
Message-ID: <5a0297f8-ddc6-4fac-b896-1b1ecede844e@linaro.org>
Date: Fri, 7 Apr 2023 16:13:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 12/14] accel: Rename WHPX struct whpx_vcpu -> struct
 AccelvCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-13-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> We want all accelerators to share the same opaque pointer in
> CPUState. Rename WHPX 'whpx_vcpu' as 'AccelvCPUState'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/whpx/whpx-all.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index 70eadb7f05..2372c4227a 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -229,7 +229,7 @@ typedef enum WhpxStepMode {
>       WHPX_STEP_EXCLUSIVE,
>   } WhpxStepMode;
>   
> -struct whpx_vcpu {
> +struct AccelvCPUState {
>       WHV_EMULATOR_HANDLE emulator;
>       bool window_registered;
>       bool interruptable;
> @@ -260,9 +260,9 @@ static bool whpx_has_xsave(void)
>    * VP support
>    */
>   
> -static struct whpx_vcpu *get_whpx_vcpu(CPUState *cpu)
> +static struct AccelvCPUState *get_whpx_vcpu(CPUState *cpu)
>   {
> -    return (struct whpx_vcpu *)cpu->accel;
> +    return (struct AccelvCPUState *)cpu->accel;

Same comment about removing 'struct'.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> -    vcpu = g_new0(struct whpx_vcpu, 1);
> +    vcpu = g_new0(struct AccelvCPUState, 1);
>   
>       if (!vcpu) {
>           error_report("WHPX: Failed to allocte VCPU context.");

Hah.  And a "can't happen" error_report, since we're not actually using try here.  :-P


r~


