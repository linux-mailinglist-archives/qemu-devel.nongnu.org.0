Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1064EEB10
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 12:12:39 +0200 (CEST)
Received: from localhost ([::1]:52456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naEGg-0005pK-U3
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 06:12:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naECd-0003Zl-Si
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:08:23 -0400
Received: from [2a00:1450:4864:20::12a] (port=35438
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naECb-0006F3-PY
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:08:23 -0400
Received: by mail-lf1-x12a.google.com with SMTP id h7so4007677lfl.2
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 03:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E+LfyDYEKzj7g/k8gJ02PvkxZ1/FuZRIkS66W9fkkPY=;
 b=hhLT694XwiQD1zOoCt1VH46FWVa/0X+gtn4sRJN3IblTc6QGxROP5Sc133SFWyn+9v
 u13dvqTNFmymbMcMdaTmH7+s35Si7tkmI+169uA0NK2VHuW/gEDURwiFkxmL3g28sN2I
 yvioGpNZq66dFhHgBkn0trXbSR0C7oqlZG+yQ+IXyVaew4W81tlajdcFnK58FU3RqyNs
 0coeEmYIpLzD18d22I3SkJvpET02jieEH6spo+dwwoPhb3zbvBoJ1wUEnBiSWctqyMPw
 B9Gczil3uwaBKZExKC7Ot2rrGHdocZQx3Wx8y1KMnxXRVpTyUCJNaLJF30y4cFIIO/ci
 LW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E+LfyDYEKzj7g/k8gJ02PvkxZ1/FuZRIkS66W9fkkPY=;
 b=R0VeGq3dXN4GFABfDXt4QKPjl0UD8agVRl4MV84ejspEzfzdKnY4gKlL5QZDWijkov
 1bbilR0UHWoRhATQyYeV2lk/7cRYnPsUXUkhUd+LMC3v41C/kg8cVP7OAq054nBP4oIl
 Cz4dXEFb+Fz2Eh5R0ZNb/pVuDXIJTO4pWshFt3sbz86T5YBITIBmMMv8IpnuSNkKLe5U
 o+SoJh1WyfKGdoOEXZ8g86ZCmt0DEN5KkbO8E3Aij87MQ/F2COszmX+zWwa8/yiAsT2l
 QmriEEXf62rQn09iXTLFnsCXEO43WM5N+Nmq0QFTVpUxoz1uowvL3n4xrZIbni37bcBj
 vfsA==
X-Gm-Message-State: AOAM531z5zeXws6byeM9qTOOs0dW8+okHTKR92Q4Weom3SIWF/2/LqgA
 5XY6VVk+hlWrU2Xt2hM6N+Em3Q==
X-Google-Smtp-Source: ABdhPJypa5M29HnzxI0viFG5Q9r7XdYAB9aR3pTI1xf0SkMYTdtiiclAoSUUW2LmNHPQC8iyghIDYQ==
X-Received: by 2002:a05:6512:e8f:b0:44a:6c22:c643 with SMTP id
 bi15-20020a0565120e8f00b0044a6c22c643mr13206725lfb.631.1648807699492; 
 Fri, 01 Apr 2022 03:08:19 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 a3-20020a195f43000000b0044a997dea6bsm197508lfj.288.2022.04.01.03.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 03:08:19 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/3] block/dirty-bitmaps: fix and improve bitmap merge
Date: Fri,  1 Apr 2022 13:08:01 +0300
Message-Id: <20220401100804.315728-1-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, nikita.lapshin@virtuozzo.com,
 eblake@redhat.com, qemu-devel@nongnu.org, hreitz@redhat.com,
 vsementsov@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3: rebase on master, one patch is already merged.

Vladimir Sementsov-Ogievskiy (3):
  block: block_dirty_bitmap_merge(): fix error path
  block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
  block: simplify handling of try to merge different sized bitmaps

 include/block/block_int-io.h    |  2 +-
 include/qemu/hbitmap.h          | 15 ++-----------
 block/backup.c                  |  6 ++----
 block/dirty-bitmap.c            | 26 ++++++++++------------
 block/monitor/bitmap-qmp-cmds.c | 38 +++++++++++++++++----------------
 util/hbitmap.c                  | 25 ++++++----------------
 6 files changed, 43 insertions(+), 69 deletions(-)

-- 
2.35.1


