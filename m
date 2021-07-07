Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200563BEA0F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:50:51 +0200 (CEST)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m18sz-0004TO-TU
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m18rW-0003Sg-Ho
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:49:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m18rU-00055x-6D
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625669355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PVzNugcFt8b5Ue81S5SdUyBC+lMya5JU2Tv7Yt4wD70=;
 b=BFcaeJJvIOBnS1aphtfVEs/yWM0MAnF+pU3vcSme6sluIv0Yqz7nmA0EKAgeqBgcPmqaSz
 9CvCrG/cUI9i4RzMi2jKezr6qWyXJkn8qc3RdGcRccx0mW0Gzissno9mbTH6BQO8oSb922
 wHMRs6OmNSaW/cTUYxcHrwDREcq8lVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-1Q1jVVBEN0Sy3lzkxObVcQ-1; Wed, 07 Jul 2021 10:49:14 -0400
X-MC-Unique: 1Q1jVVBEN0Sy3lzkxObVcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8D4119253F0;
 Wed,  7 Jul 2021 14:49:12 +0000 (UTC)
Received: from localhost (ovpn-112-160.ams2.redhat.com [10.36.112.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC77E78C0F;
 Wed,  7 Jul 2021 14:48:46 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH] vhost-user: Fix backends without multiqueue support
In-Reply-To: <20210705171429.29286-1-kwolf@redhat.com>
Organization: Red Hat GmbH
References: <20210705171429.29286-1-kwolf@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 07 Jul 2021 16:48:45 +0200
Message-ID: <87czrufacy.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, raphael.norwitz@nutanix.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05 2021, Kevin Wolf <kwolf@redhat.com> wrote:

> dev->max_queues was never initialised for backends that don't support
> VHOST_USER_PROTOCOL_F_MQ, so it would use 0 as the maximum number of
> queues to check against and consequently fail for any such backend.
>
> Set it to 1 if the backend doesn't have multiqueue support.
>
> Fixes: c90bd505a3e8210c23d69fecab9ee6f56ec4a161
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/virtio/vhost-user.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


