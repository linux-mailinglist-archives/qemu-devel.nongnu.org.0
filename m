Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E743BFA3A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:29:47 +0200 (CEST)
Received: from localhost ([::1]:40308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TA2-0001vh-ST
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1T6x-00069y-Hm
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:26:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1T6r-0008G7-D2
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625747188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ea3Fno9SziNxa5AcwMCPmP95319k1OIwWvqHH2l8Lk=;
 b=QvgOrVaOimgIvlIyzLH3dp7G+b+UnXbYPlQnZpLqQvqOdq3JaQ5yh+icDw4XLVcz/NM4Nt
 ZVYHZWL0P4c4gnHs4QV4yLAbXHQDtWV84N0klwu4cRqLI2YaT5mYMQLAWmuXpUZJGIJNyN
 fkdGAzJmfudc2LkaJPbnTzQ9MUwW/xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-nxmVgxFrO4mJGn4Zfi_ofQ-1; Thu, 08 Jul 2021 08:26:27 -0400
X-MC-Unique: nxmVgxFrO4mJGn4Zfi_ofQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DD5F10C1ADC;
 Thu,  8 Jul 2021 12:26:26 +0000 (UTC)
Received: from redhat.com (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C7B25D705;
 Thu,  8 Jul 2021 12:26:24 +0000 (UTC)
Date: Thu, 8 Jul 2021 14:26:23 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] blockdev: fix drive-backup transaction endless drained
 section
Message-ID: <YObu79Mlc38mOmMU@redhat.com>
References: <20210608171852.250775-1-vsementsov@virtuozzo.com>
 <84a04bf3-ef77-1ccf-2c4d-afc0c8079b83@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <84a04bf3-ef77-1ccf-2c4d-afc0c8079b83@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, eblake@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.07.2021 um 15:35 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Forgotten thing :(
> 
> Kevin, could you please queue it in your block branch? For me not to
> bother Peter with one-patch pull request.

No problem, I've queued it now.

Kevin


