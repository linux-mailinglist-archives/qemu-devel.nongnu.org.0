Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71EC4CFB1B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:27:53 +0100 (CET)
Received: from localhost ([::1]:34262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAan-0005OB-2H
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:27:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRADH-0002jW-GM
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRADF-0002x5-CK
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07QDxIPMafAaF6WsUgGU20pp0SPQclmS77EMgRXJWQo=;
 b=AqqYmUQyRAbxFN6/beUr64ItU7tN++IFmBcN6F3MFQXT8pcts+ILZqkjQQEv8pAH5Xf/3Z
 kvx06ULNPM3idOXjEqbiEcPMuvp6+PsNHYswsscxO4jNahGrRSeHPvX1gJo/0Rt9Ig7uAA
 cBBZ6FTZWG5Togr4BQsSsl/Gd3FDw40=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-r_vZKkk7MOiGl_vw9Vy3tA-1; Mon, 07 Mar 2022 05:03:31 -0500
X-MC-Unique: r_vZKkk7MOiGl_vw9Vy3tA-1
Received: by mail-ed1-f71.google.com with SMTP id
 h17-20020a05640250d100b004133863d836so8344711edb.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=07QDxIPMafAaF6WsUgGU20pp0SPQclmS77EMgRXJWQo=;
 b=putRaojv0XNBlrLhQWWswrOuoZby5yiR24HMpcKLvyHg91/Vgz0EWjFT/IWgG0SmQT
 08WxoXxr7WHrwVfTtWT5TnS06gvtu3r6ebUhJyjPctdMBpF8915MwugKnqzNHbHkm81S
 zAp14JZ9sLOiJtlKp+m6E1d4VjX1tkP3GWWfdn8UcHAV4wgbg7gFJDdRCkbRg3wg+cXm
 h4lOB0C1dof2wRCK494yEVcPmYr2m+GYTAVv822bwCtxJxrg+nzXjypQyvg+EPqWs2eD
 BLSPpoZ8ol/6i0j86FcjWidHdQN+V/C66SRD8jUjhjdvw/2O9usLPjS2JoDr6F+PxdWU
 LvPw==
X-Gm-Message-State: AOAM530c8bri/nx7Ou/GAAZFL7+I6s3erGlZ3IY7TlEqD0MOMyg37N+g
 C7qrawvlTUDLQMr/8msQKwsTydxi0c65z8x1vDB6kj3hK/qLtwfHbzQfLR8yXMWJbkHphIfWJeV
 9Vh+b4/RfWm1f0FaHfgrzhnxM+QKna30K+y9ELPamROQRkh1Ne0OGeM1PluFr
X-Received: by 2002:a50:baa8:0:b0:415:b0bc:6353 with SMTP id
 x37-20020a50baa8000000b00415b0bc6353mr10393512ede.220.1646647409995; 
 Mon, 07 Mar 2022 02:03:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5wZ7PjzI9fjktQNoDo5p4Os8on78q0y0B599KfC++B6R5H0qHvKtUpRGTm/p/Jev6nRmuoQ==
X-Received: by 2002:a50:baa8:0:b0:415:b0bc:6353 with SMTP id
 x37-20020a50baa8000000b00415b0bc6353mr10393485ede.220.1646647409732; 
 Mon, 07 Mar 2022 02:03:29 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b006a625c583b9sm4617709ejd.155.2022.03.07.02.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:29 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 43/47] docs: vhost-user: add subsection for non-Linux
 platforms
Message-ID: <20220307100058.449628-44-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


