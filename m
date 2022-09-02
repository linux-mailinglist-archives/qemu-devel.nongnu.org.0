Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCD15AAD9B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 13:28:44 +0200 (CEST)
Received: from localhost ([::1]:54646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU4qp-0000vQ-Ne
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 07:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU4ha-0001BR-Cv
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 07:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU4hX-0006Yq-CR
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 07:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662117546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M6xkdZcPgIDVItuQOmkZ6l6e5zE9ZOVHyZxasWIUKP4=;
 b=JcHN92z7He2uA4Z8i3q28/ILqtrXptMXV+JJQysxT6Mzlmx0aYMoBLLJWoADRfoL/mGYi3
 mNkKR8UJws0wx9Ngh+IshAGGn2AP60qUoP9nk9N6fipe+VcVxhMl9DTXj5h8oaOqlcnZMY
 zvxoQToblZ3wB+NH0c0eHexcBqqHHWY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-FLsImAbDPRCBTxfMWsZy7w-1; Fri, 02 Sep 2022 07:19:04 -0400
X-MC-Unique: FLsImAbDPRCBTxfMWsZy7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6976085A589
 for <qemu-devel@nongnu.org>; Fri,  2 Sep 2022 11:19:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 459582166B26;
 Fri,  2 Sep 2022 11:19:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 0/3] io/command: implement portable spawn
Date: Fri,  2 Sep 2022 15:18:57 +0400
Message-Id: <20220902111900.3029260-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

A small series, based on earlier "[PATCH] io/command: implement portable spawn"
to enable Windows support of command spawning in the io/ subsystem.

Marc-André Lureau (3):
  io/command: use glib GSpawn, instead of open-coding fork/exec
  io/command: implement support for win32
  tests/unit: make test-io-channel-command work on win32

 include/io/channel-command.h         |   2 +-
 io/channel-command.c                 | 163 +++++++++------------------
 tests/unit/test-io-channel-command.c |  31 +++--
 3 files changed, 75 insertions(+), 121 deletions(-)

-- 
2.37.2


