Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AF83A6F2E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:35:10 +0200 (CEST)
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssMX-00082H-E2
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssK1-0004bf-NT
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:32:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssJy-0004pU-Aq
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623699149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfez23IpOF2zbJFb9oWTU9xCaYMI6EGMDB31a8sxbas=;
 b=PzoCmVsLQOELvwSQvWvMZZF/YjQuI8QuVas3apPXHcLV9i2CZ7ry6sy0vln1Ky9fcQrBdW
 q/oDM/HwWtAL+uwprMR+zemoGm68KZnvLLdQmVXkxdkU132HIb5rLZt00RokhGWdCXa8pC
 Wl0OT2vkYsOd+8yS8urHZ7o9krA3esw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-VcfhlxnIPkiMur-ufJshyg-1; Mon, 14 Jun 2021 15:32:27 -0400
X-MC-Unique: VcfhlxnIPkiMur-ufJshyg-1
Received: by mail-wr1-f72.google.com with SMTP id
 g14-20020a5d698e0000b0290117735bd4d3so7393879wru.13
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cfez23IpOF2zbJFb9oWTU9xCaYMI6EGMDB31a8sxbas=;
 b=eO9m11slSpkaMFHecxUyf/ltOvIfqrPhZn5B1Q7/vvnQBhjrstxFa/jVtN4Y/rWPbX
 2ypx1MDij6TbebSoPS2XdKjBbS6uZYK1pDTWpefxH/W4vaUNLMG0wKIQmNCvfgvLOY0q
 nJ9X+KkhMjYodJUZLMJLlUfcCOVUtjkynwyP8USQtvB/U9wbvCWzwVE8404I03FCq4AS
 77K6QcElfxcSRnHqOK0wKKcq+dEx6Vx32w0k6E6M6utiuu29+PdrejWEkNbIaFVk3DSC
 rd3Mlk0/aq8Y6DoSPSxulcYysWniJUcTLzkM2R802t22F9PRhWp97NQpp7HWN/eNgIZT
 Fpiw==
X-Gm-Message-State: AOAM532NhhKHGMruqL9Bse3pF9kn/zmClp8oDMDwITScSOwYMfsHS/+d
 +x41kqyZ38ztWbzO39dLjJ4ytE+xbl+uFYWUmOKRKOi4ZtRt1jpoarbOfGMIu4xHXEfatDswktP
 IOlyQy5IKnPQRi7ckTbBQjgkWmLXV7sSb+yt8QDwbXgVfOf9As8f/WNHNnosnjaMp
X-Received: by 2002:a05:600c:1c22:: with SMTP id
 j34mr777593wms.166.1623699146575; 
 Mon, 14 Jun 2021 12:32:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUEO81A+Chst8NrrWMPaOj2qcBV4x3oMYIB3ZX4mlQLm9GzsJ4F3jwj3rnfSZvywhVWAddyg==
X-Received: by 2002:a05:600c:1c22:: with SMTP id
 j34mr777571wms.166.1623699146324; 
 Mon, 14 Jun 2021 12:32:26 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o5sm17324236wrw.65.2021.06.14.12.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 12:32:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 1/6] hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO ->
 FDC
Date: Mon, 14 Jun 2021 21:32:15 +0200
Message-Id: <20210614193220.2007159-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614193220.2007159-1-philmd@redhat.com>
References: <20210614193220.2007159-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_superio_realize() calls isa_fdc_init_drives(), which is defined
in hw/block/fdc.c, so ISA_SUPERIO needs to select the FDC symbol.

Reported-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Fixes: c0ff3795143 ("Introduce a CONFIG_ISA_SUPERIO switch for isa-superio.c")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 55e0003ce40..7216f66a54a 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -17,6 +17,7 @@ config ISA_SUPERIO
     bool
     select ISA_BUS
     select PCKBD
+    select FDC
 
 config PC87312
     bool
-- 
2.31.1


