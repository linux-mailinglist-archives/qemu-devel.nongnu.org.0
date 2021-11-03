Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65120443F78
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 10:38:13 +0100 (CET)
Received: from localhost ([::1]:55698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miCih-0001LB-Vn
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 05:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1miCh0-0008Fz-Re
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:36:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1miCgy-0007pm-9y
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635932182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9SrD+DTKgPjOo9aXaXYOLvXj1HvZFtLHkvj7a6OhJN0=;
 b=GciyBsfb8n00hkfjizw+kSvjBDeXYECM0KwTPMfaen9Hkdt869Ux4Bhz57UTIy8J7ecYc3
 wSdtcR0ISjngFsnDL9J5bakK2SI8UjE5Ihq/WaXdlvk7PsZeBUZ8XWQf/GXQ/JcrNcUx1i
 5RyA1KHobSpU0BuhJ6op5FeEskLOoj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-RRLpw6zCOqm0bl9NqAYomg-1; Wed, 03 Nov 2021 05:36:21 -0400
X-MC-Unique: RRLpw6zCOqm0bl9NqAYomg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0890C1006AA3;
 Wed,  3 Nov 2021 09:36:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBF1A101E592;
 Wed,  3 Nov 2021 09:36:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Jean-Louis Dupond <jean-louis@dupond.be>, qemu-devel@nongnu.org
Subject: Re: [PATCH] Fix virtio-net-pci* "vectors" compat
In-Reply-To: <20211103085234.15079-1-jean-louis@dupond.be>
Organization: Red Hat GmbH
References: <20211103085234.15079-1-jean-louis@dupond.be>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 03 Nov 2021 10:36:05 +0100
Message-ID: <87fssdbmyi.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Jean-Louis Dupond <jean-louis@dupond.be>,
 ehabkost@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03 2021, Jean-Louis Dupond <jean-louis@dupond.be> wrote:

> From: Eduardo Habkost <ehabkost@redhat.com>
>
> hw_compat_5_2 has an issue: it affects only "virtio-net-pci"
> but not "virtio-net-pci-transitional" and
> "virtio-net-pci-non-transitional".  The solution is to use the
> "virtio-net-pci-base" type in compat_props.
>
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1999141
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> Acked-by: Jean-Louis Dupond <jean-louis@dupond.be>

<process>This needs to have your s-o-b at the bottom, as you passed
Eduardo's patch on.</process>

> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


