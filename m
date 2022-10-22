Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C672608D13
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 14:00:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omD7Q-0003BB-SR; Sat, 22 Oct 2022 07:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1omD6x-0002z7-EP
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:56:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1omD6u-0006hG-7I
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666439774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TYHY1gT9TZeuInAfrc1PJkVGrRY7vx7eIA+Mx6s7Vv4=;
 b=YrJxnluz6yi+RSirVtvXmOgLHEtPLAafQk54sHu1gkT2BJ4Zy1kIaZwp9wfbkGOrfWovfG
 JJCkHRiTuPfZH+4f/xFI76+jFLXd4/PeVG0acc6hROfyrTKrTvaI0YDKdfkkWKORHntRU5
 4n4gHIPqso7hSWDFYDfII12p+ja6hEk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-65-ILBEgTXMNbmiK5nXhNtPlw-1; Sat, 22 Oct 2022 07:56:12 -0400
X-MC-Unique: ILBEgTXMNbmiK5nXhNtPlw-1
Received: by mail-ed1-f70.google.com with SMTP id
 b13-20020a056402350d00b0045d0fe2004eso5096830edd.18
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 04:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TYHY1gT9TZeuInAfrc1PJkVGrRY7vx7eIA+Mx6s7Vv4=;
 b=3RppygqWEn58Qk+/uQRjS/Jckg5j1QrXgVV4fFn7tcYMNuSXPlt36XUg797+nRZqiA
 cJZGD5YHZmHP+7apZ9N4CL8RYPiya6CRv+pBSUcXRMmXg/5dRpGK9E/MJXb6r9iqoxGR
 QXCPf5Rlk7tD/eY+arvS7RfZtR7BwpWSrLxWRsbFPgK2kmqOEAZACiLo+1A3FCrn09m8
 C+I14CkuODxtQQAZZIAOTGDZ6MYiCZc8MoGq5DHMyUdaWRaj8qhVCDY+p8FgaXUO0zPh
 2BL9vHLYfpUwai/wSLzK0tEFb37OJQbeFIUz2OIV1zqCF6lakZxCKjpgBK/fJd8k1XD9
 FSjA==
X-Gm-Message-State: ACrzQf1RHAezPjjTQr5GKZ5BfC6LLG/7Ax91wCkXlBMOEdd7GHc/lSEC
 WXOsOZ+kjEiRLSQcoV4e/xx8MikPyS8+k0/5QeXluUWeixnO39GIW4i0PBmYIycnyyBVsYLK7Fm
 HbzunrmxZ9ibLZOq6AgQNbvadik7J1im8KIrqJfCJD/jO5iYysrpQA2808+BYLhUEIMw=
X-Received: by 2002:a17:907:7627:b0:78d:b6f5:9f15 with SMTP id
 jy7-20020a170907762700b0078db6f59f15mr19823897ejc.149.1666439771266; 
 Sat, 22 Oct 2022 04:56:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7B9iIl2fIT9Aiei3gJtFmtC3KxPVZiWGa7/OoH2e/pTVlkkdLaQn56L83I8OpcBJFW+7CIDA==
X-Received: by 2002:a17:907:7627:b0:78d:b6f5:9f15 with SMTP id
 jy7-20020a170907762700b0078db6f59f15mr19823881ejc.149.1666439770881; 
 Sat, 22 Oct 2022 04:56:10 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a170906854b00b00782fbb7f5f7sm3372885ejy.113.2022.10.22.04.56.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 04:56:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] x86 TCG patches for 2022-10-22
Date: Sat, 22 Oct 2022 13:56:04 +0200
Message-Id: <20221022115608.152853-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 214a8da23651f2472b296b3293e619fd58d9e212:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-10-18 11:14:31 -0400)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 2872b0f390c3fbd8f19f6b82da3dca15fa820118:

  target/i386: implement FMA instructions (2022-10-22 09:05:54 +0200)

----------------------------------------------------------------
* target/i386: new decoder bugfix
* target/i386: complete x86-v3 support for TCG

----------------------------------------------------------------
Paolo Bonzini (4):
      target/i386: decode-new: avoid out-of-bounds access to xmm_regs[-1]
      target/i386: introduce function to set rounding mode from FPCW or MXCSR bits
      target/i386: implement F16C instructions
      target/i386: implement FMA instructions

 target/i386/cpu.c                |   8 +--
 target/i386/cpu.h                |   3 +
 target/i386/ops_sse.h            | 116 ++++++++++++++++++++-------------------
 target/i386/ops_sse_header.h     |  17 ++++++
 target/i386/tcg/decode-new.c.inc |  48 ++++++++++++++++
 target/i386/tcg/decode-new.h     |   3 +
 target/i386/tcg/emit.c.inc       |  68 ++++++++++++++++++++++-
 target/i386/tcg/fpu_helper.c     |  60 +++++++-------------
 target/i386/tcg/translate.c      |   1 +
 tests/tcg/i386/test-avx.c        |  17 ++++++
 tests/tcg/i386/test-avx.py       |   8 ++-
 11 files changed, 247 insertions(+), 102 deletions(-)
-- 
2.37.3


