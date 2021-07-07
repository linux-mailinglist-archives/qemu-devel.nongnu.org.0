Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC363BE8ED
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:41:57 +0200 (CEST)
Received: from localhost ([::1]:55538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17oK-0004fR-0x
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1m17nN-0003OR-3P
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1m17nK-0005pV-3u
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625665251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RXTCHE86heihXKKZsZF2u2sX28lC8UOiwbjeCw2mnwU=;
 b=DkQ/jVvuaEAf09hekk4vUl8pa19irMesefGBtfUO/ZGHllWTq/Bf87sL7oud6DCJOssZTI
 4YS+JvDBQA27G9UP0qrbIiAOf3moj0ycI8inEY6BjaLjfQagbnRoYJKCG5yu9pkoQeXjNG
 9Bn8ucljl4pKl+7yqe8S9HodeqNE4y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-7pHK1TNCNbiTDPPHyR8Xaw-1; Wed, 07 Jul 2021 09:40:47 -0400
X-MC-Unique: 7pHK1TNCNbiTDPPHyR8Xaw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8669E100CCC1;
 Wed,  7 Jul 2021 13:40:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 584265D6AB;
 Wed,  7 Jul 2021 13:40:45 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] numa: Parse initiator= attribute before cpus= attribute
Date: Wed,  7 Jul 2021 15:40:28 +0200
Message-Id: <cover.1625662776.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
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
Cc: imammedo@redhat.com, tao3.xu@intel.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See 2/2 for explanation. The first patch is just cosmetics.

Michal Privoznik (2):
  numa: Report expected initiator
  numa: Parse initiator= attribute before cpus= attribute

 hw/core/machine.c |  3 ++-
 hw/core/numa.c    | 45 +++++++++++++++++++++++----------------------
 2 files changed, 25 insertions(+), 23 deletions(-)

-- 
2.31.1


