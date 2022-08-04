Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBDC5898B9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 09:53:24 +0200 (CEST)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJVfX-00040d-AH
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 03:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oJVad-0000Hp-Jm
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oJVaa-00069r-VD
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659599295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IpHr5Yr2n4INhaF0G/HJs1BmE4BL6nosE65wk3ztFHk=;
 b=AJMuD15dgB37/h7hm2dWgZ+cPMVSAmV8l6JVU4YPRA44SvccSVUX2U9ZfYcs8XsuOU8i7O
 ALR2LbjS9CAJt0v6+Uxk2mCxioisDs0869QvN0yWANyaq/W9oG4b0WGST2z2uCMxIrgwQ8
 1fbjEav9HkX+kVJbVGXX4L/ebe9KQgY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-jlH4Iha3O0u1R6AQrIFxcg-1; Thu, 04 Aug 2022 03:48:13 -0400
X-MC-Unique: jlH4Iha3O0u1R6AQrIFxcg-1
Received: by mail-ed1-f72.google.com with SMTP id
 i5-20020a05640242c500b0043e50334109so2296303edc.1
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 00:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=IpHr5Yr2n4INhaF0G/HJs1BmE4BL6nosE65wk3ztFHk=;
 b=BcasLI/U2vsL2nV5z5LBF0wU7A1C1vLXKSK4fQynLmByChTcRY0GHqmqtmDKVwvQMP
 Dh5ORkjM4Q9Invms5hQ6sOzXwCGLnxhCl222sbrwuHXBa1K7lP8eGyfiWau+Zw0qyAD6
 Ra8ZmkOnHBYD076raMNexLmJCUi8WAFYBcsJqLg8srykTTTT1iI31wKptc1bb4XBw1fS
 zFzo4Fd4ThUKLnrcltpKnzqoEjOy6RbNxOycGvvc0iRIUd3IjEGZ/sUgN2N99YqkX0uO
 qRTBK7MligqjlnCC22XPObex/ydGd2PXMktwBlmLjFEoplj8v7uxAIVh9ttKTV0FSY5k
 OHuw==
X-Gm-Message-State: ACgBeo3ZtSRxhzO5xNE/d5xFIbioWZSQlCcYM1ZkXQxFjrxYITUpzEfF
 hAq3KDfev6UHAJK50/J3a8vRmT46r/T0sJNIjUWCaeUFlbLRLh7tRC2oRP69pv++G7xFkR0dCQV
 UBhp7ZYkVWRAKsms=
X-Received: by 2002:a17:907:2cef:b0:72b:5b3e:3d7a with SMTP id
 hz15-20020a1709072cef00b0072b5b3e3d7amr485452ejc.293.1659599292640; 
 Thu, 04 Aug 2022 00:48:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR57X6unNswUHua79GxPDCeuz+tD0Xs0CUlPpcSRjk2tg5t7QimJotZX0XtZcY9HKAp+SEdKxA==
X-Received: by 2002:a17:907:2cef:b0:72b:5b3e:3d7a with SMTP id
 hz15-20020a1709072cef00b0072b5b3e3d7amr485438ejc.293.1659599292404; 
 Thu, 04 Aug 2022 00:48:12 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-178.retail.telecomitalia.it.
 [79.46.200.178]) by smtp.gmail.com with ESMTPSA id
 j7-20020a170906830700b0072b810897desm51773ejx.105.2022.08.04.00.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 00:48:11 -0700 (PDT)
Date: Thu, 4 Aug 2022 09:48:08 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Qing Wang <qinwang@redhat.com>
Subject: Re: [PATCH] virtio-scsi: fix race in virtio_scsi_dataplane_start()
Message-ID: <20220804074808.75dt7kkdr2qa6v43@sgarzare-redhat>
References: <20220803162824.948023-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220803162824.948023-1-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Aug 03, 2022 at 12:28:24PM -0400, Stefan Hajnoczi wrote:
>As soon as virtio_scsi_data_plane_start() attaches host notifiers the
>IOThread may start virtqueue processing. There is a race between
>IOThread virtqueue processing and virtio_scsi_data_plane_start() because
>it only assigns s->dataplane_started after attaching host notifiers.
>
>When a virtqueue handler function in the IOThread calls
>virtio_scsi_defer_to_dataplane() it may see !s->dataplane_started and
>attempt to start dataplane even though we're already in the IOThread:
>
>  #0  0x00007f67b360857c __pthread_kill_implementation (libc.so.6 + 0xa257c)
>  #1  0x00007f67b35bbd56 raise (libc.so.6 + 0x55d56)
>  #2  0x00007f67b358e833 abort (libc.so.6 + 0x28833)
>  #3  0x00007f67b358e75b __assert_fail_base.cold (libc.so.6 + 0x2875b)
>  #4  0x00007f67b35b4cd6 __assert_fail (libc.so.6 + 0x4ecd6)
>  #5  0x000055ca87fd411b memory_region_transaction_commit (qemu-kvm + 0x67511b)
>  #6  0x000055ca87e17811 virtio_pci_ioeventfd_assign (qemu-kvm + 0x4b8811)
>  #7  0x000055ca87e14836 virtio_bus_set_host_notifier (qemu-kvm + 0x4b5836)
>  #8  0x000055ca87f8e14e virtio_scsi_set_host_notifier (qemu-kvm + 0x62f14e)
>  #9  0x000055ca87f8dd62 virtio_scsi_dataplane_start (qemu-kvm + 0x62ed62)
>  #10 0x000055ca87e14610 virtio_bus_start_ioeventfd (qemu-kvm + 0x4b5610)
>  #11 0x000055ca87f8c29a virtio_scsi_handle_ctrl (qemu-kvm + 0x62d29a)
>  #12 0x000055ca87fa5902 virtio_queue_host_notifier_read (qemu-kvm + 0x646902)
>  #13 0x000055ca882c099e aio_dispatch_handler (qemu-kvm + 0x96199e)
>  #14 0x000055ca882c1761 aio_poll (qemu-kvm + 0x962761)
>  #15 0x000055ca880e1052 iothread_run (qemu-kvm + 0x782052)
>  #16 0x000055ca882c562a qemu_thread_start (qemu-kvm + 0x96662a)
>
>This patch assigns s->dataplane_started before attaching host notifiers
>so that virtqueue handler functions that run in the IOThread before
>virtio_scsi_data_plane_start() returns correctly identify that dataplane
>does not need to be started.
>
>Note that s->dataplane_started does not need the AioContext lock because
>it is set before attaching host notifiers and cleared after detaching
>host notifiers. In other words, the IOThread always sees the value true
>and the main loop thread does not modify it while the IOThread is
>active.
>
>Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2099541
>Reported-by: Qing Wang <qinwang@redhat.com>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> hw/scsi/virtio-scsi-dataplane.c | 33 +++++++++++++++++++++++++--------
> 1 file changed, 25 insertions(+), 8 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


