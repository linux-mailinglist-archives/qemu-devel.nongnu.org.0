Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A27A380E1A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:24:59 +0200 (CEST)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhacU-0006Ir-1s
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaJl-0008SN-FX
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaJg-000690-AX
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QE3OXd/163Md4cs5sroBFpscN+9OwcbZr5PSUP17kkg=;
 b=Zrdnsg7SYIpg8SZ/1dOQDV2f/3uTyM8wvzYbbFfAe9voBpzDEsX0XT3WmyuEuGkrlfZ8R5
 dZWPwDxucJBBtnwQ/dx+5QCHFEtwjlLiolMAxl+oHIdOO2KU7tlYqL3sE+tc1bfUpv9um2
 XHM6mxT113Xg+u8Q6JM6b5qcggI1wXQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-uJBA44CGMwSe3q2Nhb00Vw-1; Fri, 14 May 2021 12:04:26 -0400
X-MC-Unique: uJBA44CGMwSe3q2Nhb00Vw-1
Received: by mail-wr1-f72.google.com with SMTP id
 1-20020adf93810000b029010fd5ac4ed7so3332696wrp.15
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QE3OXd/163Md4cs5sroBFpscN+9OwcbZr5PSUP17kkg=;
 b=OcRpofPdT77rqrUiOHENZGnMFISAK/bC138hfR5qztZvYT1lnnSB8o3Yz3i+fTjmhb
 IH29K/CsigYf6yPzRmVhJZePz/Dw4+lYAOz/q7zHoSzyyosaVXYSj+Ur/1LU6j7cQPTJ
 dlQ11GHgRGkzYNzpGWFa9dP6jvHVIK+G9bJmM4IEo3bdBHxldg659WwnNWk7qREhjxPJ
 wLCjZsGfiyp42N702bIJDyd13/eydPsz6ZZfPY9x0vOlNmqtVp9/cKUcWAjtMOSULP6s
 WqaoSByPvQ4Jg+dq+LcP+kD/gJ73e5pJ6y2TAFeG/aOnUzKvbpE0c1Lhf9mcDUhauy87
 1L5g==
X-Gm-Message-State: AOAM531ZNg1iX/5lHH5EZTthB0X8UUg6QVhHxGVaUP3tco2ZfXVvDmkH
 +3cp9Lxc/TJwIeqvHL2CTBs2I+blF9u3PtvNbJ3/u4W8Do9qr/lVN2Qh4G6+1K/CXleJp4bIuI/
 cOC7XBrYEDZvVd9XhLcU8V5jSNfAcjPpci5nG5/NxmGFGjrFGYjtcJqlbD6Nm
X-Received: by 2002:a1c:7711:: with SMTP id t17mr51255378wmi.6.1621008264142; 
 Fri, 14 May 2021 09:04:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwtHuh8GUoUeGwBOPkBl6rKzl9Sl+jsNzANAjbLePxHyYuPj//nm0xsan4WsubkNnNf4Bbzw==
X-Received: by 2002:a1c:7711:: with SMTP id t17mr51255344wmi.6.1621008263870; 
 Fri, 14 May 2021 09:04:23 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id c15sm6567357wrr.3.2021.05.14.09.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:23 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/16] amd_iommu: fix wrong MMIO operations
Message-ID: <20210514160245.91918-7-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Roman Kapl <rka@sysgo.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kapl <rka@sysgo.com>

Address was swapped with value when writing MMIO registers, so the user
saw garbage in lot of cases. The interrupt status was not correctly set.

Signed-off-by: Roman Kapl <rka@sysgo.com>
Message-Id: <20210427110504.10878-1-rka@sysgo.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 43b6e9bf51..2801dff97c 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -99,7 +99,7 @@ static uint64_t amdvi_readq(AMDVIState *s, hwaddr addr)
 }
 
 /* internal write */
-static void amdvi_writeq_raw(AMDVIState *s, uint64_t val, hwaddr addr)
+static void amdvi_writeq_raw(AMDVIState *s, hwaddr addr, uint64_t val)
 {
     stq_le_p(&s->mmior[addr], val);
 }
@@ -382,7 +382,7 @@ static void amdvi_completion_wait(AMDVIState *s, uint64_t *cmd)
     }
     /* set completion interrupt */
     if (extract64(cmd[0], 1, 1)) {
-        amdvi_test_mask(s, AMDVI_MMIO_STATUS, AMDVI_MMIO_STATUS_COMP_INT);
+        amdvi_assign_orq(s, AMDVI_MMIO_STATUS, AMDVI_MMIO_STATUS_COMP_INT);
         /* generate interrupt */
         amdvi_generate_msi_interrupt(s);
     }
@@ -553,7 +553,7 @@ static void amdvi_cmdbuf_run(AMDVIState *s)
         trace_amdvi_command_exec(s->cmdbuf_head, s->cmdbuf_tail, s->cmdbuf);
         amdvi_cmdbuf_exec(s);
         s->cmdbuf_head += AMDVI_COMMAND_SIZE;
-        amdvi_writeq_raw(s, s->cmdbuf_head, AMDVI_MMIO_COMMAND_HEAD);
+        amdvi_writeq_raw(s, AMDVI_MMIO_COMMAND_HEAD, s->cmdbuf_head);
 
         /* wrap head pointer */
         if (s->cmdbuf_head >= s->cmdbuf_len * AMDVI_COMMAND_SIZE) {
-- 
MST


