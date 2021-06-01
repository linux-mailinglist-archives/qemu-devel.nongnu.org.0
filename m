Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D059A396CE1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 07:36:28 +0200 (CEST)
Received: from localhost ([::1]:51898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnx4l-00031L-TC
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 01:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lnx3k-00029F-Vt
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:35:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lnx3j-0002Ct-GZ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622525723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ciPhEuln0EveL7CrYSSUGf88omRcmR1D8eT41mVjqbg=;
 b=eIkFni2xHCHOfbP4HfSpoV7oxMPJiCVcvJp+nOeln53dBeII1kQ57eXLomjKvLtl0gJouX
 lBMFB6e0L/RJxQ2FLlHNXKAwS0P0v6upmwwy/LYj65uDs3CY+CB27WzrdggtiaePypxgDL
 gcHaXVehOjrixiTbg5KIuJlMNQRJRu8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-SkAbP4OQNgq0EvkAfXG8Ow-1; Tue, 01 Jun 2021 01:35:07 -0400
X-MC-Unique: SkAbP4OQNgq0EvkAfXG8Ow-1
Received: by mail-wm1-f72.google.com with SMTP id
 n2-20020a05600c4f82b0290181c444b9f1so2392734wmq.6
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 22:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ciPhEuln0EveL7CrYSSUGf88omRcmR1D8eT41mVjqbg=;
 b=OLjqgYupIh1ZL5/MdVpgr43N393RyzdzsgAVG7HENLg+YZyIAUDeps2s1MpqD7hDbX
 Q2GXr1XjBV8ldsESyk/YDT5lDkcqVbkfMaqDI6BhMQFbdojk4faWIwSWIv0uZSskgSdo
 A25IBb6DhGNeT902/JwrcNF3JSdxIyOcLQx5LxN9OZmzrkqeOvoNLo4K/PQGPcjxtaLw
 G8SCxGC1OvDkKW+lOmTQpgTvWkh+MaroTnqRB48MkWQniXSWu6HwRVDVbZmXrxAHmvcY
 tZn17jpUhUmASDtZi1CaMFI/qs+i+MyVkiFA5bi1f+3EsCbdXnHp3Kmi0vJxb/9L4U2w
 lZzg==
X-Gm-Message-State: AOAM530dHlC8Ei5DRytdDipjNIKBQMR8KtR+PqC/vJLQXMbhQ+KJwrEV
 /BqzGjx0GLla6si7gt8hlJ9OH5cc+GIctl3MDUw4Uz5VPvGqlOGmFQjp/zEh2PAZzgirQyhrOSf
 ZxrhTOh7AnF3ETEc=
X-Received: by 2002:adf:e307:: with SMTP id b7mr26236082wrj.325.1622525705960; 
 Mon, 31 May 2021 22:35:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGF+HvS1B9yBDiIH8jVLvpeIHKfOvlvbiKkldjTZ+Dj0OQIZntSc+753QqmD0/nvMRQhtifw==
X-Received: by 2002:adf:e307:: with SMTP id b7mr26236050wrj.325.1622525705791; 
 Mon, 31 May 2021 22:35:05 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id s8sm2198455wrr.36.2021.05.31.22.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 22:35:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH v3] docs/secure-coding-practices: Describe how to use
 'null-co' block driver
Date: Tue,  1 Jun 2021 07:35:03 +0200
Message-Id: <20210601053503.1828319-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Prasad J Pandit <ppandit@redhat.com>,
 Bandan Das <bsd@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document that security reports must use 'null-co,read-zeroes=on'
because otherwise the memory is left uninitialized (which is an
on-purpose performance feature).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Simplified using Vladimir suggestion.
---
 docs/devel/secure-coding-practices.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/devel/secure-coding-practices.rst b/docs/devel/secure-coding-practices.rst
index cbfc8af67e6..79a3dcd09a3 100644
--- a/docs/devel/secure-coding-practices.rst
+++ b/docs/devel/secure-coding-practices.rst
@@ -104,3 +104,12 @@ structures and only process the local copy.  This prevents
 time-of-check-to-time-of-use (TOCTOU) race conditions that could cause QEMU to
 crash when a vCPU thread modifies guest RAM while device emulation is
 processing it.
+
+Use of null-co block drivers
+----------------------------
+
+The ``null-co`` block driver is designed for performance: its read accesses are
+not initialized by default. In case it this driver has to be used for security
+research, it must be used with the ``read-zeroes=on`` option which fills read
+buffers with zeroes. Security issues reported with the default
+(``read-zeroes=off``) will be discarded.
-- 
2.26.3


