Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFE44E9A10
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:46:22 +0200 (CEST)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqdR-0002k9-E7
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:46:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYqO2-00079Z-5R
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:30:27 -0400
Received: from [2a00:1450:4864:20::629] (port=37383
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYqO0-0000ss-Ji
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:30:25 -0400
Received: by mail-ej1-x629.google.com with SMTP id bg10so29076091ejb.4;
 Mon, 28 Mar 2022 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/4YTodsodHz1thNfPxV6hRnseLXtZcAUR5m/BE97hU0=;
 b=S/a0Pso9h5r/xFPfs9c+M4R3Nrm/2CIy2BtNu7VmlQFV6xafeLc1Py5Vs0RVEp2lCl
 JljtcUhN4qtIhsxfoX+RTf7kPRubU3mK4CZRz3YSGZCFskW0OzDmNzkVfdyGDdogsacT
 J8DH6eYZ6Cmycki5pn9PhL/eXOjNVZ+bDFw65VCHFSKPz4fRo624GDtCSyoQT5HpjUqm
 MAmR4Zc9gxBNi/ufsjuUTIPG33OoXe7m9B8aGqgt3BsD45DZPzC2BMVTN6wDm8cymV/G
 m7sDZoi19Bl/rFLZLkpJ49oL5ppICfGsRmRfSULxVC7ySlEw1X8Zq9d5NpY+yvE/8ZFq
 yl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/4YTodsodHz1thNfPxV6hRnseLXtZcAUR5m/BE97hU0=;
 b=TKo8Sibe6UJkQA4s0MdKZOhb3TP+Szi9j5Fh/P4y2nedDT61NMRmzf3uA1Wx2y4FO6
 089ign23ANA08P1jsvWRpHcEN27vdUQrZc7zxU0Rmhcl22kkGFPILiMTCVn6d3KebPDM
 qovNHLayFJdyGJDt0SZRL2O+Ub/vwkbJpnfGb15uK3bo+CLt3V2TheDhZMwrc9fhHMM3
 DT42psXsCDP4S8SISQIMdmv/HV3299JNF7QiA+ECsU2vHlDYgTP+OL0D6ggb37Mj9yCE
 b59bG35gL7L5qecIsc8pVPt/TJvzqD5+kZQP56L4lIHgeqBN8lu799J1FKULGxDGmkxX
 N1bA==
X-Gm-Message-State: AOAM533ADb69UOgd+AwxaqHZzFjctf3qubtF2cIY/KsWOI60tuIY9X6/
 rls6krpze+aTDPIvbse2GaFH3gC3J0E=
X-Google-Smtp-Source: ABdhPJxxZ8cngNQVO8ZlVod1gdUb2JOSRVkUBWhZ0mAGmCRFmaqLy45B5KspCwkQiTXLmZt3JT4t5g==
X-Received: by 2002:a17:907:971e:b0:6da:8221:c82f with SMTP id
 jg30-20020a170907971e00b006da8221c82fmr22432407ejc.443.1648477822412; 
 Mon, 28 Mar 2022 07:30:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a1709062b5500b006e10152162asm1982310ejg.222.2022.03.28.07.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:30:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] virtio-ccw: remove device declarations from virtio-ccw.h
Date: Mon, 28 Mar 2022 16:30:15 +0200
Message-Id: <20220328143019.682245-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have looked recently at moving some of the vhost-user definitions
from configure options to Kconfig symbols.  This made some of the vhost
symbols target-dependent (and thus poisoned) where they used to be
defined in config-host.h.

To fix this, this series removes these symbols (and all other code that
is not needed outside individual virtio-ccw device implementations)
from the virtio-ccw.h header.  I am sending it separately because I
think it's a worthwhile cleanup on its own.

Paolo

Paolo Bonzini (4):
  s390x: follow qdev tree to detect SCSI device on a CCW bus
  virtio-ccw: move vhost_ccw_scsi to a separate file
  virtio-ccw: move device type declarations to .c files
  virtio-ccw: do not include headers for all virtio devices

 hw/s390x/ipl.c                |  23 ++++--
 hw/s390x/meson.build          |   1 +
 hw/s390x/s390-virtio-ccw.c    |   1 +
 hw/s390x/vhost-scsi-ccw.c     |  73 +++++++++++++++++
 hw/s390x/vhost-vsock-ccw.c    |   9 ++
 hw/s390x/virtio-ccw-9p.c      |   9 ++
 hw/s390x/virtio-ccw-balloon.c |   9 ++
 hw/s390x/virtio-ccw-blk.c     |   9 ++
 hw/s390x/virtio-ccw-crypto.c  |   9 ++
 hw/s390x/virtio-ccw-gpu.c     |   9 ++
 hw/s390x/virtio-ccw-input.c   |  20 +++++
 hw/s390x/virtio-ccw-net.c     |   9 ++
 hw/s390x/virtio-ccw-rng.c     |   9 ++
 hw/s390x/virtio-ccw-scsi.c    |  56 ++-----------
 hw/s390x/virtio-ccw-serial.c  |   9 ++
 hw/s390x/virtio-ccw.c         |   2 +
 hw/s390x/virtio-ccw.h         | 149 ----------------------------------
 17 files changed, 202 insertions(+), 204 deletions(-)
 create mode 100644 hw/s390x/vhost-scsi-ccw.c

-- 
2.35.1


