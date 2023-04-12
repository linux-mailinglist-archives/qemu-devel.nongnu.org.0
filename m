Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D696DFB64
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 18:31:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmdLr-000477-CL; Wed, 12 Apr 2023 12:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmdLk-00044d-VI
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 12:29:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmdLi-0005aJ-F3
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 12:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681316972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sqiarqHAxLhO5fDv73z0DIYh1RlUXSI6d6Lx/ngaTSY=;
 b=P4f7jVeiMKbM3Ww6zUng6DbxGID5tTMe25GrFmVmi7B1gyovRCIxZON44LhExxjMmifUoy
 uiPI7kAhsSDE0hsCJFhgJOH6itqGiGbMqa4heHIunNK7a6oDC+vaYh7rhQkyvENRQzpWCK
 jLS9NSHQDHwRv5h40+SbI+88/UGU6L4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-KgXqFCtJP4qmdPoXf8ZNqA-1; Wed, 12 Apr 2023 12:29:30 -0400
X-MC-Unique: KgXqFCtJP4qmdPoXf8ZNqA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g6-20020a05600c310600b003ee69edec16so7196247wmo.5
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 09:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681316969; x=1683908969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sqiarqHAxLhO5fDv73z0DIYh1RlUXSI6d6Lx/ngaTSY=;
 b=RcGUvxJKjg1wWgj8EUqgvusEPdL22iwx9q8q2BxKk6KyK/pBqN8Xj0pNqS4aIciq5c
 A8n0NHjxvb5DKlxDYACZ4AmaTEQJgdrim60VSNrm+ct3oc/kft9Vh5u1McGnRnARIf+C
 tHVT5qv+mqOUY72fVoYRD/2IctDH8CwKwb9NbJQPHzDXNEMUL2MKh365wDNMOVP/YvFq
 io0NgHFeuZueGX1QvpaQjtEbqPxRLievhCfrpPRPDD+uW2iz9OpmsTxD0iPoVXuRVv+f
 DeIWnIbm/8uZ99Cfe6HkSa8fFr9XJjib7c05FPmqTRXKHwu8mleHYr8lmPXa3j3xs5GF
 n6Ew==
X-Gm-Message-State: AAQBX9co5VOq74na0UjyKXJXvc/FwrSbxN0jTFJ3byWyEh+0aLYoy/dX
 wVqifCKcbOByDQ95ugeUHtvSYiVl04d0HkSHgxnqonfcB3f8sf9U7lGASCGDhN51JNJBUtZdS23
 LhHwmHVRwRkcYmx1FIzy1QbVVWGcuRcCeDLtkPybB2D5d5VrgEtw+n/JPCHbcZNSORNPfUWFxhf
 Y=
X-Received: by 2002:a1c:770c:0:b0:3ee:3df6:e411 with SMTP id
 t12-20020a1c770c000000b003ee3df6e411mr12274863wmi.28.1681316969138; 
 Wed, 12 Apr 2023 09:29:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQI3hqh8Z4xncUeILNrUsC2xFp/tSIHVN5eXDRVdozZY8a7NHDTnbb96A/zN6pLY/uSIRRkA==
X-Received: by 2002:a1c:770c:0:b0:3ee:3df6:e411 with SMTP id
 t12-20020a1c770c000000b003ee3df6e411mr12274849wmi.28.1681316968774; 
 Wed, 12 Apr 2023 09:29:28 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c1c8700b003ee1acdaf95sm3033859wms.36.2023.04.12.09.29.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 09:29:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-8.0 0/1] NFS changes for 2023-04-12
Date: Wed, 12 Apr 2023 18:29:26 +0200
Message-Id: <20230412162927.112101-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

The following changes since commit abb02ce0e76a8e00026699a863ab2d11d88f56d4:

  Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2023-04-11 16:19:06 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 3fe64abcde55cf6f4ea5883106301baad219a7cc:

  block/nfs: do not poll within a coroutine (2023-04-12 18:26:51 +0200)

----------------------------------------------------------------
Fix NFS driver issue.

----------------------------------------------------------------
Paolo Bonzini (1):
      block/nfs: do not poll within a coroutine

 block/nfs.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)
-- 
2.39.2


