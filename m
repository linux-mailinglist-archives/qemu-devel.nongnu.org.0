Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239DE6D5FFD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:18:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjfbO-0003uk-NR; Tue, 04 Apr 2023 08:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjfbM-0003uR-Kb
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:17:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjfbI-0002rF-Q7
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680610643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvJj+eXa4lyNV4pyHPyFSVmiPqoerN8s5s7i267Lkds=;
 b=Xg2lJOKqdwliktvrcbP9u5b6gev5ymHROMjvTdQ6iUtmsD+zxZh1i/xrsERnYSULyed5II
 75ctd8AP3KBrTvYH/cK3xd+4kyuGc0TAsD+M3efy6BPKnvX4fxugZLZfy+AxjUdCgdzCEs
 GJc0Ild8j/iTmzdZnNkIehgbemHfDe4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-mgXESXW6P8SzOzC-Y2ohBQ-1; Tue, 04 Apr 2023 08:17:22 -0400
X-MC-Unique: mgXESXW6P8SzOzC-Y2ohBQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 k30-20020a50ce5e000000b00500544ebfb1so45551246edj.7
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 05:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680610641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EvJj+eXa4lyNV4pyHPyFSVmiPqoerN8s5s7i267Lkds=;
 b=KlAW+0wCiTcTlQlrQEZLAd+7Wd6XpJYcAoGEF7xRR2Dt2N29WQK1oIgjdSZT2zeLo4
 EiG3euMKycEnyF/9oX3+Sto3je3WpzP2RSAbJ+qhv/XLhkMyFFiyod2lzE321Y3xP/03
 A4XlF0rNFYNIo8bspnYBhTC4o7qv3cB8faT3VaY3vO5NqkaYZapUXQg1GyCrZRKzI4sO
 LODTKa/PCHC9eWMd6/4jLOZDAm65oWhhefW4Frqhc6fz3kuQ6AzQwuD9V+W8ENNyhiOT
 YAY4dJNp8I3pBL5iBT/L4qeqihbaMr1jXgXCiOKuyuYCcXSpC1SC5XQpTSAI1K525v4C
 9SOw==
X-Gm-Message-State: AAQBX9fAloG6Vu8IVxQTPzzInVrHeFvtva0OG/ue5ViZoiP57//+Tohk
 lZ1oBydRxRQEg1npVTJmFFRMPOlHQFjcAxG1VFUw84s9j6DEvASaZhG6x4pTzJiaPEtYbRaazUP
 8Gr4yVJgVlzAy+a0=
X-Received: by 2002:a17:906:e24a:b0:8af:3b78:315d with SMTP id
 gq10-20020a170906e24a00b008af3b78315dmr1918763ejb.23.1680610640979; 
 Tue, 04 Apr 2023 05:17:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350begm9ZIBN7DO7MzDYFifQxnJL71sQB3vzzjCMpvsFaHb5wLUho+1YhLfXlDDDtnE8i8Cewvg==
X-Received: by 2002:a17:906:e24a:b0:8af:3b78:315d with SMTP id
 gq10-20020a170906e24a00b008af3b78315dmr1918730ejb.23.1680610640607; 
 Tue, 04 Apr 2023 05:17:20 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 q15-20020a17090676cf00b00947c0cecceasm5291403ejn.206.2023.04.04.05.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:17:20 -0700 (PDT)
Date: Tue, 4 Apr 2023 14:17:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Yu Zhang <yu.zhang@ionos.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jinpu Wang <jinpu.wang@ionos.com>, Elmar Gerdes <elmar.gerdes@ionos.com>
Subject: Re: an issue for device hot-unplug
Message-ID: <20230404141719.1bc087c8@imammedo.users.ipa.redhat.com>
In-Reply-To: <CAHEcVy5SV34jaubY5F-q=H+smvMVOzKbb=rTaNJDNXyGdFaLZg@mail.gmail.com>
References: <CAHEcVy5SV34jaubY5F-q=H+smvMVOzKbb=rTaNJDNXyGdFaLZg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Mon, 3 Apr 2023 15:24:43 +0200
Yu Zhang <yu.zhang@ionos.com> wrote:

> Dear Laurent,
> 
> recently we run into an issue with the following error:
> 
> command '{ "execute": "device_del", "arguments": { "id": "virtio-diskX" }
> }' for VM "id" failed ({ "return": {"class": "GenericError", "desc":
> "Device virtio-diskX is already in the process of unplug"} }).
> 
> The issue is reproducible. With a few seconds delay before hot-unplug,
> hot-unplug just works fine.
> 
> After a few digging, we found that the commit 9323f892b39 may incur the
> issue.
> ------------------
>     failover: fix unplug pending detection
> 
>     Failover needs to detect the end of the PCI unplug to start migration
>     after the VFIO card has been unplugged.
> 
>     To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and
> reset in
>     pcie_unplug_device().
> 
>     But since
>         17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on
> Q35")
>     we have switched to ACPI unplug and these functions are not called
> anymore
>     and the flag not set. So failover migration is not able to detect if
> card
>     is really unplugged and acts as it's done as soon as it's started. So it
>     doesn't wait the end of the unplug to start the migration. We don't see
> any
>     problem when we test that because ACPI unplug is faster than PCIe native
>     hotplug and when the migration really starts the unplug operation is
>     already done.
> 
>     See c000a9bd06ea ("pci: mark device having guest unplug request
> pending")
>         a99c4da9fc2a ("pci: mark devices partially unplugged")
> 
>     Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>     Reviewed-by: Ani Sinha <ani@anisinha.ca>
>     Message-Id: <20211118133225.324937-4-lvivier@redhat.com>
>     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ------------------
> The purpose is for detecting the end of the PCI device hot-unplug. However,

unplug is async process and issuing multiple unplug requests waiting for
'not found' error as a means to detect that device has been unplugged
hardly a sane way to do that.
Instead of swamping guest with unplug requests (which lead to hw interrupts)
you should wait for DEVICE_DELETED QMP event.

> we feel the error confusing. How is it possible that a disk "is already in
> the process of unplug" during the first hot-unplug attempt? So far as I
> know, the issue was also encountered by libvirt, but they simply ignored it:
> 
>     https://bugzilla.redhat.com/show_bug.cgi?id=1878659
> 
> Hence, a question is: should we have the line below in
> acpi_pcihp_device_unplug_request_cb()?
> 
>    pdev->qdev.pending_deleted_event = true;

comment 15 in above BZ describes how we could get rid of this line
but also see comment 17
(in nutshell you get error because device hasn't been removed yet)
 
> 
> It would be great if you as the author could give us a few hints.
> 
> Thank you very much for your reply!
> 
> Sincerely,
> 
> Yu Zhang @ Compute Platform IONOS
> 03.04.2013


