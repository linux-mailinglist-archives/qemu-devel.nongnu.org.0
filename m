Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE733C787
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:16:26 +0100 (CET)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtdZ-0003yO-56
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLta7-0000dH-Ea
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLta5-0006Qk-NE
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615839169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FQryee1zpvbpvoAixq97EqXj11iTriaoNB4hmqh/i4=;
 b=eTG4R8Iq0L5omtnjqNWciy11aPWFvWb09CtKhD3+4Ac+9q6scQKP0PsDRTs+tyIRABYDXF
 jNyLqKV2VXJHzFFEww95ziqaEGpQDYGi05lXLigXrksBwsXgMQF5CDJ7bjq6DLoRZ7wmdO
 fYtGq30C84D1Wm0JBd2IKLmoRtHcpc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-XEWQSye_M8iyFFd_18RKPw-1; Mon, 15 Mar 2021 16:12:47 -0400
X-MC-Unique: XEWQSye_M8iyFFd_18RKPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB75180006E;
 Mon, 15 Mar 2021 20:12:45 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-235.ams2.redhat.com
 [10.36.114.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAD995D768;
 Mon, 15 Mar 2021 20:12:37 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, vgoyal@redhat.com,
 wanghao232@huawei.com, ma.mandourr@gmail.com
Subject: [PULL 5/9] virtiofsd: Convert some functions to return bool
Date: Mon, 15 Mar 2021 20:12:11 +0000
Message-Id: <20210315201215.222539-6-dgilbert@redhat.com>
In-Reply-To: <20210315201215.222539-1-dgilbert@redhat.com>
References: <20210315201215.222539-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Both currently only return 0 or 1.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210312141003.819108-3-groug@kaod.org>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index cf453eea9b..b144320e48 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -223,17 +223,17 @@ static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
 static int xattr_map_client(const struct lo_data *lo, const char *client_name,
                             char **out_name);
 
-static int is_dot_or_dotdot(const char *name)
+static bool is_dot_or_dotdot(const char *name)
 {
     return name[0] == '.' &&
            (name[1] == '\0' || (name[1] == '.' && name[2] == '\0'));
 }
 
 /* Is `path` a single path component that is not "." or ".."? */
-static int is_safe_path_component(const char *path)
+static bool is_safe_path_component(const char *path)
 {
     if (strchr(path, '/')) {
-        return 0;
+        return false;
     }
 
     return !is_dot_or_dotdot(path);
-- 
2.30.2


