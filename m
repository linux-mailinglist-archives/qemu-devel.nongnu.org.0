Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6167A4CF2F7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:52:51 +0100 (CET)
Received: from localhost ([::1]:45790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8Ak-0002si-Fq
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:52:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR86u-0007MO-M2
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:48:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR86t-0007Lh-Ba
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hyunsZ1DyNKGpLsMmJdHAJJ+4frXcUWMjNQ3kVsdQ68=;
 b=FUzV1yxf97yUt3ycixIrvdRhAtTu9pd1olKLAu32FpBA0etpZCX4F1GQ0ItwmIxQi+y/Pl
 eJl7uakz2nwZsvqxUwD06qHNsLUwNuO2QcH2t/iHHu8ZS3XVeoqyL0ZHunnU2IZV3LseF5
 DgHQTUGyKmPTToE2x153qeF4a82WeGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-HLMe_VdAPR2LMYiVq-QMzQ-1; Mon, 07 Mar 2022 02:48:47 -0500
X-MC-Unique: HLMe_VdAPR2LMYiVq-QMzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CBD180A19C;
 Mon,  7 Mar 2022 07:48:46 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD33C6E6F1;
 Mon,  7 Mar 2022 07:48:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/12] ui/shader: free associated programs
Date: Mon,  7 Mar 2022 11:46:27 +0400
Message-Id: <20220307074632.238049-8-marcandre.lureau@redhat.com>
In-Reply-To: <20220307074632.238049-1-marcandre.lureau@redhat.com>
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/shader.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/shader.c b/ui/shader.c
index 4c80fc831f68..ab448c41d4c6 100644
--- a/ui/shader.c
+++ b/ui/shader.c
@@ -172,5 +172,8 @@ void qemu_gl_fini_shader(QemuGLShader *gls)
     if (!gls) {
         return;
     }
+    glDeleteProgram(gls->texture_blit_prog);
+    glDeleteProgram(gls->texture_blit_flip_prog);
+    glDeleteProgram(gls->texture_blit_vao);
     g_free(gls);
 }
-- 
2.35.1.273.ge6ebfd0e8cbb


