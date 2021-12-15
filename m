Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D412347569E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:43:14 +0100 (CET)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRkf-00088J-US
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:43:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaV-0002yb-1q
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaS-0007Hk-Et
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ueqG1EF3qxBlRxx0QWcB94/JCSj03U7TM7FSAKTreEA=;
 b=Vz7o2Vctxyfr19pWRqnWg5/ybE5CQIlxgPPysqvcbyPWx3ANjfJ/BlCpCnouPZiuqkDLY/
 f3wYJWkcJI2SMNfohC/qxBWmH4wfX7xHaua0oQyM4OfWgoNih/i0tyO8EZ2/AF51wKoTBM
 EWX6sgyM8ktDlmudh4DzNAsupdBaiU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-2nRsaIw4OPuWqEwR-42bvA-1; Wed, 15 Dec 2021 05:32:35 -0500
X-MC-Unique: 2nRsaIw4OPuWqEwR-42bvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C75E10144E0;
 Wed, 15 Dec 2021 10:32:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9986275C43;
 Wed, 15 Dec 2021 10:32:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/18] dump: Remove is_zero_page()
Date: Wed, 15 Dec 2021 11:32:06 +0100
Message-Id: <20211215103218.17527-7-quintela@redhat.com>
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
References: <20211215103218.17527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It just calls buffer_is_zero().  Just change the callers.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 dump/dump.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 662d0a62cd..a84d8b1598 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1293,14 +1293,6 @@ static size_t get_len_buf_out(size_t page_size, uint32_t flag_compress)
     return 0;
 }
 
-/*
- * check if the page is all 0
- */
-static inline bool is_zero_page(const uint8_t *buf, size_t page_size)
-{
-    return buffer_is_zero(buf, page_size);
-}
-
 static void write_dump_pages(DumpState *s, Error **errp)
 {
     int ret = 0;
@@ -1357,7 +1349,7 @@ static void write_dump_pages(DumpState *s, Error **errp)
      */
     while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
         /* check zero page */
-        if (is_zero_page(buf, s->dump_info.page_size)) {
+        if (buffer_is_zero(buf, s->dump_info.page_size)) {
             ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
                               false);
             if (ret < 0) {
-- 
2.33.1


