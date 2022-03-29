Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE004EB4E1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:53:45 +0200 (CEST)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIqW-0001uV-DD
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:53:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIex-0003n6-Ar; Tue, 29 Mar 2022 16:41:48 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:51052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIet-0006a0-Es; Tue, 29 Mar 2022 16:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=HQoBbXmnsopxFtKYppNFEGjUhKS+a+YxYTTUtlRHR1s=; 
 t=1648586503;x=1649191903; 
 b=UoqV/UAjlHJW9jOtfHzxBnwBE9aPKM8QqQ+6WoB8vnE8gi8OpN3ouNZbaabZGGsninRxdiVOpisaQnSTy+D0zze7NM7JhiFV0OcMlEz1k8WOgVt4qVWUJOcNkApkpgd2xMnCoVL4qDATu1jsSLMSgMMJtFDjgCKCtef4RPVgcugz/BvhzXbhe8jLv/sJi8VKLe6QbFtKEmMc2hqtAVE0J5W7FqKZnxqUMd1gxX9dfKBnc1irnkA6cGiRYvLA/DoDyK0JSzReNaHaaK1KUtowgI5vmJAPoZvUtXrUqSEyHY9OhuVijyYIC70Wc8YUaAY8IA3kp+zWpTq13q8fFcR3Wg==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIeq-000374-Fv; Tue, 29 Mar 2022 23:41:40 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Eric Blake <eblake@redhat.com>,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PATCH v4 05/45] tests-bdrv-drain: bdrv_replace_test driver: declare
 supports_backing
Date: Tue, 29 Mar 2022 23:40:27 +0300
Message-Id: <20220329204107.411011-6-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6111D00391FF8D216C524AE3E2EB4979B500894C459B0CD1B9C8F86C3C293B19A35EE29EB9C4B34B91C206EF2094F4D734234C7E1550D41240
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E4182CE4FE3052C2EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374A24022C550661178638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D845B8EEB1DA6B282E0F84B3BA1BF3780B6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE778FCF50C7EAF9C588941B15DA834481FA18204E546F3947CD2DCF9CF1F528DBCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637BA939FD1B3BAB99B389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F790063734032FEA597FA516D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7F14938A4A9A7FB0CEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3A8421AA044726D3235872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F54C5C0B83BCEEE49395EB2C3A6DB956ED9C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34A9A0A0BF1A2CAC62E7AFA7227BF5C59DFF8E96EEB133B8A123C72705EC968A3F0055302462C663151D7E09C32AA3244CADF5CD251396C7196154F169FD49201D60759606DA2E136ADCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGY4Xy+gyntaBQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE091173E07D013056DF2FCFDDFA6D5B1D667B1B35C898C542E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

We do add COW child to the node.  In future we are going to forbid
adding COW child to the node that doesn't support backing. So, fix it
here now.

Don't worry about setting bs->backing itself: it further commit we'll
update the block-layer to automatically set/unset this field in generic
code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 tests/unit/test-bdrv-drain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 36be84ae55..23d425a494 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1948,6 +1948,7 @@ static void coroutine_fn bdrv_replace_test_co_drain_end(BlockDriverState *bs)
 static BlockDriver bdrv_replace_test = {
     .format_name            = "replace_test",
     .instance_size          = sizeof(BDRVReplaceTestState),
+    .supports_backing       = true,
 
     .bdrv_close             = bdrv_replace_test_close,
     .bdrv_co_preadv         = bdrv_replace_test_co_preadv,
-- 
2.35.1


