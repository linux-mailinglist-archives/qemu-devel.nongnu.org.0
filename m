Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495A326C383
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 16:06:57 +0200 (CEST)
Received: from localhost ([::1]:34430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIY5H-0001vt-SY
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 10:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kIY49-0000ps-Uo
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 10:05:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41128
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kIY47-0001la-F7
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 10:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600265142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=spes70wtRxtdTrcsgJaD3iqBO0Btd1aOtLaRW5v7QV8=;
 b=IxMfAyAfLGdlNF30ALSzesh0GzamdIpMObqw3Zkc/drUZbGdFJnyFZuCEezQzrvJpn/max
 0PGMLWW7PXbEk4iMpcBpWwQy0Hz24zaeR5Yq/L1r15B9Q1/Ih254sGMiugEyWZvszed7+H
 aYmTp+FVZKJqUytxgnnFyXuZR5fdjM0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-XCh3F0twMXeOS7fshTpoNA-1; Wed, 16 Sep 2020 10:05:39 -0400
X-MC-Unique: XCh3F0twMXeOS7fshTpoNA-1
Received: by mail-wm1-f71.google.com with SMTP id b14so873058wmj.3
 for <qemu-devel@nongnu.org>; Wed, 16 Sep 2020 07:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=spes70wtRxtdTrcsgJaD3iqBO0Btd1aOtLaRW5v7QV8=;
 b=jA40vtPV9D3W6c1Y20xsuC8Ke7QEGBSi+sWo00ISYY5ZagMGROWpNP3bMQGgMbesAB
 AKPCeYr1GrD8B90kQe3xC5yZhKYBf3xvVwk6QSv5Rj3tFx7yMSPpOPFr5Be1qIPWW/H5
 nsSNo7avrJBE0OXkclfJOaKE9HqSQ90/+CmuiBqsczzME3HRxje3q6aBoGQC/Rkmk00O
 ZI97TQJXJege3E+aul1vzSQvhEaDgS4453IF+xWmxHvNsWHMM2/N12nENuKkOwtTw292
 2+yvU9xFxvN6QDhkKkC9Q3ZNcdvV+eRU1TIhlTuoOlfITiXnG9p/sCyaQwjXsUMjFAr6
 hivQ==
X-Gm-Message-State: AOAM533AiljJgC7Z9ixMQhIQLuacC+oI8PNBfggm5KikfSzwr+yOaIOH
 N6l9BELjxxHByqwJrR1bG+k8LrJbxbigM89TiXBuLmTC5N68Mgq2M0CJ1AELDYXvyphwZfxLAoK
 6PQEafsAUFvdpHCQ=
X-Received: by 2002:a1c:f415:: with SMTP id z21mr4928677wma.88.1600265138305; 
 Wed, 16 Sep 2020 07:05:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfES5XFnVH5c+U5/0Ym5qbYmcb+SSSvr6TS2UjqsDODxUKrz16b2X33C5Qw+AwEGAv6Fws2Q==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr4928656wma.88.1600265138118; 
 Wed, 16 Sep 2020 07:05:38 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id h2sm34287479wrp.69.2020.09.16.07.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 07:05:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/nvram/fw_cfg: Assert linked data is not NULL
Date: Wed, 16 Sep 2020 16:05:35 +0200
Message-Id: <20200916140535.1451663-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 06:27:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The linked data passed to the fw_cfg device must not be NULL.
Add an assertion.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index f3a4728288e..40dcc08b57b 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -711,6 +711,7 @@ static void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
 
     key &= FW_CFG_ENTRY_MASK;
 
+    assert(data);
     assert(key < fw_cfg_max_entry(s) && len < UINT32_MAX);
     assert(s->entries[arch][key].data == NULL); /* avoid key conflict */
 
-- 
2.26.2


