Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B54D91D1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 01:54:43 +0100 (CET)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTvST-0003tB-Vz
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 20:54:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nTsJ4-0007u0-3D; Mon, 14 Mar 2022 17:32:46 -0400
Received: from smtp17.mail.ru ([94.100.176.154]:43154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nTsJ1-00066A-Pz; Mon, 14 Mar 2022 17:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=BZcZl+ibxpoy9pH63U1OaQFRibkWurJj8p2UBSNkI8c=; 
 t=1647293563;x=1647898963; 
 b=qXHyWNFwqBDVDK046JPRWtQvPtAQjFhnmtAq2J0ygYydikemPI7ZjiqGMrSg/rEry2Mym2t215rJCZNE3UUKXegX979CfdM0QsuxOfSX6SJTgERG00Zn09aNrHLc9AgwBbktAehVa5JFBmQNea1g96K1SqgeVIV3Jbd6qSdkf1EjHDyfwGJWhHb1yHb8u/5ONd9wm1jsmLNJ4I3CTf7v2/SF730ft5Q4DqoZtQCWv+wwM6mgJCAD9pZ0AUcrRm4pHNvHjXdQLUj/uSY6hXKT/+u8HOl7AQR8B8AY+rr/xup2Yx8O7bkBLBzfbgdfY1egcaKj26QCh5XA2gQdotIx5A==;
Received: by smtp17.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nTsIw-0004pZ-BA; Tue, 15 Mar 2022 00:32:38 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, v.sementsov-og@ya.ru,
 v.sementsov-og@mail.ru, eblake@redhat.com, yuriy.vasiliev@virtuozzo.com
Subject: [PATCH v2 for-7.1 0/3] qapi: nbd-export: select bitmap by node/name
 pair
Date: Tue, 15 Mar 2022 00:32:23 +0300
Message-Id: <20220314213226.362217-1-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp17.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196DC6E89A8CCEF2E51DF9B70E0E78BE6910182A05F538085040996086C312E66135A25329AAAC0CB487DF6051A498515D382BF05D2BCA7869A2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BCC85671EC7A750CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637352A1F9739ED04D38638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D46ED5434DA56D82F00152EAA9D0DB876F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE709B92020B71E24959FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B791E6C230873D55CA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC228CA35136EEE5753AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637458C7ED40C6FEF75EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3281D9C1DFF1F1E7335872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CD97CDA27012969F6D9FF55D2CBBE39124CD8C6EEEA02C7FE9C2B6934AE262D3EE7EAB7254005DCED72BA2F3FAE7579DB1E0A4E2319210D9B64D260DF9561598F01A9E91200F654B069F8FEF10F1C2C2993EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349320586B19AD2C7276D4868876F689285CBB3C5DD7261187B9E78F395AB204280961DA391E9ABE8B1D7E09C32AA3244C2C5C47480A94E59BB64FC93FBF3E721EA90944CA99CF22E3ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqbhzdNy/MvgZJ4+1iUfH9g==
X-Mailru-Sender: 6C3E74F07C41AE94C4973423E83F3A159D968AF17CAB6850BA632F122C71448CC16467F3597DCACCE6462B2528CDCABCB7EB570DD03A1E57B847871DB86736497E5CFB87F3DDD4B722B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
Received-SPF: pass client-ip=94.100.176.154;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp17.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Mar 2022 20:52:35 -0400
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

From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>

Hi all!

Here is small improvement for bitmap exporting interface.

v2: Sorry for the noise, me trying to find a email service, that don't
consider sending patch series by git-send-email as as spam :/

Vladimir Sementsov-Ogievskiy (3):
  qapi: rename BlockDirtyBitmapMergeSource to BlockDirtyBitmapOrStr
  qapi: nbd-export: allow select bitmaps by node/name pair
  iotests/223: check new possibility of exporting bitmaps by node/name

 block/monitor/bitmap-qmp-cmds.c        |  6 +--
 blockdev-nbd.c                         |  8 +++-
 include/block/block_int-global-state.h |  2 +-
 nbd/server.c                           | 63 +++++++++++++++++---------
 qapi/block-core.json                   |  6 +--
 qapi/block-export.json                 |  5 +-
 qemu-img.c                             |  8 ++--
 qemu-nbd.c                             | 11 ++++-
 tests/qemu-iotests/223                 | 16 +++++++
 tests/qemu-iotests/223.out             | 47 ++++++++++++++++++-
 10 files changed, 133 insertions(+), 39 deletions(-)

-- 
2.35.1


