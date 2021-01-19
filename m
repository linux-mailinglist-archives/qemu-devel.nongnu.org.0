Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E1B2FAEE0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 03:42:40 +0100 (CET)
Received: from localhost ([::1]:48922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1gyd-0001rV-8o
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 21:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1gxs-0001OM-Oa; Mon, 18 Jan 2021 21:41:52 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:44766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1gxr-0008EV-4j; Mon, 18 Jan 2021 21:41:52 -0500
Received: by mail-yb1-xb31.google.com with SMTP id x78so10102024ybe.11;
 Mon, 18 Jan 2021 18:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lp/2F5sXlYY6JgjlXoaTXdic40awA9foAt8N+Wb4Ri8=;
 b=Lqj3MZGct8RhEH/u/kLLA/EB1PGuxpLx4uSZiB6MgEoXF4QKUTq9N6N77QVhGSn/ms
 cBJe70UhIPAnKE5DYFgU2vJ5JHRxmI+pCY3Ja2kPwyMwh056GxsQCWhyav7RII975UTp
 iHH4F2e3i80Of3ArOCNrI1h+ktonZ9LvjzDXX8gkTWarmLYHe6A+gqkDijyaem6f87JH
 843NVxmTsYaqiDIlUxFgrwM03tjfJHQ4J8/nBjqHkYq5MdQBYDn4ZsFzJ2QA3zBJwvt7
 W5SBbMLM7TfdB1mau9/jBSQPafbcb+u5b10muFK5HGajD6NB4pl5T716JdBuxgfzADHV
 FW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lp/2F5sXlYY6JgjlXoaTXdic40awA9foAt8N+Wb4Ri8=;
 b=cWUk4lc9nQCRfjHdQMz6AYdnRrMP0AXdQcQfrRHbhyfU6wNZA0onK9NUqlvLzQpRn2
 /1mAcUEJ4J9cmf1FSGcY/ovbOGDKrjT5980iGny25ZAdohxEMyTha1gy2bahx3XcqQ4Z
 5cE3QO0BJ4/pII4ezxVxEYz4+zaHD6vS4Aqkpf6aBbNLddU5ks2qDrs1prxFR2LJ1cfs
 GjvPELF3hzVjYo6rNA6Jd2oJRUoff17jt8Dl0fSuFfyR3J5s53PtQbcNiYAWJMatfiio
 yif0Xvpg5hHEki27KrV4l942bb5Ptg/JmqcMZ+x/brLcdJsELmmmkriIs3teAoBqgMSl
 M/BA==
X-Gm-Message-State: AOAM5313xVR4LerA8Xf5Ipsyq0CCFp0qrGZM1ut0t5w0+5386SEKvChZ
 S/lsCt6MUuLtiMzehXFkCWAaXGatUHBb+NXHTD4=
X-Google-Smtp-Source: ABdhPJygxSg98ntcuPNE7N7xXFfIhPj8WE909o8WaRbHZufu5p6j0c2dTDOl5aMIHcPaYMD7GEG/goMbhbWXz49sQEs=
X-Received: by 2002:a25:2a86:: with SMTP id q128mr3093570ybq.387.1611024109779; 
 Mon, 18 Jan 2021 18:41:49 -0800 (PST)
MIME-Version: 1.0
References: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
 <1610427124-49887-2-git-send-email-bmeng.cn@gmail.com>
 <5bb89965-266d-d789-bd64-a963559ea28f@linaro.org>
In-Reply-To: <5bb89965-266d-d789-bd64-a963559ea28f@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 19 Jan 2021 10:41:38 +0800
Message-ID: <CAEUhbmWoF7aDfwMdQot8TTUuVb4sAzzQf1T8KM=ZtYoZ8M66eA@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/riscv: Make csr_ops[CSR_TABLE_SIZE] external
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jim Wilson <jimw@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 1:55 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/11/21 6:52 PM, Bin Meng wrote:
> > +extern riscv_csr_operations csr_ops[];
>
> You might as well use CSR_TABLE_SIZE here.
>

OK, I will send a patch for this. Thanks!

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Regards,
Bin

