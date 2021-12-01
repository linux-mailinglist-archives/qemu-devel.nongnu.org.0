Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE47D464EF5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 14:43:03 +0100 (CET)
Received: from localhost ([::1]:42490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msPt0-0003od-CD
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 08:43:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johan@kernel.org>) id 1msPj4-0002DC-Js
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:32:51 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:32922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johan@kernel.org>) id 1msPih-0003Zm-Bs
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:32:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6CFC8B81EB3;
 Wed,  1 Dec 2021 13:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB03C53FAD;
 Wed,  1 Dec 2021 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638365537;
 bh=Ugji584zVJ/I3sWBpg/k0K1Uufu688Ld13ZODd6Twvo=;
 h=From:To:Cc:Subject:Date:From;
 b=HXYyeT4VaRqzW0K4XaxiYsbgTAD67rC7w66hRVaqUvSTEhUDjZqqmBRDix0PDPml4
 swMU/FGvtJtR0q4vNCYVvkpddRiQR3ySgzjH3/owwqyAiCb/RlUWak2xx95TGBJFmW
 VaXZfn/iAhDNFR07wOVQAQ2c0yPyFvsDVf/NgCv1+Zq7ROxpDjn4+HYdtF5gr8Izno
 RT2nboUwpi3M2ZnEMeENBXUx20djfOgbEFDNaGSVXG233JIngJcpUTGROMBINFfE0K
 SlfoIn2FOjstwytHPwpTQfRfYyxe7/cTHE9wojyGZwzNE+aBBDOcWN5nyXKgWV2lxd
 ZjEB5bT0n4mbA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1msPiH-0007rs-3l; Wed, 01 Dec 2021 14:31:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Gabriel Somlo <somlo@cmu.edu>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 0/4] firmware: qemu_fw_cfg: misc bug fixes
Date: Wed,  1 Dec 2021 14:25:24 +0100
Message-Id: <20211201132528.30025-1-johan@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75; envelope-from=johan@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When searching for the latest umn.edu patches I stumbled upon a recently
submitted fix for a bug purportedly introduced by umn.edu:

	https://lore.kernel.org/r/YaZc4LbX5hrJDnec@hovoldconsulting.com

The patch in question is obviously bogus, but a closer look at the
function in question revealed a number of other bugs, including one that
was indeed introduced by umn.edu but that was missed during the
(re-)review.

Included is also a related clean up.

Johan


Johan Hovold (4):
  firmware: qemu_fw_cfg: fix NULL-pointer deref on duplicate entries
  firmware: qemu_fw_cfg: fix kobject leak in probe error path
  firmware: qemu_fw_cfg: fix sysfs information leak
  firmware: qemu_fw_cfg: remove sysfs entries explicitly

 drivers/firmware/qemu_fw_cfg.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

-- 
2.32.0


