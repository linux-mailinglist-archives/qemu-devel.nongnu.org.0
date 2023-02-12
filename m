Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEDD693AAE
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:54:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLDd-0007uv-S3; Sun, 12 Feb 2023 17:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDb-0007hL-Jq
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:53:11 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDa-0004Cn-06
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:53:11 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y1so10461152wru.2
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lPcQ4RHMZ3h7WGdkWu74gz5pDiRQhZMKvDRNLxsYVM=;
 b=wMDTkDiE9P74ywGvFhQ8WOjahnH9rnBpW2LAzzfsMR25ZWbj1gyYQeKrQzbC+xVZrW
 T6ovfMnC7LP+4Nioz582q6mNxxftnq/eHonkgQIT6TLDFlk1Ha0a/7BgjxaTlt6060/N
 fQR2Y/7XKNNHO2nwK+Qj54F3L/RNPMh5LBhIpp7LI3/iNRI2pNrbgQSp5yqgNRebDgTR
 wgR8d+Wd2peOcc83wpAcsGs48hQY/XSvWKw/cF1asz1RrGzGysRM99JD//DMORzFkcxx
 6L/mrD0VSjXHqeMeiQbwwf4wLbG+il9OGCdoAP+GsWmscnrl2Rg5bx/sEdMJGsjBKBXr
 FP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lPcQ4RHMZ3h7WGdkWu74gz5pDiRQhZMKvDRNLxsYVM=;
 b=i/YhocKCOgY2HlyxEu91q8AETY/jajnvCYWIMJos77jjbIu9FodR3wzJLAnq06u7Dw
 cf3gt6ll6W7qJKhGTasgx6O5El6zHxEhrMimEbHYXdQMzpbhSMCu0WeViGaZ7DTi2waR
 g7XBy9EHb+XYsIBZHYxF5i2ySnoPjWBie7+GI4J2LwQcNmjgJ8P95uXVri22Pj+4tSjz
 orQdUChOdmyy+gG5+lg5kqW9+WQa5MMD41N0WplwL6bmIlZ8QAB2ZPX96qNz5upqsyMI
 CsJHI8ScdyyppCXRVs0mGnPtY63BoxCIGEFwjptZh4NcPrMXsta1lfJaUR+vkzQqSN9T
 n9aw==
X-Gm-Message-State: AO0yUKUyN7/YEQvgf5QJADzL5B6AksNDdW2QostwbNRwwLPFUcq9KSWr
 6/wlpZvIR1Ege+zLwjLwYNzpVg==
X-Google-Smtp-Source: AK7set/cCys6Viy8aJ5F+zY8DKPHPw7kE4iE8JBxa9iJ9n/k8b6t1bvVxc6PAuI3FdO1a6g/8T1jQg==
X-Received: by 2002:a5d:6149:0:b0:2c5:5bc0:e7b1 with SMTP id
 y9-20020a5d6149000000b002c55bc0e7b1mr306213wrt.1.1676242388744; 
 Sun, 12 Feb 2023 14:53:08 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b002bf95500254sm9111258wro.64.2023.02.12.14.53.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:53:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 15/19] hw/s390x/event-facility: Replace DO_UPCAST(SCLPEvent)
 by SCLP_EVENT()
Date: Sun, 12 Feb 2023 23:51:40 +0100
Message-Id: <20230212225144.58660-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use the SCLP_EVENT() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/event-facility.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index faa51aa4c7..6891e3cd73 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -64,8 +64,7 @@ static bool event_pending(SCLPEventFacility *ef)
     SCLPEventClass *event_class;
 
     QTAILQ_FOREACH(kid, &ef->sbus.qbus.children, sibling) {
-        DeviceState *qdev = kid->child;
-        event = DO_UPCAST(SCLPEvent, qdev, qdev);
+        event = SCLP_EVENT(kid->child);
         event_class = SCLP_EVENT_GET_CLASS(event);
         if (event->event_pending &&
             event_class->get_send_mask() & ef->receive_mask) {
-- 
2.38.1


