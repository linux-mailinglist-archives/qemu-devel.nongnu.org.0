Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF3523C15
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 19:57:37 +0200 (CEST)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noqae-0000pA-7S
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 13:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noqVB-00027k-B1
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noqV8-0004fW-CD
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652291513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=82CFj7Bdi0T1f3uiKojlZYQmypoPP/tuKuoIN9lRyBk=;
 b=IpHHkFUltOP+VXVYotXuBGLwPRl5Lrpg3pg2NOlzAxfx9xSt24zRg5klgaZOrLJS46jPKv
 feF9AplO/pQztTO6gYKbUcFrVpP+yTAvh1LxDeNHe/tYhZ4TE4DB3s5QyQjuPKayfzb/aP
 dgtMSVUGOmcdJFSk3dT6iP4WFKZsbTU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-Uj4YzPECOGe7CoGixTzNhA-1; Wed, 11 May 2022 13:51:52 -0400
X-MC-Unique: Uj4YzPECOGe7CoGixTzNhA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49C6B80B90A
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 17:51:52 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E47F40CF8EB;
 Wed, 11 May 2022 17:51:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, libvir-list@redhat.com
Subject: [PATCH 0/3] ui: Remove deprecated sdl parameters and switch to QAPI
 parser
Date: Wed, 11 May 2022 19:51:44 +0200
Message-Id: <20220511175147.917707-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The "-display sdl" option still uses a hand-crafted parser for its
parameters since some of them used underscores which is forbidden
in QAPI. Now that they've been deprecated and the deprecation period
is over, we can remove the problematic parameters and switch to use
the QAPI parser instead.

While we're at it, also remove the deprecated "-sdl" and "-curses" options.

Thomas Huth (3):
  ui: Remove deprecated parameters of the "-display sdl" option
  ui: Switch "-display sdl" to use the QAPI parser
  ui: Remove deprecated options "-sdl" and "-curses"

 docs/about/deprecated.rst       |  26 -------
 docs/about/removed-features.rst |  27 +++++++
 qapi/ui.json                    |  17 ++++-
 include/sysemu/sysemu.h         |   2 -
 softmmu/globals.c               |   2 -
 softmmu/vl.c                    | 128 +-------------------------------
 ui/sdl2.c                       |  13 ++++
 qemu-options.hx                 |  56 +-------------
 8 files changed, 61 insertions(+), 210 deletions(-)

-- 
2.27.0


