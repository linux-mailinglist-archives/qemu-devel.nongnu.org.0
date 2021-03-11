Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A747337CC3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:39:14 +0100 (CET)
Received: from localhost ([::1]:52738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQDJ-0007lW-3q
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKQ4X-0001eT-Uv
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:30:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKQ4V-0004Vk-SI
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615487406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=28FxWiYW3/T1/Y+CPz8AGr144hxd69N/0pPW8TuudAA=;
 b=ZtlEWgrvWrb/cKCBNpkemfdrLTCJJHVwmrCBHneDdXhQnCO0UKFlVOFB8yjFqQNfn0AFEn
 synFh9T+VOdoNVpyxijXXy93KBZb7c7U0QkIqvZccfFF8BTczpvyCa9U43fQRvFfLq328X
 ws3CRLyZEZL45Ohz1ZRmtGnhOcLMSYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-2jzYEx_DO3S5XbI60AmbJQ-1; Thu, 11 Mar 2021 13:30:05 -0500
X-MC-Unique: 2jzYEx_DO3S5XbI60AmbJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3896363A1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 18:30:03 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-85.ams2.redhat.com
 [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4536A2C15A;
 Thu, 11 Mar 2021 18:29:59 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] ui: improve precision of VNC desktop resizing
Date: Thu, 11 Mar 2021 18:29:53 +0000
Message-Id: <20210311182957.486939-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently when resizing the VNC desktop we get a thin black bar down the=0D
right hand side of the screen 93% of the time, because the VNC server=0D
rounds up the display to a multiple of 16. This series solves this=0D
problem by fixing the separation between the server surface dimensions=0D
(which are important for dirty bitmap tracking) and the client desktop=0D
size (which is what the client actually renders).=0D
=0D
Daniel P. Berrang=C3=A9 (4):=0D
  ui: add more trace points for VNC client/server messages=0D
  ui: avoid sending framebuffer updates outside client desktop bounds=0D
  ui: use client width/height in WMVi message=0D
  ui: honour the actual guest display dimensions without rounding=0D
=0D
 ui/trace-events | 16 ++++++++++++++++=0D
 ui/vnc-jobs.c   | 44 ++++++++++++++++++++++++++++++++++++++++----=0D
 ui/vnc.c        | 48 ++++++++++++++++++++++++++++++++++++++++--------=0D
 ui/vnc.h        |  1 +=0D
 4 files changed, 97 insertions(+), 12 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


