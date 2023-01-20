Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EEE67600B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 23:18:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIzhC-0005ZS-42; Fri, 20 Jan 2023 17:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIzh8-0005Z5-Kg
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 17:17:10 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIzh6-000792-GE
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 17:17:10 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 866B95CA27;
 Fri, 20 Jan 2023 22:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674253024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vE48GnMXecUxwI1dCRK8W7DU8ROBZwBcbl+sVVHVbgQ=;
 b=UQ4BqMvQTlbpMHFEWlqaePeHGT8cPrtdVzQOOWmYspmfjWeoUE2CCcmxCbSTrnL7T8jtzh
 /1/f9eu4y42mJ3ujOIo/hPJVcs1fZ+ROoR3X4reHLM69MNOuhMT+jIiSXflzL74qjM7Hhz
 2DCuxtBdpZ6UuYPQEPTdu4FXwnXKrGo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674253024;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vE48GnMXecUxwI1dCRK8W7DU8ROBZwBcbl+sVVHVbgQ=;
 b=iO++hRH1BKHgedW+nHHvlCLmPkSF/zApQ9PvHF9j1OynoIgApD3pvxJwgwMhIGX5D3oseD
 dpRnB5PBhwABjOAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6AF013251;
 Fri, 20 Jan 2023 22:17:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vgRjJt4Sy2P6RwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 22:17:02 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/2] tests/avocado: Pass parameters via Makefile
Date: Fri, 20 Jan 2023 19:14:58 -0300
Message-Id: <20230120221500.4194-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is intended to replace the last two patches of Daniel's series:
https://lore.kernel.org/r/20230118124348.364771-1-dbarboza@ventanamicro.com

Currently, the initialization code in setUp() infers properties of the
tests & host/target machine by looking at the avocado tags present in
the test. If there are no tags some best-effort fallbacks are chosen.

This means that for generic tests they end up always choosing the QEMU
target that matches the host architecture, which is not always
desirable. If we allow command line parameters to override the
fallback, we can alter this behavior.

patch 1 - change precedence to tags > params to avoid changing tests
          that do have tags;

patch 2 - wires up the new AVOCADO_PARAMS variable to the '-p' avocado
          command line option;

Fabiano Rosas (2):
  tests/avocado: Invert parameter vs. tag precedence during setUp
  tests/avocado: Allow passing command line parameters via Makefile

 tests/Makefile.include                 |  6 ++++-
 tests/avocado/avocado_qemu/__init__.py | 32 +++++++++++++++-----------
 2 files changed, 24 insertions(+), 14 deletions(-)

-- 
2.35.3


