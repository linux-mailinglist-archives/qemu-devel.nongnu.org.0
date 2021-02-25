Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8BC324950
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 04:15:40 +0100 (CET)
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF77r-00020a-LF
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 22:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF76P-0001ZW-LO
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 22:14:09 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF76N-0005uN-IO
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 22:14:09 -0500
Received: by mail-pg1-x535.google.com with SMTP id t26so2873492pgv.3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 19:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f/9f5ULV0TedDhnOZeZnkMsQy4olBKrvu/iiXWUCN30=;
 b=kUTlgYqYW1tIN/VNYOgnIEc49QpSo+v37l/ZB2sgZvGGc8CSPWhhmUR21i32IxwbQv
 VDGnqemrnK4qqjRhoc8XyGu5Bs/fITMraOFPhui1R75jA9WaUvCTfUs6Gh7lDEPIvjyA
 eG47RDvsHtcdqHWIHJwA2TfkiN539Iwo5ODK1/ba2JsUW5lqqvzbi9lmWtvjR45W1BPM
 1tWnMVHyYbtaSM7Q520Jpvat5sOeo76gArha3yCVL/T7+FIEyB9IYapzg8nt9kaLAIPm
 pghUcRymP4gluHLh7z08xEdPp/rF0ZSyJ4LU1eHhr9xfzSeoicPJjY12HSPw5vjcb7Pw
 vuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f/9f5ULV0TedDhnOZeZnkMsQy4olBKrvu/iiXWUCN30=;
 b=ttI7Okl1MvRts1v9akwGhdni+U+BEDJ+2hFoPj7PUBK+JC/fdkPI278H2i3Z67zaw8
 uLsbICzDtYSTlnw2/zrh0yK04X5R2JlbbP7KkBGvqc4Zk3aZGX/2bAgetUrtLR24Epra
 AHzNEhUCcKsUI3MCX8nXk1ufc7Bp+pnM7BcEfybceTlM+YHbNvNkVNzsvoPpR7sgUzpa
 LXaIDr0kz8G14mz9DjKZNVletLMrm12eaqGhpHVTHIvg5ghGkJ6nZdZyXo6qFBNG7wS5
 huNTXKRdHkwO/L8jZnTlwFHULZh4JhvLK71aMVLDlScpRyx0/Wy5LjvoJ2QRJTGYSbhi
 mD9A==
X-Gm-Message-State: AOAM530tt/pzWkgyF1D1/eQpo8DunF0QPSGxlv9m8baoWas10SqQmx1f
 RzXPnIk3ZLrVZqQFXrkFC2jxTYWc5m4aCQ==
X-Google-Smtp-Source: ABdhPJzB08jDrgvAY8wbpjWz6NTNXWoVs3P6hJTIVuCtte8N0N9seIAJMck0z8KF8RkeEJ6owGQAIw==
X-Received: by 2002:a62:1997:0:b029:1ed:5de5:5f1c with SMTP id
 145-20020a6219970000b02901ed5de55f1cmr1151405pfz.14.1614222845899; 
 Wed, 24 Feb 2021 19:14:05 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r13sm4342232pfg.37.2021.02.24.19.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 19:14:05 -0800 (PST)
Subject: Re: [PATCH v22 11/17] i386: split misc helper into user and sysemu
 parts
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-12-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be5fd14b-ac00-4c76-7f2f-bc1d323e02de@linaro.org>
Date: Wed, 24 Feb 2021 19:14:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-12-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
> +void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
> +{
> +    fprintf(stderr, "outb: port=0x%04x, data=%02x\n", port, data);
> +}
> +
> +target_ulong helper_inb(CPUX86State *env, uint32_t port)
> +{
> +    fprintf(stderr, "inb: port=0x%04x\n", port);
> +    return 0;
> +}
> +
> +void helper_outw(CPUX86State *env, uint32_t port, uint32_t data)
> +{
> +    fprintf(stderr, "outw: port=0x%04x, data=%04x\n", port, data);
> +}
> +
> +target_ulong helper_inw(CPUX86State *env, uint32_t port)
> +{
> +    fprintf(stderr, "inw: port=0x%04x\n", port);
> +    return 0;
> +}
> +
> +void helper_outl(CPUX86State *env, uint32_t port, uint32_t data)
> +{
> +    fprintf(stderr, "outl: port=0x%04x, data=%08x\n", port, data);
> +}
> +
> +target_ulong helper_inl(CPUX86State *env, uint32_t port)
> +{
> +    fprintf(stderr, "inl: port=0x%04x\n", port);
> +    return 0;
> +}
> +
> +target_ulong helper_read_crN(CPUX86State *env, int reg)
> +{
> +    return 0;
> +}
> +
> +void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
> +{
> +}
> +
> +void helper_wrmsr(CPUX86State *env)
> +{
> +}
> +
> +void helper_rdmsr(CPUX86State *env)
> +{
> +}

It is not obvious, but all of these are not reachable.

For in/out, there's the IOPL check.  When running on hardware, there's an
ioperm(2) syscall that can change adjust the TSS to allow userland access to
specific ports.  This is used by setuid applications like the xserver.  But we
don't (and can't) implement this syscall in qemu linux-user, so the check
within check_io in seg_helper.c always fails and raises EXCP0D_GPF.

For crN and msr, the cpl check is there in the switch:

    case 0x120: /* mov reg, crN */
    case 0x122: /* mov crN, reg */
        if (s->cpl != 0) {
            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
...
    case 0x130: /* wrmsr */
    case 0x132: /* rdmsr */
        if (s->cpl != 0) {
            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);

I think we can improve the compiler eliminating some of this code with

#ifdef CONFIG_USER_ONLY
#define CPL(S)  3
#else
#define CPL(S)  ((S)->cpl)
#endif

then change all of the tests to

    if (CPL(s) != 0) {

and then something akin to

#ifdef CONFIG_USER_ONLY
static inline void gen_helper_rdmsr(TCGv_env unused)
{
    qemu_build_not_reached()
}
#endif

For in/out, lots more cleanup would be required, since that needs to propagate
up through ins/outs, and gen_check_io would want changing as well.  I don't see
an obvious way to avoid the stubs, really.  But we can g_assert_not_reached()
within them, rather than fprintf to stderr.


r~

