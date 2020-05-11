Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCA11CDCFC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 16:21:42 +0200 (CEST)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY9JN-0004o1-1n
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 10:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jY99E-00009V-OE
 for qemu-devel@nongnu.org; Mon, 11 May 2020 10:11:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42483
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jY99D-0003lm-6R
 for qemu-devel@nongnu.org; Mon, 11 May 2020 10:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589206269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=Bm5qAWA9IZjbvui5U1ITShEozof1Yy7dnvEPJ7EVQj0=;
 b=gK7rz3N1SBkureisbCU3AJJTJdaQ4nc54UxafQIzIyzNgJVjTt6OGAP+Elchz26z+rU1lU
 qSN38+qHf6QUwAW87ftC5+BOBidpQw/PuSBX5efXfKPQPDYHDORIahfxhmzLkl9Gmub6qZ
 mWPiyGB2QtogYE3cRGPAVONnM7bVleU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-fssBP8CeONSc26GkVGZ79Q-1; Mon, 11 May 2020 10:11:07 -0400
X-MC-Unique: fssBP8CeONSc26GkVGZ79Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90F3E475
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 14:11:06 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7ACC5C1B2;
 Mon, 11 May 2020 14:11:05 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] make -M memory-backend and -numa memdev mutually exclusive
Date: Mon, 11 May 2020 10:11:01 -0400
Message-Id: <20200511141103.43768-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 02:55:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The options can't be used together (1st provides RAM for non-numa and fake-numa,
while 2nd provides RAM for each numa node).
If used together it might lead to crashes, so add a check to prevent simultaneous
usage.

Igor Mammedov (2):
  vl.c: run preconfig loop before creating default RAM backend
  numa: prevent usage of -M memory-backend and -numa memdev at the same
    time

 hw/core/numa.c | 5 +++++
 softmmu/vl.c   | 5 +++--
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.18.4


