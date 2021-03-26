Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAE334A9AC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:26:28 +0100 (CET)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnPv-00044t-4t
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNf-0001zv-5P; Fri, 26 Mar 2021 10:24:07 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNd-0000gz-LW; Fri, 26 Mar 2021 10:24:06 -0400
Received: by mail-wr1-x433.google.com with SMTP id b9so5808910wrt.8;
 Fri, 26 Mar 2021 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RzPLUWnOnISQvZJ5eMeUSydnOMpHIDB1eukz1/lymmY=;
 b=GIWj9FHv3bwwAtjsFXLLxkDCUlJKUQ7n7gXemAf8X6cYtnl6I/uTKv1opximD6s1vm
 8dT94/YBCgvBOrmOtimuaKxCpsLvh+pU/WxLrjOa/OJ5UoALxlZWISXXjFUN3WKg4qDf
 i7UUxcGeyNCnUep7bza0OEPmrymcM1pPo5SRWpUt1+z7VOJ4G6H8cR6AddPFWnEqnw2b
 xx8+zMmMM4dw/h/aQdLwF4BHaYMbLcC/wTPgfpwKpiqE7vBFz7oQrEb7nO03V/Lroyw5
 yL7B7+sWlE1NHjuBeMHYmXxyltia7Bpa1osrcHGd6fHOjqlYsPzdjescnrqArbCE3NsI
 ZwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RzPLUWnOnISQvZJ5eMeUSydnOMpHIDB1eukz1/lymmY=;
 b=SF2QQwRL0IYwjMc1JHopxaNHiAXXMk29IGParOsg922Ae7FiLUIxIPUA6KQt12Kecd
 4mowjJWeOkIfL8y7ZqKCo02jqlSPhi1ORWUvvuPs87Oijtg5fvK5EZwo4ZDeg77U5N8X
 PzB83XwiPZZ7QiGM73c7n0OlWL0cXXYb0IBIwcR3BAze7SdcyhR1qxetzBUs+wt5YUuh
 4rW/Qb3DMdA2s8Pd4H/TPs2dcbWD3iHMcuxZDbkojFun2q3SyXNmxOoghzj3pppvC9EM
 jgfu1SQkFdi7ms7HLRk0DDAGyJ4GP6JpzGCM7dRgCoBpHURa+xMTkt1OLmeqrt7fDEFa
 zpug==
X-Gm-Message-State: AOAM531n13VHdc2fgJHsENCbdA10PeI1W/aniMcRq7LgmUZSxXlX4XOj
 ZGZEKnR4qIEVsBVWO/1zU9wD8IsBZa4=
X-Google-Smtp-Source: ABdhPJyu76IR1nj2HlM8Dfmoq2bS+jJONFaflx+6B2PfmFMrRDwLwagPlVCjyUgsqdaJc+GsoSxudQ==
X-Received: by 2002:adf:8151:: with SMTP id 75mr14822505wrm.152.1616768642924; 
 Fri, 26 Mar 2021 07:24:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m5sm13084517wrq.15.2021.03.26.07.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:24:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] qemu-iotests: quality of life improvements
Date: Fri, 26 Mar 2021 15:23:54 +0100
Message-Id: <20210326142359.431127-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds a few usability improvements to qemu-iotests, in
particular:

- arguments can be passed to Python unittests scripts, for example
  to run only a subset of the test cases (patches 1-2)

- it is possible to do "./check -- ../../../tests/qemu-iotests/055 args..."
  and specify arbitrary arguments to be passed to a single test script.
  This allows to take advantage of the previous feature and ease debugging
  of Python tests.

Paolo

v2->v3: fix pylint/mypy [Max]
        fix patch 4 for shell-based tests [Emanuele]

Paolo Bonzini (5):
  qemu-iotests: do not buffer the test output
  qemu-iotests: allow passing unittest.main arguments to the test
    scripts
  qemu-iotests: move command line and environment handling from
    TestRunner to TestEnv
  qemu-iotests: let "check" spawn an arbitrary test command
  qemu-iotests: fix case of SOCK_DIR already in the environment

 tests/qemu-iotests/check         | 18 ++++++-
 tests/qemu-iotests/iotests.py    | 80 +++++++++++++++++++-------------
 tests/qemu-iotests/testenv.py    | 22 +++++++--
 tests/qemu-iotests/testrunner.py | 15 +-----
 4 files changed, 85 insertions(+), 50 deletions(-)

-- 
2.30.1


