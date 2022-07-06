Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389375684E3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:12:52 +0200 (CEST)
Received: from localhost ([::1]:48456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o921Z-0006Bs-L2
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o91lX-0002Rt-5h
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:56:15 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o91lR-0004Fo-HY
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:56:11 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so19810252pjl.5
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Rg4ttDTIIO1EhUqQAUHBA2gMV8BMq3VG3P2FTwZ/Is=;
 b=YKVZImydnSg3duNJ3xEEK7r21qcHbqxo9cFQGyq6/jLgZNDE0VvFGgY1eEXkCLaWoT
 C29aYjsXAiWdQzPKYCKtA0UhySgYAA67qlP+93FKjMucJjSPbidCdizh3LiKYb0WXXkE
 /FBkPay+lWtYhiMCQ/YleXy7phDrRV83OQ8J5MuEASya0RTRjg1sTPD7rCVJmC6EOAG3
 tzkdlZiuf8CFMcu9IrlaLJwKUAYShuQA9/ivudpgatG5er3u/sBj3T0Hg7pSZJbFm/PK
 ffSN+kX876iOiqACwU8FE714Kie0+rpK4u7k2/LqNtXxsueck/IMFVrybNgIRlJrYxIZ
 M6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Rg4ttDTIIO1EhUqQAUHBA2gMV8BMq3VG3P2FTwZ/Is=;
 b=cUfhpMcRMoNU6AagYB8Fq8tEskegV2BtvmZO/ZX1vG7fD2YxsVP0mmo2BA6Vn1hWkJ
 ljKVWNqOlS4kpGcuG7RLT7Neh8m3wUUbWef/4YuxMAcH6etJ9osAtcASZA+tH51kAJE0
 bpiNlBHDSz/iT21k2em20YjNBt39p5stkl0ebbYQFz5XS7MM5/ScHINnh47BzcmJ/Klj
 R0eUSNIfK5Bur5jsSDY4XVa/G5NS+JUgmkT6wAumSRnC46NUqM2bgdfyZQkOPoIUQHVN
 uwzeJZHKeZuFCXrqj8QwIk1vvNqVceDC56qVrAuqlbbToebcYFbco7DCqc/9bXz6VjKB
 +r6Q==
X-Gm-Message-State: AJIora/d4R2/ybsWhSEuk+Z5hh8S6QKzhS/bwJTiyJJLWMQUcsyAxSkZ
 9v1XIiuGMHSB/KzHKnSsFKYCaQ==
X-Google-Smtp-Source: AGRyM1syyGryGNVVVEGRvb5dSgdEChYYYI1v9ZwR+V9rjr0pDlnU8FCSL6ONnvyj27DtrYMaWs1xQQ==
X-Received: by 2002:a17:90b:3146:b0:1ed:4485:1168 with SMTP id
 ip6-20020a17090b314600b001ed44851168mr49370461pjb.245.1657101366831; 
 Wed, 06 Jul 2022 02:56:06 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a056a000d5800b00517c84fd24asm25366818pfv.172.2022.07.06.02.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 02:56:06 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com,
	kkostiuk@redhat.com,
	marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 0/1] qga: add command 'guest-get-cpustats'
Date: Wed,  6 Jul 2022 17:51:10 +0800
Message-Id: <20220706095111.686295-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1034.google.com
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

Zhenwei Pi (1):
  qga: add command 'guest-get-cpustats'

 qga/commands-posix.c   | 89 ++++++++++++++++++++++++++++++++++++++++++
 qga/commands-win32.c   |  6 +++
 qga/qapi-schema.json   | 81 ++++++++++++++++++++++++++++++++++++++
 scripts/qapi/common.py |  2 +-
 4 files changed, 177 insertions(+), 1 deletion(-)

-- 
2.20.1


