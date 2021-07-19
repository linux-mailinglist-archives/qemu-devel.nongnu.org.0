Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448A23CD21D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:42:57 +0200 (CEST)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Qjg-0003zH-83
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m5QhW-0001sX-Ej
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:40:47 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m5QhT-0008HW-Pm
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:40:42 -0400
Received: by mail-ed1-x532.google.com with SMTP id ca14so23346035edb.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 03:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ahsWqT4/aa/F32IeA2erYqrm5/wXr65QxtUbDPadvuw=;
 b=JKbQDKp3TRFSMtjmvLmzQuF48/fb+A4ADsDMuTI/O56rU1gQGbwn8hWqtBiCQFGlsx
 OpSPHG6kGVzEyifJYuBcriNqrqpZjTOBYcHbUkxGr+Fad0c4frNWFBVdZEs1s8DKIKN/
 dy1ZRvEyr72DzvcZGXWm0d+XD4vOAWz7WGITamHFc3rH91rsaQ2VagmqDCaBEr8Gdn6k
 jAIj9j5AtLcCxXh+kb7c4H+co1leiby+khnkkIYzCFmedW2iNbqrNwmVMwnEUX3WN1nY
 pkXZX+9QCSaXPP4H/2R7tsTtZyHNB99SZnvv/w5u20wJASpQnFUh9lMBj9pWXxQQjYTj
 c4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ahsWqT4/aa/F32IeA2erYqrm5/wXr65QxtUbDPadvuw=;
 b=PFaImIlr7seHD3yPpFMYVVgxapeVzKKZ9kAC28E67nOvxr+Wb2N5CbjtrXko5x3mSI
 aSetcP8bLqTFiviy+1Fe++xVJmZF0qKjaBllurp3/5vj32/eEdmia2T2TQBt1kTd/lKH
 EJWcwPsltbv31pVhn5X3SR3LkJI730lZRf6WykDSzID0ikEK78wlSOAlkuY5Am2nBEwS
 JSlwM5BiiybGnBxhFpv90uYbnO/fguMRnMfj9ll8uia1/29DlckZGc45VMI1e1G+a+KC
 VgfLQr0ZHAVs7/GdwHXMXVMMOf3CFOKFR9JR6TUOCz0k8Beu9WWwXwUobUui1Dh57B06
 T86g==
X-Gm-Message-State: AOAM531U2yfHJgLdD3IpzawBxydWNO4ajnlDKg9/KonDxkbOqH9IJOMR
 Uy2AaEiHm6KErAtRXeM1eUlKyKGuMFzQtQ==
X-Google-Smtp-Source: ABdhPJzbqo+5ps896pOs2hTQPBEsqwoHGuyie0/4Fcx7etRsdfMwF8hdKs8Kxo2KUXupDYyHdIXgoA==
X-Received: by 2002:aa7:ccc1:: with SMTP id y1mr33545011edt.321.1626691235400; 
 Mon, 19 Jul 2021 03:40:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j22sm5872015ejt.11.2021.07.19.03.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 03:40:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] qapi/qom: use correct field name when getting/setting
 alias properties
Date: Mon, 19 Jul 2021 12:40:31 +0200
Message-Id: <20210719104033.185109-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switching -M parsing from QemuOptions and StringInputVisitor to keyval and
QObjectInputVisitor exposed a latent bug in alias properties.
Alias targets have a different name than the alias property itself
(e.g. a machine's pflash0 might be an alias of a property named 'drive').
When the target's getter or setter invokes the visitor, it will use
the "wrong" name compared to what was passed on the command line,
and the visitor will not be able to find it.

The solution that is implemented here is for alias getters and setters
to wrap the incoming visitor, and forward the sole field that the target
is expecting while renaming it appropriately.

Patch 1 implements the visitor adapter, while patch 2 applies it in QOM.

Paolo


Paolo Bonzini (2):
  qapi: introduce forwarding visitor
  qom: use correct field name when getting/setting alias properties

 include/qapi/forward-visitor.h    |  27 +++
 qapi/meson.build                  |   1 +
 qapi/qapi-forward-visitor.c       | 307 ++++++++++++++++++++++++++++++
 qom/object.c                      |   9 +-
 tests/unit/meson.build            |   1 +
 tests/unit/test-forward-visitor.c | 165 ++++++++++++++++
 6 files changed, 508 insertions(+), 2 deletions(-)
 create mode 100644 include/qapi/forward-visitor.h
 create mode 100644 qapi/qapi-forward-visitor.c
 create mode 100644 tests/unit/test-forward-visitor.c

-- 
2.31.1


