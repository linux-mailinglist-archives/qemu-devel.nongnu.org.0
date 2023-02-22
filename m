Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2E969F6CC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:41:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqIz-0003d1-I3; Wed, 22 Feb 2023 09:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqIy-0003cs-Bi
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:41:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqIw-00023B-BD
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ib/IfCbEjUdiwwZ0E6kCG2V58gSpXNGvKoxqJBl9kT8=;
 b=eTIYDSYvEQdfo2B07FNRfJdE59R1ZQDpLTw1UGA9fR4OmiLnWC065uuqDPWvQ004R4h65K
 OiVwHEZ67tUfB3ru/1gWTB3vKdjvh64XTYoVKLmRDzAV6f1mInjk3qy/hhWPEeavoxMejj
 CdwHikAvPqLmORuA54tkv3kfgG1NZTk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-3BvmrxQPMD6EAjp8qNUWSQ-1; Wed, 22 Feb 2023 09:41:08 -0500
X-MC-Unique: 3BvmrxQPMD6EAjp8qNUWSQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 ck7-20020a0564021c0700b004a25d8d7593so10417497edb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:41:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ib/IfCbEjUdiwwZ0E6kCG2V58gSpXNGvKoxqJBl9kT8=;
 b=vdZbiABGSyHYw2YgUYPV4By2s/+9fy+oVkyc0ggqZEY8BL3R6C0Y04WFt58m1XFg6T
 rXVEyrNtaMEVJqchc+FPLe/RIInFMKYRpP5LyINaUUO5VfC6PLl5rlSfp5Cw5xTb2/1E
 7bNnUyXz3qAXULMLFLXnhqMf9siRc3kZzwG8hSsbjFW5tqJdnFb3Xdchl/PsDyeShQeq
 uTSekMKySwRKGROwyBMbbdA3a39MYII1z1zp1NCb/mEfL5saqJzrvt2bwCwNEM9qIEhL
 Y94tqldlWPtLtXu+8tINYEZ12ILVTx8oHInJiigXg6/hi3euK8ghEAriUJbMk6csmk8t
 OKnA==
X-Gm-Message-State: AO0yUKVP6a4u6ZtAACR1j94lg4B1qzQH1xdf/65fzNmFDmp5Z7K78s1U
 6O0A8c+/g65cVqgWvGk7qUnpUoVnQ8+rbT1wGSQC5Eoq9X5M5OvIKWZ+ZnA1ppJ+oOmUQBtaXUC
 vy0CldIB+vojboCPqCRY6i582Pvy8zft61baFYrJyjsQnnEgtTVPmrBFVNipljgwWl6r2fAMY
X-Received: by 2002:a50:ec8d:0:b0:4aa:a390:bf4a with SMTP id
 e13-20020a50ec8d000000b004aaa390bf4amr9614691edr.20.1677076866647; 
 Wed, 22 Feb 2023 06:41:06 -0800 (PST)
X-Google-Smtp-Source: AK7set97CUb5rFO2XIhY2ZGHqMUosmr+I1V7hWzR9w4qvIMhPOX9H3Wcna5XLqOL8iknQ+G96Dvk/A==
X-Received: by 2002:a50:ec8d:0:b0:4aa:a390:bf4a with SMTP id
 e13-20020a50ec8d000000b004aaa390bf4amr9614666edr.20.1677076866262; 
 Wed, 22 Feb 2023 06:41:06 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a50d594000000b004ad7962d5bbsm3992794edi.42.2023.02.22.06.41.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:41:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Misc + target/i386 pull request for 2023-02-22
Date: Wed, 22 Feb 2023 15:40:59 +0100
Message-Id: <20230222144103.467002-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The following changes since commit 003ba52a8b327180e284630b289c6ece5a3e08b9:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-02-16 11:16:39 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 49be78ca02a687ea00ad7534254217b479a4e92d:

  target/i386/gdbstub: Fix a bug about order of FPU stack in 'g' packets. (2023-02-21 13:46:49 +0100)

----------------------------------------------------------------
* x86 bugfixes
* OpenBSD support for naming threads
* Refined Python support policy

----------------------------------------------------------------
Brad Smith (1):
      thread-posix: add support for setting threads name on OpenBSD

Paolo Bonzini (1):
      docs: build-platforms: refine requirements on Python build dependencies

Richard Henderson (1):
      target/i386: Fix 32-bit AD[CO]X insns in 64-bit mode

TaiseiIto (1):
      target/i386/gdbstub: Fix a bug about order of FPU stack in 'g' packets.

 docs/about/build-platforms.rst   | 32 +++++++++++++++++++
 meson.build                      | 12 +++++++
 target/i386/gdbstub.c            |  4 ++-
 target/i386/tcg/emit.c.inc       |  2 ++
 tests/tcg/x86_64/Makefile.target |  3 ++
 tests/tcg/x86_64/adox.c          | 69 ++++++++++++++++++++++++++++++++++++++++
 util/qemu-thread-posix.c         |  9 +++++-
 7 files changed, 129 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/x86_64/adox.c
-- 
2.39.1


