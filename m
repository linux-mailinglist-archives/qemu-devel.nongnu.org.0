Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16413569723
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 03:05:59 +0200 (CEST)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Fxu-0006UV-5q
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 21:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o9FtJ-0002td-HY
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:01:13 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o9FtE-0000PS-5y
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:01:11 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g126so1820965pfb.3
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 18:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LFxwtbU4b17JGNfNCVeIemu+lqOKYPkEJ2bsG3SlznY=;
 b=EBJ5rVDkSEK0cV77ATTWxL29p6c7HncKWT4eNsBvfxfugqxkP0kaJ0H6TbP7L++S3g
 MgLfatsl7HdfqjauAIrgpz2aapMaSuN2EOT8NwiC+9+2YAVhpCBVioht9SImsEx2fE6Q
 y7LFUcpd+TdsSWNdkiO0dxNdsb3n4W7hi9xbRd1F+BGfyyZaE+AqjWucb2otdexC4fXJ
 4vpJyR55FSw5BmEtd+RW7RecQ5hA8NhQEd0EFXWirZbDX5OFSkp4pRJkDd7xEiroeLFw
 DTVyIMUxIw5hFn+7ZjyzXHzAPbJgecYMkgwv6Mbm0gEOQOuOKGbg6iHUX9WSEPXROJUB
 Bz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LFxwtbU4b17JGNfNCVeIemu+lqOKYPkEJ2bsG3SlznY=;
 b=X+0TcbzA90wTLW3PdaKa1Mi9nmLbaC7a8zC0c9HHIcTqpUul/mD4PQtbGkt5Lz57wA
 6jIPi0cOWmYH5g5uosD+P92IB4ji7U+SnaJzrEflpzYRJGye9JwNPa8rVyKNbG70hxvS
 g7mpMDo97YwCaThT8PxFoD27YKJ5TbZph6uvx/pttW3nbdlg8Xnh+6Xiu1G8Shxm3uqN
 5BA/0ICTht3K4DUgrv4ruDZajC0EZUhoneG5qTunQPVId7zppk+Du/wYgnzcEV7vi0RD
 1wB2tyBLxwhMBj5K0+Xf1uYnAtmsiTPGWXQb1fZy2AcLmLuix2QmYVBS5S0L7gDof032
 s9zg==
X-Gm-Message-State: AJIora9jK4IsJnUWgLYTb7dT1MNeAzxuHqcHvTBp9sXj5fyAGj6PS5un
 BDd9xiOEz6Zx5QtpElwiCuV5iVNHm2duhw==
X-Google-Smtp-Source: AGRyM1urXydO7DdXFBPCk6pk6F3tb4Ta1fFoq8hcb5x+0dK7qArxNXpjRAWGkqYXfdmhY8kF5ap02A==
X-Received: by 2002:a65:464d:0:b0:412:6e9f:a4e7 with SMTP id
 k13-20020a65464d000000b004126e9fa4e7mr10801869pgr.104.1657155659963; 
 Wed, 06 Jul 2022 18:00:59 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 7-20020a620607000000b00528c26c84a3sm982445pfg.64.2022.07.06.18.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 18:00:59 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com, kkostiuk@redhat.com, marcandre.lureau@redhat.com,
 armbru@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 0/2] qga: add command 'guest-get-cpustats'
Date: Thu,  7 Jul 2022 08:56:00 +0800
Message-Id: <20220707005602.696557-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v3 -> v4:
- Separate qapi script change from qga.

v2 -> v3:
- Rename 'GuestOsType' to 'GuestCpuStatsType'.
- Add 'linux' into polluted_words, rename 'linuxos' to 'linux'. Remove
  'windows' from 'GuestCpuStatsType', because currently we don't use it.

v1 -> v2:
- Konstantin & Marc-André pointed out that the structure 'GuestCpuStats'
  is too *linux style*, so re-define it to 'GuestLinuxCpuStats', and use
  an union type of 'GuestCpuStats'.

- Modify comment info from 'man proc', also add linux version infomation.

- Test sscanf return value by '(i == EOF)' (To Marc-André: name is declared
  as 'char name[64];', so we can't test '!name').

- Suggested by Marc-André, use 'int clk_tck = sysconf(_SC_CLK_TCK);'
  instead of hard code.

v1:
- Implement guest agent command 'guest-get-cpustats'

Zhenwei Pi (2):
  qapi: Avoid generating C identifier 'linux'
  qga: add command 'guest-get-cpustats'

 qga/commands-posix.c   | 89 ++++++++++++++++++++++++++++++++++++++++++
 qga/commands-win32.c   |  6 +++
 qga/qapi-schema.json   | 81 ++++++++++++++++++++++++++++++++++++++
 scripts/qapi/common.py |  2 +-
 4 files changed, 177 insertions(+), 1 deletion(-)

-- 
2.20.1


