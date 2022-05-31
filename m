Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB48538DF0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 11:43:44 +0200 (CEST)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvyPf-00037T-QS
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 05:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nvyAO-0001Or-4M
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nvyAL-0000Cc-08
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653989271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pPcjM0HDeC2bAQmCb0L71BQmH5PIqdDo6Gy+wrJy8kg=;
 b=grY2gEIzCv0jCcujx3AdkPkD0CTcQxNJ/QQ2GPP1deHvYvC5Rh7Y4T14R67jWhggTW8Jh0
 XNNEeG/QuYa32rJ68M6WtrqHvu+piH8q2eyzhYQnMvPEgaq5EXcyc4e2jgmlxYWisZrII4
 BAgLzpAaUT22QPgLCHr5FEK7A2sZYI0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-e5IspqUoMkmBpnmmlJ5dqA-1; Tue, 31 May 2022 05:27:48 -0400
X-MC-Unique: e5IspqUoMkmBpnmmlJ5dqA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF7FD101A54E;
 Tue, 31 May 2022 09:27:47 +0000 (UTC)
Received: from localhost (dhcp-192-194.str.redhat.com [10.33.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 955E2492CA2;
 Tue, 31 May 2022 09:27:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 eric.auger@redhat.com, qemu-devel@nongnu.org, alex.williamson@redhat.com
Subject: Re: [PATCH] vfio/common: remove spurious warning on
 vfio_listener_region_del
In-Reply-To: <20220524091405.416256-1-eric.auger@redhat.com>
Organization: Red Hat GmbH
References: <20220524091405.416256-1-eric.auger@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Tue, 31 May 2022 11:27:46 +0200
Message-ID: <874k16car1.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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

On Tue, May 24 2022, Eric Auger <eric.auger@redhat.com> wrote:

> 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
> warning") removed the warning on vfio_listener_region_add() path.
>
> However the same warning also hits on region_del path. Let's remove
> it and reword the dynamic trace as this can be called on both
> map and unmap path.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/vfio/common.c     | 10 +++++++++-
>  hw/vfio/trace-events |  2 +-
>  2 files changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


