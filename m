Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23CA36F9A3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:53:31 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRi6-0007fW-NG
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQmE-0005qm-41
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQmC-0003AE-6G
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjDPy6h2GQbuQPDIrNborb6rASENS5Vv9LFPLy7WiFs=;
 b=S/fDdzA1duCyniQAHlyjkosw4nf6Oi9LVji0teGS58aEb8G863B7vYg0CjTKEw/APZRGWS
 lCOgiPOlBP3At0vb0caRHdgWEUDEW2+SCsah+8S6xMu1FzXXMp6fTVCP63QSJ6JfV7YiEl
 HX+JH0Yw8926zhkFJIdkWxwthLUCCuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-pwKQDj4GOZ-wAbnnLxGXdA-1; Fri, 30 Apr 2021 06:53:37 -0400
X-MC-Unique: pwKQDj4GOZ-wAbnnLxGXdA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 335755B38D;
 Fri, 30 Apr 2021 10:53:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 438455F707;
 Fri, 30 Apr 2021 10:53:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 38/39] qemu-img convert: Unshare write permission for source
Date: Fri, 30 Apr 2021 12:51:46 +0200
Message-Id: <20210430105147.125840-39-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a successful conversion of an image, we must make sure that its
content doesn't change during the conversion.

A special case of this is using the same image file both as the source
and as the destination. If both input and output format are raw, the
operation would just be useless work, with other formats it is a sure
way to destroy the image. This will now fail because the image file
can't be opened a second time for the output when opening it for the
input has already acquired file locks to unshare BLK_PERM_WRITE.

Nevertheless, if there is some reason in a special case why it is
actually okay to allow writes to the image while it is being converted,
-U can still be used to force sharing all permissions.

Note that for most image formats, BLK_PERM_WRITE would already be
unshared by the format driver, so this only really makes a difference
for raw source images (but any output format).

Reported-by: Xueqiang Wei <xuwei@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210422164344.283389-3-kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-img.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index babb5573ab..a5993682aa 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2146,7 +2146,7 @@ static void set_rate_limit(BlockBackend *blk, int64_t rate_limit)
 
 static int img_convert(int argc, char **argv)
 {
-    int c, bs_i, flags, src_flags = 0;
+    int c, bs_i, flags, src_flags = BDRV_O_NO_SHARE;
     const char *fmt = NULL, *out_fmt = NULL, *cache = "unsafe",
                *src_cache = BDRV_DEFAULT_CACHE, *out_baseimg = NULL,
                *out_filename, *out_baseimg_param, *snapshot_name = NULL;
-- 
2.30.2


