Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8FD68AAE0
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 16:12:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOKC0-0002PN-M3; Sat, 04 Feb 2023 10:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKBy-0002Of-9P; Sat, 04 Feb 2023 10:11:02 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKBw-0006aO-Om; Sat, 04 Feb 2023 10:11:01 -0500
Received: by mail-ej1-x62e.google.com with SMTP id hx15so22827396ejc.11;
 Sat, 04 Feb 2023 07:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XW7xO6YJKL9F4WjdLXKBwfmeW/OQ9/AIW0Vshsiq+Yw=;
 b=oKxEQj43Nb9bm/a9aS/FmKx1bBwsd/F2JsqsDgQBxIenn2ahRL79/tnlzTMffGDInm
 gs9IReEyQAMrCYnfvupBNGZt7kSY9gSycbaM2JqJGOz5tY+7XjQCV8nehYuhiNHY83oC
 aT99dS4O+alQIHGxtyZfPDMPHQ5W+TUjXgoYYe1l0TOlQ550+eJ3iLtj5OfF5QWmO7Fg
 iLFESZzAkPNGZcdmF5+HLJjb1+/99ePXnSwVEhNm5mCVb0FXPsIiw5ahep1HVpAm5CAP
 GB96WR2pflhdPoLFlaumDXnYywbdbHnfgdSZQv3Hz3xZAFT8QdFeXVfBA8rK2zUBOG5Y
 kJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XW7xO6YJKL9F4WjdLXKBwfmeW/OQ9/AIW0Vshsiq+Yw=;
 b=B7e+nYYCCmMyVRF9v6KRpWqtp3QKYrS+CJCWmUHiWOngxnaPFx3ldMdH+etn0ifd/k
 YQrBVzYvUBy1dWfJuYTz3c0B4X072JaM2is5r390WaVYDQtPpeiHcGh6Y00PFNLeu5UI
 egGhwQxuMuHaoFUe+F4OocQvCfjF69G4E5tnJhryOGmbCc3fh3kfo+WTKwAmLKEjWQE5
 eI1YWFjMEoOJL09OgvXDtYjhEILb2GgewFsd96CgMXDkcqA1Fq7tf7o4WG2sgwo+KvTU
 B+vZzjX63FNjbzEQnphURWpjmOejMYWHiUzRMz8H/UNkjhUVhgPrO4qBmjGxdVBDSvBl
 vTVg==
X-Gm-Message-State: AO0yUKVhvclvmThwM7UebSGvi/iKsrtDZ+6+Uw8uSxBEF7mAR0luMlFV
 3ognHL5MHz+ZFsIevOtVsTLqQg08gyc=
X-Google-Smtp-Source: AK7set8tDojRDYPkEmcoQ2m/eTFJtcprMY04G6gaIjyCjMAEhpkr0SNGKBGci+gr3+oylNcz9uZsuw==
X-Received: by 2002:a17:907:762e:b0:878:7650:469c with SMTP id
 jy14-20020a170907762e00b008787650469cmr14715186ejc.52.1675523459022; 
 Sat, 04 Feb 2023 07:10:59 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-183-077-083.77.183.pool.telefonica.de. [77.183.77.83])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0088a2aebb146sm2937922ejt.52.2023.02.04.07.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 07:10:58 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 3/9] hw/i386/pc_q35: Reuse machine parameter
Date: Sat,  4 Feb 2023 16:10:21 +0100
Message-Id: <20230204151027.39007-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204151027.39007-1-shentey@gmail.com>
References: <20230204151027.39007-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc_q35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 66cd718b70..dee2b38474 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -218,7 +218,7 @@ static void pc_q35_init(MachineState *machine)
     pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
                    pci_hole64_size);
 
-    object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
+    object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
                              OBJECT(ram_memory), NULL);
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
-- 
2.39.1


