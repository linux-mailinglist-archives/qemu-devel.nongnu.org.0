Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661BD42C0C0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:57:18 +0200 (CEST)
Received: from localhost ([::1]:53906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mador-0002P4-HI
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1madki-0005pY-Jj
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1madkh-0005UP-5i
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634129578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EDsOoxW6EgtFgX4OT23FEb36jHTKMtrgphgk3Epw6BM=;
 b=IycEkUZMrJ9b89yKS9324D3Bc2GpnnuByQwzrQR72QMeJhr57SlOMN6eeyQ08f91PQGqM/
 O/zQlIvbPyMw0D0PLPdurmRtdw+f7ZYyBqBuTZVBsxojhgV/gfcPaQUsc37Ffgd5P6fnvi
 hVD1hRMr2P64tAILNhSguabyNBK1YHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-_kjdl3s9NGCosEq6_R0ySg-1; Wed, 13 Oct 2021 08:52:52 -0400
X-MC-Unique: _kjdl3s9NGCosEq6_R0ySg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0C7F19200C4;
 Wed, 13 Oct 2021 12:52:49 +0000 (UTC)
Received: from localhost (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6286C5DA60;
 Wed, 13 Oct 2021 12:52:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>
Subject: Re: [PATCH v3 1/1] virtio: write back F_VERSION_1 before validate
In-Reply-To: <20211013081836-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
References: <20211011053921.1198936-1-pasic@linux.ibm.com>
 <20211013060923-mutt-send-email-mst@kernel.org>
 <96561e29-e0d6-9a4d-3657-999bad59914e@de.ibm.com>
 <20211013081836-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 13 Oct 2021 14:52:38 +0200
Message-ID: <87zgrdulwp.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>, Xie Yongji <xieyongji@bytedance.com>,
 stefanha@redhat.com, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Oct 13, 2021 at 01:23:50PM +0200, Christian Borntraeger wrote:
>> Can we get this kernel patch queued for 5.15 and stable without waiting for the QEMU patch
>> as we have a regression with 4.14?
>
> Probably. Still trying to decide between this and plain revert for 5.15
> and back. Maybe both?

Probably better queue this one, in case we have some undiscovered
problems with the config space access in virtio-net?


