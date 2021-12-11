Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D104714CB
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 17:51:04 +0100 (CET)
Received: from localhost ([::1]:60656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw5aQ-0006cB-UX
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 11:51:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mw5Za-0005ie-Ie
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 11:50:10 -0500
Received: from [2607:f8b0:4864:20::530] (port=45597
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mw5ZY-0002pb-Kl
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 11:50:10 -0500
Received: by mail-pg1-x530.google.com with SMTP id 133so10663625pgc.12
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 08:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tIoEelIiNI1eZ9a4OSYiXWI5KjsOOzRD8CuyPi4XCuw=;
 b=P41PrQJoOxChtfjs2Y+xxIrT5VxCG8duRgYlCpoqosoU8ZOILFHN2r1+PAr/qKbwta
 nXq8wFrPGNauemG9XcUMfiaGsAGIw+F6CuSUmE0I8gB2SNUHjgMdLvbzeCIq7fOFjpvZ
 g/Z5Q5QOy8dpWtiKGIac9oTFnn9LWEIZ7LgiXOPcI9Krr3DFg6B52LMOR5JrrYoclyqG
 AQbYCbDbbAgmysOeHX3i9GxnyiI1l6IZsXbNJ6nkuWMmlRnMj9yZ72H7G/jwVWTjAabu
 esBnzmMyudtMtz52RxMt0rA2UR0JvxcKd2lclCB0HIo4E5Re2cnDgdv1ec45ftx5HBFe
 PnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tIoEelIiNI1eZ9a4OSYiXWI5KjsOOzRD8CuyPi4XCuw=;
 b=mdYzLyMddJI0JjMdd9+kONhkZIugiQpAMiDSnGnEFjlaVJFoM40AAwqaZ0Ocdpphk0
 cbhQ8smXgvdyTfrxGIVa60THIHS6xLuzZOfCQ4mU5YTlqaMdP4RgAu3L41ya13jtisOx
 CloMHPw7UcjMh1+MOUGIMEzSQEtf8nW+Ph7arUk1tSTrZk1kE5fSEWdboSTcWtsA6fye
 DuIYaH7ASlI0TMrTE9naGLEB89QA47QJPIMq/LXmKQ3OU8tk45BfqLvMAqy+hZexLdpW
 mRAiuUyiExDHHyfZcoGCHWw6xDuT5vwkicJOfozY5Wfl9rU6pp4Px/b+52YsSZIWy/0M
 7M/w==
X-Gm-Message-State: AOAM5311WRS3aAcs0uhmLg0tbU4gGQo5uB+9xJ6JVucdqElqWQcBqRm+
 SgrJwyoIBVV2QIrmLQxDvCsQEQ==
X-Google-Smtp-Source: ABdhPJx3hlOL6oK5sManReqj72lUMA+M4Lih5Y3Y8k5WZptSFdg9n0UcfEsyLrpvKTTkmMI8O7fw4A==
X-Received: by 2002:a05:6a00:1308:b0:4a2:75cd:883a with SMTP id
 j8-20020a056a00130800b004a275cd883amr25095872pfu.84.1639241406600; 
 Sat, 11 Dec 2021 08:50:06 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id y4sm7320785pfi.178.2021.12.11.08.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 08:50:06 -0800 (PST)
Subject: Re: [PATCH v2] Revert "target/ppc: Move SPR_DSISR setting to
 powerpc_excp"
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211209173323.2166642-1-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d5b6237-de28-8285-b0a4-080f18ba5acd@linaro.org>
Date: Sat, 11 Dec 2021 08:50:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173323.2166642-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: philmd@redhat.com, danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/21 9:33 AM, Fabiano Rosas wrote:
> This reverts commit 336e91f85332dda0ede4c1d15b87a19a0fb898a2.
> 
> It breaks the --disable-tcg build:
> 
>   ../target/ppc/excp_helper.c:463:29: error: implicit declaration of
>   function ‘cpu_ldl_code’ [-Werror=implicit-function-declaration]
> 
> We should not have TCG code in powerpc_excp because some kvm-only
> routines use it indirectly to dispatch interrupts. See
> kvm_handle_debug, spapr_mce_req_event and
> spapr_do_system_reset_on_cpu.
> 
> We can re-introduce the change once we have split the interrupt
> injection code between KVM and TCG.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)

This is fine.  I had thought it would turn out to be helpful in conjunction with my 
user-only unaligned patch set, but in the end I went a different way and have a separate 
hook for user-only.

It is correct to simply revert the patch first.

I have ideas for further cleanup, if you have time:

(1) The assignment to DSISR does not need to wait until powerpc_excp.  I believe we can 
assign to it directly in do_unaligned_access, and avoid using env->error_code as an 
intermediary.

(2) The note about opcode fields being set incorrectly could be fixed during translation. 
  You'd use TARGET_INSN_START_EXTRA_WORDS to record the necessary information during 
translation, is provided to restore_state_to_opc during unwinding, and then moved into 
DSISR in do_unaligned_access.  Similar to target/arm and how env->exception.syndrome is 
managed, especially disas_set_insn_syndrome.


r~

