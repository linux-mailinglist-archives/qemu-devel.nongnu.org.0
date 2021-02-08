Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD1313F4E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:42:31 +0100 (CET)
Received: from localhost ([::1]:48304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CQY-0000UV-Cl
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96ks-0003DC-3B
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:39:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kP-00058O-Ky
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQL/2c2CKWAyD/s2pXTSLy+Q4WNBTeR2sIKtFalrKUo=;
 b=a7KmxLk/n6Sa+v0epPOsTEZ1b1f1rgOgmeF6QKdCG4MijO+3a1G1cs9FYkxTmBnXLkYybg
 PQTCeuW2vuP0bxrrdI7f7jcM6g/p0ZLJ3eAyP+hXAJEtqjcfZcFwUEwluMyXdUpIX6BNMq
 APZS1/d7ow17arrkVutqBEXQQ1yVLRA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-WrG5js72P8CuJ0R6YEn03g-1; Mon, 08 Feb 2021 08:38:29 -0500
X-MC-Unique: WrG5js72P8CuJ0R6YEn03g-1
Received: by mail-wm1-f70.google.com with SMTP id z188so9355333wme.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQL/2c2CKWAyD/s2pXTSLy+Q4WNBTeR2sIKtFalrKUo=;
 b=ls8sp/IE3pFf+nSMzVUYcS+6Xzfhr43joRQs2UwNMtMTgTGuPibVGHCahwUDeA5x2Z
 sv85P62X5P4QM1xw529YaA839nBt6SQItL+4fSPqSUK157xsjqcLlg+bNwsmNLSRrlCG
 ST79+7BE5EFlyvK1mfSOblXsiyD2LVBfq4pHhqf4PlhUa6BOtSg5W2zCErjO5kfvT8Vy
 1RKnQnoTKYI/L6DbHgFrBTy0GvXqfuxqZgOKV3pQCdKWISTg9t6QWe+Os49/pG7PkfjI
 BRplWnxErNkK41N6YQciDolITmVzU5GGtsijUNb6Ana0rN2ac/7j2WMUw8RJ6BzjPRIt
 tAhQ==
X-Gm-Message-State: AOAM532wrZM5iQVkztO78h7xn/Zlanb/EWFSWML/rAc5dbfdfF2vzf7M
 ArounXGOPkpRXlA/qeVRFDKiOBN1x6qhyYXeWzXk1cfzNiCyBR/9uAacnKPUlZYCG/vfRQ5yVzU
 0Js2MWQnnwxxQ9xPRztODjxciwREkK+1CJ0l5f/hKUYX2hXE0YxwrNtLjOOadfxPs
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr4136219wmc.177.1612791508028; 
 Mon, 08 Feb 2021 05:38:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTDtXpsNBUx9z9cGeHfRQGEjvwgdYuZ5tiqPIbdO9WK/ikbnD1jzK0LqBDHkCQe2E6MBSg1Q==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr4136200wmc.177.1612791507763; 
 Mon, 08 Feb 2021 05:38:27 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y15sm10506487wrm.93.2021.02.08.05.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:38:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/18] tests/acceptance/virtiofs_submounts: use a virtio-net
 device instead
Date: Mon,  8 Feb 2021 14:37:07 +0100
Message-Id: <20210208133711.2596075-15-philmd@redhat.com>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

In a virtiofs based tests, it seems safe to assume that the guest will
be capable of a virtio-net device.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210203172357.1422425-7-crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/virtiofs_submounts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 3b5a242385d..f1b49f03bb5 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -247,7 +247,7 @@ def setUp(self):
 
         # Allow us to connect to SSH
         self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
-                         '-device', 'e1000,netdev=vnet')
+                         '-device', 'virtio-net,netdev=vnet')
 
         if not kvm_available(self.arch, self.qemu_bin):
             self.cancel(KVM_NOT_AVAILABLE)
-- 
2.26.2


