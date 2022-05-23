Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F4C530B2C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 10:58:32 +0200 (CEST)
Received: from localhost ([::1]:44544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt3tX-0005Tv-Cg
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 04:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3md-00023i-Vg
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:30 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3mZ-0000Zv-4t
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:22 -0400
Received: by mail-pl1-x633.google.com with SMTP id m12so12498694plb.4
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 01:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4e8cWc0LcmrlXhvfwWsJ902iaVX9k0U46lLMhIYltgQ=;
 b=d9ApPTzr45xs9AmwbWnDBwlrveJsdigEeEcLB1Ywx4ZMTNXLgYzUN1Yr8fhbxCipZk
 ls02C2sAUoDqIlTlKAwy8UP5NLYLnpId5nr+yZ8TLoe7JdezGmjNRj058LqjXYr0Xz5S
 52HuN6Xz6pv6e1I2Al9YwkXHfvG//PrPZvxC6XAAn6dE/ehWbAqobeFPa+FopNJp8YMK
 VccC7/OR0S7e3/erM3q/MAuTTMDDxPNHQ3EyDEgAqgPnSXHQc19VpSYgrjVn1gBECEgc
 nxoFlu0+7R8PALq+wbnos+mFwfNLGf1RfXuF2Z0Sfk5Rjts/9VPTV8xFsjUzjejUXk52
 VKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4e8cWc0LcmrlXhvfwWsJ902iaVX9k0U46lLMhIYltgQ=;
 b=YT61uUgdAKjB8hxcOY/DLqd8QNEv2m9iJfP/vRJ2CuZPiPylzgpxQDW0Vy+dhaaw3n
 KLr4XsmRzjx0WxuGEbNyU57uZWX1wwAayeFutJD+hoCqSPNXNU9xWs4nVYtUeA5OFCDR
 7NMHZw2/6ie2+PPxG3KF2JHX2LpxppKnDdpZdP0nYm9uF1i7iPc62XPPmvQBOn7ZdN5J
 BgkIeHZUSAEetiDbqH3eWX04JOLIfMiWgv65k5t334TJ93EOtpmqiLVytV673qaKPU2O
 26fwqPLtSHeKW9nQaewKCnKlwZNOBKHsgl3lHlm9yB7I4gPPQeUMOPUVwM4LprpnebE1
 V1UQ==
X-Gm-Message-State: AOAM531/HPYdKZIDrVD8h+xiRdo+S8iYVwg64i+efe4/zzSpuSZTszQ/
 XK1zUwHq1mJW6gWexcO8Zlex
X-Google-Smtp-Source: ABdhPJxlNTIkG1AKTAy/DNtzyQm8xKT10DYROo6vgg7hbLuetWZZk2gTUXnq8tqMykyvmTcRCBFzWg==
X-Received: by 2002:a17:902:778e:b0:162:2cf7:28be with SMTP id
 o14-20020a170902778e00b001622cf728bemr2254547pll.0.1653295866596; 
 Mon, 23 May 2022 01:51:06 -0700 (PDT)
Received: from localhost ([139.177.225.248]) by smtp.gmail.com with ESMTPSA id
 i3-20020aa796e3000000b0050dc76281c8sm6523275pfq.162.2022.05.23.01.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:51:06 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 1/8] block: Support passing NULL ops to blk_set_dev_ops()
Date: Mon, 23 May 2022 16:46:04 +0800
Message-Id: <20220523084611.91-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523084611.91-1-xieyongji@bytedance.com>
References: <20220523084611.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x633.google.com
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

This supports passing NULL ops to blk_set_dev_ops()
so that we can remove stale ops in some cases.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..35457a6a1d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1062,7 +1062,7 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
     blk->dev_opaque = opaque;
 
     /* Are we currently quiesced? Should we enforce this right now? */
-    if (blk->quiesce_counter && ops->drained_begin) {
+    if (blk->quiesce_counter && ops && ops->drained_begin) {
         ops->drained_begin(opaque);
     }
 }
-- 
2.20.1


