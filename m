Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A591E339803
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 21:10:12 +0100 (CET)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKo6t-0000ic-KH
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 15:10:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKo4l-0007kO-Sb; Fri, 12 Mar 2021 15:07:59 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKo4k-0005YC-35; Fri, 12 Mar 2021 15:07:59 -0500
Received: by mail-qt1-x832.google.com with SMTP id x9so4798691qto.8;
 Fri, 12 Mar 2021 12:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9rmUyHTBZ/TU7/SkH92QjmLkThvjtMndfJyhs62hjMA=;
 b=phGQgr/WmQQI28uvM4AeIP3p7jZYDljlKenqGeDWaWJVHbNBXCdx3PGH6MmYjPxF24
 ysL/kqHYtF/bn1kPg+/c4keEJGIFzU9demwKVlPqDoMrc1ae4gsASOWgQvHd6/yHXe/X
 y9G8n6aDnaNIVWXNOaeUulW0f1PCa9jo+FYKJQjgcuRjQva+N782EO5MCF0NNxUP8uoQ
 q3KflnCn15qaww/sViG1tt0h42kDKv/16MWwxCNQqE9tY9OYYW/5Hn9xe2jbwow3JudE
 WpCIkp+bxmmfErxdwrTLPH/xyhgmNK1kyLqyCWMZkK40WTkMKed6szesjKPfhyRcl8Ov
 OuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9rmUyHTBZ/TU7/SkH92QjmLkThvjtMndfJyhs62hjMA=;
 b=Q95puwYWB/xyVL/2W5VMgct2DaKVRccW9d1YUrY23+J/YEj92G3H0xocdKk8IYzR2p
 30+HLqpfTQNjHpP1tL2Jpna64ohfRzl4SGm9JQgM+A9bEIL5e935FvxApgyoJE5TzuLj
 haHlM6MU08qlfjlx6jjtm5Zx11FP5nGE/dH3jU3vu2TZbcorf03LRnPyOSGdZymBn9mS
 ohMIk+MxmMbiWNKOcTHPeRpWMJbbHoKFBTQNWHFQUwsaLhruSAKk1ITNoXa0MgYoqdfu
 E6vA2VWEmuTNFJjbJspBCYbM6wfSKYu4oottj7mw6YYIN2RIB0CPBlaMT32dHTzjq1jz
 z6IQ==
X-Gm-Message-State: AOAM533GTolX6cjHLsQ4n9O4VBKZtQgIS6XLcNBEVpkdMVR0Sx+RP+wZ
 ednD66KjdoqFyBjruIht0TIIiIB7rYs=
X-Google-Smtp-Source: ABdhPJx0r6KTt3XVhoURN8ZEgQhLB0O5z+d4ME+LXtc8o12HFlumhtgxRI7kzcLjROT0SoOedlNbaQ==
X-Received: by 2002:ac8:5396:: with SMTP id x22mr13678973qtp.200.1615579675947; 
 Fri, 12 Mar 2021 12:07:55 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id j24sm5074126qka.67.2021.03.12.12.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 12:07:55 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
Date: Fri, 12 Mar 2021 17:07:36 -0300
Message-Id: <20210312200740.815014-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
DEVICE_UNPLUG_ERROR. They were (and are still being) discussed in [1].

Patches 1 and 3 are independent of the ppc patches and can be applied
separately. Patches 2 and 4 are based on David's ppc-for-6.0 branch and
are dependent on the QAPI patches.


[1] https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg01900.html

Daniel Henrique Barboza (4):
  qapi/qdev.json: add DEVICE_NOT_DELETED event
  spapr_drc.c: send DEVICE_NOT_DELETED event on unplug timeout
  qapi/machine.json: add DEVICE_UNPLUG_ERROR QAPI event
  spapr.c: use DEVICE_UNPLUG_ERROR event in
    spapr_memory_unplug_rollback()

 hw/ppc/spapr.c     |  2 +-
 hw/ppc/spapr_drc.c |  8 ++++++++
 qapi/machine.json  | 23 +++++++++++++++++++++++
 qapi/qdev.json     | 28 ++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+), 1 deletion(-)

-- 
2.29.2


