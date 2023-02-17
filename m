Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A284B69B17C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:58:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT42X-0002ei-By; Fri, 17 Feb 2023 11:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pT42S-0002eE-US
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:56:48 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pT42R-0005zW-1x
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:56:48 -0500
Received: by mail-yb1-xb30.google.com with SMTP id 188so1680343ybi.8
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 08:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J4RHINuYWc62wuiZUYoVA1vr2xMboB0oFkSwWLbZ724=;
 b=RilVJ/HKpoW7n5UWDOfmrCHM8smsB9ocQ/p3kdiPDCSdDzuOlCJEft4fkow+1dxspC
 GC8C4lRh3cOpNfXNe6d4qZZp98hQu6zKVw3dmJp4Xx6Oc7yZJk+tJpIREqR6DX5P8AZV
 YFpHe/T1skf1BjQ0qqt6rq3LcasxdRFSrcW98DOzWrr81YY80DpinOc4vjfb5LmHjF6h
 uXsCTd3/tK9RtuGq35Z0leESq2HGjaeosMdNT8xA3RsTGFDOB4LWBhp1LeylZDK+bBus
 OFQQJptLk7+igo7m3ejC12+xx66bsaz0a5wCgpuZa1i5gHIPenso0tLc+viophHTM4rZ
 Qb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J4RHINuYWc62wuiZUYoVA1vr2xMboB0oFkSwWLbZ724=;
 b=O4MWNi5UNfEOtPH7r2zcizF8Zq15+mpc0zthXNEBUpAPTslNQEw2A4xHKShTppsT3I
 /dhfpdy1xFdKd/BZnUqRF00FqRUyAR6XzTFqc1+ghBDS0bGkVBObmHeDaVhFBdvn0dpd
 HCAr3NE6XmecKy2oYZ8nrj0TUf0Y02+u9mAm6d/8B4FYfJTtJc5xgHdrjuDogxqqpcGR
 rnptlnq0HwbVjy1wmJB7BNP3iV1rrAVHRNcKlmo1w+qo1qkdweE76bo9Ka+4Udk3sTJO
 rOVaITtl8HNrtwmLyl7fFIXaBIe94aeM2WxRuxA6HYkpRmmWOw2HfW3w1nWgCILAtjTO
 u5ig==
X-Gm-Message-State: AO0yUKVdkpIh4E43OV3552iQU3lVcqMFyF8RbGy2cRyrJm7aYGg0XKil
 vAMe4G/bhE3XxRkrs6FGlMraaMMlqTe/SeXZr6Y=
X-Google-Smtp-Source: AK7set9I98nAtJXAqf2cGgeSocah47oxAOCKp17Pa8rpZh8CKcwj6w7QL2PwPvnpDaxatA7kg/Dbt82bbdNpUSZSncI=
X-Received: by 2002:a5b:1c1:0:b0:95d:85ed:4594 with SMTP id
 f1-20020a5b01c1000000b0095d85ed4594mr704527ybp.513.1676653005832; Fri, 17 Feb
 2023 08:56:45 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
 <CAJh=p+4_XkR-MN4ByiOHmu_8-RSMDS69zKd_AXYX-47Kzp7Ciw@mail.gmail.com>
In-Reply-To: <CAJh=p+4_XkR-MN4ByiOHmu_8-RSMDS69zKd_AXYX-47Kzp7Ciw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 17 Feb 2023 11:56:34 -0500
Message-ID: <CAJSP0QUrXeySuD4xi-sbuAeniuKJQLHfg9+Xu-Xpn=-SZdKsxQ@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: German Maglione <gmaglione@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 "Florescu, Andreea" <fandree@amazon.com>,
 Damien <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hanna Reitz <hreitz@redhat.com>, 
 Alberto Faria <afaria@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bernhard Beschow <shentey@gmail.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, 17 Feb 2023 at 11:43, German Maglione <gmaglione@redhat.com> wrote:
>
> Hi Stefan,
>
> Sorry for being so late, if it is still possible I would like to propose the
> following project:

Added, thanks!
https://wiki.qemu.org/Internships/ProjectIdeas/VirtiofsdSandboxingTool

Stefan

>
> === A sandboxing tool for virtiofsd ===
>
> ''Summary:''' Create a tool that runs virtiofsd in a sandboxed environment
>
> Virtiofs is a shared file system that lets virtual machines access a directory
> tree on the host. Unlike existing approaches, it is designed to
> offer local file system semantics and performance.
>
> Currently, virtiofsd integrates the sandboxing code and the server code in a
> single binary. The goal is to extract that code and create an external tool that
> creates a sandbox environment and runs virtiofsd in it. In addition, that tool
> should be extended to be able to run virtiofsd in a restricted environment with
> Landlock.
>
> This will allow greater flexibility when integrating virtiofsd into a VMM or
> running it inside a container.
>
> Goals:
> * Understand how to setup a restricted environment using chroot, namespaces, and
>   Landlock
> * Refactor virtiofsd to extract the sandbox code to its own crate
> * Create an external sandboxing tool for virtiofsd
>
> '''Links:'''
> * https://virtio-fs.gitlab.io/
> * https://gitlab.com/virtio-fs/virtiofsd
> * https://landlock.io/
>
> '''Details:'''
> * Project size: 175 hours
> * Skill level: intermediate (knowledge of Rust and C)
> * Language: Rust
> * Mentor: German Maglione <gmaglione@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
> * Suggested by: German Maglione <gmaglione@redhat.com>
>
>
> On Fri, Jan 27, 2023 at 4:18 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> Dear QEMU, KVM, and rust-vmm communities,
>> QEMU will apply for Google Summer of Code 2023
>> (https://summerofcode.withgoogle.com/) and has been accepted into
>> Outreachy May 2023 (https://www.outreachy.org/). You can now
>> submit internship project ideas for QEMU, KVM, and rust-vmm!
>>
>> Please reply to this email by February 6th with your project ideas.
>>
>> If you have experience contributing to QEMU, KVM, or rust-vmm you can
>> be a mentor. Mentors support interns as they work on their project. It's a
>> great way to give back and you get to work with people who are just
>> starting out in open source.
>>
>> Good project ideas are suitable for remote work by a competent
>> programmer who is not yet familiar with the codebase. In
>> addition, they are:
>> - Well-defined - the scope is clear
>> - Self-contained - there are few dependencies
>> - Uncontroversial - they are acceptable to the community
>> - Incremental - they produce deliverables along the way
>>
>> Feel free to post ideas even if you are unable to mentor the project.
>> It doesn't hurt to share the idea!
>>
>> I will review project ideas and keep you up-to-date on QEMU's
>> acceptance into GSoC.
>>
>> Internship program details:
>> - Paid, remote work open source internships
>> - GSoC projects are 175 or 350 hours, Outreachy projects are 30
>> hrs/week for 12 weeks
>> - Mentored by volunteers from QEMU, KVM, and rust-vmm
>> - Mentors typically spend at least 5 hours per week during the coding period
>>
>> For more background on QEMU internships, check out this video:
>> https://www.youtube.com/watch?v=xNVCX7YMUL8
>>
>> Please let me know if you have any questions!
>>
>> Stefan
>>
>
>
> --
> German

