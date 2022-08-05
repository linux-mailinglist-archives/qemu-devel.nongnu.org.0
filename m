Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F1B58A6CB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 09:12:08 +0200 (CEST)
Received: from localhost ([::1]:54638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJrV9-00023A-Hq
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 03:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJrMk-0007Af-6j
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:03:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJrMi-0001at-6U
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659683003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ntA0rO13rCwdgCBDRQyX2zRb0N4VqbAjCEgae8O/FdY=;
 b=ImykHbLq5QxzwAWhD/CjOPXK+HdTtdhBz1ARabQc4GFWyeVsorAapvWpacwdW4u5M11XkH
 lUPxAnXUVTPq8cImA89YWoiwc+nvP8F6FbjxJiH/CrF9wi2pulGoxi4lu9Bl40bJ6sB/cZ
 2W1JG+vaOwmQx6LDfbbtwGiCL999oZs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-W1j2EUAbOpSoIAcRaqjuCQ-1; Fri, 05 Aug 2022 03:03:19 -0400
X-MC-Unique: W1j2EUAbOpSoIAcRaqjuCQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 w5-20020a05640234c500b0043dda025648so1039817edc.8
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 00:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=ntA0rO13rCwdgCBDRQyX2zRb0N4VqbAjCEgae8O/FdY=;
 b=xSFaecrpY5Jhfph0txwFsiT2kwhyOB+lVMSBMS4ErGWAMzswzD9skzH5eJwuwO+YoM
 Ro08VX5ARyhhevtCYM03hchgGqdEyx3s0TKM1LkcrrybR0WQ0HO9o0BJa7Q5ngsu1Y4e
 +SxLVRmKUNJZhPhKMGUYpD8OF3KShWlzAgWHdi4zqnc5yhQ4vOZJPqbe/32nVectS+ZY
 82kNHyrdo3bqfILm4+jT7Ac4GbO3ZVei9vNSvajjixt6gRji5lEhXmT6LMH75ceMuLKR
 PW9UQh7zln+WyYxY4gR7K9L+MzsL1/c9x5W96VdaSjvLfl6FxULhrLrinwO3n356G+E7
 uI8Q==
X-Gm-Message-State: ACgBeo2VRD29HPoh4tb9CXMui6VBlCl4VJzK+7faEwwID/TF7WI4ZmxT
 QBDAHAQ97NsT11U/ceV/q01j+E8soULUpNz2TIk2p40hu5q2nbqQerCK3QWUmjrzLocjY47mVMt
 57EIMhaSoXuxeDT8=
X-Received: by 2002:a05:6402:3689:b0:43e:43d6:6039 with SMTP id
 ej9-20020a056402368900b0043e43d66039mr5384021edb.341.1659682997645; 
 Fri, 05 Aug 2022 00:03:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR69r1oE4rH2Y3ptipJJc/BVmdBQl8o6c34ygp1eY1A9vX/OtW4mEDEND7YHJ6uP3oATUcr3xw==
X-Received: by 2002:a05:6402:3689:b0:43e:43d6:6039 with SMTP id
 ej9-20020a056402368900b0043e43d66039mr5384012edb.341.1659682997464; 
 Fri, 05 Aug 2022 00:03:17 -0700 (PDT)
Received: from redhat.com ([2.52.137.185]) by smtp.gmail.com with ESMTPSA id
 ku3-20020a170907788300b006fe8ac6bc69sm1258573ejc.140.2022.08.05.00.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:03:16 -0700 (PDT)
Date: Fri, 5 Aug 2022 03:03:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Fam Zheng <fam@euphon.net>, Qing Wang <qinwang@redhat.com>
Subject: Re: [PATCH 7.1] virtio-scsi: fix race in virtio_scsi_dataplane_start()
Message-ID: <20220805030248-mutt-send-email-mst@kernel.org>
References: <20220803162824.948023-1-stefanha@redhat.com>
 <YuwWe9Yh9uijB+xG@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuwWe9Yh9uijB+xG@fedora>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Aug 04, 2022 at 02:56:59PM -0400, Stefan Hajnoczi wrote:
> On Wed, Aug 03, 2022 at 12:28:24PM -0400, Stefan Hajnoczi wrote:
> > As soon as virtio_scsi_data_plane_start() attaches host notifiers the
> > IOThread may start virtqueue processing. There is a race between
> > IOThread virtqueue processing and virtio_scsi_data_plane_start() because
> > it only assigns s->dataplane_started after attaching host notifiers.
> > 
> > When a virtqueue handler function in the IOThread calls
> > virtio_scsi_defer_to_dataplane() it may see !s->dataplane_started and
> > attempt to start dataplane even though we're already in the IOThread:
> > 
> >   #0  0x00007f67b360857c __pthread_kill_implementation (libc.so.6 + 0xa257c)
> >   #1  0x00007f67b35bbd56 raise (libc.so.6 + 0x55d56)
> >   #2  0x00007f67b358e833 abort (libc.so.6 + 0x28833)
> >   #3  0x00007f67b358e75b __assert_fail_base.cold (libc.so.6 + 0x2875b)
> >   #4  0x00007f67b35b4cd6 __assert_fail (libc.so.6 + 0x4ecd6)
> >   #5  0x000055ca87fd411b memory_region_transaction_commit (qemu-kvm + 0x67511b)
> >   #6  0x000055ca87e17811 virtio_pci_ioeventfd_assign (qemu-kvm + 0x4b8811)
> >   #7  0x000055ca87e14836 virtio_bus_set_host_notifier (qemu-kvm + 0x4b5836)
> >   #8  0x000055ca87f8e14e virtio_scsi_set_host_notifier (qemu-kvm + 0x62f14e)
> >   #9  0x000055ca87f8dd62 virtio_scsi_dataplane_start (qemu-kvm + 0x62ed62)
> >   #10 0x000055ca87e14610 virtio_bus_start_ioeventfd (qemu-kvm + 0x4b5610)
> >   #11 0x000055ca87f8c29a virtio_scsi_handle_ctrl (qemu-kvm + 0x62d29a)
> >   #12 0x000055ca87fa5902 virtio_queue_host_notifier_read (qemu-kvm + 0x646902)
> >   #13 0x000055ca882c099e aio_dispatch_handler (qemu-kvm + 0x96199e)
> >   #14 0x000055ca882c1761 aio_poll (qemu-kvm + 0x962761)
> >   #15 0x000055ca880e1052 iothread_run (qemu-kvm + 0x782052)
> >   #16 0x000055ca882c562a qemu_thread_start (qemu-kvm + 0x96662a)
> > 
> > This patch assigns s->dataplane_started before attaching host notifiers
> > so that virtqueue handler functions that run in the IOThread before
> > virtio_scsi_data_plane_start() returns correctly identify that dataplane
> > does not need to be started.
> > 
> > Note that s->dataplane_started does not need the AioContext lock because
> > it is set before attaching host notifiers and cleared after detaching
> > host notifiers. In other words, the IOThread always sees the value true
> > and the main loop thread does not modify it while the IOThread is
> > active.
> > 
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2099541
> > Reported-by: Qing Wang <qinwang@redhat.com>
> 
> Qing Wang has confirmed that this solves the assertion failures.
> 
> Paolo/Michael: Can this still be merged for QEMU 7.1?
> 
> Stefan

As a bugfix, for sure.

Can I have your ack?

-- 
MST


