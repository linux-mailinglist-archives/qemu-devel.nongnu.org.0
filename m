Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD77E2F7CDA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:40:28 +0100 (CET)
Received: from localhost ([::1]:52434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PL1-00062f-TO
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:40:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3N-000770-SH
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003Ji-P5
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UaJlBs1RGlo85pE8iAhyfpmd5b7xGp0eRC8W6g+hVs0=;
 b=LljGopQnK1hCJJb7i7FpQPA25D4iJs6+6C2g1EK2A45MGdKIf4WrG5aFPLmT9aZMk2OglM
 Z1JsyKuXoQquakOkOstN7Y1ZcT2w0oJCNIpqM1+XANIitUhr46CJSHBraNRdymI60HUVYI
 QeviHff9iGAirSAdvs7pxNBadAiCDuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-fbrE8W3INZaBbElZKokeZw-1; Fri, 15 Jan 2021 08:21:58 -0500
X-MC-Unique: fbrE8W3INZaBbElZKokeZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8629180A093;
 Fri, 15 Jan 2021 13:21:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A87E26F963;
 Fri, 15 Jan 2021 13:21:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7148F1800D58; Fri, 15 Jan 2021 14:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/30] audio: Don't use '%#' in format strings
Date: Fri, 15 Jan 2021 14:21:44 +0100
Message-Id: <20210115132146.1443592-29-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zhang Han <zhanghan64@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Han <zhanghan64@huawei.com>

Use '0x' prefix instead of '%#'

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210115012431.79533-1-zhanghan64@huawei.com
Message-Id: <20210115012431.79533-6-zhanghan64@huawei.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/dsoundaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 3b4afb949631..cfc79c129eee 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -215,7 +215,7 @@ static void dsound_log_hresult (HRESULT hr)
         break;
 #endif
     default:
-        AUD_log (AUDIO_CAP, "Reason: Unknown (HRESULT %#lx)\n", hr);
+        AUD_log (AUDIO_CAP, "Reason: Unknown (HRESULT 0x%lx)\n", hr);
         return;
     }
 
-- 
2.29.2


