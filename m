Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180495485BB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 16:39:30 +0200 (CEST)
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0lE1-0004XB-6q
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 10:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1o0lCM-0003pq-50
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 10:37:46 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:34645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1o0lCK-00009f-HH
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 10:37:45 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id p13so10232118ybm.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+UNsKEG0xo/sFzVcAQsQiJECfBiryrgj7clGyVe0wcQ=;
 b=frbRKx1GUTgbH7Xjtr72pdllmhGl9krgBZApG6HE16kJCREqk6wLL/IvWEWlEjtbaS
 m8Bp7V4kvRDNBMcfc0xNIgBR7WF2W5DvceCooEDCjt6B1ULGCiktq7d+EUtdIikGYZOC
 5v+2MVLqB3pa92ZPXTtD8reLeYxEjzHouXegREpgnjRZqoi1bhD7IfmhL1vlB4NJZ/HV
 34FapXX5PrkUHXnzAxjUWb2a5rTKaF+MBwnyaC/Z+xdM3NH0dmTIgmvJNqdB92cqHsMO
 iKuwnr4EH9G+Jn5DKhIA0hyWRvXfGc1biIRaU1StRBUc1nYiqAExCja4FMBXzT4S9Wp1
 zpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+UNsKEG0xo/sFzVcAQsQiJECfBiryrgj7clGyVe0wcQ=;
 b=isRjrMMHERiCE8uD9EXor0j+GERIuzmKO3rRcxFkuWBqQEMFPW2arLM8H7wphdJiTj
 V1f+A8UHQkuc70c3w/mMlmVqdqxAOlC3EEuc6N54GcCLJzoStlqMdnK7wViX1GC/KaWC
 FMwXmOew+TlS6qIAedqTuo3inJ05oPOHxuLPIFU+KHtbXKsyQcE3R9WSXcp+FEGufa6V
 2L7WgjDh9dHercQuJfkFdVwIwuQtaYl1xKpKyBWqgGvBt5jZuMTPSS5dq6LmnulEYcvF
 uyMM4amm8Wd6CssgcbbCJ7KgPoqk9zBXR0BbSTuKLQ+Diw6wKjpK5InWKs/f/od6Tkdp
 1P/A==
X-Gm-Message-State: AOAM531EgmJzu5vmFqPVY9hyr+bpZ3cuJpLI4sNnnb1QieCD1BSkyQBb
 O7w7Kr8hrd+r2He8ALnrjjNi9CkSeWkh5xrNse0=
X-Google-Smtp-Source: ABdhPJy2vJouQWzbA2ABO0vyHGTD2SfSFus8pmf5HWKqJDPskGdeCE0nKSW7+NZR0BL4GzUFGq50ihjnBGmbW8uix30=
X-Received: by 2002:a25:a081:0:b0:664:4823:9408 with SMTP id
 y1-20020a25a081000000b0066448239408mr20582007ybh.335.1655131063423; Mon, 13
 Jun 2022 07:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220613104402.10279-1-lizhang@suse.de>
 <20220613161937.333a6b82@redhat.com>
In-Reply-To: <20220613161937.333a6b82@redhat.com>
From: Li Zhang <zhlcindy@gmail.com>
Date: Mon, 13 Jun 2022 16:37:32 +0200
Message-ID: <CAD8of+pp-3bKX44Q0++gRofx4gmzzjpq1N2HfgRacXT196pR7w@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] Fix the coredump when memory backend id conflicts
 with default_ram_id
To: Igor Mammedov <imammedo@redhat.com>
Cc: Li Zhang <lizhang@suse.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>, QEMU <qemu-devel@nongnu.org>, 
 David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=zhlcindy@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jun 13, 2022 at 4:19 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Mon, 13 Jun 2022 12:44:02 +0200
> Li Zhang <lizhang@suse.de> wrote:
>
> > When no memory backend is specified in machine options,
> > a default memory device will be added with default_ram_id.
> > However, if a memory backend object is added in QEMU options
> > and id is the same as default_ram_id, a coredump happens.
> >
> > Command line:
> > qemu-system-x86_64 -name guest=vmtest,debug-threads=on \
> > -machine pc-q35-6.0,accel=kvm,usb=off,vmport=off \
> > -smp 16,sockets=16,cores=1,threads=1 \
> > -m 4G \
> > -object memory-backend-ram,id=pc.ram,size=4G \
> > -no-user-config -nodefaults -nographic
> >
> > Stack trace of thread 16903:
> >     #0  0x00007fb109a9318b raise (libc.so.6 + 0x3a18b)
> >     #1  0x00007fb109a94585 abort (libc.so.6 + 0x3b585)
> >     #2  0x0000558c34bc89be error_handle_fatal (qemu-system-x86_64 + 0x9c89be)
> >     #3  0x0000558c34bc8aee error_setv (qemu-system-x86_64 + 0x9c8aee)
> >     #4  0x0000558c34bc8ccf error_setg_internal (qemu-system-x86_64 + 0x9c8ccf)
> >     #5  0x0000558c349f6899 object_property_try_add (qemu-system-x86_64 + 0x7f6899)
> >     #6  0x0000558c349f7df8 object_property_try_add_child (qemu-system-x86_64 + 0x7f7df8)
> >     #7  0x0000558c349f7e91 object_property_add_child (qemu-system-x86_64 + 0x7f7e91)
> >     #8  0x0000558c3454686d create_default_memdev (qemu-system-x86_64 + 0x34686d)
> >     #9  0x0000558c34546f58 qemu_init_board (qemu-system-x86_64 + 0x346f58)
> >     #10 0x0000558c345471b9 qmp_x_exit_preconfig (qemu-system-x86_64 + 0x3471b9)
> >     #11 0x0000558c345497d9 qemu_init (qemu-system-x86_64 + 0x3497d9)
> >     #12 0x0000558c344e54c2 main (qemu-system-x86_64 + 0x2e54c2)
> >     #13 0x00007fb109a7e34d __libc_start_main (libc.so.6 + 0x2534d)
> >     #14 0x0000558c344e53ba _start (qemu-system-x86_64 + 0x2e53ba)
> >
> > Signed-off-by: Li Zhang <lizhang@suse.de>
>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
>
>
> CCing David as he probably would be the one to merge it
>

Thanks for your review.

> > ---
> >  hw/core/machine.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index a673302cce..9ede63b01c 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -1265,9 +1265,21 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
> >  static bool create_default_memdev(MachineState *ms, const char *path, Error **errp)
> >  {
> >      Object *obj;
> > +    ObjectProperty *prop;
> >      MachineClass *mc = MACHINE_GET_CLASS(ms);
> >      bool r = false;
> >
> > +    prop = object_property_find(object_get_objects_root(), mc->default_ram_id);
> > +    if (prop) {
> > +        error_report("A memory backend with id '%s' already exists, "
> > +                     "cannot create default RAM backend with the same id. "
> > +                     "Either change id of the offending backend or "
> > +                     "provide system RAM backend explicitly using "
> > +                     "'-machine memory-backend' option. " ,
> > +                     mc->default_ram_id);
> > +        exit(EXIT_FAILURE);
> > +    }
> > +
> >      obj = object_new(path ? TYPE_MEMORY_BACKEND_FILE : TYPE_MEMORY_BACKEND_RAM);
> >      if (path) {
> >          if (!object_property_set_str(obj, "mem-path", path, errp)) {
>


-- 

Best Regards
-Li

