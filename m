Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC14D0BEC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:19:31 +0100 (CET)
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMdW-0000iZ-Ax
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:19:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM82-0001Lq-21
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM80-0005mn-Kl
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07QDxIPMafAaF6WsUgGU20pp0SPQclmS77EMgRXJWQo=;
 b=RH/4L6tumuGpqDS3oqXq9+NDpcgxT0G0QJOArNrUu0dCwVLDbcTNUTYqCGxmwKMdNumc/Y
 jlxV7iq2HHaAKFaVyphJUwqwRslyiyvzrJmqEyLOYn1l6tdGFAhJY5BU9ji/NfuxH5kP/b
 zOVMYCMyCR7pcL8uDjV+eu405VOSlLA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-jw6nO7VpMsm8gXRCzVGIDw-1; Mon, 07 Mar 2022 17:46:55 -0500
X-MC-Unique: jw6nO7VpMsm8gXRCzVGIDw-1
Received: by mail-ej1-f70.google.com with SMTP id
 ga31-20020a1709070c1f00b006cec400422fso7655872ejc.22
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=07QDxIPMafAaF6WsUgGU20pp0SPQclmS77EMgRXJWQo=;
 b=O5Ly2DhoxkivHZLi40zAtvMV8bF9Qvp+/uY1Dt4iGSqaganVf/7BhwUGDsGBt/Q62M
 wUgEoCV/5cVuPUj+lyM3TQaiIJpI2Yu6hj4rvDGt0/lqtHPblZoeADoDiagEY0gF6l2s
 nHtp1GbTxLlmz9BBMZL4H+oPPhIhR+Ex2x3V+zMADfM1Ls02yWGjOYDRzO2HworG/Too
 Rds2rwY0NSgd8rO7z5OcCo5/YBrX/2P+bvnJhQCujsGKn5f3E2NghrNKjs37Y4DUhMsn
 SdTPijv/xPxdRwveGvu89eSogP5rlK/XcLO7MRvpUkSyhjFIRo4zLmMR4hbq4bH5ZpE/
 il9A==
X-Gm-Message-State: AOAM531VpuPs4a6nf0Ppb7qCUXHRx6Dg5d6lo5Y4RpHaAu3RfStdQY4+
 n+9L4rquxxSePlgET8Kr5E4mPR4O5Xx5ibf6ZVhp6VymFB5jiCTsPA4Mo4hRJFua1JDchvjIteO
 dVcZFy3oidi7XYGGWVgtoPP/B2kmdLRJxAbUq+gw+7Fs1a5cvAVY1AxmLiS8v
X-Received: by 2002:a50:da4b:0:b0:40f:28f0:c2c0 with SMTP id
 a11-20020a50da4b000000b0040f28f0c2c0mr13212075edk.374.1646693213785; 
 Mon, 07 Mar 2022 14:46:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzddG43kJtqc0HzgY84m0rcLCxKKz3lG2/Va2AM6N1Uh5kySZNwJVy1m1Ifb268Y8UzsZW6eA==
X-Received: by 2002:a50:da4b:0:b0:40f:28f0:c2c0 with SMTP id
 a11-20020a50da4b000000b0040f28f0c2c0mr13212054edk.374.1646693213510; 
 Mon, 07 Mar 2022 14:46:53 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 b24-20020a170906491800b006db31196e2bsm1338135ejq.218.2022.03.07.14.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:53 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 43/47] docs: vhost-user: add subsection for non-Linux
 platforms
Message-ID: <20220307224357.682101-44-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
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
 Stefan Hajnoczi <stefanha@redhat.com>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

Add a section explaining how vhost-user is supported on platforms
other than Linux.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220304100854.14829-5-slp@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/interop/vhost-user.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index edc3ad84a3..4dbc84fd00 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -38,6 +38,26 @@ conventions <backend_conventions>`.
 *Master* and *slave* can be either a client (i.e. connecting) or
 server (listening) in the socket communication.
 
+Support for platforms other than Linux
+--------------------------------------
+
+While vhost-user was initially developed targeting Linux, nowadays it
+is supported on any platform that provides the following features:
+
+- A way for requesting shared memory represented by a file descriptor
+  so it can be passed over a UNIX domain socket and then mapped by the
+  other process.
+
+- AF_UNIX sockets with SCM_RIGHTS, so QEMU and the other process can
+  exchange messages through it, including ancillary data when needed.
+
+- Either eventfd or pipe/pipe2. On platforms where eventfd is not
+  available, QEMU will automatically fall back to pipe2 or, as a last
+  resort, pipe. Each file descriptor will be used for receiving or
+  sending events by reading or writing (respectively) an 8-byte value
+  to the corresponding it. The 8-value itself has no meaning and
+  should not be interpreted.
+
 Message Specification
 =====================
 
-- 
MST


