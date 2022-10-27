Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF3610048
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:34:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7fw-00019n-4h; Thu, 27 Oct 2022 14:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7ft-00018q-Fw
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7fr-0002O8-0g
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqUkFr+uJGxTf58esILLEguqYaISD1eOSCLdUBXFYwc=;
 b=Z59qmKEN5sVIOrtIs7YTs2IeL7L0Y5I9z6CJP76Aiq+ZaAzK2J3bPf4fKppg9JWnLsHCC1
 JtpIe72dxVmMZUC0xa4iU08UkeKHmKQCfzY8pcxDP6ovIstAkVIPuB/Ubk4nho6LdfamL1
 ezSOPGfP2ehWdbRbRY1AEbmBJjlnpLY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-t9MRmzsmMWiNiw6M3BM1mA-1; Thu, 27 Oct 2022 14:32:12 -0400
X-MC-Unique: t9MRmzsmMWiNiw6M3BM1mA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC35F3802BBC;
 Thu, 27 Oct 2022 18:32:06 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D595E112C06A;
 Thu, 27 Oct 2022 18:32:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 05/58] vvfat: allow spaces in file names
Date: Thu, 27 Oct 2022 20:30:53 +0200
Message-Id: <20221027183146.463129-6-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hervé Poussineau <hpoussin@reactos.org>

In R/W mode, files with spaces were never created on host side.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1176
Fixes: c79e243ed67683d6d06692bd7040f7394da178b0
Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221010175511.3414357-3-hpoussin@reactos.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vvfat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index e76b42dbaf..c5b1442145 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -499,7 +499,7 @@ static bool valid_filename(const unsigned char *name)
               (c >= 'A' && c <= 'Z') ||
               (c >= 'a' && c <= 'z') ||
               c > 127 ||
-              strchr("$%'-_@~`!(){}^#&.+,;=[]", c) != NULL))
+              strchr(" $%'-_@~`!(){}^#&.+,;=[]", c) != NULL))
         {
             return false;
         }
-- 
2.37.3


