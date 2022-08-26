Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB65A326F
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:15:48 +0200 (CEST)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRiYE-0002ze-LM
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiUp-0006K0-IM
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiUm-0007o8-2A
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=As2ZeU0wzMT4WOBdzNRkCUVG7sVj/g+E5RnIygpeOzs=;
 b=Pk9hhwbYFUD+Jbp41+eNV+FoGYFppjCegkEfWJH+ZsKWG6V3flqipup0II7jQLmVo2/cBl
 v9S5qZ785js2H2CquJXJ2o746IhSvJQGZgKvN1mEGJkT1aveE/SihTd1ZICbvRuN5K8Ni5
 ddxIpIMjeBWTbNbO3ufpkJ4x2AF06Pg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-kX8yfGeDPOCOxViWSGH0_Q-1; Fri, 26 Aug 2022 19:12:08 -0400
X-MC-Unique: kX8yfGeDPOCOxViWSGH0_Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 z20-20020a05640235d400b0043e1e74a495so1868991edc.11
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=As2ZeU0wzMT4WOBdzNRkCUVG7sVj/g+E5RnIygpeOzs=;
 b=F69xtgvMv7R1bPtRMjY7q0RIaV7mnkYkg74z+eygn0LgEK4gi43VAwrbkmSTDYZTqK
 VakQ9SwcspuDW06+uGQRSngRsEhWG1I69Rl6yKT/5JOSXJmz09tKmlZPh4ZiUfY5d7/3
 4Z3uKw0wqmS3WsHeasAOPtERL22s//GF9eglbgtBBfbATMGfKF4w3OgqXRwi6xldIw5f
 9MWKO8E2IYkFf3YeKAJ6DQw4XuNQwy9xN2QV16Eb/S8diGmssXghDD+aWPYuOUuzttHn
 YJZE9ODLsBQuCVa9gOJIGDysvNB09UBdSRHLTZwpvGDJousCIUpEjbuuJCqMwcvQ5yfn
 On+A==
X-Gm-Message-State: ACgBeo27F7i1HE2NB/SSjbBKtr2fe1IhfIFJ6PP0a140L6F90Nz1P8CH
 BIQ6ICEoJUNqYKZKAPXq/mle8vaZruRoHK+bmxjXzstwGc0aZ9LMT+Hyy5JAmoJ9CuUf6NuFqbi
 Jrn82d6uO83oHUSxQ6fUEHt1YkidQiN5QsXVbFsxtkRWwzff2xsw2bgRD18O12XPiDIA=
X-Received: by 2002:a05:6402:2802:b0:43a:9098:55a0 with SMTP id
 h2-20020a056402280200b0043a909855a0mr8348773ede.179.1661555527558; 
 Fri, 26 Aug 2022 16:12:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR43y7RZIoXR5gyApS12/9jVMEY8sNn7XlfySB0J8buizp0+3hDdDGYUCFyFi2eEUvUNItSxDw==
X-Received: by 2002:a05:6402:2802:b0:43a:9098:55a0 with SMTP id
 h2-20020a056402280200b0043a909855a0mr8348755ede.179.1661555527159; 
 Fri, 26 Aug 2022 16:12:07 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 d26-20020a170906305a00b007308812ce89sm1354998ejd.168.2022.08.26.16.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 00/23] target/i386: make most SSE helpers generic in the
 vector size
Date: Sat, 27 Aug 2022 01:11:41 +0200
Message-Id: <20220826231204.201395-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This is the first half of Paul's series from last April, reorganized
to have no occurrence of YMM_ONLY or SHIFT == 2---meaning it can be
committed without much fuss, even without a plan for the implementation
of AVX decoding.

In most cases this is done by using loops that apply the same code for
all of MMX/SSE/AVX, and in fact this series removes basically all uses
of XMM_ONLY in the code.

In some cases AVX needs special-casing for the two 128-bit lanes and then
this code is simply missing.  The missing helper code is only 10 lines
though, so this _is_ the lion share of the work to adapt the existing
helpers.

The full work, with the AVX parts rebased on top of these, is at branch
i386-avx of https://gitlab.com/bonzini/qemu.  The branch passes the
tests that Paul had posted, while this reduced part passes the reduced
SSE version.

Paolo

v1->v2: get rid of XMM_ONLY
	do not special case PMULHRW (yet)
	remove dead macro for blend
	do not copy table entries on the stack
	remove AVXisms from sse_op_table rework
	extract more code from the AVX patches

Based-on: <20220825164827.392942-1-pbonzini@redhat.com>

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

 target/i386/ops_sse.h        | 1770 +++++++++++++++++-----------------
 target/i386/ops_sse_header.h |   68 +-
 target/i386/tcg/translate.c  |  831 +++++++++-------
 3 files changed, 1404 insertions(+), 1265 deletions(-)

-- 
2.37.1


