Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674B752A053
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 13:24:14 +0200 (CEST)
Received: from localhost ([::1]:36462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqvJF-0006hv-FL
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 07:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqv7q-0005y8-0N; Tue, 17 May 2022 07:12:27 -0400
Received: from smtp60.i.mail.ru ([217.69.128.40]:47424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqv7m-0006cY-Mu; Tue, 17 May 2022 07:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=lXeFWzl1NTbHm0tWova+0uwktU3BNMNgfPD1tTKDC+g=; 
 t=1652785942;x=1653391342; 
 b=GBI3TUiIsM/p6pmeqZ7m62sg2ovuVErJMiizCeQBSWjdiALWpNcvlkVs127CycPCckomn90okt20jDBsK2Zr+G+IRn6ziZCMmGvAurBg1RzlIQNMlgmovUJrRwFxidOtJsNxDpOnlw5E7ASvI7UnjbU5jV2VKSNENGopUWTTKpNKqAPdCyegDNYYEynNJIUK23LrXv7nSXlKUQk3g98H7lHjOBXVahCFUQqcqIn553LJZ1p082vi2ykI85kRdR/krj8QFT133YyhAuS9iVuVBTYrw/eA9yn1xYbYqjCRKZFu18F0oLEiralmWlBpNDMSwpcDrZJ5ibDh1z4gXVhtCQ==;
Received: by smtp60.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nqv7i-0000gZ-9I; Tue, 17 May 2022 14:12:18 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PATCH v4 1/3] block: block_dirty_bitmap_merge(): fix error path
Date: Tue, 17 May 2022 14:12:04 +0300
Message-Id: <20220517111206.23585-2-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517111206.23585-1-v.sementsov-og@mail.ru>
References: <20220517111206.23585-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp60.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9AB830312DE1E2EF80445B7287171AC0AAB135BFD257B16CA182A05F53808504070A2259CC62BA75DC980702FC437F40EA487356702ACCF71FAD089AF8EADD811
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70312E9A300D47E3BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637A69A378178A91E348638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8028854DC24ABB61E2CC9733371944C106F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74A95F4E53E8DCE969FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCDC33BF1C4DF763763AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063768889A976CB567F3D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F3F410F14AF5AD977156CCFE7AF13BCA4B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBB0624710993A7B7B75A1415F4E783A9E06CE7118C150E429C2B6934AE262D3EE7EAB7254005DCED1C39E39C5FB3188C4EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF503031C89702B531498E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34324A9840C798D500656C01C4AF402F7D8350087D04C516DE46402529BC7ED6341BBC2DBFF90C3EED1D7E09C32AA3244CE65009A008034114BE0D2D135BA91A1581560E2432555DBB27AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3fsA429394OdaXGVcyyDfg==
X-Mailru-Sender: 6C3E74F07C41AE9425C26D04B7325D44E891999DDF3A5D61B567A3E9F70B9B48E6FC31F8B608FCDFE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.40;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp60.i.mail.ru
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

At the end we ignore failure of bdrv_merge_dirty_bitmap() and report
success. And still set errp. That's wrong.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/monitor/bitmap-qmp-cmds.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 2b677c4a2f..bd10468596 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -309,7 +309,10 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     }
 
     /* Merge into dst; dst is unchanged on failure. */
-    bdrv_merge_dirty_bitmap(dst, anon, backup, errp);
+    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
+        dst = NULL;
+        goto out;
+    }
 
  out:
     bdrv_release_dirty_bitmap(anon);
-- 
2.35.1


