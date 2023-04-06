Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FEF6D96BE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:06:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOMr-0000MV-RH; Thu, 06 Apr 2023 08:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkOMl-0000Jv-KL
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:05:23 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkOMj-0004kZ-VG
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:05:23 -0400
Received: by mail-ej1-x630.google.com with SMTP id lj25so795047ejb.11
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 05:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680782720; x=1683374720;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EpuGEa+ENmyc/OMYgudIsaWT8cHW8lJbDh1sHKTE7yE=;
 b=J7m/AQCcnRQPU2fzez/sabVxIChHs/A1BSsHu3nc3+K+kE/Qs7H+iBG7qhf1O7jBgM
 Vi7fxUYgaE77KAZyp3BnKm919lt3x3nDWtJjf1kobHkvJkgWM3cUXGOyZtXfVNPQQMji
 T5jefVL0AEBqtrsqdR1fNUlyhM0XwFzW+q9+UWBj8H5egsqhAVLwMJLDzGSMBxH57NIO
 O3tfIoME4dR3Ah1uPaHJ2JhLDah/VmHetiDJsle3cPxFad3UbGWGkueK7rveJ5OqvQH+
 X3aJj8Qlmf/GQ1iRV5dEVj4NSQsJVLXkeJ/fF+oGRd57o/dz9zdufpt//8JYWEA6Bzkv
 b2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680782720; x=1683374720;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EpuGEa+ENmyc/OMYgudIsaWT8cHW8lJbDh1sHKTE7yE=;
 b=w4gWhQZagjAVgKAeX0Lfbo8Mfhm1J/OZ3MTzDJ8Zwuhgce4VsoxrqKLdLJYXSVzktK
 5Bk7okyXMuaYD8Kp6wKfvvgd6lSB3QiSsYNogtvfDhznH/yQZ9gH9802EQEi0518KoWi
 c6C7fPr/BGgsBZU9QoFJyHD95aU9nzkyftmZSZ8UkLlUzZnKcJrALoygq1Lldp85i+cO
 74wutktxlGz3KL0fbYIdKpmpBFbRBBnmgxKNvrqmlnwfkwUv2G+APrMlHqF7LwWxcPkB
 JRaPQA0vSEB2ZnCu1YnCubMWxqRwtPpsCOT0fbwGY8UC6/nR8NKkKrVMC/3hOZGNm166
 EOuQ==
X-Gm-Message-State: AAQBX9fm9Agl2Zv+7fgVvM5eQAh4gGlm4/NI85eWOi5lAJg7UToC4ewF
 yTwbtrIYnYJe6FpyeU2iuQRHC35rQf0kGWYl/NVy+g==
X-Google-Smtp-Source: AKy350ZcE1MYwRBj76SlK/ASxLVLzk6ix6VLBxQAN/Rm1COTyVYIZ/OEwHxxyK4DxtUB+T9lhtzzKp3/RsHeAE9/gRI=
X-Received: by 2002:a17:906:1619:b0:878:4a24:1a5c with SMTP id
 m25-20020a170906161900b008784a241a5cmr3100959ejd.6.1680782719922; Thu, 06 Apr
 2023 05:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
 <4521ce29-1d11-f253-7a7d-342f6bd9e6b0@redhat.com>
 <CAFEAcA_HVpYajJ5yP7+eYKNhKggtNjgFyQ_V3WqSPf4dGL=zKQ@mail.gmail.com>
 <3b5cc225-50e8-e56d-3fa8-da052a515beb@linux.ibm.com>
 <CAFEAcA_Uh+20w1gnCBXe6Go9WqkUu+SUeRtsrrbwEO4j48OjGQ@mail.gmail.com>
 <149e9342-b48b-0871-ee4d-96c6f1d3f198@linux.ibm.com>
In-Reply-To: <149e9342-b48b-0871-ee4d-96c6f1d3f198@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 13:05:09 +0100
Message-ID: <CAFEAcA_SgAZmv8YpaR0v7iU1oMdNTAMcrcYWaqGPzHDxjSP=wQ@mail.gmail.com>
Subject: Re: s390 private runner CI job timing out
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Thu, 6 Apr 2023 at 12:17, Christian Borntraeger
<borntraeger@linux.ibm.com> wrote:
>
> Am 06.04.23 um 12:44 schrieb Peter Maydell:
> > On Thu, 6 Apr 2023 at 11:40, Christian Borntraeger
> > <borntraeger@linux.ibm.com> wrote:
> >> Am 06.04.23 um 11:21 schrieb Peter Maydell:
> >>> Christian, does our S390X machine get a guaranteed amount of CPU,
> >>> or does it depend on what else is running on the hardware?
> >>
> >> I think its a shared system with shared CPUs. Can you check the steal
> >> time in top or proc? If this is far too high we could ask to give you
> >> more weight for that VM.
> >
> > It's idle at the moment and steal time seems to be low (0.0 .. 0.3);
> > I'll try to remember to check next time it's running a job.
> >
>
> Do you have /proc/stat ?

Yes; hopefully it means more to you than it does to me :-)

linux1@qemu01:~$ cat /proc/stat
cpu  60904459 604975 15052194 1435958176 17128179 351949 758578 22218760 0 0
cpu0 15022535 146734 3786909 358774818 4283172 98313 237156 5894809 0 0
cpu1 15306890 151164 3746024 358968957 4378864 85629 172492 5434255 0 0
cpu2 15307709 157180 3762691 359141276 4138714 85736 176367 5474594 0 0
cpu3 15267324 149895 3756569 359073124 4327428 82269 172562 5415101 0 0
intr 3015682291 0 1 0
ctxt 9482595181
btime 1676900212
processes 18915201
procs_running 2
procs_blocked 0
softirq 15948680473 1369597456 327774195 41134 114090717 19748 0
465505237 76101069 4250 710644779

-- PMM

