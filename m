Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267732F76B2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:31:12 +0100 (CET)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MNr-0002dU-5U
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHY-000357-NB
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHV-0007uM-N2
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610706277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MYBIpL3oyEoPKi1X23Tx0weq37PExo0fvKLjB6uMuhA=;
 b=XTJDMuIEw8jr1KOevIBqfHCha8DUoqqKdi3j7jbArIX8P1JiZG7vYU5mxKjoH9vZkYSep4
 PwcH7JJUfxz+21GwYATBMg6C6lfprCrqp0+VEtV/9UYRdomF7nAQN77vnTH326e4LrO9/b
 8Ah3vOEFYkDhxPlTOQFaoUJf9fJBChk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-kr0CM-jjMnyIneXhc3eyXw-1; Fri, 15 Jan 2021 05:24:34 -0500
X-MC-Unique: kr0CM-jjMnyIneXhc3eyXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDF6D806664;
 Fri, 15 Jan 2021 10:24:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6CFE629DA;
 Fri, 15 Jan 2021 10:24:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BC158180063C; Fri, 15 Jan 2021 11:24:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/11] vnc: fix unfinalized tlscreds for VncDisplay
Date: Fri, 15 Jan 2021 11:24:19 +0100
Message-Id: <20210115102424.1360437-7-kraxel@redhat.com>
In-Reply-To: <20210115102424.1360437-1-kraxel@redhat.com>
References: <20210115102424.1360437-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Zihao Chang <changzihao1@huawei.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zihao Chang <changzihao1@huawei.com>

In vnc_display_open(), if tls-creds is enabled, do object_ref(object
ref 1->2) for tls-creds. While in vnc_display_close(), object_unparent
sets object ref to 1(2->1) and  unparent the object for root.
Problem:
1. the object can not be found from the objects_root, while the object
is not finalized.
2. the qemu_opts of tls-creds(id: creds0) is not deleted, so new tls
object with the same id(creds0) can not be delete & add.

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210111131911.805-1-changzihao1@huawei.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 7452ac7df2ce..69e92b1ef361 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3234,7 +3234,7 @@ static void vnc_display_close(VncDisplay *vd)
     vd->auth = VNC_AUTH_INVALID;
     vd->subauth = VNC_AUTH_INVALID;
     if (vd->tlscreds) {
-        object_unparent(OBJECT(vd->tlscreds));
+        object_unref(OBJECT(vd->tlscreds));
         vd->tlscreds = NULL;
     }
     if (vd->tlsauthz) {
-- 
2.29.2


