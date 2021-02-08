Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B20313FFD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:10:52 +0100 (CET)
Received: from localhost ([::1]:40592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Crx-0005M7-Uw
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kx-0003EB-PY
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:39:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kf-00059t-0S
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:39:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yw3gvkBrgjyMj54Sdqk1AmWEgyEgeV5A+uFUxt1FnQM=;
 b=hqf0IQ4oD1eImAW5BE0oPPEagzVtYENgFkLSCzSOgWaLPxhQhdnqQ+3vRfMJpvoyyeGjtY
 YSNtoKqe+Njvpx3rLhY5kl14pdR5x8/o7bReKcxdbtpR7e+7dtfUd4sgpZaWfIJByAdwOw
 Gup/J5fEEogBHP7b5UxctZiCm4Btolk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-WqjVuW8BMd-FAdSkqtfMuA-1; Mon, 08 Feb 2021 08:38:39 -0500
X-MC-Unique: WqjVuW8BMd-FAdSkqtfMuA-1
Received: by mail-wr1-f69.google.com with SMTP id o10so2904803wru.11
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yw3gvkBrgjyMj54Sdqk1AmWEgyEgeV5A+uFUxt1FnQM=;
 b=XHIn8S8Hx1kih8Gu53RKyvEsHRoHsGCsAkboJoYZJa8yw8DJdOu9vvMpdu0wr/iOph
 +p5b5Nvwl6IzAEiMHfHy0buulUsF1oyy3uyE/TdnOlFfByPWjjgtRjdNUowL1VZ3zQ0T
 RZHkhFehvupUZgQqg9fHwCwOY1QzwJVKJ9u3ogI8hi4p/TjXBz2Z3BMZuCyQWY/2umVa
 T9gIW7G3z5lX8n5Zov5EenniIc548do6wpx3k/zv8bmdjNHpqq6yVSTJAlgQB885gOg6
 ehB1d6VxxmtGqTN+V4onc1EZXIbU0Ore5OyPCqvKq3eiZ27CcXQwGPv8o3DWMPwKmltL
 3whA==
X-Gm-Message-State: AOAM5329oknR8an1A5LjfvlXrP+i5y8Ycl6cufpECX+XT4TcC+YL7kGT
 I58KpthnJmPFs1mBqwUdkWXS0D83uBwOQZGU2yCDXmcZA9TBtfWy6/zB314SGW3WSVEayxjoLTU
 kzNYVB44CzguBtCPCiJFJB1226BHUlvAiz9DICCq0n6UAa2BtP5LfXNtAIGKc9NTx
X-Received: by 2002:adf:92c4:: with SMTP id 62mr6753497wrn.245.1612791518165; 
 Mon, 08 Feb 2021 05:38:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypx9lTMA+yRh/WQ1J/409ez2CjUAz+vDr2RnQ/gt78WORrBZtOL7bm80i8jGwjUlPSy4ZDfA==
X-Received: by 2002:adf:92c4:: with SMTP id 62mr6753481wrn.245.1612791517998; 
 Mon, 08 Feb 2021 05:38:37 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n9sm29776076wrq.41.2021.02.08.05.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:38:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/18] tests/acceptance/virtiofs_submounts: required space
 between IP and port
Date: Mon,  8 Feb 2021 14:37:09 +0100
Message-Id: <20210208133711.2596075-17-philmd@redhat.com>
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

AFAICT, there should not be a situation where IP and port do not have
at least one whitespace character separating them.

This may be true for other '\s*' patterns in the same regex too.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210203172357.1422425-10-crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/virtiofs_submounts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 82941756086..28b2920b88c 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -83,7 +83,7 @@ def get_portfwd(self):
                               command_line='info usernet')
         for line in res.split('\r\n'):
             match = \
-                re.search(r'TCP.HOST_FORWARD.*127\.0\.0\.1\s*(\d+)\s+10\.',
+                re.search(r'TCP.HOST_FORWARD.*127\.0\.0\.1\s+(\d+)\s+10\.',
                           line)
             if match is not None:
                 port = int(match[1])
-- 
2.26.2


