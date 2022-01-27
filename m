Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3587049DBAB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:32:33 +0100 (CET)
Received: from localhost ([::1]:42898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzGi-0003px-15
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:32:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCycu-0001GX-Ku
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:51:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCycs-0008KP-1M
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643266281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SxCyOWET7Q+RLXJ3QGQjPo0CmNLLNyCoQL3ROsjaGdM=;
 b=O/1CWwo1L+EbdUWHl+FdKXljos/GGV+T8VNhse5dvSUs2omjoOPADEDSwiuoFlCzG5RArP
 rthWx5O4xy1ctsbSJmPJ3V+E/Zh2zbWnMXBpR2g+RBcLr5TyXol/pW7hODgXgEFeMu/JOK
 HNi0ZnHBJWMZaxwD6ZSRsLnv3ABtbh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-1xM3FTb3Mkq2v0Fg6VkB3A-1; Thu, 27 Jan 2022 01:51:19 -0500
X-MC-Unique: 1xM3FTb3Mkq2v0Fg6VkB3A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B76CA46862;
 Thu, 27 Jan 2022 06:51:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 576AA5DBBF;
 Thu, 27 Jan 2022 06:51:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C36F113864A; Thu, 27 Jan 2022 07:51:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 6/7] meson: document, why we don't generate trace
 events for tests/ and qga/
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
 <20220126161130.3240892-7-vsementsov@virtuozzo.com>
Date: Thu, 27 Jan 2022 07:51:17 +0100
In-Reply-To: <20220126161130.3240892-7-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 26 Jan 2022 17:11:29 +0100")
Message-ID: <8735l9wu1m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nitpick: drop the comma in the title.


