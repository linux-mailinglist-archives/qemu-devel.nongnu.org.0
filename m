Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5F54621A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:18 +0200 (CEST)
Received: from localhost ([::1]:40048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzax9-0002oQ-Tf
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZY6-00021N-0N
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZY4-0006Pq-Ez
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mpocKeoZpGwYugYQgzI+xoZKK3fD0b3UGmcMDjl31wg=;
 b=H7hKzQxIWBaMj1yrAk0XsnntlwJt4lEZUBpiBmJLJV9ziQjHBva4Vw45Oed8HN8XFUtp6m
 Ij9ASWiYBBTBp92LQxQbTHnJcSxcfgmlisx/SrT/8CqMEeBUqQCN75ACZNQ2fZ3yQHl01x
 jgbsKK1XUNHamLDqFMaurtUELwu/pcM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-4azzMMmAPomXGs5RkVY8Hw-1; Fri, 10 Jun 2022 03:59:14 -0400
X-MC-Unique: 4azzMMmAPomXGs5RkVY8Hw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m22-20020a7bcb96000000b0039c4f6ade4dso4686520wmi.8
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mpocKeoZpGwYugYQgzI+xoZKK3fD0b3UGmcMDjl31wg=;
 b=wqufkfvhAx9FvaRUdnBd8/YLFT7LBkKMzIRPNA1tCP+NEkWsfBVXJykOAwkDryMb6l
 6hy9GINR7udFehdhqrfmC/w2gJhAekDocT1eAd6rTwVtlErCrv1u7xW3TBPAPSCRIkZd
 Y98hC/SW8cVhmIsNZfASwPUOvr6nMdT5y0YEE43pCYGDBLu2cRRYvxkW4mbdjRPgQxyK
 r9xekiEEIBYuWFqePYJdqMtu3JOttfj7ZhsbJtP1GSbMsTdnBSAkrANGoCk9WOB07SkK
 1qxj3fcwNyQbYuRFW+6gR9t90fXqxElJuYQGseICEl6irdRuSEVmY10I9Q08A70kiqGX
 9Ahw==
X-Gm-Message-State: AOAM532BemnzA2aLzW89wabuEQpWIVITlgnj70QG9y8Kq7eNp94qIder
 OjWULevIrtoCHx/vcF9VuCi4I9StiGZqmgmO7kIssKSx5B6yRXdh7Z/fVLwqBfSv+qmUPCV9Md5
 WNKSpCs1r4v7GMpg4VSCePCyN+QLyiN/6YyedX4gqO1PahO4qc01duZiR+PDp
X-Received: by 2002:a7b:c4d4:0:b0:39c:5bb7:2210 with SMTP id
 g20-20020a7bc4d4000000b0039c5bb72210mr7371455wmk.99.1654847953125; 
 Fri, 10 Jun 2022 00:59:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuIp3f8pJLKdl9zlo0UNlNJmNTWPIPgwghuh9OX9FBzinVMywquZmPAOUNQ74ROjA6umb7Ag==
X-Received: by 2002:a7b:c4d4:0:b0:39c:5bb7:2210 with SMTP id
 g20-20020a7bc4d4000000b0039c5bb72210mr7371427wmk.99.1654847952851; 
 Fri, 10 Jun 2022 00:59:12 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 w16-20020adff9d0000000b002103de97455sm26203392wrr.69.2022.06.10.00.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:12 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben@bwidawsk.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 43/54] hw/machine: Drop cxl_supported flag as no longer useful
Message-ID: <20220610075631.367501-44-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

As all the CXL elements have moved to boards that support
CXL, there is no need to maintain a top level flag.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
Message-Id: <20220608145440.26106-9-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/boards.h | 1 -
 hw/i386/pc.c        | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 031f5f884d..d94edcef28 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -269,7 +269,6 @@ struct MachineClass {
     bool ignore_boot_device_suffixes;
     bool smbus_no_migration_support;
     bool nvdimm_supported;
-    bool cxl_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
     SMPCompatProps smp_props;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a0c0d69698..1b6067ff22 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1804,7 +1804,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
     mc->smp_props.dies_supported = true;
-    mc->cxl_supported = true;
     mc->default_ram_id = "pc.ram";
 
     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
-- 
MST


