Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5B947893F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 11:51:43 +0100 (CET)
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myApy-0003bs-I3
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 05:51:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myAoc-0002Fh-KC
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 05:50:19 -0500
Received: from [2a00:1450:4864:20::536] (port=35786
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myAob-0005Ix-9V
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 05:50:18 -0500
Received: by mail-ed1-x536.google.com with SMTP id y22so6276975edq.2
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 02:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Va7aH7F5wNzj4tqTVDznAbDfwrxer3zFu8LqmVshp8Y=;
 b=A4YUN+A6skDlhZddCgGsXlep7VfUMxIUf0bTJeCM37s4vDbhDUeD/vxwoEeNveGExJ
 MHgVeFKsurS8BdGbXskzwro5hOH+F46g9dAtc7HFm68S2IGmq3uDVA9K8PPXiNO4ia0t
 DNq1odpWYNYhKfmoWbMFZAW6B8epxqB5HtL8jpfOOjA69yQR9dEgPtHgC749RuSyMEtk
 wTgcC4u1db23aI2oMj+Ma6nwcmXVD32GxN7T0PYLP49HA0neUCqHhvvS4uvm0HxIg1V0
 b8m7Jf34wyxOdUYppO1qq0MbA84nyp6lCCUJjkhqMMZowQ2NH/ASAfeYi/praKinbrDZ
 dQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Va7aH7F5wNzj4tqTVDznAbDfwrxer3zFu8LqmVshp8Y=;
 b=KrISZZu0Us8UkUovkbOtx5uSguM4tVrdyXLgoo6qA6yPYIWwhjgqmlMC6sf8CtYkuo
 T3k+7jEyUkotLx3esYtg91yie4JY6mLx3q+MmvG4mQDYZUhQrMDt4Z52N/JXMG1d753d
 ISuK1a5MYWSvQEkb3Cik2Vp+49aFCpDPsGjmPt0D7RZU1htQV7d7hZ+ApE5m/cn5xcl9
 v+mA1zDCIrJYufmsAleDU6gz/VYNkOcN/eNuz6vOzIQFWbTPSLSldzcAFISdhHCHP0z2
 cF9m4/37vAvXVFSJS+DJVKUSIkPgMZcgVvsJmWUPayg08SCS8+XSBxGa3BYmwgjMgIMa
 1IcQ==
X-Gm-Message-State: AOAM531M1VzmJ5qDOlemv1MqPn5Fy+h09kOh1j5boRIuqaBalCcqsSyi
 jji5CYf96TEUl12sLpi9O8wk7GJ4uvQ=
X-Google-Smtp-Source: ABdhPJwvVJL2B/q1KYPm6k1DeOpxk7eDwKvWj2lio/17L54j35hjq4aJnV18T84l/s1c9j1QO4eLeg==
X-Received: by 2002:a17:907:1dec:: with SMTP id
 og44mr2074335ejc.633.1639738215931; 
 Fri, 17 Dec 2021 02:50:15 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 nb17sm2723476ejc.7.2021.12.17.02.50.15 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 02:50:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: reenable test-fdmon-epoll
Date: Fri, 17 Dec 2021 11:50:06 +0100
Message-Id: <20211217105006.179866-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The test was disabled when CONFIG_EPOLL_CREATE1 was moved out
of config-host.mak.  Fix the condition.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index acac3622ed..90acf5b0da 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -112,7 +112,7 @@ if have_block
   if nettle.found() or gcrypt.found()
     tests += {'test-crypto-pbkdf': [io]}
   endif
-  if 'CONFIG_EPOLL_CREATE1' in config_host
+  if config_host_data.get('CONFIG_EPOLL_CREATE1')
     tests += {'test-fdmon-epoll': [testblock]}
   endif
 endif
-- 
2.33.1


