Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A386D4EB4E3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:54:10 +0200 (CEST)
Received: from localhost ([::1]:59266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIqt-00030l-TO
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:54:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIf4-0003qq-QF; Tue, 29 Mar 2022 16:41:56 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:57088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIey-0006c3-Jf; Tue, 29 Mar 2022 16:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=lqTXm5R1XXeEJWrZX9n4yFOPzx2AU3dqCdoDOaRQclg=; 
 t=1648586508;x=1649191908; 
 b=O8zEJHcTQNbIXDZSfNR/y3+71S/MRtOY6WP5QfN8rb+IypJzP4OD5swgiy7k6Wjl+E9wd4DRHVGkVk9RvtaJ70JrCojxjOTWIaXXgYth4eVZ5NUzMA5BA7Eu6MICLFRcqZ+hgD+LJEEsDnp+EEmqA+UuLhq7EeFWk93hejFPD1NJGZCiJaE1gknoEuGnL8O1mwBDGpMj+D5HMdi3mWHJxtNeECmJmc6S662cXoWy/iyTLoZOEXBvWcHYQ0MPzZVsH0hhDNCKRQEdbQ0kL+hDwtSJ1/ti8eaDqfwnRNn3459tpKnXJRPEDl3O8qk9QEOT7dKrrNlHrJoRWWaXVVuSrA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIew-000374-G4; Tue, 29 Mar 2022 23:41:46 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 07/45] block: document connection between child roles and
 bs->backing/bs->file
Date: Tue, 29 Mar 2022 23:40:29 +0300
Message-Id: <20220329204107.411011-8-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9B83DD81DD066BE64A182F30D711DF321C3181FFB50202F95182A05F5380850404C228DA9ACA6FE27E505E6F939F6EBBEDE4143B5F91DE108561097D9C6D40B900E190F2235974A63
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77BF46084C0059042EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063748E7A03516F25E8E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D850A319BEF7FD09F54DA69BD0A3792F0A6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7E4DF6D1C10F22F599FA2833FD35BB23D9E625A9149C048EECCD848CCB6FE560CBDFBBEFFF4125B51D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B4AFB60FD1831C04CA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC0D120E52B0EA0311D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7F14938A4A9A7FB0CEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3BFED8EC40EBB00D735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F532C55A9F3982E1032EFC514806A55B079C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C1E32F4AD4B2486B26D5C59B0BA9D51821B17D419BAE9ADB2F8EFB9E21218FE61E2FFBFD5D6037401D7E09C32AA3244C5E72A7BD6C1FFEE7AFA3E7DB973FE1317101BF96129E401183B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGa82XpFw3gvpA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE091173E07D01305619F0F8713184ADB6136C4C4BDE141158E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Make the informal rules formal. In further commit we'll add
corresponding assertions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 include/block/block.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 2783f77dc2..768273b2db 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -291,6 +291,48 @@ enum {
  *
  * At least one of DATA, METADATA, FILTERED, or COW must be set for
  * every child.
+ *
+ *
+ * = Connection with bs->children, bs->file and bs->backing fields =
+ *
+ * 1. Filters
+ *
+ * Filter drivers has drv->is_filter = true.
+ *
+ * Filter driver has exactly one FILTERED|PRIMARY child, any may have other
+ * children which must not have these bits (the example is copy-before-write
+ * filter that also has target DATA child).
+ *
+ * Filter driver never has COW children.
+ *
+ * For all filters except for mirror_top and commit_top, the filtered child is
+ * linked in bs->file, bs->backing is NULL.
+ *
+ * For mirror_top and commit_top filtered child is linked in bs->backing and
+ * their bs->file is NULL. These two filters has drv->filtered_child_is_backing
+ * = true.
+ *
+ * 2. "raw" driver (block/raw-format.c)
+ *
+ * Formally it's not a filter (drv->is_filter = false)
+ *
+ * bs->backing is always NULL
+ *
+ * Only has one child, linked in bs->file. It's role is either FILTERED|PRIMARY
+ * (like filter) either DATA|PRIMARY depending on options.
+ *
+ * 3. Other drivers
+ *
+ * Doesn't have any FILTERED children.
+ *
+ * May have at most one COW child. In this case it's linked in bs->backing.
+ * Otherwise bs->backing is NULL. COW child is never PRIMARY.
+ *
+ * May have at most one PRIMARY child. In this case it's linked in bs->file.
+ * Otherwise bs->file is NULL.
+ *
+ * May also have some other children that don't have neither PRIMARY nor COW
+ * bits set.
  */
 enum BdrvChildRoleBits {
     /*
-- 
2.35.1


