Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202236E6FBC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 00:59:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pouGx-0001Jt-6s; Tue, 18 Apr 2023 18:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pouGs-0001JI-4Z
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pouGp-0007CC-QZ
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681858674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fEMzRWtQSjciFJ4klUH7jQpBgI4U8tSmfxJCaavwlvM=;
 b=aA4VGW53MpTrV/8Pp57IkgcjkjYFROip4ra4oAyvZ7Dr6OXUVp9blwybZZHPhGvPf/Iy4C
 BerChG2j9yk5AFu66CwsPxnUZ+hzY8DFHApVH+33F5M7Cug896ZTCR7oZiWYLaIDXqyZhJ
 kDfdFCJAE4hFEWdFmux+g4jq2qNdFOg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-wTn_LO3LPBq0n-IDqffbjQ-1; Tue, 18 Apr 2023 18:57:52 -0400
X-MC-Unique: wTn_LO3LPBq0n-IDqffbjQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-5ef67855124so7027176d6.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 15:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681858671; x=1684450671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fEMzRWtQSjciFJ4klUH7jQpBgI4U8tSmfxJCaavwlvM=;
 b=XkeqME2w60eXyNfiEEJeGKZ0Jsmj645TJuznhLjRausXiIfMReSwEaxyJb+kjR7T4Q
 wxEvd103l75TeO7oiQGYLL7I8hNrbtlwOlvWI1bPHEhQcuquKI/XSa0rVtIe3gkZ/tX1
 rZG3nRh3eLXRduC3Y9ChKj9aHmGHiuxzGpqaNp2IAuLQgzkfBahpefHuhNJLcT1kRslv
 jYDkcKco7CM5283LfUQekbGh7hxpATQ0dcCB2I+8yAqQaHe0VN3R8eolg1uM1KDBNYxb
 ckUkkP6UDg//PcBS3UplF3zUfhLysuQ4/0pmxDjBDlpBP+Q2LF303nWM6FoTif2AC0kW
 Vmkg==
X-Gm-Message-State: AAQBX9c9KhJwxztGrSp0CuhqIA+EcY2Mb/AoyI2w1/lKwd0jm1MRhreO
 t+Jhf1yPiOu+zuZRDJLK1vDQ0WekiQu/kH0MmEArnl79cS/abrsNOA2V3l20/QWqOsX9g9Ds2MW
 fMTnvA96kgam5w1FXR9cy58QN0VsNOGn/g4lUNbZWqrfqaitr6brBGeuc6AgQfm8afxReFZtE
X-Received: by 2002:a05:6214:3018:b0:5da:b965:1efe with SMTP id
 ke24-20020a056214301800b005dab9651efemr23311620qvb.4.1681858671635; 
 Tue, 18 Apr 2023 15:57:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350arRtQ2s7IKS2WFujNPF4El4FCqD1roYfJJwWSQubNYr12j0ne3UTZssjH7/r1cGzcgtf1zbw==
X-Received: by 2002:a05:6214:3018:b0:5da:b965:1efe with SMTP id
 ke24-20020a056214301800b005dab9651efemr23311592qvb.4.1681858671182; 
 Tue, 18 Apr 2023 15:57:51 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 i3-20020ad45383000000b005e3c45c5cbdsm2937330qvv.96.2023.04.18.15.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 15:57:50 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com
Subject: [PATCH 0/3] migration/hostmem: Allow to fail early for postcopy on
 specific fs type
Date: Tue, 18 Apr 2023 18:57:46 -0400
Message-Id: <20230418225749.1049185-1-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
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

qemu-system-x86_64: Host backend files need to be TMPFS or HUGETLBFS only
qemu-system-x86_64: Postcopy is not supported

It will also fail e.g. QMP migrate-set-capabilities properly.

Please have a look, thanks.

Peter Xu (3):
  hostmem: Detect and cache fs type for file hostmem
  vl.c: Create late backends before migration object
  migration/postcopy: Detect file system on dest host

 backends/hostmem-file.c  | 37 ++++++++++++++++++++++++++++++++++++-
 include/sysemu/hostmem.h |  1 +
 migration/postcopy-ram.c | 28 ++++++++++++++++++++++++----
 softmmu/vl.c             |  9 +++++++--
 4 files changed, 68 insertions(+), 7 deletions(-)

-- 
2.39.1


