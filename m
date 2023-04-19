Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501306E7F6D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:18:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAVE-0004u0-8v; Wed, 19 Apr 2023 12:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppAVB-0004ti-7B
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:17:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppAV9-0004zT-3v
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ndVOqdIW7XUzQg7Rb8pIny6TlDCfvoYHttj+ch9rk5s=;
 b=XB54TWvyH1ytu8X77N+QO7kXPwDO1qCpuvshrxbPONrDVa1NX0KbrBLQn1JvI5MFPXbWwv
 ZDcvGwxJaJhDOPjaVEZGGdbJ7d8u7oJCijiqwbHsInP6hITKL7CXrFUlHWCV1WoGPHEEoT
 0gvxfwInYjELX5cRkPz5G0NqTuEoglU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-aBQN0xmrO_mNQqNnlsHKfw-1; Wed, 19 Apr 2023 12:17:43 -0400
X-MC-Unique: aBQN0xmrO_mNQqNnlsHKfw-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3ecc0c4b867so13083161cf.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681921062; x=1684513062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ndVOqdIW7XUzQg7Rb8pIny6TlDCfvoYHttj+ch9rk5s=;
 b=g56GwNVUhxbnykr8KvEdln+S7DsXsYXOSXYYlyRT0aDxpfCznCuYilASGdomJgr+VF
 Bsqp8GJe4zasXZrmgufJgsnUnQUsv4Pax+7IGT9GXotFqczJGFAJ8Mv7FRU022nMQUw9
 FrTQXYox3JX6kPqE0MCYV2VOfKk13992XBYS6RHmyS2qS8XNiQSOeAjgEnXqKnQx3gB7
 ez1ygfHbSAX4pgClm6S2MGqEbqzQInMpqByaL4E8d8f4KowsjABAdDGjf1AXoE1hJgEn
 ZnVi7fhUIAmEptkTb5GBTuDrZAUimjeuyY4H6+AMphVQRZw2G40944VGOVR1CgDKh3rF
 LyVw==
X-Gm-Message-State: AAQBX9cD3RflxH6+rsE1InhZ2/SHcp0jnL1bFVPMlFJwxlZNGaCqTjrQ
 ij6Xsa8P5ISDVQS1+n60xpqdOBolsTp6mRdUbSayb4ugaw1fEkEqqlwzJNp61ZLwVP4mafL1tbH
 1GtshsGZjiQNnbodPwuBU1V3ZYmJLRVbGnKGD9op20Ax440XSArJ1phfIovPvTebePVhWALoA
X-Received: by 2002:a05:622a:1894:b0:3ef:4614:d0e9 with SMTP id
 v20-20020a05622a189400b003ef4614d0e9mr4028912qtc.5.1681921062024; 
 Wed, 19 Apr 2023 09:17:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350YnnEfEBLJzz8YGk5EbQaV/FuvVKgK7R9mzfv9x2LTnJq8K3ry7/jrCxVm8Ty7ipuOfoARaYA==
X-Received: by 2002:a05:622a:1894:b0:3ef:4614:d0e9 with SMTP id
 v20-20020a05622a189400b003ef4614d0e9mr4028868qtc.5.1681921061673; 
 Wed, 19 Apr 2023 09:17:41 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05620a0b0c00b007468b183a65sm351481qkg.30.2023.04.19.09.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 09:17:41 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, peterx@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 0/4] migration/hostmem: Allow to fail early for postcopy on
 specific fs type
Date: Wed, 19 Apr 2023 12:17:35 -0400
Message-Id: <20230419161739.1129988-1-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v2:
- Replace the hostmem patch to use qemu_fd_getfs() instead [David]
- Define enum instead of using string for fs type [Dan]
- One more patch added to deliver error to QMP response (rather than
  keeping some of it in STDERR), so the response should contain richer
  information and looks prettier.

Postcopy can fail in a weird way when guest mem is put onto a random file:

https://bugzilla.redhat.com/show_bug.cgi?id=2057267

It's because we only check userfault privilege on dest QEMU but don't check
memory types.  We do so only until the UFFDIO_REGISTER right after we
switch to postcopy live migration from precopy but it could be too late.

This series tries to make it fail early by checking ramblock fs type if
backed by a memory-backend-file.

Now when it happens it'll fail the dest QEMU from the start:

./qemu-system-x86_64 \
        -global migration.x-postcopy-ram=on \
        -incoming defer \
        -object memory-backend-file,id=mem,size=128M,mem-path=$memfile \
        -machine memory-backend=mem

qemu-system-x86_64: Postcopy is not supported: Host backend files need to be TMPFS or HUGETLBFS only

It will also fail e.g. QMP migrate-set-capabilities properly:

{ "execute": "migrate-set-capabilities" , "arguments": { "capabilities": [ { "capability": "postcopy-ram", "state": true } ] } }
{"error": {"class": "GenericError", "desc": "Postcopy is not supported: Host backend files need to be TMPFS or HUGETLBFS only"}}

Please have a look, thanks.

Peter Xu (4):
  util/mmap-alloc: qemu_fd_getfs()
  vl.c: Create late backends before migration object
  migration/postcopy: Detect file system on dest host
  migration: Allow postcopy_ram_supported_by_host() to report err

 include/qemu/mmap-alloc.h |  7 +++
 migration/migration.c     |  9 ++--
 migration/postcopy-ram.c  | 89 +++++++++++++++++++++++++++------------
 migration/postcopy-ram.h  |  3 +-
 migration/savevm.c        |  3 +-
 softmmu/vl.c              |  9 +++-
 util/mmap-alloc.c         | 28 ++++++++++++
 7 files changed, 111 insertions(+), 37 deletions(-)

-- 
2.39.1


