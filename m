Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EBE44A824
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 09:07:20 +0100 (CET)
Received: from localhost ([::1]:46466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkMA3-0005Qz-Vq
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 03:07:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkM5r-0007nT-9h
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:02:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkM5o-0002Ad-4X
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636444974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pD7YLrllgP6VLzqydyv0t3IiBKdwZIuauKQIRAu02NU=;
 b=VS3frv4TXAfiTGScScC2dEJQWYkfWFFYMoiCHX3npuco6lkte7hSDjn1oeryYN0Wj6IACN
 fwRCfCoX7duAps9/CZnnaBi+xq1Yp0ZkzgdpMu3B3edXjPAzY0BOou9B8l5mH67qEBuIwJ
 tBKdnPZnVhwX3j5eRgXXRlFIY/2St/o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-Y5CWEFJ5OWy4HcxbyrIDzQ-1; Tue, 09 Nov 2021 03:02:53 -0500
X-MC-Unique: Y5CWEFJ5OWy4HcxbyrIDzQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso916006wme.8
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pD7YLrllgP6VLzqydyv0t3IiBKdwZIuauKQIRAu02NU=;
 b=S4Bz0Qs0oJAuZoG2ZMOPAljfN6W1HPGuZSCcJNYMzlSPNYLXHAobm9dWFOmhaXkJ2l
 93vN0C5MBeC2xTM8n5F7nFJCDQURs1CGZcM9kovjyHfEq2Jw/CJJQFHmzqt2pnZWx54s
 TgaiNS7hnMC6myQvkISb1Dwj+8i+nxJ5sa6WCn19PSaUfsGa4YslP9wvW7xhcHdiXzHW
 FQoswD4JkNz2W0V+7VGlS5JMseXoXPLlmb5hDqQeNkO1mMy9f0ghwA+qQiyluSshEa0A
 vPT/CF2uxllitOrBH1t2VjCnxchsQeUtOgJy4Esfoh7FZqgn1DU0vwfCr8iqPqai/w2O
 d4pA==
X-Gm-Message-State: AOAM531ijnbUE3iJjFxcHwcaTnoQV/I7XdzcWlmZM52+87MaUceNn0RY
 bDwGJMrHNgu6DSsVxlI92G60kF90JfPXOJys6QhW73eGUsnwEeki9aKvyZ/qZwtASDOFCoppXXO
 edYp1+7cNp8uwxtuNQ071a/D/S9NA12apVnrWcn0GWnCzFAbsMaUEnjqf021DtyjZINM=
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr5058789wma.129.1636444972309; 
 Tue, 09 Nov 2021 00:02:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzco07ZPBLwRGpxXbcidN7nUclkeHMCLM7S1WzzppBeZxJlEIMVt8JpdKYnw5d6l4tWVU+KIA==
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr5058754wma.129.1636444972068; 
 Tue, 09 Nov 2021 00:02:52 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id h13sm19634099wrx.82.2021.11.09.00.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 00:02:51 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] docs: fix 'sample-pages' option tag
Date: Tue,  9 Nov 2021 09:02:45 +0100
Message-Id: <20211109080247.62559-2-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109080247.62559-1-quintela@redhat.com>
References: <20211109080247.62559-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

commit f78d4ed701 has fixed qemu tag, making 'sample-pages' option tag
involved by accident, which introduced since 6.1 in commit 7afa08cd8fd.
revert this line.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 qapi/migration.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index f0aefdab64..bbfd48cf0b 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1796,7 +1796,7 @@
 # @calc-time: time in units of second for sample dirty pages
 #
 # @sample-pages: page count per GB for sample dirty pages
-#                the default value is 512 (since 6.2)
+#                the default value is 512 (since 6.1)
 #
 # @mode: mode containing method of calculate dirtyrate includes
 #        'page-sampling' and 'dirty-ring' (Since 6.2)
-- 
2.33.1


