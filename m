Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBDA33E9BF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:29:29 +0100 (CET)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPgO-0005Ci-7W
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPe1-0003Yq-SS
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:01 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPe0-0008Up-CX
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:01 -0400
Received: by mail-ed1-x530.google.com with SMTP id h13so849602eds.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KBK+oSYyQ3izYCwDMZ0s2I8Z5y9obtyOlXBYftAXE6U=;
 b=Nh9rto9iku5u/XBSpnOEoYGZWur+QG6pLt+lqm28LdQUVP4u9PQc9djBTBATlFrkFR
 Ylx9GqYaIHpG6uH4M2nbXqxGVN6saHjOvyI3/ZyZ7Jfp5lUTRJNdZylTkK5fuDZn/Hxe
 8MvH1HatceWbykfw3xwqLeVW/39K0UQZPxqri+J+vdFVVfgAgqGxW7VyjK+LkfHJ971Z
 KKqHD0LnwdIukbBnDb6Hhtyst29fj4FCXDMs2u6H9fBfXTvdFjdhVDGHI6vuiuAYi/fo
 UbNSqIBLHJTz1GWWPax3PTVM5z/BEY4RFo9+2MkZN+A2HUEOtXDeWEfxJ9dZmxsvGl8s
 0zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KBK+oSYyQ3izYCwDMZ0s2I8Z5y9obtyOlXBYftAXE6U=;
 b=IiXAzLFVFxDm6hvzitSnIH86yo6gbQ967nKKLC90yIEWmEDdFKekkNlrmbTqlR+XUr
 LN+H6Tsm5tZ4q3yDtQM+8rwKmF1LaWhOkj+dSlc01F8+wsGY3QftHtI0hkTydZMYOPLo
 Ul7brwZPk/2KjXKe0lr9MRmM8nsTFAo+U6H38kZEw0SKyPeUZ2HnMp5/VuG26cH7js4S
 kX/93SN5ScUhv0He05pAZcEOrTqdZY/fLTm9kASFGlXLdfzuBQRc7DZGC7FIw/5WQUMW
 sbcEIpvlGtaKcBFm/isI14q1vZ61h/hMBTT/nTQLuAvIBPAVft93DgxC1O73p7jxw6fC
 7mcw==
X-Gm-Message-State: AOAM530RGrFYc5Uh1yr1QqGxzrzDfzzEQGClQDMe+iY9YhDUh9F4Qwq2
 ijb8zNW/8d6+1vBaao+ITmI=
X-Google-Smtp-Source: ABdhPJwFfhS7qaII+uRT90b2ivEznNxRwA5CPW8uhg0FsvkKRTxJbzymYZJUPg5fGENxSrJPOSDw/w==
X-Received: by 2002:a05:6402:2ce:: with SMTP id
 b14mr40183437edx.13.1615962419043; 
 Tue, 16 Mar 2021 23:26:59 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:26:58 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 02/12] net: Add a 'do_not_pad" to NetClientState
Date: Wed, 17 Mar 2021 14:26:28 +0800
Message-Id: <20210317062638.72626-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

This adds a flag in NetClientState, so that a net client can tell
its peer that the packets do not need to be padded to the minimum
size of an Ethernet frame (60 bytes) before sending to it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

---

(no changes since v3)

Changes in v3:
- add a comment to 'do_not_pad'

 include/net/net.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/net/net.h b/include/net/net.h
index a02949f6db..3559f3ca19 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -103,6 +103,7 @@ struct NetClientState {
     int vring_enable;
     int vnet_hdr_len;
     bool is_netdev;
+    bool do_not_pad; /* do not pad to the minimum ethernet frame length */
     QTAILQ_HEAD(, NetFilterState) filters;
 };
 
-- 
2.17.1


