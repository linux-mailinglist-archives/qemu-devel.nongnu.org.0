Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46E255B8E0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:08:56 +0200 (CEST)
Received: from localhost ([::1]:41162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kjn-0003y0-RR
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o5kdc-0004Pz-QT
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:33 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o5kdT-0006vC-Ru
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:02:29 -0400
Received: by mail-pf1-x433.google.com with SMTP id x138so5706945pfc.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 02:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+hKm0a9BBSWooYPUmyr72u3rDo+MwVGoVU01cNjV7yE=;
 b=IBYh8l6exzvrtI3CSoPaPZI5kKOrIc8djElosjgN44WUkueft4DM10J488Xr/Y5SoH
 PW1O8XMPRmbc3BCMHBhsaLKYOvNRo3d5Cnf2oUWf+At6a6GpGAUTS76NEZN6c12kktLZ
 XXTFlKCM4DigfSM9/VE48up1QRdJQNJWWs/vC0E1hNQo+IeSiZRJ2dceaLuKBV6Zar/d
 mufe2QLBzW+oh4zE+/Al6KP0EJGBBL7TcReubsLMOIX6/4UL2dk9QtCCHiJAoB0NbInq
 KPad9cSzPbWKvyaHeNFz3ynUL9ARZB1LIWmS6mswaC8jU5m5t59tszM0rEnGybpJS6lg
 dBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+hKm0a9BBSWooYPUmyr72u3rDo+MwVGoVU01cNjV7yE=;
 b=igWfaGRgA6mRl2b1MmiUmlTecajb0eUffzDMqEO19prpQ1JgveCB+BlEawPuQlDsQo
 vw65+qDMv0yGUytXz8dv/7lPWpujgccJ3CdGBpnupI5Sw6m8hxM1XBSp4uUps5+VtU0+
 p2JEjDF8i6TAPOXODrG5SuU4uxPbpDGbjja2eVJHLWidGMmURLDO92q1OxnqsUkPYMSi
 c6+0EUUKXSwz8OJ8z/4dGrE6Mak+tqCJaYAc1AJnGkvtciHCDiRmhXm46mr4pGb+XHH0
 xVxmyYYLpF64AqPzOCKuxvji9+ZxH97GGvzJNsWbszJVKceHmX+1Fi2V5B/XZ1572o4r
 oCSQ==
X-Gm-Message-State: AJIora9t+D9nQm/UGRWeNdi9GvBLRm0Mc0RL16lAwfrBAzogo5gcLwxo
 nJ97srFtrDnbUaoloUN2r2MF
X-Google-Smtp-Source: AGRyM1uM7Dr4MtgKCgtwnmbs/Yh7epBFG/ZwPHL1ReWkJqxDXpDps83ccRHHlfJYJHViRTbeDpvTLA==
X-Received: by 2002:a05:6a00:b8c:b0:525:6391:1139 with SMTP id
 g12-20020a056a000b8c00b0052563911139mr13918548pfj.80.1656320541922; 
 Mon, 27 Jun 2022 02:02:21 -0700 (PDT)
Received: from localhost ([139.177.225.225]) by smtp.gmail.com with ESMTPSA id
 je20-20020a170903265400b00161f9e72233sm6608765plb.261.2022.06.27.02.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:02:21 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	armbru@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] Fix some coverity issues on VDUSE
Date: Mon, 27 Jun 2022 17:01:59 +0800
Message-Id: <20220627090203.87-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This series fixes some issues reported by coverity.

Patch 1 fixes an incorrect function name.

Patch 2 fixes Coverity CID 1490224.

Patch 3 fixes Coverity CID 1490226, 1490223.

Patch 4 fixes Coverity CID 1490222, 1490227.

Xie Yongji (4):
  libvduse: Fix the incorrect function name
  libvduse: Replace strcpy() with strncpy()
  libvduse: Pass positive value to strerror()
  libvduse: Check the return value of some ioctls

 subprojects/libvduse/libvduse.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

-- 
2.20.1


