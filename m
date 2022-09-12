Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FA75B587A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:32:32 +0200 (CEST)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXgjv-0004lR-Qu
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgcv-00072a-OJ
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgcm-00073w-8G
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662978303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dOttBlxO3Q9eyJFqcYNFPLzPS1ijdfakFTPx0ImD0s8=;
 b=OaY5lQBBjvaSWCPC8gbwZmwjwmGlhTFhudFTiJrz7RcVnG85W+H9e14gwz0vZmCmG7XYFX
 7oN3tdot1kmjHD1cWXiEFViiNkpCQbVMuz33mWQ2GmO+fX5CqPBz/lWg8Q8NzS6FyKxxeP
 9UmrptN2UjjePnsru6zvOWlL0udETbM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-W7yj73ZBN4-pz7aIXfOE0A-1; Mon, 12 Sep 2022 06:25:01 -0400
X-MC-Unique: W7yj73ZBN4-pz7aIXfOE0A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B5BB85A58D
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 10:25:01 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1908E492B04;
 Mon, 12 Sep 2022 10:24:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 0/5] ui: various clipboard serial fixes
Date: Mon, 12 Sep 2022 14:24:50 +0400
Message-Id: <20220912102455.111765-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

The Spice vdagent serial handling has a few flaws when the guest agent is
restarted, or when the dbus client is restarted. The clipboard serials are not
in sync between agent, qemu and client. This series fixes various reset issues.

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=2124446

Marc-André Lureau (5):
  ui: add some vdagent related traces
  ui/clipboard: fix serial priority
  ui/vdagent: always reset the clipboard serial on caps
  ui/clipboard: reset the serial state on reset
  ui/vdagent: fix serial reset of guest agent

 ui/clipboard.c  | 18 ++++++++++++++++--
 ui/vdagent.c    | 12 ++++++++++--
 ui/trace-events |  5 +++++
 3 files changed, 31 insertions(+), 4 deletions(-)

-- 
2.37.3


