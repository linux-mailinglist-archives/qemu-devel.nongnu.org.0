Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1B4B5423
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:04:34 +0100 (CET)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcu1-0008L7-19
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:04:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJc6i-0003O0-6Y
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:13:38 -0500
Received: from [2607:f8b0:4864:20::433] (port=45887
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJc6g-0005IV-Px
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:13:35 -0500
Received: by mail-pf1-x433.google.com with SMTP id p10so8784644pfo.12
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 06:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+khw6U6y+8T0a5P4YmrSF4T8TdATIQD/T3tJuNMPB/Q=;
 b=wJyqgUHPK38DzRyOQzc932BTccRSdo0igozOpcjCxaLPEgydZHp8NZTigU2TNAPnRS
 7oysWee3AbTX/sZtkgIWIlqoDScLaVMsA25X7y3Al7pvVW1GAXjm0dcc4mvyE7FfSVJk
 4+PelnJXvTyeILyxpgSvqqog80QwOnas34/4y3G9q4LT52Sgn+1OQf/i8RUv8wuTtI/e
 49zlRITDQj8oDEq3HO4tLhtVmHZhWbJpGiqAvRyxnmjleKElxC6ABCoz97JMvwifweLv
 7hQeIntftF9I1XVuM9MhDr+LGOtIKQYI44A9CVEi7FaSE0WtoX/SiLYMMhSbBULEuV4p
 LitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+khw6U6y+8T0a5P4YmrSF4T8TdATIQD/T3tJuNMPB/Q=;
 b=s1EDNL7oUTnethLU6yVQvWwVDsKhVsfovAGFEn2EghjgE3OsawdmEAvnwRylSpEqIW
 YihdWd972ghK6G7poQUtxJinmtxQsqYF89lvCnyqqbfkOLfRgKQ+eERjP8qj7zspFe1B
 XoJhfS2VapSCNRc5dZv/FeX2qLUq1ZA0fAqlBhfhq1zoNFisxkDst76jHr/A9ppSpuXL
 GvU808x9T/stvh9wVfDgmYGakjuh41bYENGUCrOIqw7+Dbu413u4qzNBoprEK65Tp+BP
 1IS7Ml9IEzes7IrSoGqCzEiHLTZHlyPxS86E6dMYc2NaREl7tYgJVF8XZ4Axmc6xckFS
 +ZZQ==
X-Gm-Message-State: AOAM5324Rk7HF5wcxcox2y7ta8pFLKnV/EgoXX9P+8hUv/nyNuBqozWe
 +csRyBarHonaTePDTtjFg3qhQrsC+eoDCw==
X-Google-Smtp-Source: ABdhPJxyESkUxvhTi1Z3qc6MhXGJKj0urMaSU/AjPORDPc4iMepGtczdFDdFAeX8Dzon7e/z5exXoA==
X-Received: by 2002:a63:5226:: with SMTP id g38mr12047023pgb.620.1644848013026; 
 Mon, 14 Feb 2022 06:13:33 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.127.101])
 by smtp.googlemail.com with ESMTPSA id hk3sm9808340pjb.12.2022.02.14.06.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 06:13:32 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v3 3/3] hw/smbios: add assertion to ensure handles of tables
 19 and 32 do not collide
Date: Mon, 14 Feb 2022 19:42:36 +0530
Message-Id: <20220214141237.47946-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214141237.47946-1-ani@anisinha.ca>
References: <20220214141237.47946-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x433.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Since change b3cddba9c14b034 ("hw/smbios: fix table memory corruption with large memory vms")
we reserve additional space between handle numbers of tables 17 and 19 for
large VMs. This may cause table 19 to collide with table 32 in their handle
numbers for those large VMs. This change adds an assertion to ensure numbers
do not collide. If they do, qemu crashes with useful debug information for
taking additional steps.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/smbios/smbios.c | 6 ++++++
 1 file changed, 6 insertions(+)

changelog:
v3: reworded the commit log and comment in code.

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 44c53797a4..1f8d5c252f 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1048,6 +1048,12 @@ void smbios_get_tables(MachineState *ms,
                                        mem_array[i].length);
         }
 
+        /*
+         * make sure 16 bit handle numbers in the headers of tables 19
+         * and 32 do not overlap.
+         */
+        assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
+
         smbios_build_type_32_table();
         smbios_build_type_38_table();
         smbios_build_type_41_table(errp);
-- 
2.25.1


