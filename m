Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A864EB4D5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:49:10 +0200 (CEST)
Received: from localhost ([::1]:49254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIm4-0004Ou-S2
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:49:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIeo-0003ad-0L; Tue, 29 Mar 2022 16:41:38 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:46942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIem-0006Z6-Ff; Tue, 29 Mar 2022 16:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=tew6AZN+3yNVtEoncd/8R2QWHOGmZYeJ96GJPg5WNbw=; 
 t=1648586496;x=1649191896; 
 b=XiaY1kmgFXw5oPREJrxSW/qvwJH4ZMPnvqbCw8Bx8Pu+UHQBHLTfz6jiq/JmAnxxfsI6ONvaZHlhpmqairxnzaGAQ8T+TqmVZWf0ziaeSSqEYkytebJvvM9QYcVv63G7UDeCtqTV/cblZDVfw0L0bLjFPakWnb24AqfQZlgaKFTD+JNjWH81u4lZt8h5Oz18T9m5tL1vc8ASQTnjo9ZA+QX/C8uvoegCEOn1cGetsiZVWIBcwP174sirIUAFaOyRxv0ukxmIAGxsmjSqR1NLeIMcGrH8/lq6Fo6ZT3/O/kwWWtQS6D/8/3iuaIq0bLS3qHzwQNRRtxsLeBnQy/Ut3Q==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIek-000374-Ff; Tue, 29 Mar 2022 23:41:34 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Ari Sundholm <ari@tuxera.com>
Subject: [PATCH v4 03/45] block/blklogwrites: don't care to remove bs->file
 child on failure
Date: Tue, 29 Mar 2022 23:40:25 +0300
Message-Id: <20220329204107.411011-4-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61C24934C3AF654FA0FDE5B3EC8CDA719600894C459B0CD1B906F8343D3AD55182B369D90A2AF98D52C206EF2094F4D734CAABEEF29940EAE0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE748069E1E80091F23EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F10563012BA5CCB0EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA693B52E5C30F998B5F27152E306F879E620879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0ECC8AC47CD0EDEFF8941B15DA834481FA18204E546F3947C1F9513A7CA91E555F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637200F62B2C1E683AF389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637C69D4C8FA58DAC3AD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE72B994BE139E55FEAEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3A8421AA044726D3235872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F512706394DCE4E1C742CA7976F4CBBD589C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342B1F2AD168155B06D9547FF3509E0C191F7B9D1A48B79F389BDD8F5A209C9BC4CAED2063EB289FCE1D7E09C32AA3244C5C70CB3952C3E4EE6154F169FD49201D1DD47778AE04E04D8D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGZ2+z6w1aPpnw==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE091173E07D013056EB048371D2FE24940E8DDDA6A2AC5B7CE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

We don't need to remove bs->file, generic layer takes care of it. No
other driver cares to remove bs->file on failure by hand.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block/blklogwrites.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index f66a617eb3..7d25df97cc 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -254,10 +254,6 @@ fail_log:
         s->log_file = NULL;
     }
 fail:
-    if (ret < 0) {
-        bdrv_unref_child(bs, bs->file);
-        bs->file = NULL;
-    }
     qemu_opts_del(opts);
     return ret;
 }
-- 
2.35.1


