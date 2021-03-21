Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E1D3433B5
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 18:25:20 +0100 (CET)
Received: from localhost ([::1]:49724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO1pH-0003b9-Vt
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 13:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1j4-0007Ov-OD
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1iu-0005Rv-1a
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616347123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMxlVTJlwTWszth46Tb6T+koSZbQnej0xUVwac2Dysk=;
 b=CXqLeteq+QflVU+I/qYFL2Y1trrJbjdor9TxBajRtNt6RA0f0nxToHLZ8E04SAMHGlHJkM
 ywt0Bf8zOLwuQ/xx62X6UDdeV765JqTIBIAYJc+kn0LSKmbdYNueftlp/Iw+UcbTy4B/0u
 LPWrCvBZL3flFrdErlTFHoW7o5e0BZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-R7rEicHnPOWdqB6pWm76ug-1; Sun, 21 Mar 2021 13:18:41 -0400
X-MC-Unique: R7rEicHnPOWdqB6pWm76ug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEE2F80006E;
 Sun, 21 Mar 2021 17:18:39 +0000 (UTC)
Received: from thuth.com (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 438305D9CD;
 Sun, 21 Mar 2021 17:18:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/5] configure: fix for SunOS based systems
Date: Sun, 21 Mar 2021 18:18:31 +0100
Message-Id: <20210321171833.20736-4-thuth@redhat.com>
In-Reply-To: <20210321171833.20736-1-thuth@redhat.com>
References: <20210321171833.20736-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David CARLIER <devnexen@gmail.com>

local directive make the configure fails on these systems.

Signed-off-by: David Carlier <devnexen@gmail.com>
Message-Id: <CA+XhMqy95D8X-QvBcEfL=a-Rkgy6aJtheskkqZwQkreru+T_Wg@mail.gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 847bc4d095..61872096a8 100755
--- a/configure
+++ b/configure
@@ -111,7 +111,7 @@ error_exit() {
 do_compiler() {
     # Run the compiler, capturing its output to the log. First argument
     # is compiler binary to execute.
-    local compiler="$1"
+    compiler="$1"
     shift
     if test -n "$BASH_VERSION"; then eval '
         echo >>config.log "
-- 
2.27.0


