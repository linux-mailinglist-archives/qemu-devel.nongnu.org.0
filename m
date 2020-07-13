Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1844121D815
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 16:16:01 +0200 (CEST)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juzFQ-0004bS-41
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 10:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1juzAe-0004fo-3Z
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 10:11:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41671
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1juzAb-0006a2-H7
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 10:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594649460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/sDGej+C5cxprRRXVaQrWzRIcyZUE7Yr6mfIQ+XUx9Q=;
 b=OR/3nQpCrtHREKfqdEJ+DhBx+Kr19c/bW0SPv4IxpqxkfJVk/vlWkl7rrlT+Hfg+9mZy3C
 +rPQLeWxWuh6QYzek0w5tnGnFz71sdtQNvrSMNZ9GopbVNneTZTpdeq1bkDc+cMUMa1KKp
 HMbgT+J+LGYQJPw2f/zCTZcIdiWo3yM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-u3uV7qeSNNOWatLgm9hhUQ-1; Mon, 13 Jul 2020 10:10:54 -0400
X-MC-Unique: u3uV7qeSNNOWatLgm9hhUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71D3D8027E2;
 Mon, 13 Jul 2020 14:10:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0264C73029;
 Mon, 13 Jul 2020 14:10:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1FD6E3EBB8; Mon, 13 Jul 2020 16:10:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] ossaudio: fix out of bounds write
Date: Mon, 13 Jul 2020 16:10:46 +0200
Message-Id: <20200713141049.2241-2-kraxel@redhat.com>
In-Reply-To: <20200713141049.2241-1-kraxel@redhat.com>
References: <20200713141049.2241-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 03:20:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

In function oss_read() a read error currently does not exit the
read loop. With no data to read the variable pos will quickly
underflow and a subsequent successful read overwrites memory
outside the buffer. This patch adds the missing break statement
to the error path of the function.

To reproduce start qemu with -audiodev oss,id=audio0 and in the
guest start audio recording. After some time this will trigger
an exception.

Fixes: 3ba4066d08 "ossaudio: port to the new audio backend api"

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 20200707180836.5435-1-vr_qemu@t-online.de
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/ossaudio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index f88d076ec236..a7dcaa31adeb 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -691,6 +691,7 @@ static size_t oss_read(HWVoiceIn *hw, void *buf, size_t len)
                            len, dst);
                 break;
             }
+            break;
         }
 
         pos += nread;
-- 
2.18.4


