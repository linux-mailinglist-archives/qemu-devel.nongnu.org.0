Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AACA49B738
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:07:06 +0100 (CET)
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNPU-0007O3-Pm
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:07:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nCLiS-0007Iw-Rc
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:18:32 -0500
Received: from [2607:f8b0:4864:20::435] (port=40627
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nCLiN-0004vV-Sk
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:18:30 -0500
Received: by mail-pf1-x435.google.com with SMTP id w190so13570558pfw.7
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 05:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ul941hkKubV2SEiG9aWdHK6DOlACwTPp8c+cTWe/zxY=;
 b=PDfhLI4Uwxo8NbODDxssuE+b7McGT+XA2NVGgKYv2BfoUgQaLgKBrLZquaXpCmehxP
 GMxyTjZOsxLh+e0epi4NWbUl8GbFAL6NEPlDioYY0KSf98Gf94ZH7LsrCZHEwmF9t5aF
 b/Lf95mVKVytK/MYCOtMABNf5B5ox5EPtmxi5C/lSC/ecAhc+ZvBWNa79p43EPhjblLE
 3frHkDF9tLpsY+llvihbIp9XazuOnqRCACSuzcBuRiwkhyQgnP5Lrue4BRcAjzY4OlUh
 0u8Wtjh7KXl8UJNnXPTmNTRimz/OeOfBFVFi9unbpZkCjAELpxfA6Mc5EA15uj4JhLx8
 /H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ul941hkKubV2SEiG9aWdHK6DOlACwTPp8c+cTWe/zxY=;
 b=vS40WHZUIz3bcmzjF4vY4TohQsBxExaWk8Le1UECefdvnGi5woyEmVDfJDNHbz9g0H
 a3hz2Gu89MDkip7/8UhGwaPk8KqAn924EsRW07zqBioMdqkyK7wypnwK/Le5j2OSjjuy
 FOKhAwnnPqyCgXrgfPtyg8Au1MNG9xtYD7oXSbx0sOA7gzrZwXfVkbcjfJwYcJWfFODq
 DHA+NNeuMdw8tEInID8swKcBnnzoRyFLdRDqyCidBBHnQ1npKHp2bLT7j9xjU8IfuMV9
 LTYkUJ6kvWfsOmoU5CenctEngo/8e7Ljndae1/8CM2VXVtfpyq95MVj0uoPun8U8C4ch
 idig==
X-Gm-Message-State: AOAM533/kJZMKuFUyfX09ufFbqbhaWFeako5WGd0l01CJaxxEmAmhX/R
 FEFMBw9P0rKKO9kZZBzGDt3v
X-Google-Smtp-Source: ABdhPJzQUD4WeALeb4kYcgx+SnZwoj7y0JB/gbZqxZpGtOICJgiNfFyemdrmxmiduwfqmzuJQ0az2Q==
X-Received: by 2002:a05:6a00:2389:b0:4c5:a842:f54 with SMTP id
 f9-20020a056a00238900b004c5a8420f54mr18250449pfc.47.1643116705644; 
 Tue, 25 Jan 2022 05:18:25 -0800 (PST)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id gt19sm440978pjb.50.2022.01.25.05.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 05:18:25 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com
Subject: [PATCH 0/5] Support exporting BDSs via VDUSE
Date: Tue, 25 Jan 2022 21:17:55 +0800
Message-Id: <20220125131800.91-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

Last few months ago, VDUSE (vDPA Device in Userspace) [1] has
been merged into Linux kernel as a framework that make it
possible to emulate a vDPA device in userspace. This series
aimed at implementing a VDUSE block backend based on the
qemu-storage-daemon infrastructure.

To support that, we firstly introduce a VDUSE library as a
subproject (like what libvhost-user does) to help implementing
VDUSE backends in QEMU. Then a VDUSE block export is implemented
based on this library. At last, we add resize and reconnect support
to the VDUSE block export and VDUSE library.

Since we don't support vdpa-blk in QEMU currently, the VM case is
tested with my previous patchset [2].

[1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html

Please review, thanks!

Xie Yongji (5):
  headers: Add vduse.h
  libvduse: Add VDUSE (vDPA Device in Userspace) library
  vduse-blk: implements vduse-blk export
  vduse-blk: Add vduse-blk resize support
  libvduse: Add support for reconnecting

 block/export/export.c                       |    6 +
 block/export/meson.build                    |    5 +
 block/export/vduse-blk.c                    |  448 +++++++
 block/export/vduse-blk.h                    |   20 +
 include/standard-headers/linux/vduse.h      |  306 +++++
 meson.build                                 |   28 +
 meson_options.txt                           |    4 +
 qapi/block-export.json                      |   24 +-
 scripts/meson-buildoptions.sh               |    7 +
 scripts/update-linux-headers.sh             |    1 +
 subprojects/libvduse/include/atomic.h       |    1 +
 subprojects/libvduse/libvduse.c             | 1267 +++++++++++++++++++
 subprojects/libvduse/libvduse.h             |  195 +++
 subprojects/libvduse/meson.build            |   10 +
 subprojects/libvduse/standard-headers/linux |    1 +
 15 files changed, 2321 insertions(+), 2 deletions(-)
 create mode 100644 block/export/vduse-blk.c
 create mode 100644 block/export/vduse-blk.h
 create mode 100644 include/standard-headers/linux/vduse.h
 create mode 120000 subprojects/libvduse/include/atomic.h
 create mode 100644 subprojects/libvduse/libvduse.c
 create mode 100644 subprojects/libvduse/libvduse.h
 create mode 100644 subprojects/libvduse/meson.build
 create mode 120000 subprojects/libvduse/standard-headers/linux

-- 
2.20.1


