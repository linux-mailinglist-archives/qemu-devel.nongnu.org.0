Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469CC52DA0C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 18:20:17 +0200 (CEST)
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrisp-0004JB-UZ
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 12:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nriVy-0006u9-7p
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nriVs-00031J-O8
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652975791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5HU2KBYn2VJW41q/JVR3B+RtDrER9hEerHZegmEevIE=;
 b=BNSmMqjBSV8fTuJrDM2d+ZqZoL4EIRDG09NwFmoVYSQvFnFFdP0ykEl78vW78cmbZSvN1h
 BH8Ch8K2CFhU7I/n0W9Z7W4Tmru7fzyiItdKOL/uTNr6WYoX2unhnAPScurER/3gUDHuvr
 hZbA3x9NrJrAgdVY0ZB+M2lqi0yfllg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-EpNlbN6mM4-GnljJm1I0jQ-1; Thu, 19 May 2022 11:56:30 -0400
X-MC-Unique: EpNlbN6mM4-GnljJm1I0jQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03474101AA64
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 15:56:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95F70401E74;
 Thu, 19 May 2022 15:56:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 0/3] ui: Remove deprecated sdl parameters and switch to
 QAPI parser
Date: Thu, 19 May 2022 17:56:22 +0200
Message-Id: <20220519155625.1414365-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
parameters since some of them used underscores which is disliked in QAPI.
Now that they've been deprecated and the deprecation period is over, we
can remove the problematic parameters and switch to use the QAPI parser
instead.

While we're at it, also remove the deprecated "-sdl" and "-curses" options.

v3:
 - Fixed some texts according to Markus' and Eric's suggestions
 - Renamed the GrabMod enum to HotKeyMod (to not confuse it so easily
   with GrabToggleKeys)
   
v2:
 - Rebase to current master branch to resolve conflicts in docs/about/*.rst
 - Use an enum for the grab-mod parameter instead of a unconstrained string

Thomas Huth (3):
  ui: Remove deprecated parameters of the "-display sdl" option
  ui: Switch "-display sdl" to use the QAPI parser
  ui: Remove deprecated options "-sdl" and "-curses"

 docs/about/deprecated.rst       |  26 -------
 docs/about/removed-features.rst |  27 +++++++
 qapi/ui.json                    |  26 ++++++-
 include/sysemu/sysemu.h         |   2 -
 softmmu/globals.c               |   2 -
 softmmu/vl.c                    | 128 +-------------------------------
 ui/sdl2.c                       |  10 +++
 qemu-options.hx                 |  56 +-------------
 8 files changed, 67 insertions(+), 210 deletions(-)

-- 
2.27.0


