Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BB35FD628
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 10:25:41 +0200 (CEST)
Received: from localhost ([::1]:39234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oitXA-0002tH-ER
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 04:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6E-0005Wk-2e
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois69-0006u6-8p
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665644020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ikFCKxzwAATzDhF0GILYkTYichUaaKdjHXijr3jLnvo=;
 b=EoLF5magveIwRDEZJCdIwz3A/3iHfXxO1E0AnUBbFtlO0xcqpmbj6V5cIW+n2/azQzu+R1
 bNC/pgR5OE1xB7VXxOZK5PD/ma3UcrBW59Lx4JFATvCa57Tfy36/Y6K2uzm9ToO1x7wb4b
 XD0M8VY6oB6KPhMLPLyAymqIgAeuMjQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-vYT_5PLqPiO1Wxj6klbu4g-1; Thu, 13 Oct 2022 02:53:34 -0400
X-MC-Unique: vYT_5PLqPiO1Wxj6klbu4g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55FEA29DD994;
 Thu, 13 Oct 2022 06:53:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC8C6492B05;
 Thu, 13 Oct 2022 06:53:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 19DF818009C2; Thu, 13 Oct 2022 08:52:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 TangPeng <tangpeng@qianxin.com>
Subject: [PULL 13/26] ui/vnc-clipboard: fix integer underflow in
 vnc_client_cut_text_ext
Date: Thu, 13 Oct 2022 08:52:11 +0200
Message-Id: <20221013065224.1864145-14-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Matteo Cascella <mcascell@redhat.com>

Extended ClientCutText messages start with a 4-byte header. If len < 4,
an integer underflow occurs in vnc_client_cut_text_ext. The result is
used to decompress data in a while loop in inflate_buffer, leading to
CPU consumption and denial of service. Prevent this by checking dlen in
protocol_client_msg.

Fixes: CVE-2022-3165
Fixes: 0bf41cab93e5 ("ui/vnc: clipboard support")
Reported-by: TangPeng <tangpeng@qianxin.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Message-Id: <20220925204511.1103214-1-mcascell@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 6a05d061479e..acb3629cd8e2 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2442,8 +2442,8 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
         if (len == 1) {
             return 8;
         }
+        uint32_t dlen = abs(read_s32(data, 4));
         if (len == 8) {
-            uint32_t dlen = abs(read_s32(data, 4));
             if (dlen > (1 << 20)) {
                 error_report("vnc: client_cut_text msg payload has %u bytes"
                              " which exceeds our limit of 1MB.", dlen);
@@ -2456,8 +2456,13 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
         }
 
         if (read_s32(data, 4) < 0) {
-            vnc_client_cut_text_ext(vs, abs(read_s32(data, 4)),
-                                    read_u32(data, 8), data + 12);
+            if (dlen < 4) {
+                error_report("vnc: malformed payload (header less than 4 bytes)"
+                             " in extended clipboard pseudo-encoding.");
+                vnc_client_error(vs);
+                break;
+            }
+            vnc_client_cut_text_ext(vs, dlen, read_u32(data, 8), data + 12);
             break;
         }
         vnc_client_cut_text(vs, read_u32(data, 4), data + 8);
-- 
2.37.3


