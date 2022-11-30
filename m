Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CC163CD25
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 03:08:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0CUy-00029T-Hr; Tue, 29 Nov 2022 21:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1p0AZZ-0007yt-AG
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 19:03:34 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1p0AZX-0004ta-6T
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 19:03:32 -0500
Received: by mail-lf1-x131.google.com with SMTP id bp15so24431931lfb.13
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 16:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B/N/pLLop/XPWc5Ns5z9uzE5gJCaeAZB6tVvIPMrHEw=;
 b=xjGwkw6QcZQEYmJDcRY9mLoUk4O7V33l8AvfgVvkVofB0fC/smr73oD+A7vj+Puz8i
 rzxmlsFCDH21XwWd+HrQYtsqfmdTA8W6Eu4WQKniDEoKse5p73Brrq/RWM6iXDOqE8pO
 2BP8VnaYIUe9DjsqihweXZHGgeL7WWytbdCSnYUoIrgcoM4e7zub11A087HBE8eRGIg4
 6DEaUqXhfxxogu76bhn0+c1eETgez8p3fZQS9pTAH0LwZlmK6XZU0iuAYXroNnqAQFGO
 oLODXxg44p8ZYoGw7QjmcqN+0M/qkqhnUwV0fVOiRhtcQVirvSA2lxcbzSYd1hbvnysY
 4brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B/N/pLLop/XPWc5Ns5z9uzE5gJCaeAZB6tVvIPMrHEw=;
 b=iUrofM88+0Yqz6SajKpfpCcBowU5PNwR9A2PQjZHjDH3fjLUboXdyPEcPX/Bptd67c
 P5QlrJWgoRf+cR1QhA6yOD7fhXNYtj4NlsJWS2zLa4M80qPeijjLzez+2vuq3d5rRXVo
 9H9hzAvfQlwTo2kUpRCYJmE6pqvEtNlgpbmICJ6sWfIzgxiBx9mflwWVuaP6l6cqxLMr
 PAMEm907eLJYi0LaHRKBtrrv0AaapXFrPZUx5QwA7x2xNzPaKfHYV79kgt6IyPaNB+M2
 8kvrdBkxsj79Jw71qcLL1WSVj3ucC4NIBk9YlQqix2RYlbYLB4M3djlEhPWcKsvZpgpc
 9ylg==
X-Gm-Message-State: ANoB5pmPYePTronIvr9sCjj3tLmMXPhWJgPiTxE3SbGKtreuR6qWP+xH
 zHsk8OTBYPOdIomui5txdEj5bA==
X-Google-Smtp-Source: AA0mqf4dqVkWwK3s5nkZp6bk5YXLqxjPVJm5oJBIz1+F8j+wFhZZkzTcpOVO29XftaDtyyuuH9Q+SQ==
X-Received: by 2002:ac2:5f42:0:b0:4a2:645b:15cd with SMTP id
 2-20020ac25f42000000b004a2645b15cdmr14297610lfz.308.1669766609393; 
 Tue, 29 Nov 2022 16:03:29 -0800 (PST)
Received: from vp-pc.. (46-138-224-213.dynamic.spd-mgts.ru. [46.138.224.213])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a056512079100b004b4f4360407sm2399377lfr.105.2022.11.29.16.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 16:03:28 -0800 (PST)
From: Viktor Prutyanov <viktor@daynix.com>
To: pbonzini@redhat.com
Cc: viktor.prutyanov@phystech.edu, yuri.benditovich@daynix.com, yan@daynix.com,
 qemu-devel@nongnu.org, viktor@daynix.com
Subject: [PATCH v1 0/3] contrib/elf2dmp: Windows Server 2022 support
Date: Wed, 30 Nov 2022 03:03:17 +0300
Message-Id: <20221130000320.287976-1-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::131;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Nov 2022 21:06:53 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

For now, elf2dmp is unable to convert ELF-dump to DMP-dump made of
Windows Server 2022 guest. This patch series fixes it.

v1: improve code-style fix

Viktor Prutyanov (3):
  contrib/elf2dmp: fix code style
  contrib/elf2dmp: move PE dir search to pe_get_data_dir_entry
  contrib/elf2dmp: add PE name check and Windows Server 2022 support

 contrib/elf2dmp/addrspace.c |   1 +
 contrib/elf2dmp/main.c      | 103 +++++++++++++++++++++-----------
 contrib/elf2dmp/pe.h        | 115 ++++++++++++++++++++----------------
 3 files changed, 135 insertions(+), 84 deletions(-)

-- 
2.35.1


