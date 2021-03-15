Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A136633C9F7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:37:05 +0100 (CET)
Received: from localhost ([::1]:51134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwlk-0002OD-2z
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkL-0000vN-IL
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:35:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkJ-0005r4-3a
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615851333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rXctU5hOubXOmmN6A6bqu5HyNx+/3RypZ2yl8cWn/UU=;
 b=ekM7LbchkxJjGzp3mcmqqRZF+b/kounwBgr5MB6zM7Lt0JNFyMmfzFLvp0dE4PJ6PjrSFi
 c81uPgNe+fZphrxAizystw8GSmxZr/sLN5N085gUuQZtD3P2DE5iN+uF0U2/T7lt5cDj5P
 2r+UZBnbeek2NzbBBRxz95gVmKdLxzU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-rxyCBmlwMtu9CBTNcrV6Gg-1; Mon, 15 Mar 2021 19:35:30 -0400
X-MC-Unique: rxyCBmlwMtu9CBTNcrV6Gg-1
Received: by mail-wm1-f69.google.com with SMTP id f9so8869770wml.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=InXHJmMEzFOOMftb4qsFDK1SKZtFic+ziki5EJAikw8=;
 b=muhp5gcX7OGdlfEWAHTWlzkJCQMYJM3ZS9mclA5Cyglihm+8OKd2aFUgVmerD9sr7D
 4lkXe+QkUslgZYkGtf2yGGiMWAR8TxKhuheDOczczZqOR0kHtLFmziZrKY9mtcGidnsN
 zKFfL77KWUbFabL+nLfzyEU3sw8U4JVPoZPxC19nSljluxyHvKcEZa5T4bDPejgAI1Gp
 /mcPirjPdfDVaihs74aSKVBe2FdLlmiuwcRZnn7uAAugVcDYZ1fSk1e3xKyv7eMARJFE
 p09GReEioFprJvjuZ30yDaLtmeXjuOFIMgoOwDX9oM4A7V/5y9XliTM7qFdoAFpwDJes
 C9uA==
X-Gm-Message-State: AOAM531/hvwlljweOm48zWZ7cRY4FtI3HezZa0gp2zfPtA82y0Lbha9Y
 vGPmYtbchXwVvz1mGupsZ4qPCy8p651DYLh5jUcUc6wh8vxOqyPJOtbAb2Fw7oVBdBgdbvf8l9t
 scbUPSaWoU3KEjumyfjLHmL9imOtwU+qn4qDh+5IhQI2aVrCrjEaWOU20+BG2eAfK
X-Received: by 2002:a5d:548c:: with SMTP id h12mr1899990wrv.46.1615851329197; 
 Mon, 15 Mar 2021 16:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/Vpx1s/4S/jpIQQ6fhZXOl8561arBvYYO4QQ4q+XvxbYqEcWtZxwHs6HLHHjHxC9f3zhL1Q==
X-Received: by 2002:a5d:548c:: with SMTP id h12mr1899975wrv.46.1615851328991; 
 Mon, 15 Mar 2021 16:35:28 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 18sm1200990wmj.21.2021.03.15.16.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:35:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] pflash patches for 2021-03-16
Date: Tue, 16 Mar 2021 00:35:16 +0100
Message-Id: <20210315233527.2988483-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2615a5e433aeb812c300d3a48e1a88e1303e2339=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-req=
uest' into staging (2021-03-15 19:23:00 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/pflash-20210316=0D
=0D
for you to fetch changes up to 3b6a1da064ac6ce5256f1f6f16870ea79c2422d0:=0D
=0D
  hw/block/pflash_cfi: Replace DPRINTF with trace events (2021-03-16 00:28:=
33 +0100)=0D
=0D
----------------------------------------------------------------=0D
Parallel NOR Flash patches queue=0D
=0D
- Code movement to ease maintainability=0D
- Tracing improvements=0D
----------------------------------------------------------------=0D
=0D
David Edmondson (2):=0D
  hw/block/pflash_cfi01: Correct the type of PFlashCFI01.ro=0D
  hw/block/pflash_cfi: Replace DPRINTF with trace events=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  hw/block/pflash_cfi: Fix code style for checkpatch.pl=0D
  hw/block/pflash_cfi01: Extract pflash_cfi01_fill_cfi_table()=0D
  hw/block/pflash_cfi02: Extract pflash_cfi02_fill_cfi_table()=0D
  hw/block/pflash_cfi02: Set rom_mode to true in pflash_setup_mappings()=0D
  hw/block/pflash_cfi02: Open-code pflash_register_memory(rom=3Dfalse)=0D
  hw/block/pflash_cfi02: Rename register_memory(true) as mode_read_array=0D
  hw/block/pflash_cfi02: Factor out pflash_reset_state_machine()=0D
  hw/block/pflash_cfi02: Add DeviceReset method=0D
  hw/block/pflash_cfi01: Clarify trace events=0D
=0D
 hw/block/pflash_cfi01.c | 253 ++++++++++++++++----------------=0D
 hw/block/pflash_cfi02.c | 316 ++++++++++++++++++++--------------------=0D
 hw/block/trace-events   |  40 +++--=0D
 3 files changed, 320 insertions(+), 289 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


