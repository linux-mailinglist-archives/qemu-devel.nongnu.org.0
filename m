Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2BB380E15
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:21:31 +0200 (CEST)
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaZ7-00021H-VH
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIc-0006H6-8b
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIZ-0005JZ-L9
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uXByC9bAMbx8cyt6YCu0wJ8hR9id0KLULy1jcFDQm94=;
 b=ivlNqsIIfkxuaoBJm9HtMTD7M6lRvk1IPTN11n8UfB6lJaq81SweoEHJXznVYrJIllL+md
 p7uSNhSlIjqwhM/AMs+fNJrdoE5EhwsT/7YPn9sq+bm06JgjMkeEdmBd9YwITq01vohj65
 jau2vvsWSnRV6FwwWj5cHHrAD7YA7sU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-RmIFU5BoMq6w9MTvLqAGYw-1; Fri, 14 May 2021 12:04:20 -0400
X-MC-Unique: RmIFU5BoMq6w9MTvLqAGYw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so1251204wmb.2
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uXByC9bAMbx8cyt6YCu0wJ8hR9id0KLULy1jcFDQm94=;
 b=NJ3X48FIDPJBookQnUxsl0Q7isxIg2hM/j3usroc6I8IIa60F1zRNWeC+oX9VGD4CX
 44zJml6+SzqapVPZuGGh443u1fm0LjT81jv+uBdhiLYs+JKOD+4GBmwQhwpfbW7IH3Qe
 I5KYCP7bhjYDYsZ9MxTboiGkiMr4DyOjpJPOdPM9VcJpKpmD9eE37TUH0NSvNM8TIDmJ
 VlygdwYZBENDpKJsfCi0XFJ94+zM0fTREHOOzFyjSd7jk2YKlFoagLudzoUlvkXbeQQn
 F+9h0oREcwDDefpmHayB3Gm7B87/6yauCgVUEb5wN98waB/JEAxRNO/KasZ1dmouGexY
 yaeg==
X-Gm-Message-State: AOAM532N8DL94ynnroqBT6xUkDQwSzE9QuQg1xklJrXyAJTwkqAAx0MO
 +nrcCJkC+VHcOYcR3y082y262QsOg36bi6xfioMNFYYEo613VxBDb4gcCoyLwW7K87cMAUWWZDf
 RLgq7yr4W6KYBJco39R9AMdkkbtxVLY8nMfGFlfGl7FdF/94cnT6YEHY9rvmk
X-Received: by 2002:a7b:c444:: with SMTP id l4mr50620948wmi.36.1621008258518; 
 Fri, 14 May 2021 09:04:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzawTqC5I8sP/nIeAkkgxWZ+RSQYDS3d0ZHYnFVYoYOf9DlEGW8tPTUD/Doy6KYXc55SB1jQ==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr50620925wmi.36.1621008258289; 
 Fri, 14 May 2021 09:04:18 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id x65sm14274008wmg.36.2021.05.14.09.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:17 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/16] virtio-blk: Constify VirtIOFeature feature_sizes[]
Message-ID: <20210514160245.91918-5-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210511104157.2880306-3-philmd@redhat.com>
---
 hw/block/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index d28979efb8..f139cd7cc9 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -40,7 +40,7 @@
  * Starting from the discard feature, we can use this array to properly
  * set the config size depending on the features enabled.
  */
-static VirtIOFeature feature_sizes[] = {
+static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
      .end = endof(struct virtio_blk_config, discard_sector_alignment)},
     {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
-- 
MST


