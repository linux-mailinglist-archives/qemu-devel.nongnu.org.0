Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18C858750B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 03:26:47 +0200 (CEST)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIggA-00050z-B2
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 21:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oIgcv-0002BE-4q
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 21:23:17 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oIgcm-00067p-E4
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 21:23:13 -0400
Received: by mail-pf1-x436.google.com with SMTP id u133so5520625pfc.10
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 18:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3bIDmu8zjMZF92Q3uyGCqF7/uncVqzRY+kbdEud23Bc=;
 b=pfevdkpsl6+XJR6O/ak7+CES7c7asDpl60NY+hBXRMNUbLna1ERxeflT1bgSsfWGJr
 XvuwEWp42Z9AmOWqg7UqZEihUzhngBFw6F4O9p4cwqcVyVR1EKJVaqSWubEgNAZHchg3
 bKinvwkUv472JAOWgdBNk/KkiBGJb060OrrJzSNvlNkXoKHWqQaqguXuP6CUJmD/SeBY
 Od0PL67dW8Fiq9m8VQELN8imAjp1fYys9cIdb/309X+Oc6T3vxgJOUcvWK6tzbV9Krxy
 nIL0TE0pFBblkaazPHKsXjzwkoTq8tukZ2qtQG2r+MGB8xKpiKJVxO9WJm+HYz94zZTl
 SYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3bIDmu8zjMZF92Q3uyGCqF7/uncVqzRY+kbdEud23Bc=;
 b=GlqXjf9Vr/WEKU6uIZkEYB/4Iy6Sktccc++tc+hZ2ZUOBGL5jDxwfS81J1B6LI1+Rw
 ZbEDyizwoGU+sUuvcgX8fKXpDYk/wtosuIPKhJoMtcwGuXBhzcZeLJND9lWAxhxVnxJ5
 I+zhLiRzH27vdAZzG4EJ4QiFE8f+4lqY5KspbkFUczZppALFRs3VxNfdDGzZ3P7q/GSG
 U8NlK8FNyLQ56F6vu1GRhxOS2QWexNK+NeT9BuyxVYsTuqkD7Ct0LNDwLX7BCEU4nKJA
 939Uxy+RG5GeUtwZ2a5UD4DVDcrjtkWnD0U/0hS1jCpsQccm2IE30YlMeNHPDbBCL7Q2
 ummg==
X-Gm-Message-State: ACgBeo1Bq9jaz2xs6ALrTVWuCFt1ro+hCktX2WyCe/OVqgkS4JOSczrL
 gylu+PwW85XAHEIohJcNYqTuOQ==
X-Google-Smtp-Source: AA6agR53TxbPi5lizEa8qQuN7RMQB3dg2G6ZBJXlsOftxa/EuxLYzlQO2cZdtuCi4SALKzKQfAE61Q==
X-Received: by 2002:a05:6a00:e1a:b0:52d:9c84:24c1 with SMTP id
 bq26-20020a056a000e1a00b0052d9c8424c1mr4954910pfb.13.1659403385769; 
 Mon, 01 Aug 2022 18:23:05 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a63fc53000000b0040d22243295sm8289865pgk.79.2022.08.01.18.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 18:23:04 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: dgilbert@redhat.com,
	armbru@redhat.com
Cc: qemu-devel@nongnu.org, darren.kenny@oracle.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 0/1] monitor: Support specified vCPU registers
Date: Tue,  2 Aug 2022 09:17:55 +0800
Message-Id: <20220802011756.1227808-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x436.google.com
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
- Add more document in help info.
- Use 'qemu_get_cpu()' to simplify code.

v1 -> v2:
- Typo fix in commit message.
- Suggested by Darren, use '[-a|vcpu]' instead of '[-a] [vcpu]',
  becase only one of these may be specified at a time.

v1:
- Support specified vCPU registers for monitor command.

Zhenwei Pi (1):
  monitor: Support specified vCPU registers

 hmp-commands-info.hx |  8 +++++---
 monitor/misc.c       | 10 ++++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.20.1


