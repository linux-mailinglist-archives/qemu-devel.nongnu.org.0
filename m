Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF873264A0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 16:24:26 +0100 (CET)
Received: from localhost ([::1]:36354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFeye-0007Ug-Fc
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 10:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFevZ-00066y-6r
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:21:13 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFevU-000227-KF
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:21:12 -0500
Received: by mail-pf1-x42a.google.com with SMTP id q204so5401762pfq.10
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 07:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q9D9ckAyzPob/zFZfRyG9b6faC24hS0Mbo7aK3xzbJw=;
 b=ZSqTHpeQrJGVro8ynljuI2nEyDpLkiwsIC7so6dsxhveJqI/NUPLJW94Ken1TPV+dL
 0tQm5NClc7U1wdiZdNB++GzNpgwhiBuArB+WSH7dFv3keKlRJvttdkUEI23P9dR07b2Z
 C1+4MKOq9rJye0kp4Rz603I236NEpopJayeqjpVo9B9w8NRA40Jgt/9/pGlnmJTIaTc6
 45xiB2a149gV3AEPni7k/YN7V2ov5UUNfqvABmllFFUjQh2uMTxwsCMCGLivDbdWEhoM
 Q9XM6IOuPEvz4bADnDLgpiUQXU7HXTbAo3p8JyVhnzG+A7jABzA/Mr27lZvHTlRykOmd
 afrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q9D9ckAyzPob/zFZfRyG9b6faC24hS0Mbo7aK3xzbJw=;
 b=mgX/CXpxFG6N39yyhNYd1Y/D7OAefdUJoxjoL5A3LC7MelghjcBO8Ed4YEvJgi3GBv
 iHAY+FX+ov/2MCnK279jd5aBByvXuujnq2kir1s59I5eXkXDzC/cU8RCm1WI47dqlw49
 CrDy4cNocUHHg7m//6pcnMxfehdKBdtyuHnWF9uVf57IBpUItclkxt2EO7o43XYAqaWX
 /GDkcYelHq7MdvMz9/6W3t01cMhqey5txnltNCipFS3s0PfY23RFGcw166PlVVYAx5d/
 JJWW4fhVayMrUO0u8O3ViM5E7tD4S23gCj1Qd7ZGtqD/szjA9TAfAcD0bpyOhC6GhahG
 9gUA==
X-Gm-Message-State: AOAM531K09fOn4RQJlUyjhXJtVWztTXiXfSNzitvsz9d1n1cKOEePvgE
 UDkXRHoDZVCybX7DoUhYHAZuv0kBPze1oA==
X-Google-Smtp-Source: ABdhPJy1gumlwFWJ7Fmx4aQ3O1pb+WRa4KH06EKd97k3joFMGKOR7fz08ir6RFkJBCnlGr+xQI89Xg==
X-Received: by 2002:a63:e44a:: with SMTP id i10mr3286862pgk.404.1614352866796; 
 Fri, 26 Feb 2021 07:21:06 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 3sm10326243pfd.45.2021.02.26.07.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 07:21:06 -0800 (PST)
Subject: Re: [PATCH v24 10/18] i386: move TCG btp_helper into sysemu/
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210226094939.11087-1-cfontana@suse.de>
 <20210226094939.11087-11-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e68b6529-ddb7-afbf-450c-38811771492f@linaro.org>
Date: Fri, 26 Feb 2021 07:21:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226094939.11087-11-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.349,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 1:49 AM, Claudio Fontana wrote:
> @@ -8054,6 +8058,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      case 0x123: /* mov drN, reg */
>          if (s->cpl != 0) {
>              gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +#ifndef CONFIG_USER_ONLY
>          } else {
>              modrm = x86_ldub_code(env, s);
>              /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
> @@ -8083,6 +8088,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  gen_helper_get_dr(s->T0, cpu_env, s->tmp2_i32);
>                  gen_op_mov_reg_v(s, ot, rm, s->T0);
>              }
> +#endif /* CONFIG_USER_ONLY */
>          }

Better to properly nest the ifdef with the if. I.e.

if (x) {
} else {
#ifndef
#endif
}

Anything else gets confusing quickly.


r~

