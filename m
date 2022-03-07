Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304FB4CFBF7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:53:45 +0100 (CET)
Received: from localhost ([::1]:45488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAzo-0000Wt-75
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:53:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAD8-0002QH-Np
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAD7-0002v6-6t
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZuOy/7+HfqjI4TvmqHPnqx0Q0KWAobCs5iZB1N1AGuw=;
 b=TlCWDVNLK2DvG4DK2BjberWCCh7EMy00nHbpgk0uhIDoccvYF9eemXf4Lxbs9GnID3aiCH
 FuqrAK0LEF/zjSISzbU8Hq7eGVznO0rU/rRpZCKRqPNjGYLXCaNMT0t186qgHyNRsPHZJb
 vXnnQo/Wx+Yh+XLr0n9ia9Cqfkstn/I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-Xwni9VuePJqWhGCF8Qx7xw-1; Mon, 07 Mar 2022 05:03:23 -0500
X-MC-Unique: Xwni9VuePJqWhGCF8Qx7xw-1
Received: by mail-ed1-f72.google.com with SMTP id
 i5-20020a056402054500b00415ce7443f4so7385626edx.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZuOy/7+HfqjI4TvmqHPnqx0Q0KWAobCs5iZB1N1AGuw=;
 b=Cu4pfNkgyIzdKS1xJOKVs8gXL+Gh3w2YpXJKqGYRaRY1mr03G2xBJRR6WsghMi8dIP
 V5IDfyC6IhHifrqSCPyYKVlE7auaAkOFn73u4EjBtk9uIuXAKxl5Dam+d2dB0T5zBhSA
 sLe19oOnBkIP0yDrO8xa5my22wB+rcdmQDfEIzKkaLKiBdMWJnv21hI+dCRsJVO8mZId
 m6J/tBXszd7ZqtR5bbrT8Nnx8BdWNOY2JwJeMzaf0A6qnVJxbLMXvEJbNVkBhgixZueD
 xQryg9ghupAaWOGkdpp8HiiygaBYgItkMsFSyrkABC2TqLUrSKuNNI4f50CcNvDz7Oxy
 SrlA==
X-Gm-Message-State: AOAM533S0zN+/Wea9ydmn5ohlTAmbXg1JxRjlhA18gFqtE+UUxfrzZ3U
 sUINLMNjoPCeYiiJedFbaOHo/yRK2i6hvye5HOHKk5zKDiDyAvKrXiWlxH17L8Cua8Sv+ZzaZaQ
 pdcZ+KX5bHIsk5P70G337Nz6WTycbxAS1dPdxHCjH7Rasangt7EcRrvWxJ5sP
X-Received: by 2002:a17:906:1e94:b0:6b9:6fcc:53fd with SMTP id
 e20-20020a1709061e9400b006b96fcc53fdmr8364009ejj.450.1646647402068; 
 Mon, 07 Mar 2022 02:03:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY6Mab7A0Gj8mQf0ZdX9ZFZL5UllDCQGaFrdQqUzz7E0JQ3K/qkMjIU8nw/DzAfZOKaNg+pw==
X-Received: by 2002:a17:906:1e94:b0:6b9:6fcc:53fd with SMTP id
 e20-20020a1709061e9400b006b96fcc53fdmr8363982ejj.450.1646647401722; 
 Mon, 07 Mar 2022 02:03:21 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 da23-20020a056402177700b0041394d8173csm5914341edb.31.2022.03.07.02.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:21 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 40/47] event_notifier: add event_notifier_get_wfd()
Message-ID: <20220307100058.449628-41-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

event_notifier_get_fd(const EventNotifier *e) always returns
EventNotifier's read file descriptor (rfd). This is not a problem when
the EventNotifier is backed by a an eventfd, as a single file
descriptor is used both for reading and triggering events (rfd ==
wfd).

But, when EventNotifier is backed by a pipe pair, we have two file
descriptors, one that can only be used for reads (rfd), and the other
only for writes (wfd).

There's, at least, one known situation in which we need to obtain wfd
instead of rfd, which is when setting up the file that's going to be
sent to the peer in vhost's SET_VRING_CALL.

Add a new event_notifier_get_wfd(const EventNotifier *e) that can be
used to obtain wfd where needed.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220304100854.14829-2-slp@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/qemu/event_notifier.h | 1 +
 util/event_notifier-posix.c   | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/qemu/event_notifier.h b/include/qemu/event_notifier.h
index b79add035d..8a4ff308e1 100644
--- a/include/qemu/event_notifier.h
+++ b/include/qemu/event_notifier.h
@@ -38,6 +38,7 @@ int event_notifier_test_and_clear(EventNotifier *);
 #ifdef CONFIG_POSIX
 void event_notifier_init_fd(EventNotifier *, int fd);
 int event_notifier_get_fd(const EventNotifier *);
+int event_notifier_get_wfd(const EventNotifier *);
 #else
 HANDLE event_notifier_get_handle(EventNotifier *);
 #endif
diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 8307013c5d..16294e98d4 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -99,6 +99,11 @@ int event_notifier_get_fd(const EventNotifier *e)
     return e->rfd;
 }
 
+int event_notifier_get_wfd(const EventNotifier *e)
+{
+    return e->wfd;
+}
+
 int event_notifier_set(EventNotifier *e)
 {
     static const uint64_t value = 1;
-- 
MST


