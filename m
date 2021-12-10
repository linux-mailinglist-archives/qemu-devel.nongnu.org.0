Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45B747055C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 17:12:12 +0100 (CET)
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mviVH-00011T-O5
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 11:12:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mviTm-0008SQ-5p
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:10:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mviTi-0000yA-1s
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639152629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsVQBgeX6Xx8C6WCt78kb1V4uedh8TTXAvnFXZtUXeY=;
 b=BII0hicVqZe0HZvehoL53pjSzu+xIZyrLwIiWMjvevUdHWpzGnXFl18Te5D4DaOz6AKna5
 OxTaxsbWPdMNNh488XlWJrqY9+ir5u76ox5O0dJXPO57siIyT/BPUIX96rm7dDiFgP2+XM
 SeQ/Qzi4w5IxbI/mPOFBdMIbh7mOPY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-MC7OJ0SxM3iUDugagBzdkQ-1; Fri, 10 Dec 2021 11:10:26 -0500
X-MC-Unique: MC7OJ0SxM3iUDugagBzdkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 523B810199A0;
 Fri, 10 Dec 2021 16:10:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5572860BF4;
 Fri, 10 Dec 2021 16:10:24 +0000 (UTC)
Date: Fri, 10 Dec 2021 17:10:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 0/2] block-backend: Retain permissions after migration
Message-ID: <YbN77v2rCdgcBxyQ@redhat.com>
References: <20211125135317.186576-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211125135317.186576-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peng Liang <liangpeng10@huawei.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.11.2021 um 14:53 hat Hanna Reitz geschrieben:
> Hi,
> 
> Peng Liang has reported an issue regarding migration of raw images here:
> https://lists.nongnu.org/archive/html/qemu-block/2021-11/msg00673.html
> 
> It turns out that after migrating, all permissions are shared when they
> weren’t before.  The cause of the problem is that we deliberately delay
> restricting the shared permissions until migration is really done (until
> the runstate is no longer INMIGRATE) and first share all permissions;
> but this causes us to lose the original shared permission mask and
> overwrites it with BLK_PERM_ALL, so once we do try to restrict the
> shared permissions, we only again share them all.
> 
> Fix this by saving the set of shared permissions through the first
> blk_perm_set() call that shares all; and add a regression test.
> 
> 
> I don’t believe we have to fix this in 6.2, because I think this bug has
> existed for four years now.  (I.e. it isn’t critical, and it’s no
> regression.)

Feels a bit like a hack, but I guess as long as it works... :-)

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


