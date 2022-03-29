Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67264EB54B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:28:41 +0200 (CEST)
Received: from localhost ([::1]:43806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJOK-0000CT-OQ
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:28:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIge-0006RV-Ap; Tue, 29 Mar 2022 16:43:34 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:58440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgb-0006tX-IS; Tue, 29 Mar 2022 16:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=J1qakdUaEOEbP3EcoPKgdyXlRBkSxQ8zIGx9i00pt9c=; 
 t=1648586609;x=1649192009; 
 b=zL2vkyTDlr9b8t1E74s9E79BrrtXRKo2xRNKw3Xqf/hxLzaDLkdJZAscxXwEmGPyLEWgViqHT9CTSBK1r3atDm9D/FJJAfPCqdfqblRyahcJt3uLk83AFcnBBfoH934av9daJHwsz/jTLxUUDPDreSpZAZOhOg8DwJaoBzNo1xmyUQJodigSh9QlSs7hHU+Q7r6VS5NLXzizebN6CYWvUvUy9gYwcxtClgHvngevghJWVuFp2mQXULqm9zsKr1ibswvvRcW3o5G9Jn0sYQQ5S6aKm/ALHYI2h12lqgGaPJFR6RVDjmi44wLzL2/1phA04eqk1yk8zr8VKbAjk8AvoA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIgF-000374-Iz; Tue, 29 Mar 2022 23:43:07 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 30/45] block: bdrv_insert_node(): use BDRV_O_NOPERM
Date: Tue, 29 Mar 2022 23:40:52 +0300
Message-Id: <20220329204107.411011-31-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6163EE6E06DD4447CEC1754C785D0B844400894C459B0CD1B9748C20A9E4288C13A0DE39A0289CF3B9C206EF2094F4D7341E8733F5BB4BDA8C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE79961E86438F5BDAEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375CC217B55A7C05578638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88F8137A02B1206E7C51332809AB9E6226F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE79FEEBCD9E13F050E9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FCB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BE2CCD8F0CAA010FB389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637EDAD75E181AE3ED6D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7BE66C62EBF8BF55BEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C328505141BAE32B3435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F5E152AA041FCDE0229C81168D8F6D70609C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D341C998A3771F0415349F474DE687B73BDFB85FD6F12562CC62E81BC0D211B997A601F5CB78CFBCCDF1D7E09C32AA3244C12F49C054FE5BB82C5BE147BF98F3E97858039643087248083B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGbw+VrT5q7a1Q==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE336C705384C873166238312533C3A04D213DB349BF08F646E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Further bdrv_replace_node will refresh permissions anyway, so we can
avoid intermediate permission conflicts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index a3bc28cf32..d4d0adc6c8 100644
--- a/block.c
+++ b/block.c
@@ -5267,8 +5267,8 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
 
     node_name = qdict_get_try_str(options, "node-name");
 
-    new_node_bs = bdrv_new_open_driver_opts(drv, node_name, options, flags,
-                                            errp);
+    new_node_bs = bdrv_new_open_driver_opts(drv, node_name, options,
+                                            flags | BDRV_O_NOPERM, errp);
     options = NULL; /* bdrv_new_open_driver() eats options */
     if (!new_node_bs) {
         error_prepend(errp, "Could not create node: ");
-- 
2.35.1


