Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8D14E9951
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:22:28 +0200 (CEST)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqGJ-0002ij-Hj
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:22:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxM-0001o7-Jv
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxI-0004kT-3t
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4JLNIaw68sxhvcRreZgtfxXw4rRrgNFFCnhMpkj+8xI=;
 b=SgPD5ui1CMuaB/LkKAPHjUDGE0gZcSruXBCjTBroocZ3OsMJuzXPlJPlbSE9Cs1/6Uklhb
 tfhtU55xUru7sy1flPTVaj23bC0VzM6zOWI97BmZuPYqctbDDcGaXryIPUISp+w1utnyjp
 NjQwwttNcTFgBSPeqOwvKYy9L4gJIN8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-m1XAMPEdOvim6D5T35EA4Q-1; Mon, 28 Mar 2022 10:02:41 -0400
X-MC-Unique: m1XAMPEdOvim6D5T35EA4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C438D803D65;
 Mon, 28 Mar 2022 14:02:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC3541121318;
 Mon, 28 Mar 2022 14:02:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/15] tests/docker and tests/tcg cleanup and diet
Date: Mon, 28 Mar 2022 10:02:25 -0400
Message-Id: <20220328140240.40798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first seven patches simplify and clean up a bit the
tests/docker/Makefile.include file.

The rest adjust tests/Makefile.include to invoke the tests/tcg
Makefiles directly, without going through Makefile.qemu and
Makefile.prereqs.  All information is gathered at configure time,
and the config*.mak files for each TCG test target includes
the normal Makefile variables (AC, CC, LD, etc.).

This is also a first step towards moving the cross-compilation
infrastructure from tests/tcg to all of QEMU, so that it can be
used to build firmware binaries.

Paolo

Paolo Bonzini (15):
  tests/docker: remove dead code
  tests/docker: remove test targets
  tests/docker: remove dead variable
  tests/docker: remove unnecessary default definitions
  tests/docker: inline variable definitions or move close to use
  tests/docker: remove unnecessary filtering of $(DOCKER_IMAGES)
  tests/docker: simplify docker-TEST@IMAGE targets
  tests/tcg: add compiler tests when using containers
  tests/tcg: remove CONFIG_LINUX_USER from config-target.mak
  tests/tcg: remove CONFIG_USER_ONLY from config-target.mak
  tests/tcg: prepare Makefile.prereqs at configure time
  tests/tcg: list test targets in Makefile.prereqs
  tests/tcg: invoke Makefile.target directly from QEMU's makefile
  tests/docker: remove SKIP_DOCKER_BUILD
  tests/tcg: fix non-static build

 tests/Makefile.include                    |  63 +++++------
 tests/docker/Makefile.include             |  89 ++++------------
 tests/tcg/Makefile.prereqs                |  18 ----
 tests/tcg/Makefile.qemu                   | 121 ----------------------
 tests/tcg/Makefile.target                 |  11 +-
 tests/tcg/aarch64/Makefile.softmmu-target |   2 +-
 tests/tcg/aarch64/Makefile.target         |  10 +-
 tests/tcg/configure.sh                    |  72 ++++++++-----
 tests/tcg/i386/Makefile.target            |   2 +-
 tests/tcg/multiarch/Makefile.target       |   2 +-
 tests/tcg/ppc64/Makefile.target           |   4 +-
 tests/tcg/ppc64le/Makefile.target         |   4 +-
 tests/tcg/x86_64/Makefile.target          |   2 +-
 13 files changed, 116 insertions(+), 284 deletions(-)
 delete mode 100644 tests/tcg/Makefile.prereqs
 delete mode 100644 tests/tcg/Makefile.qemu

-- 
2.31.1


