Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F4492621
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:52:35 +0100 (CET)
Received: from localhost ([::1]:56166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nyP-0007bx-US
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:52:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEN-0006CQ-DT; Tue, 18 Jan 2022 07:05:05 -0500
Received: from [2a00:1450:4864:20::333] (port=40831
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEC-0005sa-Qp; Tue, 18 Jan 2022 07:04:49 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so5174413wmo.5; 
 Tue, 18 Jan 2022 04:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95uk+zI0cWzNzaMAxJlxn1n1i/neyy/TLYWrgzPz8RA=;
 b=gB5xEdht4+5oT+SP2IyTlibvpibdXl95XXQn7d1ckFRlCc+aUTLpjMKLK8oU4YnabO
 K34HExd/CDOtOLHo83bpYj7tg3TZQkwWiNYXrAz7SiiD9h6cqInE6tmFRnfFWEZ6nIv4
 ORlx/epSj8UI9JGYMmElJA6XXKL3C1NKmcZRVOerLMNORylKRr9paHIxq5jcdGRqKfJc
 ogDA7y399j+beDdqOwXoEBV7iMFU1BrjNxL05cZauJi8XfefJzEXQNW5Ngbw9eiWjji4
 HSPsl+NVTHyHMIqNOf/ItTAof2OoOBOY4UV/b8P8cuDgb88x+AP78bRKrVRxLyBtwsye
 TBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=95uk+zI0cWzNzaMAxJlxn1n1i/neyy/TLYWrgzPz8RA=;
 b=VU+q+l7WUn8ZKFeTQXxzezIYakHzRHAcXUydje+7xrparEw8Zn8LZI8niovUjyi4Fe
 ekhWj3vSPrru7UllD5WjndTM7ivOMdrxPfpH2k/Oitxc0vWaHyH68oOiVBDEDCcVh4Vi
 SwQwtLGNm/DbaRZzKXEqjvBdUgjVxZGac8Pk+GTiFvDicZOtcBB5os4rbrdAu7WiptYN
 sjgDD00Wy9N+lwC+mOXI6BYg6NbUoyn9WpcVNJPnlY9tsHSz5bUVzxas74pdizatfZ3i
 XlW/ZB/WqaYcJoXnL+gqcdgUbIN+PDvf3i0+MEPpYD4xni+MfXnsJeoi2kQNpH7HMqbw
 riJQ==
X-Gm-Message-State: AOAM532FWeNpp0ghChgviVYAurGY2fae8HymSHeICIWl5EaPphxVEXZV
 gXk1QlrZmj8wWxkX7Fta1IxFSzZfyyw=
X-Google-Smtp-Source: ABdhPJxfTerP8ne+Jtnw/utZvdKaqRXYVGSXVWPNAVW5AjnPsGZrxrLOuqTdmSAmM79K3mv07WRt5Q==
X-Received: by 2002:adf:cc90:: with SMTP id p16mr24829004wrj.685.1642507394540; 
 Tue, 18 Jan 2022 04:03:14 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 v5sm1919951wrx.114.2022.01.18.04.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:03:14 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 09/19] hw/nvram: Restrict fw_cfg QOM interface to sysemu and
 tools
Date: Tue, 18 Jan 2022 13:02:19 +0100
Message-Id: <20220118120229.196337-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

fw_cfg QOM interface is required by system emulation and
qemu-storage-daemon. User-mode emulation doesn't need it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220111184309.28637-3-f4bug@amsat.org>
---
 hw/nvram/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index 202a5466e63..f5ee9f6b88c 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -1,5 +1,7 @@
-# QOM interfaces must be available anytime QOM is used.
-qom_ss.add(files('fw_cfg-interface.c'))
+if have_system or have_tools
+  # QOM interfaces must be available anytime QOM is used.
+  qom_ss.add(files('fw_cfg-interface.c'))
+endif
 
 softmmu_ss.add(files('fw_cfg.c'))
 softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
-- 
2.34.1


