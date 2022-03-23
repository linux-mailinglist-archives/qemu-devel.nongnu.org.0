Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B99F4E504E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 11:28:59 +0100 (CET)
Received: from localhost ([::1]:41998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWyEc-0000oB-Ai
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 06:28:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWy9R-0005G2-O0
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:23:37 -0400
Received: from [2607:f8b0:4864:20::533] (port=37692
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWy9K-0001C4-Lm
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:23:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id bc27so753677pgb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4QmXSDUPadFNHm/+ud1A/rVSFoiXlozN7xRQGmHgWso=;
 b=WOdTi5vjAjy0isJb0ZCka0X1vbQeyJAyveE4mg/Wf3yJEnNZ9jSh8UYyxN00SCG+wl
 Cw6H7hNN+PL9HXuZe5YHyltHJjk06BxH3pzzVe4XhRe19rLFNpax3vnhdCURjowKtoac
 tywDvmVr4eD4tqICBy51Yw9QPy65tYFsovyC5JJJsEaSbMOxghmWYFTcPxLCfvdWPJ72
 nEoXYtf4Zbm7QXqNnnezCLwe+04vMipeVJxpv6NP9oNyzQJL2Q56BeA0gfR3tLLWIlal
 QReurkOC+kwukevRaB1psGo+7urwYCK0VffkgcJdcFKLMnikq4RL7mxhVL7+erfYFxMA
 dl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4QmXSDUPadFNHm/+ud1A/rVSFoiXlozN7xRQGmHgWso=;
 b=0dzWIe0ElQXB5WZSo6FZjLA0vVVviKVXFu/TQ7C1VYzRXLl8rMX7d6iVWNAbYUqs1V
 30KkHddgd1swJbMWsoCuHsZfIS2vLTJgdmMVcn6A67tbU4xQ68Gp/EFXo3f18brA+ruS
 TnER9NwF4+8Gfzoc3sAwcuVdO2xCCmr9jjssE/AKVIZs0953vft1hXvV+pauZUwSe67m
 WIKoyX0i4n65TF3Az0nmPawkHSCkIh9sNWBD/edDIR9VeFPQUOO6mCwJ9OVPvVwfEk9C
 NHuV5FREsFTiSiPZ2cTR0xN7aPHH5+Gxid2CogksbwhRHStxH+5/KGx9NU9MTwr1LCVc
 AGew==
X-Gm-Message-State: AOAM531Zdpc+QaE2GtOpyE5sNwS9vULMyXIO7qzASZvJFX+cwY0i+f+O
 if+CJfSjy3Rad0mEBKEOSYrvCg==
X-Google-Smtp-Source: ABdhPJymE6uBmHKicK8hoYPtxwP0UGo0S2tfKiCqroHIB1qsw6bXaKHnZO2ZXHPWGoKbo8jW7+cxng==
X-Received: by 2002:a05:6a00:1acb:b0:4fa:de8e:da9d with SMTP id
 f11-20020a056a001acb00b004fade8eda9dmr1414069pfv.42.1648031005808; 
 Wed, 23 Mar 2022 03:23:25 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.224])
 by smtp.gmail.com with ESMTPSA id
 124-20020a621682000000b004f6a2e59a4dsm24778765pfw.121.2022.03.23.03.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 03:23:25 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: armbru@redhat.com,
	michael.roth@amd.com
Subject: [RESEND 0/2] Introduce NVMe type and Smart for qga
Date: Wed, 23 Mar 2022 18:19:56 +0800
Message-Id: <20220323101958.300848-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x533.google.com
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce NVMe disk type for qga firstly, then support SMART in the
response of command "guest-get-disks".

Originally I sent the 2 patch separately, because the second patch is
dependent on the first one. So resend them in a patchset.


Zhenwei Pi (2):
  qga: Introduce NVMe disk bus type
  qga: Introduce disk smart

 qga/commands-posix.c | 78 +++++++++++++++++++++++++++++++++++++++++++-
 qga/qapi-schema.json | 56 +++++++++++++++++++++++++++++--
 2 files changed, 131 insertions(+), 3 deletions(-)

-- 
2.25.1


