Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC4E649E05
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:37:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4h38-0000XM-Ns; Mon, 12 Dec 2022 06:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4h2m-0000VP-9p; Mon, 12 Dec 2022 06:32:25 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4h2j-0000K0-Vk; Mon, 12 Dec 2022 06:32:24 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A725F5C00D0;
 Mon, 12 Dec 2022 06:32:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 12 Dec 2022 06:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1670844739; x=1670931139; bh=sr
 T4kPzfysePBbfBv1gvqK5lIVry48ZoP1+PaM6sX9Q=; b=mEUdIC5sZvdGd207Eh
 E8YrLThXxUQCkEGNJz1TVJmVNJgfbZkEZ580/86KlRfACtBzJrX6SUyy8upi5PLq
 TcCDgLryHTHNm+4CWjCQZWxFpCnEFsCeevF2rDnr1ouJPk/VDkuumr4kxdkBZCVY
 eZV+EsI0yF01avGniWufuGaq9x5/NucXXNy7WxyJFiZD4AzqmpHs6XRrYm0jmRhK
 FY8oL6dWNeaNb/YZzrJ0ogdA93dLjhEOlEDsSH210Tua2ykrtmb7h0Wvl6g7deu0
 vVDyDI/pNlkFL89C4Z9y18H1V1EAwxdEbvOdjF3cYZYnucQD1n5o7f6lz9fKB/ec
 2Kqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670844739; x=1670931139; bh=srT4kPzfysePB
 bfBv1gvqK5lIVry48ZoP1+PaM6sX9Q=; b=HFxE0Yc/+QFT23/lEWH2Gnwd06oir
 CyWxA8Tw9U/cKxX9UKr2yrumWuX2OFuxpY4TFFhzA6vUJkoyhgYzuyd84CuJ3ehb
 9/Agl2LWj+PTHH23+vKpZssfUatC9vQon6tmMOdd0ZolXkGj6p92mmqughmGz7Kv
 IprDSWil5VUKWhdKwQGpxzmYYwrThZ4+B3789bQoxfiBhPxIUKVarmqP7Clj5sEq
 dMVylqe03qFsDYrOxRXDrIflzzvS2dlj6ZOxQn75kbsvwcORTWWp4C76HuxAYHPT
 0rEP53cVmof0H3+5LlFC8l4WIIAR1mpfOprC3tEzbX8fBDzgUI9657awg==
X-ME-Sender: <xms:QhGXY5XJWA95q9kCGLG00x8pp5ShF7rGLRCuDADEw0IFSgn2j4KvBQ>
 <xme:QhGXY5nOO6ExAkWyG9bqz1CM4joihQbjSXV-37J-1XU738YYkyn5_-vD0KdjqXoiO
 LBUFx5f_Bq9BrT7Y7Y>
X-ME-Received: <xmr:QhGXY1bFgHzUJyWWCeQY1-enGycqSGcnaoUb7n-GhlYnhvzoUi9roLm7znk_s_6CvYouUXU8ONIeh1RDC13AMMkdqeAwHn6MqDqMCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepheetfedtgeekueeltefgudfgtddtleeflefgjefgueeggffgvddvhefhleeuhefh
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:QhGXY8W1SniqoMcIVRDKL2sgg-wiERbHFRBOlPr1v2Be1Rn0ER2Fow>
 <xmx:QhGXYzkn_vqY-qFm0g7JRx5YifWfhcoDkwJRy8ju1kkghKbmnQAR-A>
 <xmx:QhGXY5eF5kxSVzzYU2B6l19CmLyaonh5zomoJmihVnhGxhf9o4WL6w>
 <xmx:QxGXY-tLrI42uO3PFlsmauYlb7SOGz_3WBZApBN81vBmLRiP4ukPBA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 06:32:17 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <its@irrelevant.dk>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 0/4] hw/nvme: fix broken shadow doorbells on some platforms
Date: Mon, 12 Dec 2022 12:32:11 +0100
Message-Id: <20221212113215.33135-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=k.jensen@samsung.com;
 h=from:subject; bh=tsNqer2jIkbKZlEw8VZ0Q6mKrfj52nCRS5Eceik96aA=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOXET56RILQ2EEAL2aoRkUAAx5BvfXM8Tz81fVy
 m/bA7bCHV4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjlxE+AAoJEE3hrzFtTw3pn9
 0H/RsxPkVy9SoCi9Es/dJeI1qDjwJ7DnDIGIZdML+1L2dCihPAqO8+o3RSS3TkMvEKQHZYEMfKneKi
 xsHIrxMrPhRex21sHNXxWt7ob+Lyt/01jSV/IRCKWhKiBuL3e2N51otFZNL8hbe/VZ9NN8ttmNO4gH
 eirhA7+iG61TgC+W8ZCHQ6f3n3GK0bLL7ZEY1ctdXKI8PAr77laxXex8ogmvc26RE6vKdD7OoPChpZ
 QhRjgC8MnGHm/3GOlw2JlkEhjde+0oLU+TCzYbXrw3eL+jTpJ8FExh9SIyXSAvC4Oh5kymT4HzZwAh
 Msz4Aom2dDSNz6Vq2yr+qIY79ErdGRBJiZsKmw
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Guenter reports that hw/nvme is broken on riscv64[1] and big endian
platforms[2].

This is a regression since 7.1, so this does not warrent an rc5 for 7.2.
I'm sure Guenter can carry this patch in his tree, and maybe we can get
this out in a stable release.

On riscv, the issue is a missing cq eventidx update. I really wonder why
this issue only shows up on riscv64. We have not observed this on other
platforms (yet).

Further, Guenter also reported problems on big-endian platforms. The
issue here is missing endian conversions which patch 3 addresses. This
also requires a fix for the Linux kernel that I am posting separately
(can't link to it, chicken and egg problem).

  [1]: https://lore.kernel.org/qemu-devel/20221207174918.GA1151796@roeck-us.net/
  [2]: https://lore.kernel.org/qemu-devel/20221209110022.GA3396194@roeck-us.net/

v3:
 - add patch to fix big-endian platforms

v2:
 - use QOM accessor (Philippe)
 - added some cleanup patches in front

Klaus Jensen (4):
  hw/nvme: use QOM accessors
  hw/nvme: rename shadow doorbell related trace events
  hw/nvme: fix missing endian conversions for doorbell buffers
  hw/nvme: fix missing cq eventidx update

 hw/nvme/ctrl.c       | 121 ++++++++++++++++++++++++++-----------------
 hw/nvme/trace-events |   8 +--
 2 files changed, 78 insertions(+), 51 deletions(-)

-- 
2.38.1


