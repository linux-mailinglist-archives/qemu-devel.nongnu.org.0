Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7151D1092
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:05:36 +0200 (CEST)
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpCh-0007xs-81
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1jYpAi-0006br-Q7
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:03:32 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:38463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1jYpAg-0002Uq-Im
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:03:32 -0400
Received: by mail-lf1-x132.google.com with SMTP id b26so13252889lfa.5
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sloJaQPzW0U0ONEJWXGvQ/PltRAAu+Zk7vHdtQOET7A=;
 b=JT+n96RqGMf2ycqCNm386JB8XNEixLzizmJbEAAQQA6mDWOGQW0T816zPNa4UPX2Of
 x/+0EewP02upQb37Io7bRziQQMvIizaSLeqaBgCwh8V2KTCu3FtqbAGQjitp6lnH0WRV
 FiWsfmg0bhxkPcCScAUQiFDIkdzwBx0qeFXluPwds9aX/43xuMt3j/uZCtup2cKPEEN0
 UaVRfHSCEQUtwLCSvbL8OsOMsSQJIHZ6wWBy2Q9KOA0ioZzgp1/StMCW67a/j8He3z4I
 l17wveW45gKea6ROiNOC/0cgRNefeMR9FyU6VUW2JFE8MobBeToiSkw3zrc41IOHPXXl
 F7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sloJaQPzW0U0ONEJWXGvQ/PltRAAu+Zk7vHdtQOET7A=;
 b=hQ3fhOaJN6yzD9G7F0GLbm06iy2wJ9Jn4RY3dAyJUUQUFiGf0bgs0h1s2cFI2O+lWX
 MZUGXu1SxsOpNEKK0Xz0/+zq+PhjYvjdy+YZzqPZRb9VDVllz7VRiZJkPjZIHAlRZajZ
 OriJPVKudx5RVQjm9cuJKkhY6NZxR6l2VDjXIH2x0Fxl/kMJuR7zi5ElOqw6+fv8qo9f
 qzGh4VDjuIFeXxXfNCkP2j3JrjgBgfUngp7pfBUbOnm1n3mMy781fawWIX1gCZsiboGp
 jMcmvzPHclXHr/EO99jH/Bus4jDvxj5TEdo8naUgIcTi3t3cjSlhm64OIA5HnN7rZeYI
 JsZw==
X-Gm-Message-State: AOAM533ER1fsDS7MZVdqYtuGEN2hTXSnxTqI+oW9Crw0pspMs6phwHy3
 XV3vbzNwl5U1RvW56Cu8cJRK5WpJp6cwLQ==
X-Google-Smtp-Source: ABdhPJwrhfw8sbfhQB5QbWo1UVWwfBa6p8QuUSrq/LV1uudHB2poNbghNqnw7JsUsB59Q7z7YwpSSA==
X-Received: by 2002:ac2:50d8:: with SMTP id h24mr18439052lfm.63.1589367808792; 
 Wed, 13 May 2020 04:03:28 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id s4sm12045991lja.14.2020.05.13.04.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 04:03:28 -0700 (PDT)
From: andrew@daynix.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] e1000e: Added ICR clearing by corresponding IMS bit.
Date: Wed, 13 May 2020 14:31:24 +0300
Message-Id: <20200513113125.1465650-1-andrew@daynix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::132;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x132.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: jasowang@redhat.com, dmitry.fleytman@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

Added E1000_ICR_ASSERTED check.

Andrew Melnychenko (1):
  e1000e: Added ICR clearing by corresponding IMS bit.

 hw/net/e1000e_core.c | 10 ++++++++++
 hw/net/trace-events  |  1 +
 2 files changed, 11 insertions(+)

-- 
2.26.2


