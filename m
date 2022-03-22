Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BCD4E463B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 19:46:58 +0100 (CET)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWjWz-0000R2-Dr
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 14:46:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWjPU-0002MQ-VE; Tue, 22 Mar 2022 14:39:12 -0400
Received: from [2607:f8b0:4864:20::32b] (port=33635
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWjPS-0006ZM-2D; Tue, 22 Mar 2022 14:39:12 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso13154667otj.0; 
 Tue, 22 Mar 2022 11:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8CSv1Qgy8xij9QmNsuXCELidpAc18RpLWBydelFO4U=;
 b=Oh7AecXi7QQR8o1V9DJX1gT26WkphsZlUO9egrKXsOBUOGObyhzJRu58jQaQON1Vui
 JZXcFpCDQqmKvzDsEEr4Cs3fg2GN/ES00n7dBgsWgR4arjqdVbk3WoMW4Dz9ZIIRjOYr
 D1zoOcKqbqIPxolNEc7ukSkzRmkTu9KCnfsI7dhYqDK1vQqCpqhEBUN1LAv4I2gkvBrm
 yZusw4UA4VajNlFpiSU7Uisdw1ARzAlX94MR8KLfTpO2fdN887S6rCQiPJNKmkkwxsbk
 jVcZkhEi98HFNswnRmjhJjqboT5zW/RDeHgygrKgXSguk7F0tGqtBtbQ4tLZQQiAHNWZ
 dAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8CSv1Qgy8xij9QmNsuXCELidpAc18RpLWBydelFO4U=;
 b=OMTPAamFRfu0yI5k3leZaO+OivX3svopOuvHn1I/ARxuNU4CXuarz7KxtQcw4SZe3G
 q8F7gNTnNl2g70s23ANvQAg549vsovyfIZTxll3JBDQQgvOzdiUhyxt3A0Eie/aEOGsD
 l+YwOHnE15aTH1e0enoYK4MlMjjVgQuzAZ8qUIZmya6viJJhNik9LWVULRdPjVCO5MlB
 hoc456nfSZz4lN3kOygA/KdH0vE6J4Z4xRBGo6q1mYjcE9TzHJZpeiTikShoaBleTev3
 vPr0DJPuB0ZxHa/kY98HicPHmWvuRhzBs//Ajo/F3yCSKhZ1ifqZw6o+yhFzuEiipmat
 R+NA==
X-Gm-Message-State: AOAM530zVaUH/qJzhRurXFFlTXNWGBUvPXCXWrXjOq0yWV6wGsnmPUVR
 9fuB6Zyny2Yo2mVc8EFFoGoD19orttI=
X-Google-Smtp-Source: ABdhPJxTYsCtlVBGra4W7IRM8VnrDy+9qIZQnc8H5NDkejlhQoB+g9Z0Nkw/gAzgLKnjyhxQ5G7lxg==
X-Received: by 2002:a9d:6b02:0:b0:5b2:6a98:75fa with SMTP id
 g2-20020a9d6b02000000b005b26a9875famr10377564otp.146.1647974344369; 
 Tue, 22 Mar 2022 11:39:04 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d0469000000b005c959dd643csm9109627otc.3.2022.03.22.11.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 11:39:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 0/4] use dc->vmsd with spapr devices vmstate
Date: Tue, 22 Mar 2022 15:38:50 -0300
Message-Id: <20220322183854.196063-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This short series converts some spapr devices to use the dc->vmsd
interface to register the vmstate. For most of them it was needed
to use qdev_set_legacy_instance_id() to keep compatibility with the
instance_id being used for awhile.

Although no functional changes were made the resulting code is a bit
shorter and maintainable. After these patches there are only 3 places
where vmstate_register() APIs are being used.

No behavior changes were detected when testing migration scenarios with
hotplug/unplug of devices.

Daniel Henrique Barboza (4):
  hw/ppc: use qdev to register logical DRC vmstates
  hw/ppc: use qdev to register physical DRC vmstates
  hw/ppc: use qdev to register spapr_iommu tcet vmstate
  hw/ppc: use qdev to register spapr_nvdimm vmsd

 hw/ppc/spapr_drc.c    | 13 ++++++-------
 hw/ppc/spapr_iommu.c  |  7 +++----
 hw/ppc/spapr_nvdimm.c | 11 ++---------
 3 files changed, 11 insertions(+), 20 deletions(-)

-- 
2.35.1


