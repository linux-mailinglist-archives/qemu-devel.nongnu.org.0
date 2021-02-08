Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB02313F81
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:50:00 +0100 (CET)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CXl-0005SK-B2
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kq-0003DA-P1
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:39:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kR-000594-LR
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e0LNi1evvMz34L4iMgJD557S0z2qV5j+B5CpuhtMhXo=;
 b=Wfn3PjYkoVE6j1Jeb/0inbITwDVyBNuEK/BA36yl0V2uJ82drhmMY/ZADlmmgY8qj+g8F0
 ZxFmlvqC3LCKyI1RlJi3bp6AD+zGcXtywXI1lndP2NG9ahnejg9AVmP2Gr1z47dfEnkM/8
 iCu/X/cGHLc0Z3jX69imTmtKB24hGc0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-F8D5M-eNOaOJQfnDzyAIQQ-1; Mon, 08 Feb 2021 08:38:34 -0500
X-MC-Unique: F8D5M-eNOaOJQfnDzyAIQQ-1
Received: by mail-wr1-f69.google.com with SMTP id x1so6417534wrg.22
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e0LNi1evvMz34L4iMgJD557S0z2qV5j+B5CpuhtMhXo=;
 b=MPif+QrFoQKVz5C27vz8nrZ7g0vBzQmxs+i/I4ISS7bMZhNKidXuEpnDqL7JQyfGts
 kfBxDITzKeuQnXPxBwWGoMqfzsbVfO99yScrMK78qRpWAvUmRcaPbvGA3IM7fmOe7MzT
 FcTJDK3E4YsPgiPe5q6G/GRcVWN5eugfySzTMnZ6GwO+BIYDotIu3V4Lbx2BeVx5qE6t
 pS0YZNRcS9OavJTYkTVEof2mEV06e33WgQqPkUq4S8u93s8FuOepqWKWYH8e9icEu9J2
 HkeeWonSMoijT2uf6/zayfBZjOtYrXaB0Mj9A2kZZyJxsfhUJNU+A7f/1MjdZj5xhmyd
 ZNpw==
X-Gm-Message-State: AOAM530kUXYnIilE82TP0cqvlU6jfZDIU07L+xbKaZhnngOHd7JvLa7m
 QnsZ+AuuXmuDC3lYJaS4tBzuQR1tdhfe1ab1KiGvWQOB5/VNoEuURwuD/Xze1famIpuQPkGYoI2
 guslzGToZNxZ1gQLx0g/8RFT3RUgD2BxkhVtMrDZmEL1vVozjS8yF6tUe1NPaU78X
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr14573476wma.37.1612791513028; 
 Mon, 08 Feb 2021 05:38:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5iKiM22YAdVC/hJMVw1MEO1jya+6pJoJpy40grYv/iNAs1eQg/dU0R13WaodxT93ngiziDg==
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr14573456wma.37.1612791512775; 
 Mon, 08 Feb 2021 05:38:32 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o8sm5599250wmc.34.2021.02.08.05.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:38:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/18] tests/acceptance/virtiofs_submounts: standardize port as
 integer
Date: Mon,  8 Feb 2021 14:37:08 +0100
Message-Id: <20210208133711.2596075-16-philmd@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

Instead of having to cast it whenever it's going to be used, let's
standardize it as an integer, which is the data type that will be
used most often.

Given that the regex will only match digits, it's safe that we'll
end up getting a integer, but, it could as well be a zero.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Message-Id: <20210203172357.1422425-9-crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/virtiofs_submounts.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index f1b49f03bb5..82941756086 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -86,17 +86,18 @@ def get_portfwd(self):
                 re.search(r'TCP.HOST_FORWARD.*127\.0\.0\.1\s*(\d+)\s+10\.',
                           line)
             if match is not None:
-                port = match[1]
+                port = int(match[1])
                 break
 
         self.assertIsNotNone(port)
-        self.log.debug('sshd listening on port: ' + port)
+        self.assertGreater(port, 0)
+        self.log.debug('sshd listening on port: %d', port)
         return port
 
     def ssh_connect(self, username, keyfile):
         self.ssh_logger = logging.getLogger('ssh')
         port = self.get_portfwd()
-        self.ssh_session = ssh.Session('127.0.0.1', port=int(port),
+        self.ssh_session = ssh.Session('127.0.0.1', port=port,
                                        user=username, key=keyfile)
         for i in range(10):
             try:
-- 
2.26.2


