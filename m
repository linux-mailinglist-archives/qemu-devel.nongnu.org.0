Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66085575AF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 10:40:14 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4INo-0001YX-Eg
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 04:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o4ILk-0000oo-Fv
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:38:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o4ILh-0005rg-C9
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655973479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G3KDUPNs4GOD9r35pJws7dJWQV1LRF4eOd91hsrSjRQ=;
 b=eYYQVSnxaSR9mfy3BA6XQkViqTktja789KpfoZyx43vC0JYjRIcxFN4/kZSWYpDManx5yl
 VFe9r8UZVRX5VbTgfO0HkEULiW+i/j76hFb6D63uWLTDg9f0Bh37HvIGiPaYJivHi06CJl
 rQhpIzECSjvbUSpshmQseQCCcILbSm8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-UglUoWboPSuwkav12qbsRQ-1; Thu, 23 Jun 2022 04:37:56 -0400
X-MC-Unique: UglUoWboPSuwkav12qbsRQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 221C41C0690B;
 Thu, 23 Jun 2022 08:37:56 +0000 (UTC)
Received: from localhost (unknown [10.39.194.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8AB7456CD9;
 Thu, 23 Jun 2022 08:37:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] pc-bios/s390-ccw/virtio: Set missing status bits
 while initializing
In-Reply-To: <20220623071131.412457-2-thuth@redhat.com>
Organization: Red Hat GmbH
References: <20220623071131.412457-1-thuth@redhat.com>
 <20220623071131.412457-2-thuth@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 23 Jun 2022 10:37:54 +0200
Message-ID: <87edzf93ml.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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

On Thu, Jun 23 2022, Thomas Huth <thuth@redhat.com> wrote:

> According chapter "3.1.1 Driver Requirements: Device Initialization"
> of the Virtio specification (v1.1), a driver for a device has to set
> the ACKNOWLEDGE and DRIVER bits in the status field after resetting
> the device. The s390-ccw bios skipped these steps so far and seems
> like QEMU never cared. Anyway, it's better to follow the spec, so
> let's set these bits now in the right spots, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/virtio.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

The QEMU implementation seems to be pretty tolerant :)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


