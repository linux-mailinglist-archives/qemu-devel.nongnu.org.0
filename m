Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1314EBED2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:33:45 +0200 (CEST)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVe4-00020Y-5G
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:33:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZVJb-0002PC-M0; Wed, 30 Mar 2022 06:12:35 -0400
Received: from smtp46.i.mail.ru ([94.100.177.106]:49294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZVJX-0007yp-FZ; Wed, 30 Mar 2022 06:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=nzHnFg8qT3g8xTdXNJEMGQ5QJ6wup1Kqz+KCIRGYSg0=; 
 t=1648635151;x=1649240551; 
 b=n22mGjklEHtZo48zYGjHLJh+PlLs7rqAkOQJ4Y/tGuBxpNr/Nj1V++D5gODl79YyX+HanJul/FFh0x7ETDpCHupspbM6qmuXpOI0/iX8ZCZUB6KX8FxDSwcWrD+POvJaxU2g73Fh1fatvZNy85tD95xTYaQTm6DLBgMCXfcWHAaFmMquIQo1H2xB3TXnQm/qU1BreCuKElAj6GCd6SExY1VVZ4wh4SWaMHsjpnLMKpdH7ou2usp0ePUd1xPO0W/J3+dR/SyfV79LyiVsbQeUjPq+PhNLnRFBYEN4dQDsM2vuzVrOrgzykLdxGylCdxK4Sy+0nV3AMRE3AaJSwJeBpA==;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZVJS-00048P-O9; Wed, 30 Mar 2022 13:12:27 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 40/45] iotests.py: qemu_img_create: use imgfmt by default
Date: Wed, 30 Mar 2022 13:12:12 +0300
Message-Id: <20220330101217.4229-2-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp46.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61E18CC9614702355F2DF046C2CD994CE500894C459B0CD1B96B3E695170DE200CD0A23AAEC9CE0113338E05E3556DF6F75083F157FA65ABDB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A8325FA649D0A450EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DA223B75F41C64628638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D894591D36799911953A5230A04E22B58C6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7BE2AB513042E4E129FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAA867293B0326636D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE38D4DC57D478E68897A342136F30543AD8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE360910C30DCD593B1040F9FF01DFDA4A8C4224003CC836476EA7A3FFF5B025636E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F79006374A4ED358074F063AEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F5E75A8EDF4DF6C7AC63217CDDAD441C559C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34181D1E89D5A0B42F07F4B45DA8A237EAC7739185E660D72EB36703061E211E487DF8AEE4429B850C1D7E09C32AA3244C58E56C775964FE13063FF50CE35768A15595C85A795C7BAE83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+UtyKRavZiNuQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FEF59FC8FC90DF3869226388393450F404EC898040696C8C5AE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.106;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp46.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Less typing: let's use imgfmt by default if user doesn't specify
neither -f nor --image-opts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 tests/qemu-iotests/iotests.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 8cdb381f2a..02601162d6 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -231,6 +231,8 @@ def ordered_qmp(qmsg, conv_keys=True):
     return qmsg
 
 def qemu_img_create(*args):
+    if '-f' not in args and '--image-opts' not in args:
+        args = ['-f', imgfmt] + list(args)
     return qemu_img('create', *args)
 
 def qemu_img_measure(*args):
-- 
2.35.1


