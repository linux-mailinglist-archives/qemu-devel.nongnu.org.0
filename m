Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56A0544E52
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:02:42 +0200 (CEST)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIkD-0007kc-Iu
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nzGWV-0006fk-J1
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:40:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nzGWS-00009m-RE
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654774819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R7vvE5SQVHfcqi+8/jRhqNlAFBmdDPZc9UMqAnzSirc=;
 b=Icbl2AdcnbOEayB0jnNLOOo1zzpr1zlp5IwdHJGRWkE9VaUxTTJdNWiodpUUgycvdG1Lhn
 tb5xi9XXcLJ14dANpdfHiyOiyDlbwyIEzHghfeyZ3BJzPRsFcYUucaUnUCtYquS+6jEMs1
 U4m7xzh9VokSBeJdVXudMNx9lKTA2N8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-Xeoo1p7uOB-fBsFV3rmUMA-1; Thu, 09 Jun 2022 07:40:17 -0400
X-MC-Unique: Xeoo1p7uOB-fBsFV3rmUMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75F92101A54E
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 11:40:17 +0000 (UTC)
Received: from localhost (unknown [10.39.192.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25F8840CF8E2;
 Thu,  9 Jun 2022 11:40:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, thuth@redhat.com
Subject: Re: [PATCH 1/4] s390x: simplify virtio_ccw_reset_virtio
In-Reply-To: <20220609091534.1416909-2-pbonzini@redhat.com>
Organization: Red Hat GmbH
References: <20220609091534.1416909-1-pbonzini@redhat.com>
 <20220609091534.1416909-2-pbonzini@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 09 Jun 2022 13:40:14 +0200
Message-ID: <87r13y9iap.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

> Call virtio_bus_reset instead of virtio_reset, so that the function
> need not receive the VirtIODevice.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/s390x/virtio-ccw.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


