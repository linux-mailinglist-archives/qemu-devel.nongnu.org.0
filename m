Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2C56FB1C7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:38:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw143-0006LS-Vi; Mon, 08 May 2023 09:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw13v-0006Js-DC
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw13t-0008TJ-QH
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683553076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UVjJ6id9Wr1r1MZKNVKbv3ewcMTdUQa5hFmrVuji3VE=;
 b=B9WbK861BQte1CehAcbNyOEbLcfZyiyqQQyhdGyFvqTHFJAB1UWJyd8Cpy9xYGDxBIi9yn
 xUUYroG4Ft/cnTrJl2gjsy+tyYOZ2WGcd2u4aP8Z3GDVOxjTs63BNAhyp7zlB1YsXfwFwJ
 cX27SNrXNopWaR2oH1F50x18cwwuU4s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-dFZuqjT6NUWCVTTZxtV2OQ-1; Mon, 08 May 2023 09:37:50 -0400
X-MC-Unique: dFZuqjT6NUWCVTTZxtV2OQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC08C80080E;
 Mon,  8 May 2023 13:37:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EA9C492B00;
 Mon,  8 May 2023 13:37:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Subject: [RFC PATCH 0/2] Make the core disassembler functions
 target-independent
Date: Mon,  8 May 2023 15:37:43 +0200
Message-Id: <20230508133745.109463-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Move disas.c into the target-independent source set, so that we
only have to compile this code once instead multiple times (one
time for each target).

Marked as RFC since we have to replace the target_ulongs here
with hwaddr, and the TARGET_FMT_lx with HWADDR_FMT_plx, which is
a little bit ugly ... what's your opinion?

Thomas Huth (2):
  disas: Move softmmu specific code to separate file
  disas: Move disas.c into the target-independent source set

 meson.build            |  4 +-
 disas/disas-internal.h | 20 +++++++++
 include/disas/disas.h  | 21 +++------
 include/hw/elf_ops.h   |  2 +-
 bsd-user/elfload.c     |  2 +-
 disas.c                | 98 ++++++++----------------------------------
 disas/disas-mon.c      | 65 ++++++++++++++++++++++++++++
 linux-user/elfload.c   |  2 +-
 disas/meson.build      |  2 +
 9 files changed, 116 insertions(+), 100 deletions(-)
 create mode 100644 disas/disas-internal.h
 create mode 100644 disas/disas-mon.c

-- 
2.31.1


