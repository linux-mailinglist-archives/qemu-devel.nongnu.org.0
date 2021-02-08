Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2DA313EEB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:28:43 +0100 (CET)
Received: from localhost ([::1]:50570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CDC-00069R-Jj
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96k5-00037o-SA
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jn-00053q-3q
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQ7gcwIJyEjX0zd59lKnvbrHOtNccVSpuCuwvlX+x68=;
 b=Ajh7fkJAyEuGrS7dAlQIEYGsk4GqHW4njE8UvliRylDPLtAZJWYW5fzBlqj76v4a+sQuhW
 jidLV3C3wCs50W0XWlqhcLpG1Nq85CGn4BOfPd8UsKgDiVe0FNxcQVcJcJT2dURgLxmyqJ
 dTXp2CU5o/ziZJx07Eot48Z2YLxnxQQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-pAXBqkxKPSyDgzYm1hj6Bg-1; Mon, 08 Feb 2021 08:37:52 -0500
X-MC-Unique: pAXBqkxKPSyDgzYm1hj6Bg-1
Received: by mail-wm1-f70.google.com with SMTP id u138so3607265wmu.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tQ7gcwIJyEjX0zd59lKnvbrHOtNccVSpuCuwvlX+x68=;
 b=HvwRulPVIACbfPGpODcGDQcNL7BdUON50ebHcLF9TB/C5SN/SQJk06coQif/viJb1o
 gzI76W8TOKAOlgX0OVVAv9iLK6Ls6KD4SDuAorwg4Daxc9tmUUmxLLdRGU6Oj87FL4Mq
 R42xOQCr1+F4P05U5BDDPtUP3gLZzp0Xs2tICdS4kSLZKsAnD8YW4TSElBZHSSBr9mCQ
 TxJCxsRZLhD+IZkmztSlbhIwf15SnlblgrtbpL9ng+SaXkiy2VrrNu+TI16TG1/gaKHX
 l6QnLoltOfN9GSUfrH826wZSdcto5x+MEqbRroruzNsDLsrxW9S3YWNths/96tu//V+Y
 disg==
X-Gm-Message-State: AOAM533LHM+nam3twQS1jMh1MuZV28EBMuXnI/wnUdu3JlwqaLmWpNUR
 QXpqTaHMdMd6MipZSWd0HmubHYI5JxO+X3n5aM5shID730C0/bT+NZ1UJ+GA8QS+OxMU+SVFOx9
 GksvmRxDInqJqthM86Z8ZfRPbRUz8xOLlYzfrTE0/DdbCZqlBLbt1d4Ew6wHxr1Nl
X-Received: by 2002:a1c:bcc3:: with SMTP id m186mr7642798wmf.165.1612791470889; 
 Mon, 08 Feb 2021 05:37:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoLovhfKM44tbrkJ7pK9KWK+o5YraYN1AYYaEu+dXfImgiwVVZxhVAZ7cuN8yOdA7PLvZWTA==
X-Received: by 2002:a1c:bcc3:: with SMTP id m186mr7642773wmf.165.1612791470584; 
 Mon, 08 Feb 2021 05:37:50 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z4sm28610257wrw.38.2021.02.08.05.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:37:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/18] tests/acceptance: Add a test for the virtex-ml507 ppc
 machine
Date: Mon,  8 Feb 2021 14:37:00 +0100
Message-Id: <20210208133711.2596075-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
References: <20210208133711.2596075-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The "And a hippo new year" image from the QEMU advent calendar 2020
can be used to test the virtex-ml507 ppc machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210112164045.98565-4-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/machine_ppc.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
index 71025d296c5..a836e2496f1 100644
--- a/tests/acceptance/machine_ppc.py
+++ b/tests/acceptance/machine_ppc.py
@@ -49,3 +49,21 @@ def test_ppc_mpc8544ds(self):
         self.vm.launch()
         wait_for_console_pattern(self, 'QEMU advent calendar 2020',
                                  self.panic_message)
+
+    def test_ppc_virtex_ml507(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:virtex-ml507
+        """
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2020/download/hippo.tar.gz')
+        tar_hash = '306b95bfe7d147f125aa176a877e266db8ef914a'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/hippo/hippo.linux',
+                         '-dtb', self.workdir + '/hippo/virtex440-ml507.dtb',
+                         '-m', '512')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
+                                 self.panic_message)
-- 
2.26.2


