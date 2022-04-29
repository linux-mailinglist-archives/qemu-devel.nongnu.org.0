Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9279451431A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 09:19:28 +0200 (CEST)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkKuV-0003id-MK
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 03:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nkKpW-0001QA-Ge
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:14:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nkKpV-0001ML-0C
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651216455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2G6OR7H6NSW4oXOvsYNu/g/7DVqg21KnKG2NzzRqnqQ=;
 b=MoYjf7zDf8GB46hZOfKrI+YgHHRsBQ+nH4MGYXR/PvJQ+bzM1mGxjGpCvHDlSxrTO9MvFE
 zwGWQLBi7AxgxSlm4LVOjxki/w5Hds2fhF1QHSYoGkhJSVzy4WAiINjhbE8XI34Hvac9GV
 Rh1wU6EdoDYaKCZrow3f6uXla2dgOGw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-FOS8PorxNUa8Fltp1Ir5Lg-1; Fri, 29 Apr 2022 03:14:12 -0400
X-MC-Unique: FOS8PorxNUa8Fltp1Ir5Lg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E04B83C0E191;
 Fri, 29 Apr 2022 07:14:11 +0000 (UTC)
Received: from kostyanf14nb.Dlink (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DF722166BA3;
 Fri, 29 Apr 2022 07:13:59 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 2/2] qga-vss: always build qga-vss.tlb when qga-vss.dll
 is built
Date: Fri, 29 Apr 2022 10:13:26 +0300
Message-Id: <20220429071326.324497-3-kkostiuk@redhat.com>
In-Reply-To: <20220429071326.324497-1-kkostiuk@redhat.com>
References: <20220429071326.324497-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/vss-win32/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 71c50d0866..26c5dd6e0e 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -23,8 +23,6 @@ qga_vss = shared_module(
   ]
 )

-all_qga += qga_vss
-
 if midl.found()
   gen_tlb = custom_target('gen-tlb',
                           input: 'qga-vss.idl',
@@ -36,3 +34,5 @@ else
                           output: 'qga-vss.tlb',
                           command: [widl, '-t', '@INPUT@', '-o', '@OUTPUT@'])
 endif
+
+all_qga += [ qga_vss, gen_tlb ]
--
2.25.1


