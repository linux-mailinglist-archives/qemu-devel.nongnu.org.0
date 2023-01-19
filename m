Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D544E673242
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:16:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIP97-0006wy-B9; Thu, 19 Jan 2023 02:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8d-0006Lc-5y
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:15:10 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8b-0002T8-H1
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:15:06 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 o7-20020a17090a0a0700b00226c9b82c3aso981664pjo.3
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sJQjtNov5mk1r72UjvpVU8akaXUCzzt2OYWGCXBa4Pg=;
 b=JBciYpY5MJw+yVi9oUcyQkeAS+QQ4ppkzv0yh4O3lBoQp+nOlKWqK3TxtqwUq0pjWT
 mgknuI1dvGTcx+C7IBdzuF1uqaNlajWhJVZrwHznr7Al3WPZdjZ2f0VPPhsrC+Skc5c3
 H55nseLwA6zN0EY0WwdGeu7EUdGl3VOsGwxA7kuq/PTB2y0njjpGZlRHM6deKf/IV4Zi
 B8Z9RbztoaYl+GJNEPSMqYbJP1a/9+Y5mRhcjuB8TWZhzb0N/HdGiYTZhIv9DcPhoXtF
 9Ka9c3BphkiznLhp4Y33IO4meiBSI6iLrOXfdbZoJEBrh5sONx+rBZ96Hi2pDvFBQrSd
 ikbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJQjtNov5mk1r72UjvpVU8akaXUCzzt2OYWGCXBa4Pg=;
 b=HiHwG3jdNiNDRyAXCgO6C/NxXYIwTm6nyLCi6sgNjusZZQUR8iITlFUeNUrGn2i1xD
 /togqaTMuok60nU9HLIocZ5RAspo0dDA5uwTlgyJszAFXn8Vv7i09CQQFtjyTXl83SOP
 ugs85hgf5J0gtHa8ESenfHrLUG4ck+6nZ253BZqijwphZtlbQov/WFncE2LOgl7GksXa
 6z6mPP8cveNEwai/XRwpU+BxVPO23UIRktkcwLi23lOTAwNcHEoogCNCUxHOQ4JwR24G
 UyKh8MFyp1CNt5VmOTlyDRbo5ytH9mVc0+CJP3RYYxI5OwjyN3JoCGvtiA2DjjivLgbZ
 sO1A==
X-Gm-Message-State: AFqh2kqvsDirda2hJsKwfyoSzR84LNngqpVrKaAQYiaoJJFYq0M0qUP6
 jtWdGbVe2JpKLQKZb/q8zUk1s6PJjeuiRN/M
X-Google-Smtp-Source: AMrXdXtB4KLaam3H27BUCuH5QPnuU8KTdVpu+cH1nNdWx6CfTahh7TnZJaPEOjtXsP+hoO/hnSvZ5w==
X-Received: by 2002:a17:902:7042:b0:189:7548:2096 with SMTP id
 h2-20020a170902704200b0018975482096mr9511764plt.45.1674112504231; 
 Wed, 18 Jan 2023 23:15:04 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902ef4400b0016d72804664sm24266631plx.205.2023.01.18.23.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:15:03 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 12/12] MAINTAINERS: add myself as the maintainer for
 cryptodev
Date: Thu, 19 Jan 2023 15:14:19 +0800
Message-Id: <20230119071419.3585771-13-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119071419.3585771-1-pizhenwei@bytedance.com>
References: <20230119071419.3585771-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ec5aebadb..0f8ffe2f64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2858,6 +2858,7 @@ T: git https://gitlab.com/ehabkost/qemu.git machine-next
 
 Cryptodev Backends
 M: Gonglei <arei.gonglei@huawei.com>
+M: zhenwei pi <pizhenwei@bytedance.com>
 S: Maintained
 F: include/sysemu/cryptodev*.h
 F: backends/cryptodev*.c
-- 
2.34.1


