Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D658F3D38CF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:36:14 +0200 (CEST)
Received: from localhost ([::1]:53714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6sXN-0004P4-SM
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1m6sVc-0002HC-98
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1m6sVa-0006AL-AI
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627036458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+3CdpMpZCj2aot57fDyAqbE/uCnADmSUIvscaRiL/5M=;
 b=JaRGORtdFfKJyxFZFRYEN1a4AoEYvGqgQxbTTJwaNSqouyhrVu57Oby62fwHXpYxScWi+q
 zn2CqP96N8gHJqwoUj4A5+j8yR+i/wfYcgIP2pIbWqYEc87ARm0McB84TVao4rW92Xs5CT
 tYAthSEwwbA1kraV/o0mlN/rRH94lIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-g3YTNLbiNiKLL0ZeZRH8NQ-1; Fri, 23 Jul 2021 06:34:16 -0400
X-MC-Unique: g3YTNLbiNiKLL0ZeZRH8NQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F04D184E165;
 Fri, 23 Jul 2021 10:34:15 +0000 (UTC)
Received: from devr9.home.annexia.org (ovpn-114-133.ams2.redhat.com
 [10.36.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D00FB5C1D5;
 Fri, 23 Jul 2021 10:34:13 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: eblake@redhat.com
Subject: [PATCH v2] nbd/server: Add --selinux-label option
Date: Fri, 23 Jul 2021 11:33:02 +0100
Message-Id: <20210723103303.1731437-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1 was here:
https://lists.nongnu.org/archive/html/qemu-block/2021-07/threads.html#00713

v2 adds the changes to CI docker files as suggested by
Dan Berrange in his review.

Rich.



