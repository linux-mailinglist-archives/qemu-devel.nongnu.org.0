Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E195A33321A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 00:55:31 +0100 (CET)
Received: from localhost ([::1]:49524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmCI-0001u4-Tc
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 18:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm8H-0004Rg-2w
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:51:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm8D-0001AY-L9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615333876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1sffFlZ9/SNFgtZee/CEsk5iX0bBYiTE0XhzbPNOxhU=;
 b=Vhk5djBkG89APOeRZ1+UYmcbOrUEXKGhPJCykRpNwadADxRQWh6BUb7rnBW2h+UJD5wW4/
 f6ApY4SasbgV8uogBLd8lLUyszcD5DD/SnWDOoEKt0vkpcz4ep7ypBRUGqVTpXdsVbENHR
 whgQIvH7Se9ou2AjxeGqya6GUVQNHwY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-qUBVVjkJN0e9Ly-_XRrivw-1; Tue, 09 Mar 2021 18:51:15 -0500
X-MC-Unique: qUBVVjkJN0e9Ly-_XRrivw-1
Received: by mail-ed1-f70.google.com with SMTP id o15so7567722edv.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 15:51:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1sffFlZ9/SNFgtZee/CEsk5iX0bBYiTE0XhzbPNOxhU=;
 b=Xah1O6UG3ItlF9BAPRtrVvECkVd2WFD7JCfo8s5Q7h9SHEnsWyuDRBWGNgjCIW1HXA
 EvN9WL/3slyMkGHQheu3omJM/elQJzyqyfm9QLqmmR0y6UC8QAQXtB8Os8WrF58Y2pRZ
 QsZQvX8lV/Fv7aWFs7E6MrQAXbYPsPBoYaaVgySh43ltEuORiWjz+Bo5LTcUFhmH/iBQ
 tOVsFgmCf4jwcE64qBIO5X764MYouKgIsBK3mt9H1kOxuwKmc0UPocE4f5m9XoPH+tW1
 JXHQtCQv/hLGBimxdwa3WyrvDBOaoausRPvJXRh0HZcWz8HCU5ueG8wm3Na8g2/RyzJ2
 zSaw==
X-Gm-Message-State: AOAM531lbQCIQy3rRmoVUQ9qTUglTPCmIVvsNjz8A6UkxbgfTPS4DjXs
 9Fj/hARxC0u7M/zLkKrecOeMRKPv8fyEQ5ypdLJiICbhn+l6iLasVz/C5X+6CeAV6it86SDNdro
 AZ4rgdvlj7gLXvIwQQNQsTi+n8tG8DSyZqssbTeS5RhPYIDvCqXqq8JhSwCBd24os
X-Received: by 2002:a50:9d0b:: with SMTP id v11mr190510ede.308.1615333873778; 
 Tue, 09 Mar 2021 15:51:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTEWns1FXeYiJTJdgIWM3J+uyhLArzMKGqWPuyHy+KUK3Q1lRRZYqdsO2EftnANh7RlSSrLg==
X-Received: by 2002:a50:9d0b:: with SMTP id v11mr190485ede.308.1615333873519; 
 Tue, 09 Mar 2021 15:51:13 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h15sm7172603edb.74.2021.03.09.15.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 15:51:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] hw/block/pflash_cfi01: Clarify trace events
Date: Wed, 10 Mar 2021 00:50:27 +0100
Message-Id: <20210309235028.912078-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309235028.912078-1-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the 'mode_read_array' event when we set the device in such
mode, and use the 'reset' event in DeviceReset handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 03472ea5b64..2618e00926d 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -663,7 +663,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  mode_read_array:
-    trace_pflash_reset();
+    trace_pflash_mode_read_array();
     memory_region_rom_device_set_romd(&pfl->mem, true);
     pfl->wcycle = 0;
     pfl->cmd = 0x00; /* This model reset value for READ_ARRAY (not CFI) */
@@ -886,6 +886,7 @@ static void pflash_cfi01_system_reset(DeviceState *dev)
 {
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
 
+    trace_pflash_reset();
     /*
      * The command 0x00 is not assigned by the CFI open standard,
      * but QEMU historically uses it for the READ_ARRAY command (0xff).
-- 
2.26.2


