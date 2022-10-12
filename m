Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039925FC497
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 13:57:25 +0200 (CEST)
Received: from localhost ([::1]:57392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiaMV-000556-Q6
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 07:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <postmaster@mail115932.mx2f6e.netcup.net>)
 id 1oiaF1-0006Uq-Ms
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:49:40 -0400
Received: from relay.yourmailgateway.de ([194.59.206.189]:37637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <postmaster@mail115932.mx2f6e.netcup.net>)
 id 1oiaEz-0002DY-Qz
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:49:39 -0400
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4MnWCc5Zjlz3xTc;
 Wed, 12 Oct 2022 13:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1665575372; bh=fpOl670JaKjOj0YNt2ThaWg9wSXFTOd/QooznoXkLUw=;
 h=From:To:Cc:Subject:Date:From;
 b=GdJ7/ngLJy+2camLOgJjx2PSgfQpG7kJTmGHSAg67UdDcLRkAEeWy6CYxucCWVq6R
 SCG9qKtxwibzpO7usMj/6b5NgULd0STi+pD7O4dsCAdVFMQ1hdms0KCLq1Qo6IRxiY
 EoUDfw1j/3Sidfn2RARezHlI/tkHp6MYQgK9O5HDa2TsiJxeaBlArXE3BMHVIqYXf0
 DUjVi2ZoMqYHlYGl3yNfRzo4ZP8NIaAQz7W03kWKLZV8unYbnFnAVyCQejOD0aC8BQ
 R7ckAiiH12wmczPU3qbIciLpHfYD90rOIFPG4IHuOEOYy6Q9vRgUTBpElna1zTsw2w
 Kcb76d851w/iQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4MnWCc59Bxz7y3C;
 Wed, 12 Oct 2022 13:49:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.652
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4MnWCc2F31z8sbB;
 Wed, 12 Oct 2022 13:49:32 +0200 (CEST)
Received: from localhost.localdomain
 (ip-095-223-070-198.um35.pools.vodafone-ip.de [95.223.70.198])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 391FC603C7;
 Wed, 12 Oct 2022 13:49:31 +0200 (CEST)
Authentication-Results: mx2f6e; spf=pass (sender IP is 95.223.70.198)
 smtp.mailfrom=postmaster@mail115932.mx2f6e.netcup.net
 smtp.helo=localhost.localdomain
Received-SPF: pass (mx2f6e: connection is authenticated)
From: Helge Konetzka <hk@zapateado.de>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 0/2] Fix audio voices tests
Date: Wed, 12 Oct 2022 13:49:23 +0200
Message-Id: <20221012114925.5084-1-hk@zapateado.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <166557537163.2268.2577909775866914257@mx2f6e.netcup.net>
X-PPP-Vhost: mail115932.mx2f6e.netcup.net
X-Rspamd-Queue-Id: 391FC603C7
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: 5l/JvvSd6Bv0xlgt6ZYNf6OqMwCjbb0yb/doWfCRSMW4PrApL16R9jglvd6AcS0mENlD0F+COQ==
Received-SPF: none client-ip=194.59.206.189;
 envelope-from=postmaster@mail115932.mx2f6e.netcup.net;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

Changes for v2:
 * Sent by git send-email to keep correct format

Fix to remove obsolete warning on -audiodev ...,in.voices=0 and
improvement for better readability of audio out.voices test

Helge Konetzka (2):
  audio: fix in.voices test
  audio: improve out.voices test

 audio/audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.38.0


