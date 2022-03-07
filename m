Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5B84D0BC9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:12:31 +0100 (CET)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMWk-0002vj-4C
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7z-0001LE-Ko
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7x-0005mG-RT
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JLZkqE9CMO9Jo/gLiHOXhp5k4vbHvwWLStgWAFhWUt4=;
 b=fVoCtUpRSCQITyhpXnoHOFH+hwwDHHvcIffxBk56YKgGaFRE4SWQP/dI9fnW6LrimeruK1
 Dj4SNjswNyHCK8BKYZjsr3v7E+WkwhhAtaGoIWZDo6wE8zu7hYHnVhCn4L4+sW+EAW1jRn
 qfS804d62vbeCaqK+v+nkdt6IGvIeOY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-VaC5eG1KMhKDlYOxUoJQcg-1; Mon, 07 Mar 2022 17:46:52 -0500
X-MC-Unique: VaC5eG1KMhKDlYOxUoJQcg-1
Received: by mail-ed1-f71.google.com with SMTP id
 n11-20020aa7c68b000000b0041641550e11so3096399edq.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JLZkqE9CMO9Jo/gLiHOXhp5k4vbHvwWLStgWAFhWUt4=;
 b=ZjZ1J4qMgZPKZIRlSpNKUgUGbfAZru+U4wyj3tM5dYo7467cjfdiv5HlYRSpslx7PS
 Y6MfiNxj0x0XtVPTn0QGnYhX3LIpzljt2/4Xsz3jGrqrhAJcmBbve0LKnWPoUKMHspnU
 4xuKB19hl0s7HFgkqm1nETd/9Xa02hXFJxxmmJHFGoAjrvZ3/S1GUmHrNpgSXc5xY9X3
 z2IRZP1b2wW7hL5pZy9eTYOGCH7jAF5s4UtrJ63W+9EIOYBeG2vUwerJP3V0KxrV8Azn
 7VSodz8pbF27/r8+4D5oP2iaaKoFBG6tFjCh+axynicZ19XNmQZWXkb2uSUKa3tgy4nx
 8B0g==
X-Gm-Message-State: AOAM533NBoeE1zmVkLAmTLk22dHBggAy9JJEdbEmgYV41hgzyv62+GL8
 lFc7h9XAFFSq6tIZ0NutI8W3lrnyE2Oy8AO8wSsf4iJMFmuK2byz3A0iGNJ2i7zCUCCMDhhXPE5
 RfsrToifqcGQKoRCPopbrDJtX+B5qpYtuiqIb1k06lRlDgvdNV5VEAY/Vxg7p
X-Received: by 2002:a17:907:9910:b0:6d5:acd6:8d02 with SMTP id
 ka16-20020a170907991000b006d5acd68d02mr10786907ejc.173.1646693210799; 
 Mon, 07 Mar 2022 14:46:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz12klE1w0EdSwVqsOVOVq9mjFfdUKa820qk77fc5eYa7TtWC+L0rm9koEsOZ+XgzA7v3be4w==
X-Received: by 2002:a17:907:9910:b0:6d5:acd6:8d02 with SMTP id
 ka16-20020a170907991000b006d5acd68d02mr10786883ejc.173.1646693210583; 
 Mon, 07 Mar 2022 14:46:50 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 g19-20020a056402425300b0041664626cb9sm684152edb.54.2022.03.07.14.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:50 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 42/47] configure, meson: allow enabling vhost-user on all
 POSIX systems
Message-ID: <20220307224357.682101-43-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

With the possibility of using a pipe pair via qemu_pipe() as a
replacement on operating systems that doesn't support eventfd,
vhost-user can also work on all POSIX systems.

This change allows enabling vhost-user on all non-Windows platforms
and makes libvhost_user (which still depends on eventfd) a linux-only
feature.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220304100854.14829-4-slp@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 configure   | 4 ++--
 meson.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index c56ed53ee3..daccf4be7c 100755
--- a/configure
+++ b/configure
@@ -1659,8 +1659,8 @@ fi
 # vhost interdependencies and host support
 
 # vhost backends
-if test "$vhost_user" = "yes" && test "$linux" != "yes"; then
-  error_exit "vhost-user is only available on Linux"
+if test "$vhost_user" = "yes" && test "$mingw32" = "yes"; then
+  error_exit "vhost-user is not available on Windows"
 fi
 test "$vhost_vdpa" = "" && vhost_vdpa=$linux
 if test "$vhost_vdpa" = "yes" && test "$linux" != "yes"; then
diff --git a/meson.build b/meson.build
index a5b63e62cd..28612fca36 100644
--- a/meson.build
+++ b/meson.build
@@ -2714,7 +2714,7 @@ if have_system or have_user
 endif
 
 vhost_user = not_found
-if 'CONFIG_VHOST_USER' in config_host
+if targetos == 'linux' and 'CONFIG_VHOST_USER' in config_host
   libvhost_user = subproject('libvhost-user')
   vhost_user = libvhost_user.get_variable('vhost_user_dep')
 endif
-- 
MST


