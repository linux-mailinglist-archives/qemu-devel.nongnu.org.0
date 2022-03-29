Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0F04EB4D1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:45:51 +0200 (CEST)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIis-000761-JW
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:45:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIek-0003UP-Jk; Tue, 29 Mar 2022 16:41:34 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:43230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIei-0006YT-Pb; Tue, 29 Mar 2022 16:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=84L85vIWkkHJmUkmAtGcwU2r9aOqmmAWEEYXAesWkO4=; 
 t=1648586492;x=1649191892; 
 b=tGatJ6fuwcrHQwP/oZg4uXaoZABwrCJ5Hr6VgeYkVvmz/ucjCVNXxqnu6SmFYBT5u7sZ8gDa6S9I1X9/dP9Ce+GJvr3hDoWFY5gYYnpWUk+9Pm3U7WwM+zmXQVW1eIQ8r8X8Zq2Y/5ABNweuELSaTCDaCs/TI1UW89AH+qe27rwzUxdOePe29V0ZH3AhpAXyPa63uF8nfqcYHKSNW/gJvRx0KVZ5KjMeT1MsqWMpGAJdUYw+8G5q3X2lvq5OfDoZV3gC/mzden51Z4fNnWSlr7eDSFmN+i7j5b8sYNRBUthYKiigHKA9BqNurA7IGnvjJWOTI4Jp77vJKO4+n0qIvg==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIeg-000374-0o; Tue, 29 Mar 2022 23:41:30 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH v4 01/45] block: BlockDriver: add .filtered_child_is_backing
 field
Date: Tue, 29 Mar 2022 23:40:23 +0300
Message-Id: <20220329204107.411011-2-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9B83DD81DD066BE64A182F30D711DF321C3181FFB50202F95182A05F5380850404C228DA9ACA6FE27153E9284F104A1A4D918493AE196CEBAF8F22AA4F79052FFB646630209F37A7F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74B7EDB5828CF9C27EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375769C641B9D7B8878638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88D24631D13E1008143DCC0990AAFB3A26F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7212612128AA291179FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B587F3D2152687E5CA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC42CE6FDBC42FF1EC3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637897F013DCFD1A724D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FCBE33A7817EDC1EF57739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F52F8809203CA790D90213485DC94F7C739C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349EC559D073CA5B6800A0D2AEDC99F0328B648F7C1B477B99DB4F285E7E06FD6EC7DE6A326292F5601D7E09C32AA3244C9467422ADDB0B4A79D2641B17BA48B99C3B3ADDA61883BB5DCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGZCcBn534MQKw==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE091173E07D0130562731BC14851E15D3EF5638EADA4E8A50E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Unfortunately not all filters use .file child as filtered child. Two
exclusions are mirror_top and commit_top. Happily they both are private
filters. Bad thing is that this inconsistency is observable through qmp
commands query-block / query-named-block-nodes. So, could we just
change mirror_top and commit_top to use file child as all other filter
driver is an open question. Probably, we could do that with some kind
of deprecation period, but how to warn users during it?

For now, let's just add a field so we can distinguish them in generic
code, it will be used in further commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block/commit.c            |  1 +
 block/mirror.c            |  1 +
 include/block/block_int.h | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/block/commit.c b/block/commit.c
index b1fc7b908b..b2e7be0b1f 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -237,6 +237,7 @@ static BlockDriver bdrv_commit_top = {
     .bdrv_child_perm            = bdrv_commit_top_child_perm,
 
     .is_filter                  = true,
+    .filtered_child_is_backing  = true,
 };
 
 void commit_start(const char *job_id, BlockDriverState *bs,
diff --git a/block/mirror.c b/block/mirror.c
index 69b2c1c697..87f6a9dd8d 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1577,6 +1577,7 @@ static BlockDriver bdrv_mirror_top = {
     .bdrv_child_perm            = bdrv_mirror_top_child_perm,
 
     .is_filter                  = true,
+    .filtered_child_is_backing  = true,
 };
 
 static BlockJob *mirror_start_job(
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 27008cfb22..5ed61bb079 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -117,6 +117,20 @@ struct BlockDriver {
      * (And this filtered child must then be bs->file or bs->backing.)
      */
     bool is_filter;
+
+    /*
+     * Only make sense for filter drivers, for others must be false.
+     * If true, filtered child is bs->backing. Otherwise it's bs->file.
+     * Only two internal filters use bs->backing as filtered child and has this
+     * field set to true: mirror_top and commit_top.
+     *
+     * Never create any more such filters!
+     *
+     * TODO: imagine how to deprecate this behavior and make all filters work
+     * similarly using bs->file as filtered child.
+     */
+    bool filtered_child_is_backing;
+
     /*
      * Set to true if the BlockDriver is a format driver.  Format nodes
      * generally do not expect their children to be other format nodes
-- 
2.35.1


