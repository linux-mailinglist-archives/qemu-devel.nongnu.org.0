Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A13B581CE1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 02:58:41 +0200 (CEST)
Received: from localhost ([::1]:50526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGVNn-0005hy-Q1
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 20:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oGVLq-0004I3-B8
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 20:56:38 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oGVLk-0004UP-Lc
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 20:56:34 -0400
Received: by mail-pf1-x435.google.com with SMTP id y141so14697137pfb.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 17:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IpVkzNkce+4X8VQHSf2Q+7s7bcev+r2GsWXBsjO4bdc=;
 b=nhhgd1vZOTPJoo0f1i9UTfQB4nVFSMCiF0fCvIqnkXrmJkQy5w5XHRnxzwi2QNEcuk
 +UOHHRkmi3yP1bcdnfIbwvc8boQPj8jbQkdgLyupU3js6L7lfkuaph4p19gyS3TBi8XE
 M7fNmJK6bHhBJIkhbNpsJOGv+0Vr+Mtjy81iuI2pmC9jq5y7EeIinW6C6he3Ac+psu4k
 9oBy+h/QFPayMVACjjJz4Xfa5i0HkN1y2QMCDpIROxTVDrmfGu3jBhF3dXm8XAFTtieR
 MH1zAdQdx0Oy9+NPVek5u5O03B04pNLlhdQT4xxNsi19KArtXTm6B56GCAW+6cZ614h7
 /QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IpVkzNkce+4X8VQHSf2Q+7s7bcev+r2GsWXBsjO4bdc=;
 b=JM7h7bPzOXIhRhZh3h+Pa9lGgtTajAsnQEcbLV7F10NEA63wxI57C/Ehvo33ET/Apt
 n99vJDyq/m5O4CgvtqgyGdiWjo/Jx3qUMaYfzRJrkCXI8RqHwV45zAHcsbJ7bnMiDo9G
 go0UbpHJqYynKIgOjrkRBb738yTsheg6x0TyfbnyysIWKnwT821tpjiX6tg3eXrmSeFB
 mpMvyhWl3XyiqyHuWJf+AM/9ubImSR+0VcM28+bEkla6toRfQd0B2lSSmS0vpf9wsLLJ
 DjxWD+55AwFdZaintNgPoiQlifD8YjOaSHqsVj4hXq/WLzIjVuhAlxz8LvU++PihdVyP
 Y7EQ==
X-Gm-Message-State: AJIora/hbpwoeffb71hLtwVmp0j8b9IiJ7KqcFC0ktfloT8niEZFltw2
 Wo8e3Kt0v/fwJ50wT9Ss8In90A==
X-Google-Smtp-Source: AGRyM1vQ1Ek+10RNTpsucTfgHyy9jfgFNHRkE37Hx1iAkpUvGQVXsjbylswESbFZSRuKuyqId36+ag==
X-Received: by 2002:a63:f412:0:b0:41b:cbd:bcd7 with SMTP id
 g18-20020a63f412000000b0041b0cbdbcd7mr7539216pgi.30.1658883389874; 
 Tue, 26 Jul 2022 17:56:29 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a62a201000000b005289ef6db79sm12311859pff.32.2022.07.26.17.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 17:56:29 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: dgilbert@redhat.com
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v2 0/1] monitor: Support specified vCPU registers
Date: Wed, 27 Jul 2022 08:51:22 +0800
Message-Id: <20220727005123.1093478-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x435.google.com
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

v1 -> v2:
- Typo fix in commit message.
- Suggested by Darren, use '[-a|vcpu]' instead of '[-a] [vcpu]',
  becase only one of these may be specified at a time.

v1:
- Support specified vCPU registers for monitor command.

Zhenwei Pi (1):
  monitor: Support specified vCPU registers

 hmp-commands-info.hx |  7 ++++---
 monitor/misc.c       | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.20.1


