Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211ED6AB69B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:53:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4iJ-0003Yl-NK; Mon, 06 Mar 2023 01:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4hy-0003GJ-01
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4hw-0000Wb-Cc
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7y/D8sGqubS+tmtkakPYx2BKdnm+kQe5y0cy7kKK5aM=;
 b=dRzwImzwQS42kCQO6O27vEZSOYQDixnMvNWKJGpmMlL5Q76G0m8Ee0iZHlyvZmHFXVGsKP
 AHv1Y+Elp/C/O10zIdkS33LMbMDJCCZAls6yeChcZk03FlJxx4Gq82PtBpt5JuzzpmcyKo
 d7OG2AMbIRm7QG5WpKfmYTnL/QrZ6IQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-93IEcLLVOYu45k1F21raWQ-1; Mon, 06 Mar 2023 01:52:24 -0500
X-MC-Unique: 93IEcLLVOYu45k1F21raWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3D93185A7A4;
 Mon,  6 Mar 2023 06:52:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80B7C140EBF4;
 Mon,  6 Mar 2023 06:52:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 04/27] audio: rename hardware store to backend
Date: Mon,  6 Mar 2023 10:51:39 +0400
Message-Id: <20230306065202.2160066-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Volker Rümelin <vr_qemu@t-online.de>

Use a consistent friendly name for the HWVoiceOut and HWVoiceIn
structures.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230121094735.11644-3-vr_qemu@t-online.de>
---
 audio/audio_template.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index f0ef262ab3..33af42ed8b 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -529,8 +529,8 @@ SW *glue (AUD_open_, TYPE) (
         HW *hw = sw->hw;
 
         if (!hw) {
-            dolog ("Internal logic error voice `%s' has no hardware store\n",
-                   SW_NAME (sw));
+            dolog("Internal logic error: voice `%s' has no backend\n",
+                  SW_NAME(sw));
             goto fail;
         }
 
-- 
2.39.2


