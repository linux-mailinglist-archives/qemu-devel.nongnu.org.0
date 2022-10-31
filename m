Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC661377E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:11:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUJ4-0004Zc-CG; Mon, 31 Oct 2022 08:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIe-0003nU-Pd
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUId-0003NH-CZ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jNpjaX4cmprH7T9UhisnDsmdXVXPpfdfHlComBYrO/E=;
 b=VaujLeSouHLDqxU4ovbx9N9/Y+VZU5T2zBZIh4UpILskMukgyybfozg8SCj4IDV7L7yZ/D
 4SceNJIvgyKgMj0j0ZCvQFtySDwj07FrPs+Js+YWoPiqq9775bOvtaJZlEBtyxaETbB25R
 g0uiffpaJtRMAyDyg+iQP/8pRAs5vPo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-pLONW9IDNYWW3HREtzZHiQ-1; Mon, 31 Oct 2022 08:53:53 -0400
X-MC-Unique: pLONW9IDNYWW3HREtzZHiQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so949506wme.8
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jNpjaX4cmprH7T9UhisnDsmdXVXPpfdfHlComBYrO/E=;
 b=lXANlpJVYZK7v8x9Ir/2nhzXQ989u3ms2ypqwgD4RGv1W+PScKZwgDcbscgQ2E3K+2
 r0EKn/yVdpqYS4hyLqpWVQu3bt/VJ4mYsKON/Y3KLjQxsqZ2uR9sKKoN6D4JYIe0Quhm
 ASjpYR3miHUZytQA44ytR+xop67kkNbnOQ3NYM6gu+xa1+KfCff8o3jgTKTgogbZeO2Z
 0r6mUFjTcR0auIcn4HZCocgyQAoUcyUhq27lViU5IZt9EtP5t83HZuoxXLIlOlWafDLl
 Ez/Hg4TuOHT5auqusZ9eEESvjBXtXlFbkZksco2pAmSjWXE0jsGiTcD9d3mTl/9+xQ7t
 CjTw==
X-Gm-Message-State: ACrzQf0oBJBWhwm5cKLvGZ0yr/iB9/Vkk1TQIBPnK77w607HVOAdV3WJ
 4ya1UfKhNbUbd/yHGfluuhyaDCPTv6hDrHNFm06hXPq0D+xaBo17U8QxnEkDQpphIJ4Lw+XadKf
 n6Von+xVJcY3ES7PQCcUMJF8ElKNw+5yZWsPi6hlWTFZen4OuzC9vUU1DK54+
X-Received: by 2002:a7b:c34a:0:b0:3c6:e069:d41c with SMTP id
 l10-20020a7bc34a000000b003c6e069d41cmr18158706wmj.180.1667220831704; 
 Mon, 31 Oct 2022 05:53:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7JcySzAOQQ2rm7r/PR+NZOdxMuawAxlWNRRKzH7aRsZImBVbg4NSPeeSoTtrzR7nfTHzpXiQ==
X-Received: by 2002:a7b:c34a:0:b0:3c6:e069:d41c with SMTP id
 l10-20020a7bc34a000000b003c6e069d41cmr18158683wmj.180.1667220831413; 
 Mon, 31 Oct 2022 05:53:51 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 d8-20020a5d5388000000b0023672104c24sm7193354wrv.74.2022.10.31.05.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:51 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 66/86] MAINTAINERS: Add qapi/virtio.json to section "virtio"
Message-ID: <20221031124928.128475-67-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Markus Armbruster <armbru@redhat.com>

Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221020120458.80709-1-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 47c02889a8..e894c07552 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2014,6 +2014,7 @@ S: Supported
 F: hw/*/virtio*
 F: hw/virtio/Makefile.objs
 F: hw/virtio/trace-events
+F: qapi/virtio.json
 F: net/vhost-user.c
 F: include/hw/virtio/
 
-- 
MST


