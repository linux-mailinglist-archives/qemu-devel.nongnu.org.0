Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD968E261
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:57:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPV1p-0004XR-0d; Tue, 07 Feb 2023 15:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPV1j-0004Wf-Sh
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:57:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPV1h-00087y-P0
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675803436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sFyXcq7yeWNuVr/QOLxP6iee2qwd595TLKlOdaPMXhQ=;
 b=KgSYwWo6ZN9QE6twlDw3uzD6XUc/fSr8N6reyziHAUdTtMoyqmq+GjUF4Oi2EqQP3vr9eq
 Fzz3Ho9CP7pf9axIDPcBeZUATrT7gNM9AXdwA6q6/gAOxfZndLs2+Lb36MT8s5ZETLwqS0
 T/DeHnPwYIH21AychNG3o+rO0DqzMSI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-qjnuffY9MoWeRoFz7WuXzg-1; Tue, 07 Feb 2023 15:57:15 -0500
X-MC-Unique: qjnuffY9MoWeRoFz7WuXzg-1
Received: by mail-qt1-f199.google.com with SMTP id
 he22-20020a05622a601600b003ba3c280fabso1162421qtb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 12:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sFyXcq7yeWNuVr/QOLxP6iee2qwd595TLKlOdaPMXhQ=;
 b=n5JloBuKHPmennYj70JDf633tPH8KaeoVo2mbVIh8DfBp13FBM99FSPLaE/96bJEd5
 VSwgIeECZrwcU1QMJRbGXA1kZO8E2BLwXbpFjBZe74B7V/ELroowkWjDCEr3CYUVgAyV
 cuHcGBhOU/FnjLxU+9/F1wxAA1Z1ECkA3uWMFCw5rpVjhXIwOSjDSOh1XrgTtLKg4TYx
 pAkXo83riaxR8slCcAo0kRoqfbZsrAXbxJIqI6luAEYOieyW4DDIXPAu6EIu0jQ6FNp1
 ggj80hSKMGVX+jwQ6mBVXlnCCw9EXieGG4sRypi7tjpVFjKkXif0E/xbia/uNvUQE49h
 h7uQ==
X-Gm-Message-State: AO0yUKWO8xA663qdDdVPPrNhlKEA2b3ydgQ0mHEPDHdtkUq6YZmufxLa
 x03kfy+qALLlzG42dom1lMyiHwkd5pUj8b5/H+pfVXxcbYWeQrMD948RZiGV2EbuzvnAJOuusC0
 FSwkISe6flGBx08H1RDzS1/lAfBILGzGoxRCXnQq3tbmz+jHzXelqljY4LuYZO+ugPNcr7w==
X-Received: by 2002:ac8:4e8d:0:b0:3b8:5f47:aac2 with SMTP id
 13-20020ac84e8d000000b003b85f47aac2mr9606345qtp.1.1675803434033; 
 Tue, 07 Feb 2023 12:57:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+3MgC5FwY+kgTvRwA9LwTGJ5pf8iKvCTBushXk23Grq3Wi9XFqizfAquUc+lRHhe72SmDyGw==
X-Received: by 2002:ac8:4e8d:0:b0:3b8:5f47:aac2 with SMTP id
 13-20020ac84e8d000000b003b85f47aac2mr9606303qtp.1.1675803433679; 
 Tue, 07 Feb 2023 12:57:13 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a05620a0f9800b0071ba3799334sm10113731qkn.58.2023.02.07.12.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 12:57:13 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 0/2] util/userfaultfd: Support /dev/userfaultfd
Date: Tue,  7 Feb 2023 15:57:09 -0500
Message-Id: <20230207205711.1187216-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

To Juan: from what I observe on how to update the linux headers, I think it
can simply be in a pull just like a normal patch.

The most recent change and its pull for reference:

https://lore.kernel.org/all/20220915091035.3897-1-chenyi.qiang@intel.com/
https://lore.kernel.org/all/20220926170804.453855-1-thuth@redhat.com/

Changelog:

v3:
- Remove __linux__ macro check in util/userfaultfd.c [Juan]
- Avoid using globals, merge functions [Juan]

v2:
- Added R-bs for Phil
- Move open_mode into uffd_detect_open_mode() [Phil]
- Document uffd_open() in the header file [Phil]
- [Discussed with Daniel/Michal, decided to leave fd support for later]

The new /dev/userfaultfd handle is superior to the system call with a
better permission control and also works for a restricted seccomp
environment.

The new device was only introduced in v6.1 so we need a header update.

Please have a look, thanks.

Peter Xu (2):
  linux-headers: Update to v6.1
  util/userfaultfd: Support /dev/userfaultfd

 include/standard-headers/drm/drm_fourcc.h     |  34 ++++-
 include/standard-headers/linux/ethtool.h      |  63 +++++++-
 include/standard-headers/linux/fuse.h         |   6 +-
 .../linux/input-event-codes.h                 |   1 +
 include/standard-headers/linux/virtio_blk.h   |  19 +++
 linux-headers/asm-generic/hugetlb_encode.h    |  26 ++--
 linux-headers/asm-generic/mman-common.h       |   2 +
 linux-headers/asm-mips/mman.h                 |   2 +
 linux-headers/asm-riscv/kvm.h                 |   4 +
 linux-headers/linux/kvm.h                     |   1 +
 linux-headers/linux/psci.h                    |  14 ++
 linux-headers/linux/userfaultfd.h             |   4 +
 linux-headers/linux/vfio.h                    | 142 ++++++++++++++++++
 util/trace-events                             |   1 +
 util/userfaultfd.c                            |  32 ++++
 15 files changed, 331 insertions(+), 20 deletions(-)

-- 
2.37.3


