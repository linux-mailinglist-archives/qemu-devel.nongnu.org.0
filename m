Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FC868A123
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:04:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0QC-0003OL-Pn; Fri, 03 Feb 2023 13:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pO0QA-0003Nj-VZ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:04:23 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pO0Q9-0007GM-7F
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:04:22 -0500
Received: by mail-pg1-x535.google.com with SMTP id e10so4156406pgc.9
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HwXTVO6SoTft807q1bi91JylVHoFB+AudW1NWIB+/tc=;
 b=vG1Jsd1WeXTHte/BcHaCskhixA6XDue6Yc/fY/q/VcjUCZ/ECOCRn6dP4CYFjhsjvV
 G47torwizTYG19uOjSv4LYshAeaUfgmT9soEZe8eVWQPWgmX9+6VW8KFRio+keygxV5W
 sDnPy1ujtqD4V8io/4N8Gb1elYGkzm22PBGPG1aF/i6zJRMqQWHIC33tctklxV6UO5tu
 nCL4GntoN+e9eNLp0qsO8Qoq0l5Y+T8kM7H88hdrv0gFYdxwY86YA36rFNvtuFcPoEoZ
 XLgXF4MXgsORiYhfMqrqNH9KbCUYlLCclQtLDOkHt5nzHoaHwFVil8ztfFzh4p9ljd29
 btVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HwXTVO6SoTft807q1bi91JylVHoFB+AudW1NWIB+/tc=;
 b=Sch8bziBv+JfWCMdMGfCBX26VcvstzZhEcilUjjXRFTgX86vJuhq2+aHFmOeMNCrJ0
 ztdUosNL55skFw8ud28uhX7hSk8T7wd14fZIGsZtP6YwDgwIcqDeQlxF1Dw1pSdDL6fK
 axsK3BHTpA4iIPw36Dtw8uOKNBl5rGqf7ycHa8zfh15bOx28rMkJ8ORcn9HMpwCM8R8w
 BNbIkTV4zYkPH7XpSC1YilS/7PWmW3plY/6z3Ukx+YMNDfDFxNwy/k/0AXphUUAOA5u9
 KkqCYQxQWgHWKl9XrGhResr2/xdJ1mGOzdkURSZpAKM8VSbUBM+qQe2jZt1pv/IgWzV7
 YEkA==
X-Gm-Message-State: AO0yUKWNFZRWoqK7xxNiur40GsXqdVd9PNgfY+jdMvfR/gu9hFERbueq
 6kF2v9kU7SAJwaqw08mUooeyD9pZr/MVQ0LB5dnoGA==
X-Google-Smtp-Source: AK7set8sM5j/HynYDX+3XnfUE0g9IIfVEi1zgovjx70i6PnuaGlyVIOuz11lKPUu/UjVAOmJRYPZ0PAfj7MkHSpzsZM=
X-Received: by 2002:a05:6a00:1490:b0:593:dc7d:a31d with SMTP id
 v16-20020a056a00149000b00593dc7da31dmr2668448pfu.23.1675447459498; Fri, 03
 Feb 2023 10:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20230203171657.2867598-1-eric.auger@redhat.com>
In-Reply-To: <20230203171657.2867598-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 18:04:07 +0000
Message-ID: <CAFEAcA8qz8qsZNsrbbnmvVUgRazsxtGVm59enyU1rf2ZHjx+ow@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Add raw_writes ops for register whose write
 induce TLB maintenance
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, richard.henderson@linaro.org, 
 pbonzini@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 3 Feb 2023 at 17:17, Eric Auger <eric.auger@redhat.com> wrote:
>
> Many registers whose 'cooked' writefns induce TLB maintenance do
> not have raw_writefn ops defined. If only the writefn ops is set
> (ie. no raw_writefn is provided), it is assumed the cooked also
> work as the raw one. For those registers it is not obvious the
> tlb_flush works on KVM mode so better/safer setting the raw write.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>
> ---
>
> I'am not familiar with those callbacks. I have tested in kvm accelerated
> mode including migration but I fail to test with TCG. It SIGSEVs for
> me even without my additions. I am not sure whether the .raw_writefn
> must be set only for registers only doing some TLB maintenance or
> shall be set safely on other registers doing TLB maintenance + other
> state settings.
> ---
> @@ -718,16 +718,20 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
>       * the unified TLB ops but also the dside/iside/inner-shareable variants.
>       */
>      { .name = "TLBIALL", .cp = 15, .crn = 8, .crm = CP_ANY,
> -      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W, .writefn = tlbiall_write,
> +      .opc1 = CP_ANY, .opc2 = 0, .access = PL1_W,
> +      .writefn = tlbiall_write, .raw_writefn = raw_write,
>        .type = ARM_CP_NO_RAW },

Anything with type ARM_CP_NO_RAW shouldn't need a .raw_writefn, because
that type indication says that it's a bug if we ever call
read_raw_cp_reg() or write_raw_cp_reg() on it. (Specifically,
for KVM, we should never end up trying to do a raw read/write
for a state sync because write_list_to_cpustate() and
write_cpustate_to_list() skip NO_RAW cpregs.)

thanks
-- PMM

