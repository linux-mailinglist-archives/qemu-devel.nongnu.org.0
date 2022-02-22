Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5348A4C0478
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:20:38 +0100 (CET)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdWP-0003xv-EK
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:20:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KWfY=TF=zx2c4.com=Jason@kernel.org>)
 id 1nMdTU-0000q2-AU
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:17:36 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:58072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KWfY=TF=zx2c4.com=Jason@kernel.org>)
 id 1nMdTR-0006xL-AI
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:17:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 705C5617F5
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 22:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF297C340F4
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 22:17:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lXMDj8r4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645568244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vCnYHLy2ZxLW1+1wKyxbDfmohEew3lEiJPknv0zMRYw=;
 b=lXMDj8r4Yr5uWWxTJyy9JlZE8dPd9P561SOdb0cphGNYx4uYOF0/QjtLjtN93FcOp6uNlQ
 VupvtVgoxdsTRr0yiFFc/3WGr0DAPUbxmounmYEQjVl0cokQYpe4Am0KzYJUUjkCaqDOIk
 WVlMfbOqLv3Owc1ux6xbpSelgoQb0Mw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1bba6feb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 22 Feb 2022 22:17:23 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id d21so21882209yba.11
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:17:22 -0800 (PST)
X-Gm-Message-State: AOAM532CIMjRV8Vfngn2oWQb7EjTEYBfsWJ5sOUIcsUu/B5l2eYJarDN
 TKlsHEvtlPxsYrzy4uAAks75Cyfv4wQMDVazS+Q=
X-Google-Smtp-Source: ABdhPJwlIOwo+38zIXLd6Qx86vOEC2pTybWrAlF+D1no8DxGsVb1DkoOkHcofqIhHbVsWXHFvpYK/Ea3CPmEoMWT/g0=
X-Received: by 2002:a05:6902:693:b0:613:7f4f:2e63 with SMTP id
 i19-20020a056902069300b006137f4f2e63mr24281380ybt.271.1645568240101; Tue, 22
 Feb 2022 14:17:20 -0800 (PST)
MIME-Version: 1.0
References: <1614156452-17311-1-git-send-email-acatan@amazon.com>
 <1614156452-17311-3-git-send-email-acatan@amazon.com>
 <CAHmME9o6cjZT1Cj1g5w5WQE83YxJNqB7eUCWn74FA9Pbb3Y6nQ@mail.gmail.com>
In-Reply-To: <CAHmME9o6cjZT1Cj1g5w5WQE83YxJNqB7eUCWn74FA9Pbb3Y6nQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 22 Feb 2022 23:17:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9poYgfoniexZ2dvpEEvnWGLQTOjOvB2bck-Whhy9h+Hjw@mail.gmail.com>
Message-ID: <CAHmME9poYgfoniexZ2dvpEEvnWGLQTOjOvB2bck-Whhy9h+Hjw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drivers/virt: vmgenid: add vm generation id driver
To: adrian@parity.io
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=KWfY=TF=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: areber@redhat.com, KVM list <kvm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, ghammer@redhat.com,
 vijaysun@ca.ibm.com, 0x7f454c46@gmail.com,
 QEMU Developers <qemu-devel@nongnu.org>, Michal Hocko <mhocko@kernel.org>,
 dgunigun@redhat.com, avagin@gmail.com, Pavel Machek <pavel@ucw.cz>,
 ptikhomirov@virtuozzo.com, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Biggers <ebiggers@kernel.org>,
 borntraeger@de.ibm.com, "Singh, Balbir" <sblbir@amazon.com>, bonzini@gnu.org,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, "Weiss,
 Radu" <raduweis@amazon.com>, asmehra@redhat.com,
 Adrian Catangiu <acatan@amazon.com>, graf@amazon.com,
 Mike Rapoport <rppt@kernel.org>, Andrew Lutomirski <luto@kernel.org>,
 gil@azul.com, oridgar@gmail.com, Colm MacCarthaigh <colmmacc@amazon.com>,
 Theodore Ts'o <tytso@mit.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, ovzxemul@gmail.com,
 "Rafael J. Wysocki" <rafael@kernel.org>, Willy Tarreau <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey again,

On Tue, Feb 22, 2022 at 10:24 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> This thread seems to be long dead, but I couldn't figure out what
> happened to the ideas in it. I'm specifically interested in this part:
>
> On Wed, Feb 24, 2021 at 9:48 AM Adrian Catangiu <acatan@amazon.com> wrote:
> > +static void vmgenid_acpi_notify(struct acpi_device *device, u32 event)
> > +{
> > +       uuid_t old_uuid;
> > +
> > +       if (!device || acpi_driver_data(device) != &vmgenid_data) {
> > +               pr_err("VMGENID notify with unexpected driver private data\n");
> > +               return;
> > +       }
> > +
> > +       /* update VM Generation UUID */
> > +       old_uuid = vmgenid_data.uuid;
> > +       memcpy_fromio(&vmgenid_data.uuid, vmgenid_data.uuid_iomap, sizeof(uuid_t));
> > +
> > +       if (memcmp(&old_uuid, &vmgenid_data.uuid, sizeof(uuid_t))) {
> > +               /* HW uuid updated */
> > +               sysgenid_bump_generation();
> > +               add_device_randomness(&vmgenid_data.uuid, sizeof(uuid_t));
> > +       }
> > +}
>
> As Jann mentioned in an earlier email, we probably want this to
> immediately reseed the crng, not just dump it into
> add_device_randomness alone. But either way, the general idea seems
> interesting to me. As far as I can tell, QEMU still supports this. Was
> it not deemed to be sufficiently interesting?
>
> Thanks,
> Jason

Well I cleaned up this v7 and refactored it into something along the
lines of what I'm thinking. I don't yet know enough about this general
problem space to propose the patch and I haven't tested it either, but
in case you're curious, something along the lines of what I'm thinking
about lives at https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git/commit/?h=jd/vmgenid
if you (or somebody else) feels inclined to pick this up.

Looking forward to learning more from you in general, though, about
what the deal is with the VM gen ID, and if this is a real thing or
not.

Regards,
Jason

