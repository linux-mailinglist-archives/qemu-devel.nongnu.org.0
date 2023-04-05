Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0614B6D7B87
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 13:40:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk1TO-000384-Jr; Wed, 05 Apr 2023 07:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pk1TK-00037k-NU
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 07:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pk1TI-0006i8-C4
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 07:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680694713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=c9uXHheAfjTgEZlvQ3udcA+FmWRpvPCLVGD0g3tPNk4=;
 b=K+9g2CVOIngVRgKCcpn52Flcyyf7XI1Lir8+UFeiTplWnBYbPD6SjMrFX/gsp6823f0l30
 RnGZXNiUyCA9BLrZiyTZmVlGar+NUSXHktKAmadsa/w//Iyb+C5pPYILO8sGeZZelL+F/A
 qUfZHKW0G6V8tLaWTh+WnIj/mxs/A8M=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-sda2iRQpPa2ApDFtxnqZ-Q-1; Wed, 05 Apr 2023 07:38:32 -0400
X-MC-Unique: sda2iRQpPa2ApDFtxnqZ-Q-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-54476ef9caeso350367867b3.6
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 04:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680694711;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c9uXHheAfjTgEZlvQ3udcA+FmWRpvPCLVGD0g3tPNk4=;
 b=1eFQYFsszQHTBaLCCSufVygvnBHB/QNbv5VLgM49GS4+B0temvur+fTdXyWMofUHrI
 D0kLK955a+SVsOELET6zoGoPjVHAWWIxQvARJi0BQ2DQaKRBAeEAit5bnusXFiilr1r3
 aWqAyIpk7sR2G9QE2jg1vV8Nz3KVOZTz3iWN9+NuqyvNFMWXmQIbtij2Mh0JQmW1Zu14
 HT4n7E8+YSLKba8owvkAMUyvpOVYVudtfyNTwd8JTuGsuF+MAwcGs5jZ4ETUG0BlUiML
 ENDtR7bW7LbUNwi+3tmnIgxoNgYK7oxXIdG0tvmj8//j7oujTdl7KfuoG7QrewbxFZ4e
 9rbg==
X-Gm-Message-State: AAQBX9dcHSh9rMRdHVh49IOzK7nEw+Py1+3OwScI+gKg2lrIFdDvn7B4
 JxA1GBb+B7K0GDoGJ4N4IItshZ6mouKjsSbhD4drrgSkAnrhxmayIfw9lUKx2K4mUqJxNIvmb8L
 R7LWLOsF6vrJUELdomy8ynMDEdkXVMK+pVMAArAg=
X-Received: by 2002:a81:b609:0:b0:541:8995:5334 with SMTP id
 u9-20020a81b609000000b0054189955334mr3400732ywh.3.1680694711537; 
 Wed, 05 Apr 2023 04:38:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350aUqZnM/qmindH54PzA0esyhEWI3gCCe7TmG55KVKtF/IqiDC5Bdz4qPEKXy2W4+6PIzbLox0H8NSd/K5hbCZU=
X-Received: by 2002:a81:b609:0:b0:541:8995:5334 with SMTP id
 u9-20020a81b609000000b0054189955334mr3400713ywh.3.1680694711135; Wed, 05 Apr
 2023 04:38:31 -0700 (PDT)
MIME-Version: 1.0
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 5 Apr 2023 13:37:54 +0200
Message-ID: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
Subject: Reducing vdpa migration downtime because of memory pin / maps
To: qemu-level <qemu-devel@nongnu.org>
Cc: Jason Wang <jasowang@redhat.com>, Michael Tsirkin <mst@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Longpeng <longpeng2@huawei.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <elic@nvidia.com>, 
 Parav Pandit <parav@nvidia.com>, Juan Quintela <quintela@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

Hi!

As mentioned in the last upstream virtio-networking meeting, one of
the factors that adds more downtime to migration is the handling of
the guest memory (pin, map, etc). At this moment this handling is
bound to the virtio life cycle (DRIVER_OK, RESET). In that sense, the
destination device waits until all the guest memory / state is
migrated to start pinning all the memory.

The proposal is to bind it to the char device life cycle (open vs
close), so all the guest memory can be pinned for all the guest / qemu
lifecycle.

This has two main problems:
* At this moment the reset semantics forces the vdpa device to unmap
all the memory. So this change needs a vhost vdpa feature flag.
* This may increase the initialization time. Maybe we can delay it if
qemu is not the destination of a LM. Anyway I think this should be
done as an optimization on top.

Any ideas or comments in this regard?

Thanks!


