Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB1B3B8AF8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 01:33:03 +0200 (CEST)
Received: from localhost ([::1]:54938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyjhT-000120-Qb
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 19:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyjcf-0003Pe-Q0
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 19:28:01 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyjce-0001FE-3R
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 19:28:01 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 113151FF32;
 Wed, 30 Jun 2021 23:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625095677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rqAUtZeeyu1Z0VrDDE748lLJyqVb7R94bPJXzaVn0aU=;
 b=uf/CWxrgtFWiYg3LM/5MPLGcu58//9n3tdx0LpTskjeVzpjuBaCdMDkisUl3LDVhJzfxcn
 TX+YsOqcyiixkvWjq//uX37fr5CbtGeDKvFRMJp2JscmpSd5OQ4EbC3ZMIqWki/00Kxzik
 buH3jTyd5SzCSqQFRI3OaTTreMc8oPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625095677;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rqAUtZeeyu1Z0VrDDE748lLJyqVb7R94bPJXzaVn0aU=;
 b=nY6SO2d7FdJsPOhNIbYxycdHbCmzRAQeC1g/w+kxYnzZwRyg4EZpY75BXhXYBwucbza3di
 0mYLK05uQfh9VeDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id BE222118DD;
 Wed, 30 Jun 2021 23:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625095677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rqAUtZeeyu1Z0VrDDE748lLJyqVb7R94bPJXzaVn0aU=;
 b=uf/CWxrgtFWiYg3LM/5MPLGcu58//9n3tdx0LpTskjeVzpjuBaCdMDkisUl3LDVhJzfxcn
 TX+YsOqcyiixkvWjq//uX37fr5CbtGeDKvFRMJp2JscmpSd5OQ4EbC3ZMIqWki/00Kxzik
 buH3jTyd5SzCSqQFRI3OaTTreMc8oPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625095677;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rqAUtZeeyu1Z0VrDDE748lLJyqVb7R94bPJXzaVn0aU=;
 b=nY6SO2d7FdJsPOhNIbYxycdHbCmzRAQeC1g/w+kxYnzZwRyg4EZpY75BXhXYBwucbza3di
 0mYLK05uQfh9VeDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id PcQVH/r93GA/IQAALh3uQQ
 (envelope-from <jziviani@suse.de>); Wed, 30 Jun 2021 23:27:54 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [RFC 0/3] Improve module accelerator error message
Date: Wed, 30 Jun 2021 20:27:46 -0300
Message-Id: <20210630232749.21873-1-jziviani@suse.de>
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
Cc: berrange@redhat.com, ehabkost@redhat.com,
 "Jose R. Ziviani" <jziviani@suse.de>, kraxel@redhat.com, pbonzini@redhat.com,
 cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!

I'm sending this as RFC because it's based on a patch still on
review[1], so I'd like to see if it makes sense.

Tt will improve the error message when an accelerator module could
not be loaded. Instead of the current assert error, a formated
message will be displayed.

[1] https://patchwork.kernel.org/project/qemu-devel/list/?series=506379

Jose R. Ziviani (3):
  modules: Add CONFIG_TCG_MODULAR in config_host
  modules: Implement module_is_loaded function
  qom: Improve error message in module_object_class_by_name()

 include/qemu/module.h |  3 +++
 meson.build           |  3 +++
 qom/object.c          | 30 ++++++++++++++++++++++++++++++
 util/module.c         | 28 +++++++++++++++++++++-------
 4 files changed, 57 insertions(+), 7 deletions(-)

-- 
2.32.0


