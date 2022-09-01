Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF46C5A9176
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:01:55 +0200 (CEST)
Received: from localhost ([::1]:57752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTf98-00059i-04
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewb-0000op-KI
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewS-000356-Hz
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ksimOx/6TYzV5ef7HtghKYb7SC0X9TmgtcyvioAQI/k=;
 b=HLF80tFD58npeNX1bnRDuKwEoui79x2nnnkd+8/R/IFjjk1AyWAwRmKevdK9FY0LZseyXq
 jGkkvplYiyfQZQ87/5xykHfB3QR+ULOCsumEnY1c7TOAhxcre415oVjj5p86GAKdnFeruL
 3gY76L0ls22YjxatjQ8PqN2UopAeikI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-058kxjB4PJq2IiWx8FYQQw-1; Thu, 01 Sep 2022 03:48:46 -0400
X-MC-Unique: 058kxjB4PJq2IiWx8FYQQw-1
Received: by mail-wm1-f70.google.com with SMTP id
 a17-20020a05600c349100b003a545125f6eso889665wmq.4
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ksimOx/6TYzV5ef7HtghKYb7SC0X9TmgtcyvioAQI/k=;
 b=C70JjJgHV05cN7Z5OI2gLz1F91Ybn2SYhu5PwAoMbont1TtH8syWppsmn+W9TTJ9kQ
 hKSDCelnX+Nf8O+mF5i+bvd1/UVPWQvz9VPivb9eM8FCtnM75CUj2eS/7Lc0KeKDc9mc
 O1lYFuanVHh+F7PHlmPseIgEUyY3tt5gjOSFSotHa1wubAszke4j9DIBHglCB83/nB4q
 HpuGem63+dPImtS7Xw4RTLlNb6wwl9i2B5H3CVNFJEwMKbsq97NBJUW87vFmoEpPqmbN
 sKy+C8rY7pGYs56/cQ2VsAE1JSryFwka8jnSK6vJdoEgDxGsOnt5EIwtYiXKMd+pC58T
 wKtw==
X-Gm-Message-State: ACgBeo3HlrXJS3GjCwyjHndJrsl48l5Jg1wSkskKQa9Z3vv+Ilo7jZm7
 2ihf5ELfDyBncnFOOQlVR5RHIu0AjK1c671t2SUkUNaF7CWQeGJvy8KNZiAj3KCQRS8C5XLCjPL
 dj3IVMFF6uaAdpjy363VtufGSZfin0zHlv76F6XK4EBJBUMBc4j708MGe4S8l0MLwXGs=
X-Received: by 2002:a05:600c:224c:b0:3a6:7234:551 with SMTP id
 a12-20020a05600c224c00b003a672340551mr4224852wmm.27.1662018524789; 
 Thu, 01 Sep 2022 00:48:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7XbyNDM/DWonTDbzzbm+mF7YM9mEBqitFVnxGG8HP9rAaFle97b9X8jqkEQFHffYOKIU52Ow==
X-Received: by 2002:a05:600c:224c:b0:3a6:7234:551 with SMTP id
 a12-20020a05600c224c00b003a672340551mr4224834wmm.27.1662018524396; 
 Thu, 01 Sep 2022 00:48:44 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 t64-20020a1c4643000000b003a673055e68sm4889108wma.0.2022.09.01.00.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:48:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 00/23] target/i386: make SSE helpers generic in the vector
 size
Date: Thu,  1 Sep 2022 09:48:19 +0200
Message-Id: <20220901074842.57424-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This is the first half of Paul's series from last April, reorganized
so that there is no need for YMM_ONLY and SHIFT == 2 does not appear
yet.  This means that it is independent of Paul's implementation
of AVX decoding.

This generally uses loops that apply the same code for all of MMX/SSE/AVX,
and in fact this series removes basically all uses of XMM_ONLY in the code.
In some cases AVX needs special-casing for the two 128-bit lanes; this is
done with a new macro LANE_WIDTH that is currently the same as the register
width, but remains 16 for AVX registers.

The full work, with the AVX parts rebased on top of these, is at branch
i386-avx of https://gitlab.com/bonzini/qemu.  The branch passes the
tests that Paul had posted, while this reduced part passes the reduced
SSE version.

Paolo

Supersedes: <20220826231204.201395-1-pbonzini@redhat.com>
Based-on: <20220825164827.392942-1-pbonzini@redhat.com>

v2->v3: convert remaining lane-based operations (hadd/hsub, psrldq)
	unify MMX and SSE hadd/hsub
	move code generation after illegal_op checks
	remove C++ comments

v1->v2: get rid of XMM_ONLY
	do not special case PMULHRW (yet)
	remove dead macro for blend
	do not copy table entries on the stack
	remove AVXisms from sse_op_table rework
	extract more code from the AVX patches

Paolo Bonzini (6):
  i386: do not use MOVL to move data between SSE registers
  i386: formatting fixes
  i386: check SSE table flags instead of hardcoding opcodes
  i386: isolate MMX code more
  i386: Add size suffix to vector FP helpers
  i386: do not cast gen_helper_* function pointers

Paul Brook (17):
  i386: Add ZMM_OFFSET macro
  i386: Rework sse_op_table1
  i386: Rework sse_op_table6/7
  i386: Move 3DNOW decoder
  i386: Add CHECK_NO_VEX
  i386: Rewrite vector shift helper
  i386: Rewrite simple integer vector helpers
  i386: Misc integer AVX helper prep
  i386: Destructive vector helpers for AVX
  i386: Floating point arithmetic helper AVX prep
  i386: reimplement AVX comparison helpers
  i386: Dot product AVX helper prep
  i386: Destructive FP helpers for AVX
  i386: Misc AVX helper prep
  i386: Rewrite blendv helpers
  i386: AVX pclmulqdq prep
  i386: AVX+AES helpers prep

 target/i386/ops_sse.h        | 1781 +++++++++++++++++-----------------
 target/i386/ops_sse_header.h |   68 +-
 target/i386/tcg/translate.c  |  831 +++++++++-------
 3 files changed, 1391 insertions(+), 1289 deletions(-)

-- 
2.37.1


