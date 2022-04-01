Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DBB4EF1D6
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:42:06 +0200 (CEST)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naITV-0002el-E3
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:42:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naIRN-0008RX-6W
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:39:53 -0400
Received: from [2a00:1450:4864:20::136] (port=37686
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naIRL-0002F8-9b
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:39:52 -0400
Received: by mail-lf1-x136.google.com with SMTP id k21so5335838lfe.4
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=evlLTb/LNjTWaVhm7B01HI+uKKahH5t2onDNXiLCaPc=;
 b=qaSUqki653jzXHZ1FXPACvAzBRii5ffV9072Qo9ZeCV9N9e3Ts0pSubGHTlxGhbY9f
 BCKbi5eDj24qc3O0OxhIPdmwL0vINHUxnwHWaGnji/h2cFQkuJO5mQPRMvyj4IxBhlC2
 5Ad/5T2eFtlZBAUx7EZZOQQI3u6tVueHQ+wf/jAu/FE/T5FsRh+AmPKSZDB/xgj0OpO+
 2WSLlb/16jTGhhHe098WP1dY65X8WfEnTpYtvJbvbaTAmX5FlWZ1KWc6dT7RAualGu4J
 ECgi+WEuQM7agBR7JdbMEiG1pavH9S95mv4DRhNQrvO/3Byt2E8GNsJXttxwvanfUqqA
 bfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=evlLTb/LNjTWaVhm7B01HI+uKKahH5t2onDNXiLCaPc=;
 b=YVRgNu5aA+XRah0ojaXEI7UPncB1hMH6BKEKfg18t3xRMzBFCiL25sNUHY+92f3XxB
 EQle7zAZS3nSf9wU4bUdiYAJKdIk3vxS9nuj9/4pMdAIjmf3vw9eJ50woy/u9t1gNC+m
 u53awUdBP7usj3LStJtKfbZUSGzO97uYUe5hOISTuURwzbbGfLrtpgKbalzY1Ls9zaH8
 MtYHrO7EfwIasaIz21N37srIj1xUmmkdkKyYmyj3fJrtGgvG5IVKRC31OOt/QRZZgwn7
 e+msiR6Vb8shg3RiMYaIqB/NYZN07dDvhtdxEonfjg/xy3EN49oMxn/SSt91zJ5uhdmT
 poJw==
X-Gm-Message-State: AOAM530q6G88Pf6TLd+TuXykL8GsFOyKISRMoNRMdela4rWXEimwP88A
 FLXIoOm0Xrs33tUqzp19ocZeH+bQK37dUQ==
X-Google-Smtp-Source: ABdhPJxI80rJAQ4tPAjRj1w/z8mXBD1io74poVkgfwXpZg8Yg7ytgxb6iUSBQV7S/wMe7VvEIcaaWQ==
X-Received: by 2002:a19:f00f:0:b0:443:ae5c:47d0 with SMTP id
 p15-20020a19f00f000000b00443ae5c47d0mr14094066lfc.332.1648823988321; 
 Fri, 01 Apr 2022 07:39:48 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a2eb003000000b0024afe02da7asm215554ljk.22.2022.04.01.07.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:39:48 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/3] qapi/ui: change vnc addresses
Date: Fri,  1 Apr 2022 17:39:33 +0300
Message-Id: <20220401143936.356460-1-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x136.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: v.sementsov-og@mail.ru, berrange@redhat.com, bleal@redhat.com,
 armbru@redhat.com, wainersm@redhat.com, f4bug@amsat.org, vsementsov@openvz.org,
 kraxel@redhat.com, crosa@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v5: tiny tweaks, add r-bs

Recently our customer requested a possibility to change VNC listen port
dynamically.

Happily in Rhel7-based Qemu we already have this possibility: through
deprecated "change" qmp command.

But since 6.0 "change" qmp command was removed, with recommendation to
use change-vnc-password or blockdev-change-medium instead. Of course,
neither of them allow change VNC listen port.

So, let's reimplement the possibility.

Vladimir Sementsov-Ogievskiy (3):
  ui/vnc: refactor arrays of addresses to SocketAddressList
  qapi/ui: add 'display-update' command for changing listen address
  avocado/vnc: add test_change_listen

 docs/about/removed-features.rst |   3 +-
 qapi/ui.json                    |  65 ++++++++++++++
 include/ui/console.h            |   1 +
 monitor/qmp-cmds.c              |  15 ++++
 ui/vnc.c                        | 152 ++++++++++++++++----------------
 tests/avocado/vnc.py            |  63 +++++++++++++
 6 files changed, 220 insertions(+), 79 deletions(-)

-- 
2.35.1


