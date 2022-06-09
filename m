Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4EE544DE4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:41:25 +0200 (CEST)
Received: from localhost ([::1]:40400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIPc-0000DQ-Sy
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nzGez-0003ud-JA
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:49:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nzGey-0001RD-1M
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654775347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sJ5pzCaJf35gEX9rll2Q9GFir5IWQp0fowQIbRFjC3g=;
 b=EuJzW2d4VPa5h8jI2hJLe3ngBpSw5F9GnbnCPSA2x+BdwUVlyNTi+IJ0FDTxH+aVhth9oF
 8vLA+lbE0Cy1aoeQQeykBZb1mBkG2UPKYBTOBXOt4006sv6VxHOv66SzCvzGuHzESUeJcJ
 Xul8xzWrnoGMxl3aZCBtz5RQBPXQd9w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-qIxqX2Q1MDCU0v8pWlyedw-1; Thu, 09 Jun 2022 07:49:06 -0400
X-MC-Unique: qIxqX2Q1MDCU0v8pWlyedw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A67C61D33870
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 11:49:05 +0000 (UTC)
Received: from localhost (unknown [10.39.192.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FEBDC23DBF;
 Thu,  9 Jun 2022 11:49:05 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, thuth@redhat.com
Subject: Re: [PATCH 2/4] virtio-mmio: stop ioeventfd on legacy reset
In-Reply-To: <20220609091534.1416909-3-pbonzini@redhat.com>
Organization: Red Hat GmbH
References: <20220609091534.1416909-1-pbonzini@redhat.com>
 <20220609091534.1416909-3-pbonzini@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 09 Jun 2022 13:49:04 +0200
Message-ID: <87o7z29hvz.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
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

On Thu, Jun 09 2022, Paolo Bonzini <pbonzini@redhat.com> wrote:

> If the queue PFN is set to zero on a virtio-mmio device, the device is reset.
> In that case however the virtio_bus_stop_ioeventfd function was not
> called; add it so that the behavior is similar to when status is set to 0.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/virtio/virtio-mmio.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


