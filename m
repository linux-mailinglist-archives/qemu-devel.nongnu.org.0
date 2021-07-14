Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E23C85C8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:11:17 +0200 (CEST)
Received: from localhost ([::1]:53886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fbX-0002oi-Kg
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m3fZ9-0001FI-LM
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m3fZ0-00061d-G2
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m6dhIxH76/DM8ZwYlkQZs6GWZ97xhHB2rBVtrzXGgqQ=;
 b=aPMbTk/pkhcpucuCgTH6cxX95mRwW0goHAVp2U0paKFO3aX141r0Vz0zAXfc0ZdfsW7du+
 BccfwR5f778CA0aOUgJbtAh2JMk6+O4FScFhJPIwxshjw46JhyWOmxe1JKhssK1KctAjn/
 fx3X4MR2Q5x2gS+3IdgkmE6cFLjjKTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-1DaUmF8_NMagKFxdjFz9qQ-1; Wed, 14 Jul 2021 10:08:31 -0400
X-MC-Unique: 1DaUmF8_NMagKFxdjFz9qQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B462510C1ADC;
 Wed, 14 Jul 2021 14:08:29 +0000 (UTC)
Received: from redhat.com (ovpn-115-26.ams2.redhat.com [10.36.115.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 333A25D6B1;
 Wed, 14 Jul 2021 14:08:27 +0000 (UTC)
Date: Wed, 14 Jul 2021 16:08:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/3] Fix active mirror dead-lock
Message-ID: <YO7v2jeRYpWYIY6J@redhat.com>
References: <20210702211636.228981-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210702211636.228981-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: dem@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.07.2021 um 23:16 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> We've faced a dead-lock in active mirror in our Rhev-8.4 based Qemu
> build. And it's reproducible on master too.

Thanks, applied to the block branch.

Kevin


