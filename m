Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0006568C715
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 20:53:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP7Y7-0002S7-0w; Mon, 06 Feb 2023 14:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1pP7Y1-0002Rj-SO
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1pP7Y0-00008m-2F
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675713182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rVq9FE3zQz68lr7rntok1IqkBi/F8oP97RLDrwJNrAA=;
 b=L+PJhEFG90K38v8FcaIoPoZertuEBE59iI1Y26vZivnvKzu5MWnVxBrG1OcWflq7P9B+G2
 zH8rIz+3iIPQtEUSE/uVKFlFKD+SQwFDg5nm+BzP0eqJmRPcUw5Y7VKYp6iNIRjOvBs3IF
 G8ZWCh8GxS0ruR4/ubC6M0BetX2/B3Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-UlETbyVoM4CcXlrz9wdE1w-1; Mon, 06 Feb 2023 14:51:35 -0500
X-MC-Unique: UlETbyVoM4CcXlrz9wdE1w-1
Received: by mail-ed1-f69.google.com with SMTP id
 be25-20020a0564021a3900b004aaa52dde12so3191819edb.18
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 11:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rVq9FE3zQz68lr7rntok1IqkBi/F8oP97RLDrwJNrAA=;
 b=VZ4dqDaXINSsgB0TjrGmJJIOL5kdRc8VxG3k8NAK87VHXb3UWZ76/lB0WO+OuJbbe0
 FpSw5CftNcfGbSzzKsYUnRkgd5ev1JvY+IWToxekuNulnn2jAAcGyE8QTTGvzb4QIcWW
 zOjj95pu3yIwOkvpcjNo+oDlCLHMUvzHF8GN8xHkaseZHzgU7pdB5JjrLMxTNbrRLhXe
 EcrfITKE1Q29zNLFfbs0VeRWZCSW0+pNstOjeWmf3iREXsgOYsvE0qflH8AnF6Rv5FgG
 2fg5PCMLZgc2eZZJTXGOm0WhCDTQq05HKjG0aETD++nyBMjBehzpwA8PBfZmWzJ2bvOD
 rD7g==
X-Gm-Message-State: AO0yUKUuMlevRVIVkdcS8wfctK9517gEUOMJdU4M24JJrHW/NsrQeiU9
 wdxhg4In1Ocv5OZe9t5Rbpm35K81pQW41TlyRhMgPbj6l0o3jJzeWozzd7Vyh+ZaKRkttVDS28S
 IBVtQ4nHPSeroVW44wuz6ms0Cphk15Sw=
X-Received: by 2002:a17:906:7b55:b0:88f:9c29:d238 with SMTP id
 n21-20020a1709067b5500b0088f9c29d238mr184847ejo.214.1675713094623; 
 Mon, 06 Feb 2023 11:51:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9p9+rOhbqUscva+gn/sL4GOeq9baOQ8/fRol+3NzaI6Jt/j7FHUp6w61Aaft7LLfmBF8ppV3RFqZ5MN7WEG08=
X-Received: by 2002:a17:906:7b55:b0:88f:9c29:d238 with SMTP id
 n21-20020a1709067b5500b0088f9c29d238mr184825ejo.214.1675713094363; Mon, 06
 Feb 2023 11:51:34 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
In-Reply-To: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 6 Feb 2023 19:50:58 +0000
Message-ID: <CAELaAXysa3M-TPbLMCVCwpt40iqhXpF7PCan_i6SzY_YMafXrg@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Stefan Hajnoczi <stefanha@gmail.com>
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bernhard Beschow <shentey@gmail.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, gmaglione@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Jan 27, 2023 at 3:17 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> Dear QEMU, KVM, and rust-vmm communities,
> QEMU will apply for Google Summer of Code 2023
> (https://summerofcode.withgoogle.com/) and has been accepted into
> Outreachy May 2023 (https://www.outreachy.org/). You can now
> submit internship project ideas for QEMU, KVM, and rust-vmm!
>
> Please reply to this email by February 6th with your project ideas.
>
> If you have experience contributing to QEMU, KVM, or rust-vmm you can
> be a mentor. Mentors support interns as they work on their project. It's a
> great way to give back and you get to work with people who are just
> starting out in open source.
>
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
> For more background on QEMU internships, check out this video:
> https://www.youtube.com/watch?v=xNVCX7YMUL8
>
> Please let me know if you have any questions!
>
> Stefan

FWIW there is some work to be done on libblkio [1] that QEMU could
benefit from. Maybe these would be appropriate as QEMU projects?

One possible project would be to add zoned device support to libblkio
and all its drivers [2]. This would allow QEMU to use zoned
vhost-user-blk devices, for instance (once general zoned device
support lands [3]).

Another idea would be to add an NVMe driver to libblkio that
internally relies on xNVMe [4, 5]. This would enable QEMU users to use
the NVMe drivers from SPDK or libvfn.

Thanks,
Alberto

[1] https://libblkio.gitlab.io/libblkio/
[2] https://gitlab.com/libblkio/libblkio/-/issues/44
[3] https://lore.kernel.org/qemu-devel/20230129102850.84731-1-faithilikerun@gmail.com/
[4] https://gitlab.com/libblkio/libblkio/-/issues/45
[5] https://github.com/OpenMPDK/xNVMe


