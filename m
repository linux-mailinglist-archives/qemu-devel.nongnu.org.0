Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD855BEDF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:49:40 +0200 (CEST)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o652Z-00066b-Km
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633s-00080d-B3
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633q-0006sX-Qw
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WNc6s5hGnqp3J7IBUoI5eL8DC+L+SCRZwVqehYETRFc=;
 b=M8/DHHRAfbK+0rLrwM9SsushR7ZticP3oeKeK4BPJS+8sORzFvtR3skfjba6T2WDVKPdjj
 y3AvFChubgGsvMf6d1KOkBSYgqmTzvMkbWfCXXv3957Ifo0cbqWZaiUCEZ2uk0gsrPfnBn
 nYJHNFP8eRE95YwcCxwjMObbFbEX1sk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-8kBQuNccPKGH2FwlH34eiA-1; Tue, 28 Jun 2022 00:42:48 -0400
X-MC-Unique: 8kBQuNccPKGH2FwlH34eiA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h125-20020a1c2183000000b003a0374f1eb8so7225708wmh.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WNc6s5hGnqp3J7IBUoI5eL8DC+L+SCRZwVqehYETRFc=;
 b=vLD1aS1k0mD7Mo7AwwML1lv/Bg/28iTVa3qDk4FA0qUrI1AAudP2fJoZ5d+4kTtR00
 4btCCkSVbG1HBAclf1la6ZJc3OYSsuufmBf9iAxfy/RpbVlWjlVjcOSj0UXyIXh57Lvc
 SXiNs1xEjZvx34JmcLnsNzsdizXDXoUdTOI/UmWgmmuJ0o7oiqFt6bhySwVJWCUhsQdc
 BKSMJLrEKKg4+n2sE406fbToo1BtouTe9K9g/zlIhxEHoOOioZWsGhl3g4YmlFvdunMV
 DdE0iY/M5EbGCJJpY1Q60HcY7pjFRc5P1YKuJAhXQFsW81zu9vNgLiq8uqIJ+yW8FEDp
 +CRA==
X-Gm-Message-State: AJIora8roK5ILiOJzmiWOcUzVzGLREFARodyr3pZXXK2w3Y5aaVnoRdp
 3DmGmX1J1+Bh7tolzIvT8DnIOGZ6ypPL85t4hdtNrYnGbMNtb6iBA5CwvqXbnvw7yTLC3I4qh7h
 uqPlgbUM5nOS9RN4zSm4C4YtCLrGL4HXFv6h2Cw38f89c5n7OHKxvx96jHHwC
X-Received: by 2002:a5d:6a0b:0:b0:21a:3a8e:d5ae with SMTP id
 m11-20020a5d6a0b000000b0021a3a8ed5aemr16237534wru.79.1656391366547; 
 Mon, 27 Jun 2022 21:42:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sWo0GgTpTDfLhzbw6FzQCibqIBPjJbo6VPPnU515fBC+E4KUrTQDARiVO3SSnketoE51o8Nw==
X-Received: by 2002:a5d:6a0b:0:b0:21a:3a8e:d5ae with SMTP id
 m11-20020a5d6a0b000000b0021a3a8ed5aemr16237517wru.79.1656391366230; 
 Mon, 27 Jun 2022 21:42:46 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c1d0f00b003a04962ad3esm8828303wms.31.2022.06.27.21.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:42:45 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:42:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>
Subject: [PULL 06/12] docs/vhost-user: Fix mismerge
Message-ID: <20220628044201.217173-7-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Kevin Wolf <kwolf@redhat.com>

This reverts commit 76b1b64370007234279ea4cc8b09c98cbd2523de.

The commit only duplicated some text that had already been merged in
commit 31009d13cc5.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220627134500.94842-2-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/interop/vhost-user.rst | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index d7cf904f7f..3f18ab424e 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1376,14 +1376,6 @@ Front-end message types
   For further details on postcopy, see ``VHOST_USER_SET_MEM_TABLE``.
   They apply to ``VHOST_USER_ADD_MEM_REG`` accordingly.
 
-  Exactly one file descriptor from which the memory is mapped is
-  passed in the ancillary data.
-
-  In postcopy mode (see ``VHOST_USER_POSTCOPY_LISTEN``), the back-end
-  replies with the bases of the memory mapped region to the front-end.
-  For further details on postcopy, see ``VHOST_USER_SET_MEM_TABLE``.
-  They apply to ``VHOST_USER_ADD_MEM_REG`` accordingly.
-
 ``VHOST_USER_REM_MEM_REG``
   :id: 38
   :equivalent ioctl: N/A
@@ -1408,14 +1400,6 @@ Front-end message types
   accept messages with one file descriptor. If a file descriptor is
   passed, the back-end MUST close it without using it otherwise.
 
-  The memory region to be removed is identified by its guest address,
-  user address and size. The mmap offset is ignored.
-
-  No file descriptors SHOULD be passed in the ancillary data. For
-  compatibility with existing incorrect implementations, the back-end MAY
-  accept messages with one file descriptor. If a file descriptor is
-  passed, the back-end MUST close it without using it otherwise.
-
 ``VHOST_USER_SET_STATUS``
   :id: 39
   :equivalent ioctl: VHOST_VDPA_SET_STATUS
-- 
MST


