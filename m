Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD38304C5D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 23:40:50 +0100 (CET)
Received: from localhost ([::1]:59018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4X0z-0006Ey-8h
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 17:40:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4WzU-0005ga-Ra
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 17:39:17 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4WzS-0008U3-Mp
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 17:39:16 -0500
Received: by mail-pj1-x102a.google.com with SMTP id cq1so86119pjb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 14:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kB2oVbYwI5e4pPxc814avBVCTUqGILmWfMAETjxzdcQ=;
 b=w3CCSwSU9TE2l4117ybmNrlAHPFnA+HHrHlOJHQ1w6odkcDNsxsnzM3kkGsiCa8yi4
 OEofSiGjY3GA5pmSNRD8fqxwU1gIMAwlmqLNJszchA+H3YmIipS7mQgLQSwyYS09G/uP
 dfagkeianB/KSMAC4E/hFJUG0bZ2uvkgGdCLOKJoVG7Si9mKyNzFc68dzlC9STl5+VKa
 zS7QtwnSvMC9RQqtQc2T2iTWbg2dSBJKcNcpwvuFMLzu7fqGrE2PLA7nL0rImveA/R+E
 2tyxad/HboXCr77IQqWZI4M6UPGDbZAhUHS/0BNTuk+fs5XmsLnuShAIFq/EAA+dquY6
 eqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kB2oVbYwI5e4pPxc814avBVCTUqGILmWfMAETjxzdcQ=;
 b=D4wenu23K6+N9FeUSe6TDZi6tdB0i0atFQe0InlZ2Vq8zGsRngyNixBrgBcC1Hy8v3
 bf8Gi5eRKZxTrOv0qufyxhKQibx/rg3rqT7OxfFPOhXj3piU+4SpoPqT+mRJ7Py1EEwY
 Ijecwgq6nKxqB9Oq87z7ZArTyo1RBwSwDis+80mp/6qNvr3+2bHjDFDEZlMoaOiaGFDj
 bMJxal0BuS7xiG5ZQiuxwZUDd6WRxpSOIG5sfTm8gQEacYiE1KrxZVn3SiFABK65y7d1
 yzW/utrShaFgIE8iNl1rtl9pSR5ZKOcCZnihlRE9tGT5K1LseWbikGUgo9IcUAIX4Irc
 EsWA==
X-Gm-Message-State: AOAM530EN7/c8FY85ZIJrgs6Fd4teVEivLl+q88abUcIsPDwacSgi4nR
 PFa9cu4CU8USApM+7xeDyUw5NLDDP9zwC0IT
X-Google-Smtp-Source: ABdhPJya03Mg2SLz2a+xYneluHeMi9B1RdEhgqX1Kye3CKyfS7lp0Fwy325ED0sFC0DNBgCshlNt2w==
X-Received: by 2002:a17:90a:d249:: with SMTP id
 o9mr2083452pjw.78.1611700752234; 
 Tue, 26 Jan 2021 14:39:12 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l4sm2320pju.26.2021.01.26.14.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 14:39:11 -0800 (PST)
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
 <875z3jy3tt.fsf@linaro.org>
 <89209f1b-29ad-e5df-6d45-b2480db4775e@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bbe4adfe-5bed-c37f-78c6-b120cb192aae@linaro.org>
Date: Tue, 26 Jan 2021 12:39:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <89209f1b-29ad-e5df-6d45-b2480db4775e@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 9:44 AM, Stefan Weil wrote:
> I was not talking about the TODO assertions. When I wrote TCI, I only enabled
> and included code which was triggered by my testing - that's why I said the
> productive code lines have 100 % test coverage. TODO assertions are not
> productive code, but debug code which were made to detect new test cases. They
> were successful, too, because they were triggered by some tests in `make
> check-tcg`.

The TODO assertions are all bugs.

Any *real* dead code detection should have been done in
tcg/tci/tcg-target.c.inc.  What's interpreted in tcg/tci.c should be exactly
what is produced on the other side, and you are producing more than you are
consuming.

> It should pass now unless you get timeouts for some tests. Please tell me if
> more TODO assertions are triggered by new tests.

        case INDEX_op_ld8s_i32:
            TODO();
            break;

Can be triggered by

target/arm/translate-a64.c:1061:
        tcg_gen_ld8s_i64(tcg_dest, cpu_env, vect_off);
target/arm/translate-a64.c:1090:
        tcg_gen_ld8s_i32(tcg_dest, cpu_env, vect_off);
target/arm/translate.c:1210:
        tcg_gen_ld8s_i32(dest, cpu_env, off);

target/s390x/translate_vx.c.inc:81:
        tcg_gen_ld8s_i64(dst, cpu_env, offs);
target/s390x/translate_vx.c.inc:111:
        tcg_gen_ld8s_i32(dst, cpu_env, offs);

        case INDEX_op_ld16s_i32:
            TODO();
            break;

Can be triggered by

target/arm/translate-a64.c:1064:
        tcg_gen_ld16s_i64(tcg_dest, cpu_env, vect_off);
target/arm/translate-a64.c:1093:
        tcg_gen_ld16s_i32(tcg_dest, cpu_env, vect_off);
target/arm/translate.c:1216:
        tcg_gen_ld16s_i32(dest, cpu_env, off);
target/s390x/translate_vx.c.inc:84:
        tcg_gen_ld16s_i64(dst, cpu_env, offs);
target/s390x/translate_vx.c.inc:114:
        tcg_gen_ld16s_i32(dst, cpu_env, offs);

All of which are target vector instructions.
I'm sure it would be trivial to whip up test cases for them, but I don't see
that as my job.

Please maintain this code properly or give it up.


r~

