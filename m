Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E32C68F2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:51:03 +0100 (CET)
Received: from localhost ([::1]:52594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kig1W-0000OW-PB
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kifuy-0004Hc-Jo
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:44:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kifuw-0006bK-KY
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606491853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ml9rGsGgQezbwICp/zJeAIuWLYNdNW9vQx+fmZ4ZKDw=;
 b=J8zBe2YbImQJRcMyybuohyX8qpkMAxj+LXNGV+8OmXMUc5BvdcloIICT0yJX3xEe5qq5RV
 z4A/Ez/T7GVs8DkniHh6DsT9EpnGB7ieuEiKg5/bkOiuRrrBMsdeCwYGQ7mDVMYijfm5Rm
 YMqKPRz0iq74TKpbedU2XFryFi8MOp0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-qlwjscTvNTuK4d8n0oZSpA-1; Fri, 27 Nov 2020 10:44:10 -0500
X-MC-Unique: qlwjscTvNTuK4d8n0oZSpA-1
Received: by mail-wm1-f69.google.com with SMTP id o19so3365020wme.2
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 07:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7ZMptySEVF+qxp46nt0WeS28nH29hpHOpjHUabFK4vI=;
 b=BA02kU3SEMskIEAcYEPWghoBg+XRiJSk5ZjM0dW7EEacKUoqL72m5WrRapRnrC8wHa
 u+oHKBel6MdUDOGv8+8CVJeac4MEJBjzgHNAZecqid/pXugBC2nQjRBojeB3n8Guweot
 xWCEKyLH70WMeH2BXFqLrGLOZyQB2c9f5qSL/Spv5g3kqbS3xwbS7FASaeCLj5XE0f3J
 Cw+UlZR2zw6OvrrJKgoe+oFh3lq8GtE8TYvcxkbMlyW6Rm4atjYu5Bu9EexXQE+iXGVA
 MFjdrOzNkNfd+1y04bLieCnHqHjBaI6CQvx55p2Mg8/emF2Z3/Gf4MZ46Qfrxo1CtCGi
 t32Q==
X-Gm-Message-State: AOAM531vdJGEMPVlpJ0y0j8nIryfZROLRqf2CeNE/hQCc7PyJadgQFdh
 2U+S0RFjnEfmJ9jjVqYyYRBSLgh/mZ5FwuWiUfGjx1GcuphNpfJRp/nzQ6KfTRIXSoiC/9Yi5lW
 JmntMmFw53IXZ1Co=
X-Received: by 2002:a1c:1982:: with SMTP id 124mr9831268wmz.74.1606491849340; 
 Fri, 27 Nov 2020 07:44:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytxW8ZnvAV68ZiceF5w4J07tAVGsS+GFr6oOgADr9NuCD3xPvI6HRJ+H6eMt9FwWNO3X7TYw==
X-Received: by 2002:a1c:1982:: with SMTP id 124mr9831237wmz.74.1606491849069; 
 Fri, 27 Nov 2020 07:44:09 -0800 (PST)
Received: from steredhat (host-79-17-248-175.retail.telecomitalia.it.
 [79.17.248.175])
 by smtp.gmail.com with ESMTPSA id p19sm16051757wrg.18.2020.11.27.07.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:44:08 -0800 (PST)
Date: Fri, 27 Nov 2020 16:44:05 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 00/27] vDPA software assisted live migration
Message-ID: <20201127154405.uobkujyhd7fuv7nx@steredhat>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Howard Cai <howard.cai@gmail.com>,
 Parav Pandit <parav@mellanox.com>, vm <vmireyno@marvell.com>,
 Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 07:50:38PM +0100, Eugenio Pérez wrote:
>This series enable vDPA software assisted live migration for vhost-net
>devices. This is a new method of vhost devices migration: Instead of
>relay on vDPA device's dirty logging capability, SW assisted LM
>intercepts dataplane, forwarding the descriptors between VM and device.
>
>In this migration mode, qemu offers a new vring to the device to
>read and write into, and disable vhost notifiers, processing guest and
>vhost notifications in qemu. On used buffer relay, qemu will mark the
>dirty memory as with plain virtio-net devices. This way, devices does
>not need to have dirty page logging capability.
>
>This series is a POC doing SW LM for vhost-net devices, which already
>have dirty page logging capabilities. None of the changes have actual
>effect with current devices until last two patches (26 and 27) are
>applied, but they can be rebased on top of any other. These checks the
>device to meet all requirements, and disable vhost-net devices logging
>so migration goes through SW LM. This last patch is not meant to be
>applied in the final revision, it is in the series just for testing
>purposes.
>
>For use SW assisted LM these vhost-net devices need to be instantiated:
>* With IOMMU (iommu_platform=on,ats=on)
>* Without event_idx (event_idx=off)
>
>Just the notification forwarding (with no descriptor relay) can be
>achieved with patches 7 and 9, and starting migration. Partial applies
>between 13 and 24 will not work while migrating on source, and patch
>25 is needed for the destination to resume network activity.
>
>It is based on the ideas of DPDK SW assisted LM, in the series of
>DPDK's https://patchwork.dpdk.org/cover/48370/ .
>
>Comments are welcome.

Hi Eugenio,
I took a look and the idea of the shadow queue I think is the right way.
It's very similar to what we thought with Stefan for io_uring 
passthrough and vdpa-blk.

IIUC, when the migrations starts, the notifications from the guest to 
vhost are disabled, so QEMU starts to intercept them through the 
custom_handler installed in virtio-net (we need to understand how to 
generalize this).
At this point QEMU starts to use the shadows queues and exposes them to 
vhost.
The opposite is done for vhost to guest notifications, where 
vhost_handle_call is installed to masked_notifier to intercept the 
notification.

I hope to give better feedback when I get a complete overview ;-)

Anyway, as Jason suggested, we should split this series, so maybe we can 
merge some preparations patches (e.g. 1, 11, 21, 22) regardless the 
other patches.

Thanks,
Stefano


