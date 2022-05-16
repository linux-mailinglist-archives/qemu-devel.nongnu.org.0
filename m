Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C05E5292F1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:35:05 +0200 (CEST)
Received: from localhost ([::1]:50958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiMq-00044D-H0
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhje-0001bn-JS
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjc-0006l2-RB
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A0NLu4LYJzZO/vmTGecGB8oVWtwmF8SbX1Whz2eHDck=;
 b=AuutYzPVhpysy4/Nfoj+JJ7IHRxDRAmDZdrC0j+C+hPRKqN+qHvPGunoSQ0VshKX5lJrh6
 /iYSmK/9Z9kCt6kbEkJflYlWkbfTPXk78YDD0gJzs3Kq0erHUiW1b0Cj3koyOC+dDq6AI7
 XjaZZxWO/zlTsecRcpEmt3wAwsQMRCc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-ejnQb_JTM26UK5oG38BvWw-1; Mon, 16 May 2022 16:54:28 -0400
X-MC-Unique: ejnQb_JTM26UK5oG38BvWw-1
Received: by mail-ej1-f70.google.com with SMTP id
 gs8-20020a1709072d0800b006f42d47382fso6343681ejc.17
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A0NLu4LYJzZO/vmTGecGB8oVWtwmF8SbX1Whz2eHDck=;
 b=lGyhN2lMHWZ0wRzSKsuEf4dK3Djty4a+oY1yX0t1wDYRERu5zpSn481l3jAZe9RAA7
 JqUKk4wuFb1YgFipNlfOL11KNLoChLQIiaqCC4Yas0C/iejipUbZVK9ysxXjVU5nMbKg
 orteDfXoa3bOBmVyF3JCEpsp5EVyqIbPlpfm/W0H4OeeE5HC/bQOss+bO5DUZIKvR8tM
 KsGar4QZk/LohU1IzkW+ZL8e6bu2CmgG39ycvQKmf2jXBz3JcrNdkVfkmFAfh6U4aadY
 qOYs/4Zjt7lhlcS3AeDJS8Bf7BdFpXcM89PhY+OfsRwtRj4vTOphKEUvpetCXX6UMmCR
 3Kdg==
X-Gm-Message-State: AOAM533GNDO5NS/mWX64BVSXmW4sjh+Nqn4QqLYwe5s/EZ4H7nSHTkhC
 6n/sDXvObMyRQ7oc4Ub32oJe9+dUvW+saBVUJxtUSoClSNitDAaqYA9dU8MlEWwXBPCVloy1fTN
 3apfyfQ2ouon7SOY1meA55XXb+r4hOntmfZYBW+0HgabSzXN+u28OE0XT1n+3
X-Received: by 2002:a17:907:8a1f:b0:6f4:b5fb:e1c8 with SMTP id
 sc31-20020a1709078a1f00b006f4b5fbe1c8mr16609497ejc.240.1652734467413; 
 Mon, 16 May 2022 13:54:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdoFxB8RzouHyJdYnrj/ZKNiWfvHMtA+cfA85Last7ZvbAAmJNPM807SmUgGrN9qoSNRhYlA==
X-Received: by 2002:a17:907:8a1f:b0:6f4:b5fb:e1c8 with SMTP id
 sc31-20020a1709078a1f00b006f4b5fbe1c8mr16609478ejc.240.1652734467071; 
 Mon, 16 May 2022 13:54:27 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 gx13-20020a1709068a4d00b006f4512e7bc8sm175894ejc.60.2022.05.16.13.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:26 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL v2 62/86] docs: vhost-user: rewrite section on ring state
 machine
Message-ID: <20220516204913.542894-63-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

This section is using the word "back-end" to refer to the
"slave's back-end", and talking about the "client" for
what the rest of the document calls the "slave".

Rework it to free the use of the term "back-end", which in
the next patch will replace "slave".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210226143413.188046-3-pbonzini@redhat.com>
Message-Id: <20220321153037.3622127-6-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/interop/vhost-user.rst | 46 +++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 1039e7a34e..1151326d6f 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -332,40 +332,36 @@ bit was dedicated for this purpose::
 
   #define VHOST_USER_F_PROTOCOL_FEATURES 30
 
-Starting and stopping rings
----------------------------
+Ring states
+-----------
 
-Client must only process each ring when it is started.
+Rings can be in one of three states:
 
-Client must only pass data between the ring and the backend, when the
-ring is enabled.
+* stopped: the slave must not process the ring at all.
 
-If ring is started but disabled, client must process the ring without
-talking to the backend.
+* started but disabled: the slave must process the ring without
+  causing any side effects.  For example, for a networking device,
+  in the disabled state the slave must not supply any new RX packets,
+  but must process and discard any TX packets.
 
-For example, for a networking device, in the disabled state client
-must not supply any new RX packets, but must process and discard any
-TX packets.
+* started and enabled.
+
+Each ring is initialized in a stopped state.  The slave must start
+ring upon receiving a kick (that is, detecting that file descriptor is
+readable) on the descriptor specified by ``VHOST_USER_SET_VRING_KICK``
+or receiving the in-band message ``VHOST_USER_VRING_KICK`` if negotiated,
+and stop ring upon receiving ``VHOST_USER_GET_VRING_BASE``.
+
+Rings can be enabled or disabled by ``VHOST_USER_SET_VRING_ENABLE``.
 
 If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
-ring is initialized in an enabled state.
+ring starts directly in the enabled state.
 
 If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
-initialized in a disabled state. Client must not pass data to/from the
-backend until ring is enabled by ``VHOST_USER_SET_VRING_ENABLE`` with
-parameter 1, or after it has been disabled by
-``VHOST_USER_SET_VRING_ENABLE`` with parameter 0.
+initialized in a disabled state and is enabled by
+``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
 
-Each ring is initialized in a stopped state, client must not process
-it until ring is started, or after it has been stopped.
-
-Client must start ring upon receiving a kick (that is, detecting that
-file descriptor is readable) on the descriptor specified by
-``VHOST_USER_SET_VRING_KICK`` or receiving the in-band message
-``VHOST_USER_VRING_KICK`` if negotiated, and stop ring upon receiving
-``VHOST_USER_GET_VRING_BASE``.
-
-While processing the rings (whether they are enabled or not), client
+While processing the rings (whether they are enabled or not), the slave
 must support changing some configuration aspects on the fly.
 
 Multiple queue support
-- 
MST


