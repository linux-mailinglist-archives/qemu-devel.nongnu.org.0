Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83469597EDA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 09:02:11 +0200 (CEST)
Received: from localhost ([::1]:34782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZXd-0004NI-BI
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 03:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oOZSU-0007yT-5L
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:56:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oOZSS-0001iN-PE
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660805808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMnl2vpRG7/pDRtPtSExUMeUc7WcvgZovwPh+0L2Q8Q=;
 b=IxldaB4Hydp4/+Ege+F/hpcWVsFRTaJfb1uOxgrDgDxs0zB/w3qZAm1Ee46TjmUhBELdGo
 ugDHDjkhT0qVRzVrdTd8adbhh0BLNKN7vjM4AJhLIRpqCMoZTEBwGSgyf0ZAHFuXaPT0y7
 S7dqUavTYxyRPwPpkSAP7o7bEkmV0P4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-9A0SfIcvO2SEjDoM0-f-sw-1; Thu, 18 Aug 2022 02:56:43 -0400
X-MC-Unique: 9A0SfIcvO2SEjDoM0-f-sw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9041F1C068D1;
 Thu, 18 Aug 2022 06:56:42 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8CD7C15BC0;
 Thu, 18 Aug 2022 06:56:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, qemu-s390x@nongnu.org
Subject: [PULL 2/3] build-sys: disable vhost-user-gpu if !opengl
Date: Thu, 18 Aug 2022 10:56:30 +0400
Message-Id: <20220818065631.324170-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220818065631.324170-1-marcandre.lureau@redhat.com>
References: <20220818065631.324170-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

vhost-user-gpu uses epoxy/glflush and thus requires opengl.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220628132315.664026-1-marcandre.lureau@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 30a380752c..20fddbd707 100644
--- a/meson.build
+++ b/meson.build
@@ -1097,7 +1097,7 @@ if (have_system or have_tools) and (virgl.found() or opengl.found())
   gbm = dependency('gbm', method: 'pkg-config', required: false,
                    kwargs: static_kwargs)
 endif
-have_vhost_user_gpu = have_vhost_user_gpu and virgl.found() and gbm.found()
+have_vhost_user_gpu = have_vhost_user_gpu and virgl.found() and opengl.found() and gbm.found()
 
 gnutls = not_found
 gnutls_crypto = not_found
-- 
2.37.1


