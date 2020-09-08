Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE526111E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 14:12:46 +0200 (CEST)
Received: from localhost ([::1]:48724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFcUP-0001tb-BW
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 08:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFcSS-0000Fi-Gq; Tue, 08 Sep 2020 08:10:44 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:34461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFcSN-0005bZ-RB; Tue, 08 Sep 2020 08:10:44 -0400
Received: by mail-pf1-x430.google.com with SMTP id v196so10800530pfc.1;
 Tue, 08 Sep 2020 05:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yrAA7x2FEGJebk4mIL1oqQkafJ2iJAdtvrejeq1qeOU=;
 b=TSe2OukqtfhmVzIobZKsZwcueQrbpygVNmAou/CaGBjb5B7eXSk/7uSNWeLLUghvSK
 hnGIc3h5mmrNV6nuPdVv6fTRVKm+4N/3c65CK42pcIq9l31pDdzvnSjhZPBA0P6qULyu
 KPmBqf+JIva43I+4WRYY7QYxLyb6+ILI37hFD4IeoKKXO6SoihFNQFS05/s+7HWXeZ3E
 Qfq20LMxE4KQnHrssZ6Q79tSOQO1UoeM6RP3kGW6iD4ZQPoPZ53qzamgXYncjnq7zC2A
 HK1+gSmKK1QIBHYkEdV3EMnvepANZnE4JlY4s/4de5SVrIo7z2PM3E6GnxL+73m84oIu
 reHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yrAA7x2FEGJebk4mIL1oqQkafJ2iJAdtvrejeq1qeOU=;
 b=XgMvlbyYb6fwXv2NQUZJQLhVUraqwjF6yptCO5V+D3f8VczWCWkRDRw8jJA5iwmpRI
 x1qkmICPU1kROUEY/JWPA4r9kg11b0KTfwEMoA4ZgZlTMHvc6XrEhMTkIKDPTZgEPlkv
 x1WWMGsNdWF4boeYjsRaOa3PJjskMO3zT3m3CnKHaftcJyhGd9ZnAZ0c/MP3BaxCHYAs
 zQdDTThN507n8s2wobGrOqHJSS75cuJcWeuGHxmgRR/WVGu0x6Erzy8+63oDOqCozQ6u
 7nInIF678YFpUh++iH4Tg+Z8/KdPG4oZZsbiaJ5IJQ2hXuyu/KMDtWS+/UR2ZmfuUICu
 YRiQ==
X-Gm-Message-State: AOAM532yZvUDRJJZIKTV3BNYHlNn9nC/rVI78iQXFaS3oQuNUfbUecoO
 2bjhUw58UVEdT9nF/0MsCpGpjWdP3WC4s+4m
X-Google-Smtp-Source: ABdhPJwvpGCzrcj/w++hma+ObguP6n5scFL2hWjFYJGeqVkP/W5W1brtXUMpoh9NKUWbq8TFT15f9A==
X-Received: by 2002:aa7:98cc:: with SMTP id e12mr24198778pfm.66.1599567037528; 
 Tue, 08 Sep 2020 05:10:37 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id
 t15sm18731657pfl.175.2020.09.08.05.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 05:10:36 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] rcu: add uninit destructor for rcu so the pending calls
 be called before the process exit
Date: Tue,  8 Sep 2020 20:10:20 +0800
Message-Id: <20200908121022.11-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Daniel Brodsky <dnbrdsky@gmail.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is necessary if the pending calls are close and removing temp files=0D
Also fixes test-logging.c on msys2/mingw, on windows if the file doesn't cl=
os=3D=0D
ed, you can not remove i=0D
=0D
Yonggang Luo (2):=0D
  logging: Fixes memory leak in test-logging.c=0D
  rcu: add uninit destructor for rcu so the pending calls be called=0D
    before the process exit=0D
=0D
 include/qemu/rcu.h   |  5 +++++=0D
 tests/test-logging.c |  4 +++-=0D
 util/rcu.c           | 28 ++++++++++++++++++++++++----=0D
 3 files changed, 32 insertions(+), 5 deletions(-)=0D
=0D
--=3D20=0D
2.28.0.windows.1=0D
=0D

