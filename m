Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7993D2F8A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 00:11:16 +0200 (CEST)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6guR-0008FL-Bf
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 18:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m6gtP-00073O-Bx
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:10:11 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:42138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m6gtN-0005xm-AF
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:10:11 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58BE42262F;
 Thu, 22 Jul 2021 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626991805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Jtl4PPA0Ju11Djp61WmIy8kmsZ/jJ2oodH7rzMpl13E=;
 b=FE9ruWn3bjoxXsOdy9IULfLZH+h2F3RVww40wdLBXioZphRCPilzFOgHomRGXPJ9iPlu/r
 ty5YsC4JPHR/JLMsqgeAe7Vnr88lBrSkQuuRra3mQFxArGaAvI+q3IZVdgN24MWgemy0s3
 zK5oie/OiraS9m5Da2Xe38+hBS5kizw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626991805;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Jtl4PPA0Ju11Djp61WmIy8kmsZ/jJ2oodH7rzMpl13E=;
 b=SMLAGiXpUnP38REK7/exDojBJE+el67t1KeLSxTFLEKixqYHYnlMtsSWZGVjmbBO+tE9Cq
 Bxd7ZqJmGcXXcYCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5A415139A1;
 Thu, 22 Jul 2021 22:10:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id dqrmBrvs+WCsZgAAGKfGzw
 (envelope-from <jziviani@suse.de>); Thu, 22 Jul 2021 22:10:03 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] Improve module accelerator error message
Date: Thu, 22 Jul 2021 19:09:51 -0300
Message-Id: <20210722220952.17444-1-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
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
 richard.henderson@linaro.org, kraxel@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1 -> v2:
* Moved the code to module.c
* Simplified a lot by using current module DB to get info

The main objective is to improve the error message when trying to
load a not found/not installed module TCG.

For example:

$ qemu-system-x86_64 -accel tcg
ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: 
(ops != NULL)
Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: 
assertion failed: (ops != NULL)
[1]    31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...

To:
$ qemu-system-x86_64 -accel tcg
accel-tcg-x86_64 module is missing, install the package or config the library 
path correctly.

Jose R. Ziviani (1):
  modules: Improve error message when module is not found

 accel/accel-softmmu.c |  5 ++++-
 util/module.c         | 14 ++++++++------
 2 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.32.0


