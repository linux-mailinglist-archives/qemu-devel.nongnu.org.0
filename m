Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67E25B17ED
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 11:02:06 +0200 (CEST)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWDQ8-0001nu-Pt
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 05:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oWDNf-0008Bh-2E
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:59:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oWDNY-0005eG-KK
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662627559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8mVUJvfBVSXt16h3l+dMpoKJxeSS94lQTngpQLJ531o=;
 b=Pp1ISiBVX6Gm/HFscTUmgJcuUmMT46yLHJwHG5IEjmFdQGSOJ7h4ltVmY2PJSDT0QRhOz4
 92GHK37jmgwMh4j0JSMKWh3W66naFlx6nQSBCLHR0+GLQB4s6MbqpVG3EeHdFjJupvjQsZ
 BXXkogk2UfY+Ad7hdRP6umPrXdqyQN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-59rA992UPweD9FN5c3HqxQ-1; Thu, 08 Sep 2022 04:59:15 -0400
X-MC-Unique: 59rA992UPweD9FN5c3HqxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66FD8803520;
 Thu,  8 Sep 2022 08:59:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC4C4945D0;
 Thu,  8 Sep 2022 08:59:12 +0000 (UTC)
Date: Thu, 8 Sep 2022 10:59:11 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Denis V. Lunev" <den@virtuozzo.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Peter Krempa <pkrempa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v5 0/2] block: add missed block_acct_setup with new block
 device init procedure
Message-ID: <Yxmu3xhZxqxHXMuk@redhat.com>
References: <20220824095044.166009-1-den@openvz.org>
 <3812f98f-9afc-9e0f-9839-916b083cfc77@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3812f98f-9afc-9e0f-9839-916b083cfc77@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Am 07.09.2022 um 19:25 hat Denis V. Lunev geschrieben:
> ping

I'll get to it (and quite a few other small series on the list that
should be quick to review), but probably only after KVM Forum. So I'll
have to ask you to be patient for a little longer.

Kevin


