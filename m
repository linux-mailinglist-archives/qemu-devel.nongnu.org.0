Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE926397805
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:26:57 +0200 (CEST)
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7EG-0000cx-IU
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lo7DO-0007rt-89
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lo7DJ-0001d7-P0
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622564754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kbemtu5SuRmZUgikT9P1lOnHb3c8k3upALUhB55ylRo=;
 b=EHsqC+SDS9r5Mn9zWGN6VKkraY7hcwBQTkqp3L8ADPFNk6rbfkveJSamJ8w61OpFJXOiDb
 PfKP/UBkzfKA69orr6+klWFqVK+GpaLihZJWyQ6zGBGPRUW2N0+WxuCI24v3ma0ReBmLj3
 T17G1yrM1Qyo/GyQy14lTsyzVAWdHmg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-EzqY3zfwN5mQhzxwZwRMUw-1; Tue, 01 Jun 2021 12:25:51 -0400
X-MC-Unique: EzqY3zfwN5mQhzxwZwRMUw-1
Received: by mail-ed1-f70.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso8103242edd.19
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 09:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kbemtu5SuRmZUgikT9P1lOnHb3c8k3upALUhB55ylRo=;
 b=fof8p8xXlkqBKwV2qrxTPECTwIqTYGV5Mh1Zo3NWn19ZJFA2pbOaOoKFe9z2PdwTZK
 88x03aLJ5wqvQZPxiKnEPk7Sf3I6xur+W7m4g937p+dVyIXiyM4mNZIu5eG0sWlFzlU4
 OtraArpCW/+kW5wLjxkR3vv807qZvg+p+GmMa8BVMYrh/2IgRbaNh+UzwMQ6eQhFor4L
 eifuHqJljwRIfQoF0Q2T+FvusQgH6yWp+d15bZ1gywt4xZKhm4VvkMhmGM0rexeNG51l
 WKeVvOX4unn//cnPt2oWUdfBo+jIwHHhRVCbnVZzuwSf8nc438M6XmlMEy4mhok7lXpW
 gNag==
X-Gm-Message-State: AOAM530YQOPJycnlqf6V0k0n36/NhyyW6sO3JWa5eY8J7t4IBfklYcm/
 iTVb1yZ2m0rrJ6TMYH6IzfPOL0tdO4Z7wINwJrSanMIVuEHBohl756mOx7/BIbynICGf50P1sSK
 XHs76Idiikfyb0NY=
X-Received: by 2002:aa7:cfc5:: with SMTP id r5mr22061940edy.319.1622564750239; 
 Tue, 01 Jun 2021 09:25:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycU8skpU6Zi1H+2RK2KMjeAb8lhJ/q4JhWVmUl+9e2Y7t+CfkVL/mmz+crHku04lqotJbf5Q==
X-Received: by 2002:aa7:cfc5:: with SMTP id r5mr22061911edy.319.1622564750062; 
 Tue, 01 Jun 2021 09:25:50 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id s10sm1895658ejf.54.2021.06.01.09.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 09:25:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH v4] docs/secure-coding-practices: Describe how to use
 'null-co' block driver
Date: Tue,  1 Jun 2021 18:25:48 +0200
Message-Id: <20210601162548.2076631-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Prasad J Pandit <ppandit@redhat.com>,
 Bandan Das <bsd@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document that security reports must use 'null-co,read-zeroes=on'
because otherwise the memory is left uninitialized (which is an
on-purpose performance feature).

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v4: Fixed typo (Kevin)
v3: Simplified using Vladimir suggestion.
---
 docs/devel/secure-coding-practices.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/devel/secure-coding-practices.rst b/docs/devel/secure-coding-practices.rst
index cbfc8af67e6..0454cc527e1 100644
--- a/docs/devel/secure-coding-practices.rst
+++ b/docs/devel/secure-coding-practices.rst
@@ -104,3 +104,12 @@ structures and only process the local copy.  This prevents
 time-of-check-to-time-of-use (TOCTOU) race conditions that could cause QEMU to
 crash when a vCPU thread modifies guest RAM while device emulation is
 processing it.
+
+Use of null-co block drivers
+----------------------------
+
+The ``null-co`` block driver is designed for performance: its read accesses are
+not initialized by default. In case this driver has to be used for security
+research, it must be used with the ``read-zeroes=on`` option which fills read
+buffers with zeroes. Security issues reported with the default
+(``read-zeroes=off``) will be discarded.
-- 
2.26.3


