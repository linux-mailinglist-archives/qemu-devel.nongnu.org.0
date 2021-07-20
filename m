Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C53CFE37
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:53:00 +0200 (CEST)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5s3G-0003FT-2r
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rt0-00084o-4b
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsy-00052l-MK
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wA6+RtbQ7Um0MRpydXbUNAVoPmQJ36kPzcc30JTCS8A=;
 b=MG6CWfZoqJHxap/aKy/QSiBOFoaW54zREbwPwM5wgEtmwdIKUtLYqYVUaLgTHmSh2oQlZR
 1vvHaNC/rN5Hz8NHjffWGNW43z7UvEKnp8k0VePbdllj5sb9G9UFGpvys0F2oeL0ue6m7U
 48CyzIl57oWs/4xjP9Ijnmy6lPbKk14=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-9zYJUG5uNqyt8jznanfynQ-1; Tue, 20 Jul 2021 11:42:19 -0400
X-MC-Unique: 9zYJUG5uNqyt8jznanfynQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 g13-20020a05600c4ecdb0290242a8f4cf9cso1385290wmq.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wA6+RtbQ7Um0MRpydXbUNAVoPmQJ36kPzcc30JTCS8A=;
 b=c4ouHsYmuc1bkkEwXsDtvB/gX0I588/nyE2giqBdCkCnq4fIX3xR3MGYO6rq+Z5UCZ
 sehmvuIX4h8N5dHs9c08vWNR6LjgBECdolJLjrktwHKtsEABNXYU8GOe5nkIJEBBZZyk
 pOohb4BK/xORR99aUQpa15p2YXwuM37bsXP3s1bZD/hy/K2MbyDw3d1/74NF9tiVpFNJ
 2YIvQk/QU32fq5i3kDJau2NIfngu2vZjd3GwBa2plxridCr/Bm/LCMdCZA52puJwk2l/
 18AGRdB/jwy5XcCMD0lmwC7VIWf7wBQhoy8Z+Nxmx1OhS29rSUE5t+OvDXSaEJNZdCEa
 jxdw==
X-Gm-Message-State: AOAM5323nAVqehlIqOBBfuKmVIaSoR0kXGcbEvvG2xK9wKV58H8X9bHD
 IAyFEO5BE6PrVX3LNZThEyEtd7dxmAQjQrGsIUHqT3cPnUvPJGXJNshN6x6IdEnMyt6Lv8dAsxq
 RoZod6Mh0j5Btc1PlRmoLIuqA4j5pSApZJWXvc0YQCViny2nIhbFwBKIlcHUOkQYs
X-Received: by 2002:a1c:a709:: with SMTP id q9mr37998691wme.23.1626795737819; 
 Tue, 20 Jul 2021 08:42:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIImfEo+T2BYV/lOyetPf0xj3lBrzSiHWRjkPCKwlXjT6+M5l73ZiIRXozJFAx5RlvACiZ/g==
X-Received: by 2002:a1c:a709:: with SMTP id q9mr37998675wme.23.1626795737683; 
 Tue, 20 Jul 2021 08:42:17 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 t5sm24166827wrw.38.2021.07.20.08.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/17] hw/arm/Kconfig: Remove unused DS1338 symbol from i.MX25
 PDK Board
Date: Tue, 20 Jul 2021 17:41:32 +0200
Message-Id: <20210720154141.3919817-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit c4f00daa5b3 ("imx25-pdk: create ds1338 for qtest inside
the test") we removed the DS1338 device from the i.MX25 machine
but forgot to remove it in the machine Kconfig definitions, do
it now.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210515173716.358295-5-philmd@redhat.com>
---
 hw/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4a994f35e3b..30967da2e14 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -404,7 +404,6 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
-    select DS1338
 
 config FSL_IMX31
     bool
-- 
2.31.1


