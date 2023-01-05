Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4989F65E835
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:50:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMNA-0004PR-Rz; Thu, 05 Jan 2023 04:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMN8-0004Mg-J8
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:17:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMN7-0007ij-0O
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WNSb3P3e/gJyxANZkmJtP90PraSrI8QixAcWG1RrDLA=;
 b=Lya7yycCLgAoO1pBVlq3e1/6N9sOr4vNt3FvdDz3BFS3BPpZ1NfyKyfAlsArdrmFFIgvar
 ry404xGy6qDbYjDzUfLIQTlupyiwUre5/nucDWhsXIjTnidtNHjMfnxfPSJ9T7/Yonv816
 RADwxg5/8QOTyGVJ8UoMS7BXrcuiF5g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-kwyNeGKJNNu-waM-llF4fA-1; Thu, 05 Jan 2023 04:17:11 -0500
X-MC-Unique: kwyNeGKJNNu-waM-llF4fA-1
Received: by mail-wr1-f70.google.com with SMTP id
 n13-20020adfc60d000000b0029bdfcf52eeso1712812wrg.8
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WNSb3P3e/gJyxANZkmJtP90PraSrI8QixAcWG1RrDLA=;
 b=VUhvVsLmTHsjIaPJ340BxQ5vIfdKPmPHinhTSVdKue2XW10y6iDt74S5E5F2lTsut8
 RLPKiDya9L4cATiVtD1B5tw0CNKQ1bra+M1pyCiOb3XTIVZFcbduPN/EAbhuHF0tNYZJ
 quzNmq59JfYYpU7NEk5fumvlYFGkRPgzzSX/IBxhACSIQtticGMJkr4mrhBuWQ1HpNZv
 XshXn4tfHSF64zbHwlQ/8OsF1WqCwmt5fH/0SopVUuakgoirmHLz6kPpHxySAgLJu41P
 PJw6c/1zSC6NgL0WvtNsAbPANOevfsMapzm5yrp4cQ/sebt6zSTOPgU75tGM4fXgjQTr
 dc3g==
X-Gm-Message-State: AFqh2krwjduSCnTMTF9gCRtTOpWeJQ3aAWml2Alk5izjHYlY3pEVzsaZ
 zBWJx3/uuasC7q8MLbtzWukW7MlFs05KmUfajGLUiIjkPuiFOkFCTG4xfS2QVRwTu1+70Y0eeNe
 UG8rd069DnmnTj5BuS3y6bnySmT3usGnpL8ss2Zeaq64nAme45ACwsmNCcAyJ
X-Received: by 2002:a05:600c:5399:b0:3d9:c6f5:c63d with SMTP id
 hg25-20020a05600c539900b003d9c6f5c63dmr4577575wmb.28.1672910229821; 
 Thu, 05 Jan 2023 01:17:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt+dasS3Egp1HZ7sh+iOLsEsJrCjLfZbTS6RftP8tpDejBQxeVIJUrMcqh6gE6/Fzi79uTGXQ==
X-Received: by 2002:a05:600c:5399:b0:3d9:c6f5:c63d with SMTP id
 hg25-20020a05600c539900b003d9c6f5c63dmr4577558wmb.28.1672910229583; 
 Thu, 05 Jan 2023 01:17:09 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b003c5571c27a1sm2166327wmo.32.2023.01.05.01.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:17:09 -0800 (PST)
Date: Thu, 5 Jan 2023 04:17:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dongli Zhang <dongli.zhang@oracle.com>,
 Joe Jin <joe.jin@oracle.com>, Li Feng <fengli@smartx.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PULL 51/51] vhost-scsi: fix memleak of vsc->inflight
Message-ID: <20230105091310.263867-52-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Dongli Zhang <dongli.zhang@oracle.com>

This is below memleak detected when to quit the qemu-system-x86_64 (with
vhost-scsi-pci).

(qemu) quit

=================================================================
==15568==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 40 byte(s) in 1 object(s) allocated from:
    #0 0x7f00aec57917 in __interceptor_calloc (/lib64/libasan.so.6+0xb4917)
    #1 0x7f00ada0d7b5 in g_malloc0 (/lib64/libglib-2.0.so.0+0x517b5)
    #2 0x5648ffd38bac in vhost_scsi_start ../hw/scsi/vhost-scsi.c:92
    #3 0x5648ffd38d52 in vhost_scsi_set_status ../hw/scsi/vhost-scsi.c:131
    #4 0x5648ffda340e in virtio_set_status ../hw/virtio/virtio.c:2036
    #5 0x5648ff8de281 in virtio_ioport_write ../hw/virtio/virtio-pci.c:431
    #6 0x5648ff8deb29 in virtio_pci_config_write ../hw/virtio/virtio-pci.c:576
    #7 0x5648ffe5c0c2 in memory_region_write_accessor ../softmmu/memory.c:493
    #8 0x5648ffe5c424 in access_with_adjusted_size ../softmmu/memory.c:555
    #9 0x5648ffe6428f in memory_region_dispatch_write ../softmmu/memory.c:1515
    #10 0x5648ffe8613d in flatview_write_continue ../softmmu/physmem.c:2825
    #11 0x5648ffe86490 in flatview_write ../softmmu/physmem.c:2867
    #12 0x5648ffe86d9f in address_space_write ../softmmu/physmem.c:2963
    #13 0x5648ffe86e57 in address_space_rw ../softmmu/physmem.c:2973
    #14 0x5648fffbfb3d in kvm_handle_io ../accel/kvm/kvm-all.c:2639
    #15 0x5648fffc0e0d in kvm_cpu_exec ../accel/kvm/kvm-all.c:2890
    #16 0x5648fffc90a7 in kvm_vcpu_thread_fn ../accel/kvm/kvm-accel-ops.c:51
    #17 0x56490042400a in qemu_thread_start ../util/qemu-thread-posix.c:505
    #18 0x7f00ac3b6ea4 in start_thread (/lib64/libpthread.so.0+0x7ea4)

Free the vsc->inflight at the 'stop' path.

Fixes: b82526c7ee ("vhost-scsi: support inflight io track")
Cc: Joe Jin <joe.jin@oracle.com>
Cc: Li Feng <fengli@smartx.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Message-Id: <20230104160433.21353-1-dongli.zhang@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/scsi/vhost-scsi-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/vhost-scsi-common.c b/hw/scsi/vhost-scsi-common.c
index 18ea5dcfa1..a06f01af26 100644
--- a/hw/scsi/vhost-scsi-common.c
+++ b/hw/scsi/vhost-scsi-common.c
@@ -113,6 +113,7 @@ void vhost_scsi_common_stop(VHostSCSICommon *vsc)
 
     if (vsc->inflight) {
         vhost_dev_free_inflight(vsc->inflight);
+        g_free(vsc->inflight);
         vsc->inflight = NULL;
     }
 
-- 
MST


