Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CBD4BA79F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:01:47 +0100 (CET)
Received: from localhost ([::1]:51064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKl6A-0008B8-Cp
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:01:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKkxF-0001ij-V0
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:52:34 -0500
Received: from [2a00:1450:4864:20::536] (port=44640
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKkxA-00087y-8T
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:52:33 -0500
Received: by mail-ed1-x536.google.com with SMTP id x5so11007396edd.11
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 09:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0GezYuBq/IBk84/vSXTIhXk7J6MIx3mjFhk6IwFvMpk=;
 b=jLaab6MwwT20QXD4svGT4lr1ununpN2FDzfw5Fd5zN6NacnaFxdFx/32vEkC4NW6jk
 zkbeWhtkY5i4CnmhFXMqOwvr9CBReUqYHQbYGVZbhPq6jiJlHLszzydv65qpfQA8QTFQ
 Y7aSWHzgC/8dvePLHMdKg2l7ChiAxPHDx/4ma3gbp0nMUq8yjIv5s0G8VjLd4DYc6WPQ
 KM2yKtixtMjDh9EIEP951hwb2dfs6Fg7EaTAx08VPJ9u8rKWgdwOspobpOFkMRCFkFLx
 RC2gp1VeFZCE101Ix5JhDVANbO5Xa4/rrGhBgwkRxIPjZiR64PxNPl8TFZxBZGLN+aSy
 Agtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0GezYuBq/IBk84/vSXTIhXk7J6MIx3mjFhk6IwFvMpk=;
 b=cvOcR6f/JAjfPnorhc7zx99eBfGT28KeAowUHEzZjuCexmhHJ855xpmh9a9lB8EdGG
 yAFU6z4FxcUyfxSSwRBKCzf6t9Yw1mw36WMPaAnD43QPsd0IBZGcEkNB+G/AR4Ykv3VM
 bh54uHkGWHGr43N7zyQzaWR4JHY0iaO8cN2F41tyIO7NP6jj1DLYyyU7HHdb93JR/Ltp
 An+ieBwyZvPfEnzvlqY+kQLXRbm/Nq20klocpVT/rYuqYubvGToY75kwNM3DwzxkS1gW
 HkWdZVAhe9EXOgDQFP6e9vvwHm9zIsjeQE7h5w+JS1oKgh9eEDr1e2Ey5ni2ruUduHct
 +wcw==
X-Gm-Message-State: AOAM533o0eMaxhDThmtwGtByUkqzn/o4IDALGLLRYcBRdpLJMnIf7feX
 Zayf7RNfG2mJi/jJIUls4qM=
X-Google-Smtp-Source: ABdhPJzI200juUtGBf/k8LHDGffRyefuo8jxOX3KLk/VDR0ORMo5x7f5QIrkpeZ3jz6H/ybWZB20vQ==
X-Received: by 2002:a05:6402:18:b0:410:86cd:9dce with SMTP id
 d24-20020a056402001800b0041086cd9dcemr3830314edu.70.1645120346234; 
 Thu, 17 Feb 2022 09:52:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id b5sm3717367edz.13.2022.02.17.09.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 09:52:25 -0800 (PST)
Message-ID: <f7dc638d-0de1-baa8-d883-fd8435ae13f2@redhat.com>
Date: Thu, 17 Feb 2022 18:52:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, 
 kvm <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 16:47, Stefan Hajnoczi wrote:
> Dear QEMU, KVM, and rust-vmm communities,
> QEMU will apply for Google Summer of Code 2022
> (https://summerofcode.withgoogle.com/) and has been accepted into
> Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> submit internship project ideas for QEMU, KVM, and rust-vmm!
> 
> If you have experience contributing to QEMU, KVM, or rust-vmm you can
> be a mentor. It's a great way to give back and you get to work with
> people who are just starting out in open source.
> 
> Please reply to this email by February 21st with your project ideas.

I would like to co-mentor one or more projects about adding more 
statistics to Mark Kanda's newly-born introspectable statistics 
subsystem in QEMU 
(https://patchew.org/QEMU/20220215150433.2310711-1-mark.kanda@oracle.com/), 
for example integrating "info blockstats"; and/or, to add matching 
functionality to libvirt.

However, I will only be available for co-mentoring unfortunately.

Paolo

> Good project ideas are suitable for remote work by a competent
> programmer who is not yet familiar with the codebase. In
> addition, they are:
> - Well-defined - the scope is clear
> - Self-contained - there are few dependencies
> - Uncontroversial - they are acceptable to the community
> - Incremental - they produce deliverables along the way
> 
> Feel free to post ideas even if you are unable to mentor the project.
> It doesn't hurt to share the idea!
> 
> I will review project ideas and keep you up-to-date on QEMU's
> acceptance into GSoC.
> 
> Internship program details:
> - Paid, remote work open source internships
> - GSoC projects are 175 or 350 hours, Outreachy projects are 30
> hrs/week for 12 weeks
> - Mentored by volunteers from QEMU, KVM, and rust-vmm
> - Mentors typically spend at least 5 hours per week during the coding period
> 
> Changes since last year: GSoC now has 175 or 350 hour project sizes
> instead of 12 week full-time projects. GSoC will accept applicants who
> are not students, before it was limited to students.
> 
> For more background on QEMU internships, check out this video:
> https://www.youtube.com/watch?v=xNVCX7YMUL8
> 
> Please let me know if you have any questions!
> 
> Stefan
> 


