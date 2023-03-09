Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CB76B1EE3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:52:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBzP-0007lB-Bg; Thu, 09 Mar 2023 03:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBzH-0007k2-Nr
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBzF-00020z-7T
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7zy/U/lHnc9kj0GF9dkyUFvTzv601wVYI4mVkgWvBnQ=;
 b=jKqzFVXIF3lRl6PitoudlWZCrKeES6LcrND2qmnjOaVPvtpY74NbTa8Jrexv1WeiUOUPgs
 zbqxznUuPQ0rIxrv7s7+FZYxKtUCZzArik3kOQHI/t5P9CphJ/EQUl//2yqyaXq0hbs3Fq
 2EIvv90J0KtOwGVErlpgVY2y+7Pf8V8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-IXagclYDM4SAXXa_CufU0w-1; Thu, 09 Mar 2023 03:50:54 -0500
X-MC-Unique: IXagclYDM4SAXXa_CufU0w-1
Received: by mail-ed1-f72.google.com with SMTP id
 i22-20020a05640242d600b004f5962985f4so1465727edc.12
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7zy/U/lHnc9kj0GF9dkyUFvTzv601wVYI4mVkgWvBnQ=;
 b=0Cp2ZiU+XYfCx2L3p8l11N/uPnxJV3kK+Cz8P4ZodlviQlMRzCyXae5L+RTLcAX3ZH
 X4XY/qDpxBn+F95Bc3iMygBAijtF+E9n9vSqi+ooH+9DJ/lneq74WbB+4AkIClXeVP/t
 cLTTbNgpy2IkLUAB4TtXORr90HV8Ns1PJQvfZj0Ynlullf4knzlvW4TtNesDEozv61hx
 Vz15uyuUPg0c/9odJq0M5ALy+OcyAfrJ5BWkTVk4wT71YUdAiohsti5Dbt/d/OBq1Uu7
 VNI+Q34Qz81daDXLKO2D0YBvXVEDn2ejF5Yt47aNTBBl7rMQ1p4L2VUnqOHC6Qaqu4FZ
 3Q2Q==
X-Gm-Message-State: AO0yUKX2246+FWUZgjuoX8v7U4nyLBp2qiQcRtk4cfC8ZQZUOVZrPwFl
 nrEXT3CoVOwn+IwssIXhElxObKTFsRcyLEu+zPYHPemiRhNRfUK4emYRaQrhDwX5A75y953j5nJ
 nUGPsCA6QtFwwkv+EYG3FXdMV0byROXAvOMckIbehBegLoycV6855gLra4f84tBgbWI0VZfI66B
 Y=
X-Received: by 2002:a17:906:1713:b0:8b1:806b:7dbb with SMTP id
 c19-20020a170906171300b008b1806b7dbbmr20479967eje.51.1678351853033; 
 Thu, 09 Mar 2023 00:50:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9lam47b8uIbrU1SF3VjF7PftH7dckPxMyhBCzmVJOQ9lFoZkojKgKPWmcZQvEErAyXDtqZPQ==
X-Received: by 2002:a17:906:1713:b0:8b1:806b:7dbb with SMTP id
 c19-20020a170906171300b008b1806b7dbbmr20479951eje.51.1678351852528; 
 Thu, 09 Mar 2023 00:50:52 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a170906519a00b008e53874f8d8sm8548857ejk.180.2023.03.09.00.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:50:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 0/3] block: remove separate bdrv_file_open callback
Date: Thu,  9 Mar 2023 09:50:48 +0100
Message-Id: <20230309085051.308664-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The value of the bdrv_file_open is sometimes checked to distinguish
protocol and format drivers, but apart from that there is no difference
between bdrv_file_open and bdrv_open.

However, they can all be distinguished by the non-NULL .protocol_name
member.  Change the checks to use .protocol_name instead of .bdrv_file_open,
and unify the two callbacks.

Paolo

Paolo Bonzini (3):
  block: make assertion more generic
  block: do not check bdrv_file_open
  block: remove separate bdrv_file_open callback

 block.c                          | 17 +++++++----------
 block/blkdebug.c                 |  2 +-
 block/blkio.c                    |  2 +-
 block/blkverify.c                |  2 +-
 block/curl.c                     |  8 ++++----
 block/file-posix.c               |  8 ++++----
 block/file-win32.c               |  4 ++--
 block/gluster.c                  |  8 ++++----
 block/iscsi.c                    |  4 ++--
 block/nbd.c                      |  6 +++---
 block/nfs.c                      |  2 +-
 block/null.c                     |  4 ++--
 block/nvme.c                     |  2 +-
 block/rbd.c                      |  3 ++-
 block/ssh.c                      |  2 +-
 block/vvfat.c                    |  2 +-
 include/block/block_int-common.h |  3 ---
 17 files changed, 37 insertions(+), 42 deletions(-)

-- 
2.39.2


