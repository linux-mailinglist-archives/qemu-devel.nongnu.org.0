Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86CC2CBAE7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:50:09 +0100 (CET)
Received: from localhost ([::1]:51630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPi4-0007Pf-UG
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kkOLh-0002WQ-8C
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kkOLe-0002V4-Np
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606900973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sP1QBr4IsudguiDErupnNFcXWhQ22ol27NVKTZ3sDjs=;
 b=PwvYl6OHdl/qBppC63z76JiNdMyENiKHXAUc2ea8pMWuxC1be6huruEfjLkZLsoS4sPbM6
 RmMhTMWRby5JAr7cYjiVcrhueLRdeGHh1vO+P4U6y5W0Tt/ca3wgMTh+xAGiLgn0kBUTvA
 OXp6fotC0YGPm0Io5Ct4Tff2XeauPzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-8c5Rup-EMva-KtMTY_GKnw-1; Wed, 02 Dec 2020 04:22:51 -0500
X-MC-Unique: 8c5Rup-EMva-KtMTY_GKnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F9B7180DE0E;
 Wed,  2 Dec 2020 09:22:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DECB5D720;
 Wed,  2 Dec 2020 09:22:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 001E8113864E; Wed,  2 Dec 2020 10:22:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gan Qixin <ganqixin@huawei.com>
Subject: Re: [PATCH 0/4] Use lock guard macros in block
References: <20201109154327.325675-1-ganqixin@huawei.com>
Date: Wed, 02 Dec 2020 10:22:41 +0100
In-Reply-To: <20201109154327.325675-1-ganqixin@huawei.com> (Gan Qixin's
 message of "Mon, 9 Nov 2020 23:43:23 +0800")
Message-ID: <87k0u05zq6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, dnbrdsky@gmail.com,
 stefanha@redhat.com, pbonzini@redhat.com, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Did this fall through the cracks?

Gan Qixin <ganqixin@huawei.com> writes:

> Hi all,
>   I saw some tasks to replace manual lock()/unlock() calls with lock guard macros in BiteSizedTasks.
> I am very interested in this and modified some of the files under block. Could someone help me check the code?
>
> Thanks,
> Gan Qixin
>
> Gan Qixin (4):
>   block/accounting.c: Use lock guard macros
>   block/curl.c: Use lock guard macros
>   block/throttle-groups.c: Use lock guard macros
>   block/iscsi.c: Use lock guard macros
>
>  block/accounting.c      | 32 +++++++++++++--------------
>  block/curl.c            | 28 ++++++++++++------------
>  block/iscsi.c           | 28 +++++++++++-------------
>  block/throttle-groups.c | 48 ++++++++++++++++++++---------------------
>  4 files changed, 65 insertions(+), 71 deletions(-)


