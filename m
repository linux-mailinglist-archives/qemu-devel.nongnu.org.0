Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F6C3B79DF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 23:30:08 +0200 (CEST)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyLIy-0001kp-DT
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 17:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyLHb-0008GZ-5R
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:28:39 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:37372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyLHZ-0004eo-46
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:28:38 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C9DF81FDCD;
 Tue, 29 Jun 2021 21:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625002113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dO3kbF7x+SjB1RuyLy/rq6NhQOUXJme1aA7EMRthTSk=;
 b=trViWbgv6R8ryyXPe7mBdn5u4vzlRIMiyQ7Svpkl16vR+/18xg0TsW1THFCdFiYkkXM5D0
 MKhCpgc5Ow/J6YP8oGk6zCZ7K1+zekoDPLhDV1YrO016rEeJ0Iy/6HNsVaplkb9hBSke+h
 oFEghFcPmVK3kNsdlh7q3gW2UouVQ6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625002113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dO3kbF7x+SjB1RuyLy/rq6NhQOUXJme1aA7EMRthTSk=;
 b=8VpjAiL2qE7SLtyp4Za/9S0id36R+2EuOp3BOf6g3p00kKkL/KUdqq17YC74FFqEiMGkEN
 Fl4JPNydNsDhyjCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2684311906;
 Tue, 29 Jun 2021 21:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625002113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dO3kbF7x+SjB1RuyLy/rq6NhQOUXJme1aA7EMRthTSk=;
 b=trViWbgv6R8ryyXPe7mBdn5u4vzlRIMiyQ7Svpkl16vR+/18xg0TsW1THFCdFiYkkXM5D0
 MKhCpgc5Ow/J6YP8oGk6zCZ7K1+zekoDPLhDV1YrO016rEeJ0Iy/6HNsVaplkb9hBSke+h
 oFEghFcPmVK3kNsdlh7q3gW2UouVQ6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625002113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dO3kbF7x+SjB1RuyLy/rq6NhQOUXJme1aA7EMRthTSk=;
 b=8VpjAiL2qE7SLtyp4Za/9S0id36R+2EuOp3BOf6g3p00kKkL/KUdqq17YC74FFqEiMGkEN
 Fl4JPNydNsDhyjCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id tNBbN3+Q22AtQQAALh3uQQ
 (envelope-from <jziviani@suse.de>); Tue, 29 Jun 2021 21:28:31 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [RFC 0/2] Option to build native TCG with --enable-modules
Date: Tue, 29 Jun 2021 18:28:17 -0300
Message-Id: <20210629212819.24389-1-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, "Jose R. Ziviani" <jziviani@suse.de>,
 kraxel@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!

I'm sending this simple patchset based on a patch still on review[1]
just to understand if it's something that makes sense to the community.

If so, I think it could be included in Gerd's patchset.

Thank you!

[1] https://patchwork.kernel.org/project/qemu-devel/list/?series=506379

Jose R. Ziviani (2):
  modules: Option to build native TCG with --enable-modules
  modules: Fix warning in module_arch documentation

 configure             | 12 ++++++++++--
 include/qemu/module.h |  2 +-
 meson.build           |  7 ++++++-
 meson_options.txt     |  2 ++
 4 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.32.0


