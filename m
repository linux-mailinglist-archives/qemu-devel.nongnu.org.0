Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5128A4548C9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:31:37 +0100 (CET)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLyK-0005De-E6
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:31:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1mnLrE-0002Fh-H6
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:24:16 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:56466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1mnLrA-0005SF-Jt
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:24:14 -0500
Received: from sas1-4cbebe29391b.qloud-c.yandex.net
 (sas1-4cbebe29391b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:789:0:640:4cbe:be29])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 660BE2E118F;
 Wed, 17 Nov 2021 17:24:02 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas1-4cbebe29391b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 oI4st4dfbl-O2saRT2v; Wed, 17 Nov 2021 17:24:02 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1637159042; bh=utI+FRRQYv+DmOIJBnobtD+CxTBXwM/jnUkObeIXypE=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=zOKLPbFtU7RTmSOvhd25EYNISP7KoMQdSlywYU4Wi0uH/cpxC9qP61w17Fxih+T1b
 FmcuLEFoqbj1aUSRi2mp+xnSGMP6bsCIjc88Tv01DVLRlMZt0CH6H15Xd7Niq25qFK
 la97aLrwgTMmQnKQcR9AneDG+U2WJ5bpMuc7wir4=
Authentication-Results: sas1-4cbebe29391b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from d-tatianin-nix.yandex-team.ru (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:201::1:27])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 boklLck2Jj-O1wC3gx5; Wed, 17 Nov 2021 17:24:02 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] chardev/wctable: don't free the instance in
 wctablet_chr_finalize
Date: Wed, 17 Nov 2021 17:23:49 +0300
Message-Id: <20211117142349.836279-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Nov 2021 09:29:13 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, yc-core@yandex-team.ru, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Object is supposed to be freed by invoking obj->free, and not
obj->instance_finalize. This would lead to use-after-free followed by
double free in object_unref/object_finalize.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 chardev/wctablet.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index e9cb7ca710..fa3c9be04e 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -318,7 +318,6 @@ static void wctablet_chr_finalize(Object *obj)
     TabletChardev *tablet = WCTABLET_CHARDEV(obj);
 
     qemu_input_handler_unregister(tablet->hs);
-    g_free(tablet);
 }
 
 static void wctablet_chr_open(Chardev *chr,
-- 
2.25.1


