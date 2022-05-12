Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEE252588F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 01:43:05 +0200 (CEST)
Received: from localhost ([::1]:42346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npISW-0001AY-7R
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 19:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIPg-0007rt-2K
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:40:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIPc-00044d-OU
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652398803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r3Nc5n7M8tAekqGixx/+8GuV4NbjS0jzWJ/DvjApW84=;
 b=R7QjOB6xHlXcvhZovo6ZaEP5Q56Q65LXMGgHtZY3E7LV8gLcDdP8pWh9i8E6MvahY/r6ED
 0lRS2GAYzYWzaWOvgFqSAOmMI0igjXknfpLwYOigLZ0BldXTTmbr1o3u9DplIbWKygJXpo
 1FZeNFB6BTr0l8AOPHAsK0XbFK9CdXk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-TUHmquWHNr2MaY8yRgL_IQ-1; Thu, 12 May 2022 19:38:56 -0400
X-MC-Unique: TUHmquWHNr2MaY8yRgL_IQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z23-20020a05600c221700b003942fd37764so5088328wml.8
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 16:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r3Nc5n7M8tAekqGixx/+8GuV4NbjS0jzWJ/DvjApW84=;
 b=E0249BgwoXh7CkuC8aG13AjllAarzDXSG/DsamZkOc2297byh/nA/ifDnoPJ7ctdp7
 +3bDKttyZoCKZCRTar1KpPRZJfqTR/BLnKN34S3e+fCa0khth0G/b5vbkmk0DNFw9824
 2rOsBuVOUXh+S7vR+KLFXkaeQ1Nt0XocpX/inrFbFEDyE3JHZeE4LTUUJ2Yg7ntBFBKW
 zxgZpXCXZKfS+70knXHAVqADGKhbju65NoXuE24MUC/EMUHPw8SuTDZRENMME4dbo2fq
 Z6oqre85Y1QPMh/NsBI7oSnUQthHvmO9wzP0uvRqWXCpDM2VwnGJkeRzjD3sjS60VRNO
 +PBw==
X-Gm-Message-State: AOAM530WLuYUmhk3G5ZMZ+yM53KNAmbQt/Tyz1LRuzqgti64McXcHvGU
 3n7NbnlWZPvbA8vxDDMz4JfWwn9Y0KEblG1grfdQdRyQmuirsPPFOwAD4PR5k+rozj42JXYEBPK
 i5eHuHumrAoaWxsy5/yjou8eLdBPAYDLGql9juuFbESCPGKzhLs650Xeo2b+6fZqw
X-Received: by 2002:a5d:5502:0:b0:20a:e0aa:90bd with SMTP id
 b2-20020a5d5502000000b0020ae0aa90bdmr1632298wrv.551.1652398735295; 
 Thu, 12 May 2022 16:38:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFWtQpU+lwBN70xDWgcmKJYsByv+nWc1Rw99I5ycitpIfQTw+pY9lLlqwZkuVcgJC8j216Ow==
X-Received: by 2002:a5d:5502:0:b0:20a:e0aa:90bd with SMTP id
 b2-20020a5d5502000000b0020ae0aa90bdmr1632270wrv.551.1652398734810; 
 Thu, 12 May 2022 16:38:54 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 r12-20020adfa14c000000b0020c5253d8c7sm749045wrr.19.2022.05.12.16.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:38:54 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>
Subject: [PATCH 0/7] Implement bdrv_{pread, pwrite, pwrite_sync,
 pwrite_zeroes}() using generated_co_wrapper
Date: Fri, 13 May 2022 00:38:42 +0100
Message-Id: <20220512233849.2219275-1-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Start by making the interfaces of analogous non-coroutine and coroutine
functions consistent with each other, then implement the non-coroutine
ones using generated_co_wrapper.

For the bdrv_pwrite_sync() case, also add the missing
bdrv_co_pwrite_sync() function.

Alberto Faria (7):
  block: Add a 'flags' param to bdrv_{pread,pwrite,pwrite_sync}()
  block: Change bdrv_{pread,pwrite,pwrite_sync}() param order
  block: Make bdrv_{pread,pwrite}() return 0 on success
  block: Make bdrv_co_pwrite() take a const buffer
  block: Make 'bytes' param of bdrv_co_{pread,pwrite,preadv,pwritev}()
    an int64_t
  block: Implement bdrv_{pread,pwrite,pwrite_zeroes}() using
    generated_co_wrapper
  block: Add bdrv_co_pwrite_sync()

 block/blklogwrites.c             |  6 +--
 block/bochs.c                    | 10 ++---
 block/cloop.c                    | 12 +++---
 block/coroutines.h               |  4 +-
 block/crypto.c                   |  8 ++--
 block/dmg.c                      | 36 ++++++++--------
 block/io.c                       | 53 ++----------------------
 block/parallels-ext.c            |  6 +--
 block/parallels.c                | 12 +++---
 block/qcow.c                     | 41 +++++++++----------
 block/qcow2-bitmap.c             | 14 +++----
 block/qcow2-cache.c              |  9 ++--
 block/qcow2-cluster.c            | 19 +++++----
 block/qcow2-refcount.c           | 58 +++++++++++++-------------
 block/qcow2-snapshot.c           | 51 +++++++++++------------
 block/qcow2.c                    | 53 ++++++++++++------------
 block/qed.c                      | 13 ++----
 block/vdi.c                      | 14 +++----
 block/vhdx-log.c                 | 26 ++++++------
 block/vhdx.c                     | 36 ++++++++--------
 block/vmdk.c                     | 70 ++++++++++++++------------------
 block/vpc.c                      | 23 ++++++-----
 block/vvfat.c                    | 11 ++---
 include/block/block-io.h         | 22 ++++++----
 include/block/block_int-io.h     |  4 +-
 tests/unit/test-block-iothread.c | 12 +++---
 26 files changed, 292 insertions(+), 331 deletions(-)

-- 
2.35.3


