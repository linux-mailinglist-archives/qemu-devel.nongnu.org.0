Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE72C32A1E9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:13:25 +0100 (CET)
Received: from localhost ([::1]:37934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5m8-00062e-R5
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lH5jO-0002QN-2z; Tue, 02 Mar 2021 09:10:34 -0500
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:39870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lH5jM-0007AJ-Gc; Tue, 02 Mar 2021 09:10:33 -0500
Received: by mail-qk1-x730.google.com with SMTP id g185so966129qkf.6;
 Tue, 02 Mar 2021 06:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bayDl/27X9t8BzGIMK8tEPYhwocOYB9bxe2uCjWhGCE=;
 b=nGwAEBY7o8DyATgdLOvytRll6ONaSfz1Ae5UPY77GvCb2VlK0Y+svIEPyWylroTsoy
 8I9HqkrE+Cdof61JSyg9DIT83OXxV9la1x5BKfvor+aJu8uW5M74+2PQOVPn8Z9aC2bC
 Aq/XzIVZIherDKU67NR7sq2HCcm9d25EUFQRLF7RIxSCqx/xUiKkPo7E9ZmqUtsXGV1h
 A3+yH4r3Mmb9I/w+ImCbRtV4JCkZMg87F52LnjRDJHXYBbsFbah/CmmFE609gej+ZxMG
 MCDgTS9ZNOUCrubn2bPwqmehkPRuOJlZhoIXmXWnhkcLt4ISt2RhkTvf2pWgxXymncaH
 EraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bayDl/27X9t8BzGIMK8tEPYhwocOYB9bxe2uCjWhGCE=;
 b=qzCUpl4NneRU/XEA5z1TWexV5pYP1mHHD+5xoKxqtBWa12+OT2OznfphWGnppYqlLU
 wTuMCRORPy5sPxnYUDxHookFHVZdJnti8tAeg6/jmI/Arg8xaZOJXgVuK0k+c8j1dB9k
 Cxxx5ZLDWzUdLMt9AHtEuE/5bjwJTOb8+kIlHpw4Nmyksub3Jq5whRWbuEj2vuaqIYjE
 /ph9XgFFFCcg1QwDUDL17TKHP28ThgCmu3O7AgU7krKW1iv78tXJkaDZdUorCaTbsh/t
 IL2DkMeWZ+x+/k6Meoo2i9sI+6P7mTLHzaQo3QUaylWGh2rvsptChJX2bFZZwKaT3/rI
 7v2Q==
X-Gm-Message-State: AOAM530ysUGuPYiLX263TCD47hHkZMUakUA3/6pUjKBBQLlaLvFWHGM1
 lG9cft89stUB3evoyT+Rl3aadZqE68S9jQ==
X-Google-Smtp-Source: ABdhPJyU2eCY8YC60HpL+LdzsGMrfStu+YPbTXW614XMzyIQhfZtrHZjALjEzqc3p4Wcx24I3szK1g==
X-Received: by 2002:a05:620a:1410:: with SMTP id
 d16mr18810951qkj.465.1614694229651; 
 Tue, 02 Mar 2021 06:10:29 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:1670:7849:4614:f4b6:4112])
 by smtp.gmail.com with ESMTPSA id n5sm9376504qkp.133.2021.03.02.06.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:10:29 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] send QAPI_EVENT_MEM_UNPLUG_ERROR for ppc64 unplugs
Date: Tue,  2 Mar 2021 11:10:17 -0300
Message-Id: <20210302141019.153729-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v1:
- patches 3 and 4: pushed to David's ppc-for-6.0
- patch 1: changed to just remove the duplicated assert of the first DRC
- patch 2: dropped
- patch 2 (former 5):
    * changed the error message to mention that the memory unplug
      failed because the guest refused it
   * added Greg's R-b
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08378.html 


Daniel Henrique Barboza (2):
  spapr.c: remove duplicated assert in spapr_memory_unplug_request()
  spapr.c: send QAPI event when memory hotunplug fails

 hw/ppc/spapr.c         | 14 +++++++++++---
 hw/ppc/spapr_drc.c     |  5 ++---
 include/hw/ppc/spapr.h |  3 +--
 3 files changed, 14 insertions(+), 8 deletions(-)

-- 
2.29.2


