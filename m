Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC2C67E8B4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 15:55:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQ7v-0000wg-0H; Fri, 27 Jan 2023 09:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLQ7s-0000vV-91
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 09:54:48 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLQ7n-00032t-Sw
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 09:54:45 -0500
Received: by mail-pj1-x1029.google.com with SMTP id b10so4854013pjo.1
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 06:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LkDqyGrdQP09P8B3VOXn+2snrIqZ+RVtQwBSGQWoOuE=;
 b=tbV+DtYfL0Tt3h2SY0kE72VJ3f3GRcNM3eERMngALVTmFr4w3HvaHqdRSl/yJUNkfD
 8KEda7J0BuobaAq6VsFTrGQBThFt6Tj9pra9379MYarW87eRD7Mij4dk1O3m2TTV0daQ
 V3uS9MpvkY+bPFmOCoB7tzKqzwRgCdDFhfpoTF0kkCwaobzit8vutClr+rSYX2R//XjB
 rgjArxqS+KjE/niw3FHKeefz8atQnLwnv/t396aRMcPhavopo2IWwtP5JhM2n5H8tk25
 F3e4+UPYqlM2BJotAbFwRBq9Dsw8w/85a5xnj6gB/YaSAp1kR03Ez8iBW397pbhgohU4
 aKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LkDqyGrdQP09P8B3VOXn+2snrIqZ+RVtQwBSGQWoOuE=;
 b=1FNXLs19EdIZ7yFAN/XxpPyDprWeDhEJUsMC197Okm1Q82BlmtRC+VUJRsBme1iHB8
 44nLUp+OX/129IheLXKgjVlRhby6n92+ustNGXQZy+YiEo5UySsFaE3i13uRT27XZqga
 G4er/P4WW9kU56vNLMrF5DSCVyXnLeYBLrQbZrwyZTkNjHW2SLHcDlJUXBwtHEVTYeEw
 XhBzh24VnwUQOVMnQ5aKyy3SAI0GAMcT+1UBTO3trTabQN8P//b/UBEuHuCpNfkqmtus
 jQnEEbB14mJl9zcO96463ZnLLzUHeUs37e2bgvXGPoKBz4z+r4DeQ3J9EX4TRuwbuj3s
 Uy6g==
X-Gm-Message-State: AO0yUKWQ8NpAWprH885lsKsxAwnr8Lk8z5E+ONqcAwrZhEiGlPiaeZML
 FrWpZR/+C4lHbxLbEdh6dC33XIdCf96g8zyYLz5fmA==
X-Google-Smtp-Source: AK7set+BwyxAKfRkJOIWYhmGmtqgxW/nvVV/wOB8DP+JLuUxKYXjGigYlwPknE1fpi3tOE6uxD7mb3NqRa6uPxGwO8M=
X-Received: by 2002:a17:90a:71c6:b0:22c:dfb:a9da with SMTP id
 m6-20020a17090a71c600b0022c0dfba9damr1928136pjs.115.1674831282251; Fri, 27
 Jan 2023 06:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
In-Reply-To: <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2023 14:54:30 +0000
Message-ID: <CAFEAcA8E98v5X5ekA16c6Fby2HAhOC5G4JYnN9TkrA9G7rVzvA@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
To: Warner Losh <imp@bsdimp.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, 
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com, kevans@freebsd.org, 
 berrange@redhat.com, groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, 
 philmd@linaro.org, alistair@alistair23.me, jasowang@redhat.com, 
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de, 
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com, 
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 19 Jan 2023 at 14:42, Warner Losh <imp@bsdimp.com> wrote:
>
> Also, why didn't you move sys/resource.h and other such files
> to os-dep.h? I'm struggling to understand the rules around what
> is or isn't included where?

The rough rule of thumb is that if some OS needs a compatibility
fixup or workaround for a system header (eg not every mmap.h
defines MAP_ANONYMOUS; on Windows unistd.h has to come before
time.h) then we put that header include and the compat workaround
into osdep.h. This avoids "only fails on obscure platform" issues
where somebody puts a header include into some specific .c file
but not the compat workaround, and it works on the Linux host
that most people develop and test on and we only find the
problem later.

There's also no doubt some includes there for historical
reasons, and some which really are "everybody needs these"
convenience ones. But we should probably not add new
includes to osdep.h unless they fall into the "working around
system header issues" bucket.

thanks
-- PMM

