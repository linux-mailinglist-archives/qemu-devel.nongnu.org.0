Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CD452BB98
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:48:37 +0200 (CEST)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrK2W-0002Hz-2m
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrJyx-0006fi-8R
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrJyu-0005JA-5v
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652881490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/SLHywzpeCaLFVyhl2n9zAHa1GrAd/VcN/6Pa8sOUt8=;
 b=B5Ubr59S1kEZZ0ciU3IBurAM8GEn3m44DqYlrLAQ9IJddIrFq/pyMLsMDhjzjJrU/E5fCJ
 j4L8zWPcXs41z7cgBqlN4+Vcu3NsJc1E/WbtNRl/+s9r7joW+8hHyezyn28S7pmDfttf12
 g2K2RkTellHMxosjdWSBtB7XzS25eI4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-238zmNCNNSSThJG3jSWvkw-1; Wed, 18 May 2022 09:44:49 -0400
X-MC-Unique: 238zmNCNNSSThJG3jSWvkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E069185A7BA
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 13:44:49 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43E0540CF8F0;
 Wed, 18 May 2022 13:44:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 0/3] ui: Remove deprecated sdl parameters and switch to
 QAPI parser
Date: Wed, 18 May 2022 15:44:43 +0200
Message-Id: <20220518134446.211632-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

v2:
 - Rebase to current master branch to resolve conflicts in docs/about/*.rst
 - Use an enum for the grab-mod parameter instead of a unconstrained string

Thomas Huth (3):
  ui: Remove deprecated parameters of the "-display sdl" option
  ui: Switch "-display sdl" to use the QAPI parser
  ui: Remove deprecated options "-sdl" and "-curses"

 docs/about/deprecated.rst       |  26 -------
 docs/about/removed-features.rst |  27 +++++++
 qapi/ui.json                    |  27 ++++++-
 include/sysemu/sysemu.h         |   2 -
 softmmu/globals.c               |   2 -
 softmmu/vl.c                    | 128 +-------------------------------
 ui/sdl2.c                       |  10 +++
 qemu-options.hx                 |  56 +-------------
 8 files changed, 68 insertions(+), 210 deletions(-)

-- 
2.27.0


