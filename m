Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A71352772
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 10:31:20 +0200 (CEST)
Received: from localhost ([::1]:33354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSFD5-0003Au-VR
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 04:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lSFBg-0002g1-UV
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:29:52 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:36500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lSFBf-0004Dp-7T
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:29:52 -0400
Received: by mail-yb1-xb32.google.com with SMTP id w8so4452354ybt.3
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 01:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ypH9u1BUgNRRDkjFDN1finKrfaIKE5GwZ3zLHX5brCU=;
 b=mUxIAYe550FkvjAyvrvZL4++VEOF4b6FtIxY2HIKKBJPdJbXK13I/aXM3yalbulr/e
 7Pt0FLp3BmRMt75lOKh6NW+R8q65jju19dvcaKopafScg1gStiI4iB8Yi3FxZg86cIMN
 rpRLCkyr677C1szL+niUKNNYdxUTJJPfQFXtvVDg+tKFXzpHHc4352U/AwJHGXDivg03
 cBpNeKxTa7p0WNYKdofzbH2An3tYPNay7ETC4t2s+5NckkobPF0hCg+R7jyOvQIcsVaC
 TXjtwiIRFglFYR/5Do4C/8tR8vI5Gv451WqMJ+Q6mNb3Bpp4kpS3jjb3ilPqPlOUQDqC
 2RUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ypH9u1BUgNRRDkjFDN1finKrfaIKE5GwZ3zLHX5brCU=;
 b=HepNr3Th4OVV+2xcxhxU1evn2NpQZ9DTjUQeRzEbCLmxI9/uMhyNQvomp+CBPyBZNq
 JJo00FgCh2eTJVTJiga0Q8p/FoGOOpaI7UBdFxK0/21GoVmCifjAGDDbm+S/3s8Ddt8X
 8I1YXclzlCFrcmqaCjqc9feMVeTjyHs/9VgyZlbFu78IJH/3dEcHxQRf90ONT6nLoA7o
 oTjgf1vM8a39Y2W7fOwjdDWf4GPd5qnxF/d1llmbR6tYdwhObOLYuZdtS8e++TTipp6V
 xK+1jJ4DjywzuEqrg31+bXQWzF2hJOOdZtTMgGvbOEFIpsCz2StQcYRCNQaSh4sSGoPQ
 l5kw==
X-Gm-Message-State: AOAM5328kZIy8btJD42YiZBcO7KB2uM8zb6IPppvUF2KZUZfrOdRaDei
 bJTQoDb2KhEzKLF4CX5S9KIFiqfzMgv6fF1tBbJkOCU1av6EBw==
X-Google-Smtp-Source: ABdhPJyZB54Qm2Vf9luGvQx/WTPjW25bsQy74gZXWsakgSsKr7Mg8uR4IKYN/WL8likMjDT+sg1j6hr38haRuOVOFU0=
X-Received: by 2002:a25:74ca:: with SMTP id
 p193mr17124734ybc.405.1617352189445; 
 Fri, 02 Apr 2021 01:29:49 -0700 (PDT)
MIME-Version: 1.0
From: Ziqiao Kong <ziqiaokong@gmail.com>
Date: Fri, 2 Apr 2021 16:29:38 +0800
Message-ID: <CAM0BWNCTD_oe3BgKQUqG41fgFqGCXVh1gaiMqJpvXbR4Fh5vHg@mail.gmail.com>
Subject: Bug: fstenv is wrongly implemented
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=ziqiaokong@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello everyone,

I am an active maintainer of Unicorn engine
(https://github.com/unicorn-engine). During my development, I found
that the fstenv implementation in qemu upstream is incorrect.

Below is the code snippet from target/i386/tcg/fpu_helper.c
(https://github.com/qemu/qemu/blob/266469947161aa10b1d36843580d369d5aa38589/target/i386/tcg/fpu_helper.c#L2393).

> cpu_stl_data_ra(env, ptr, env->fpuc, retaddr);
> cpu_stl_data_ra(env, ptr + 4, fpus, retaddr);
> cpu_stl_data_ra(env, ptr + 8, fptag, retaddr);
> cpu_stl_data_ra(env, ptr + 12, 0, retaddr); /* fpip */
> cpu_stl_data_ra(env, ptr + 16, 0, retaddr); /* fpcs */
> cpu_stl_data_ra(env, ptr + 20, 0, retaddr); /* fpoo */
> cpu_stl_data_ra(env, ptr + 24, 0, retaddr); /* fpos */

The value of fpip is wrongly set to 0, which should be env->fpip at
least I think. In real-world usage, the fstenv is often used to obtain
the current eip value from the FIP field in shellcode.

According to git blame, this bug is introduced about 13 years ago:
https://github.com/qemu/qemu/blame/633decd71119a4293e5e53e6059026c517a8bef0/target-i386/fpu_helper.c#L997.

We also had a patch for this bug:
https://github.com/unicorn-engine/unicorn/commit/59b09a71bfc6fd8b95357944f6be9aa54f424421
which you may refer to. I can also help draft a patch if necessary.

I'm pretty new to qemu-devel mail list and sorry for any violation of
your convention. Thanks in advance!

Ziqiao

