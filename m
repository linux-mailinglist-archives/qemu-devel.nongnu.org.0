Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB54BA4A2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:41:00 +0100 (CET)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKitu-000273-BE
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:40:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKiUT-0000AR-Tt
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:14:44 -0500
Received: from [2607:f8b0:4864:20::536] (port=39735
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKiUS-0007cx-Is
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:14:41 -0500
Received: by mail-pg1-x536.google.com with SMTP id 195so5286436pgc.6
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 07:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QjYn/nDcS9vSkBLMNCNGY4sLg2O1EWN+YW+PnfRwmZE=;
 b=G6qfXj7G21WnhiyNsyWUXjhnJnmDuxgiFVDVZROknMAesK/KyvheZ+k9oAlfNcYZvi
 /trsR+UY8v5/5W3NHcL8Tgkiq26J7Tlbug4BRn51+ArMHA9tB4I57s3yAQs/0j/39k4j
 +9nzFrVQftlTIIuyvvDrkm0Fo6J1cUEvUhfYquuHS7cEg780ez66JRPqw5mSyJAC06Lu
 EjDvW4MOdZgoXIsjNFG4yCD5OBQUuS8+h8lPRLqnjc+KaS4o0WJAZzZ1uau0ikfPMmc1
 Cw/KQwe1RQ1raqmfb26TUUGu4D599ZyaDBkdWmWDa275KVb2mPLkIn737v65ga9mBLUq
 V+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QjYn/nDcS9vSkBLMNCNGY4sLg2O1EWN+YW+PnfRwmZE=;
 b=JZ+7WLIoiPf4yjekQp7FhC0+tqEkHV4dpY7aEi+YUnP+NTOk9R1ALWEMYlQoViiPCV
 IRP2b6OoipW5p475EUxjUqX1xjvW23jaeTC+BLTrpWictMVQ3bW1EhpiZHQ+no33hUfs
 rVMaD28NpnMdp8uMgSqnj2BAUfmU/xSUTmVhY1gcDYSFTyypNpHw0mHUO94tDLX1R7Ie
 qOuUpVxxRwUeRZ1bonChpklnZfM5lzAhDjk52nNRhGwvtwe8TTBVaL3PJ5q8AJ3wtP47
 tSdrUxzhikyCsx1w4VkrXnUdSEMiUrwWpHTbTOOrPVqq7qzx03xbG9hZAk9r+c9Ehr/p
 rwAA==
X-Gm-Message-State: AOAM530IGKXZrWNwfkZRJ1d0NpSZZvv1JQ8TXmRG4rQJoRnWr+bikbib
 ruqp+zb8X87tMfrAgaeTGERqPZqHzGQzJQ==
X-Google-Smtp-Source: ABdhPJwJfuJsza9bOLk1az7yAjn26Odscx3WOcJ7M3kUVM2LUvyDKoP2wZCFSw/acJxZPsolG5qEHA==
X-Received: by 2002:a05:6a00:1249:b0:4e1:5aa4:9ac6 with SMTP id
 u9-20020a056a00124900b004e15aa49ac6mr3334326pfi.72.1645110879093; 
 Thu, 17 Feb 2022 07:14:39 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.253])
 by smtp.googlemail.com with ESMTPSA id z9sm8456884pgz.32.2022.02.17.07.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 07:14:38 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v4 3/3] hw/smbios: add assertion to ensure handles of tables
 19 and 32 do not collide
Date: Thu, 17 Feb 2022 20:44:10 +0530
Message-Id: <20220217151410.300210-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217151410.300210-1-ani@anisinha.ca>
References: <20220217151410.300210-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x536.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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

Since change dcf359832eec02 ("hw/smbios: fix table memory corruption with large memory vms")
we reserve additional space between handle numbers of tables 17 and 19 for
large VMs. This may cause table 19 to collide with table 32 in their handle
numbers for those large VMs. This change adds an assertion to ensure numbers
do not collide. If they do, qemu crashes with useful debug information for
taking additional steps.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/smbios/smbios.c | 6 ++++++
 1 file changed, 6 insertions(+)

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


