Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49715368551
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:56:11 +0200 (CEST)
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZccc-0004j6-5B
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZcR0-0003UF-82
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:44:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZcQo-0001OD-OP
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619109837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxW29+HaiMOgTpIgxteuMoZpgjilsyB9n2J9Od4Fm0o=;
 b=YjS4NAzFmB5toQMEwbaolgovJ5g70tBma3cr4ruDnflhqS21JdZrXoHgZYOgnUk2e/XAg4
 uxNSyUCSvSFTDvaLN94/2S5jtOm3SFYsVIMqIJthDPdafo+XsbF1A/FrSEPq80A3oLM8UF
 U598BY4MuBkHqq+TM2bk7Wx5pi3Z1b0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-AYBc2BwLNqaZRYKS_rg5IQ-1; Thu, 22 Apr 2021 12:43:55 -0400
X-MC-Unique: AYBc2BwLNqaZRYKS_rg5IQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EB3410054F6;
 Thu, 22 Apr 2021 16:43:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-159.ams2.redhat.com [10.36.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 717F35C261;
 Thu, 22 Apr 2021 16:43:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/2] qemu-img convert: Unshare write permission for source
Date: Thu, 22 Apr 2021 18:43:44 +0200
Message-Id: <20210422164344.283389-3-kwolf@redhat.com>
In-Reply-To: <20210422164344.283389-1-kwolf@redhat.com>
References: <20210422164344.283389-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
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


