Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E934753DB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:44:26 +0100 (CET)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxOxd-00027F-NM
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnp-0002pE-Nk
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOno-0004Hd-8E
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8lW9CiLm0Ir73u8fEE2lWVy2RtS9eDaS1DKo963bTOQ=;
 b=JyeoZQkkIB2KRGm8+HtlweAC4/RE/jpNK1onNeSjoCkB7rR74/1DDW/jApplYpmnrrvgdl
 yh3YKKGwVzcttcIsHhKxdKcrMyE0iTvpLk9v9MOAmphCxsL2+6HI8q7rWnlodVqNNT7eY+
 Dlbwo8c39gE6W1tyODIyQolpZbqDkuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-VOBasldVOf2mTRx_rEgaPg-1; Wed, 15 Dec 2021 02:34:14 -0500
X-MC-Unique: VOBasldVOf2mTRx_rEgaPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1009381CCBD;
 Wed, 15 Dec 2021 07:34:13 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A3CE1092790;
 Wed, 15 Dec 2021 07:34:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/16] tests/qtest: Run the PPC 32-bit tests with the 64-bit
 target binary, too
Date: Wed, 15 Dec 2021 08:33:51 +0100
Message-Id: <20211215073402.144286-6-thuth@redhat.com>
In-Reply-To: <20211215073402.144286-1-thuth@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ppc64 target is a superset of the 32-bit target, so we should
include the tests here, too. This used to be done in the past already,
but it got lost during the conversion to meson.

Fixes: a2ce7dbd91 ("meson: convert tests/qtest to meson")
Message-Id: <20211201104347.51922-2-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 975a0f2f5f..36ca175660 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -138,6 +138,7 @@ qtests_ppc = \
   ['boot-order-test', 'prom-env-test', 'boot-serial-test']                 \
 
 qtests_ppc64 = \
+  qtests_ppc + \
   (config_all_devices.has_key('CONFIG_PSERIES') ? ['device-plug-test'] : []) +               \
   (config_all_devices.has_key('CONFIG_POWERNV') ? ['pnv-xscom-test'] : []) +                 \
   (config_all_devices.has_key('CONFIG_PSERIES') ? ['rtas-test'] : []) +                      \
-- 
2.27.0


