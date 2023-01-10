Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94FA6645C1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:15:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH5x-00037a-UB; Tue, 10 Jan 2023 11:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5L-0002s7-QG
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:02:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5H-0004xW-Oc
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/alYy8O92DxdcA4HyUkM0DF2NwTmR7PHdUG+Enp9h6M=;
 b=RNehhsZ0yyYKp+AeiUpvAhub1bQimSxYsnGKYLpkRz+H0FTb2jAMzV6NIf3L6u59F50Rgz
 EXVOgy2tFn1z44TzEmFdfQOtTeYS1RkgCPVEc3+wz7dial3OzIqMfY1q+0PlErAUoAZTsz
 CLxJ1vywllC0fBgtkLwqjpai649Eb+4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-99-5FLsHFI2PH2Mt0MI1ywIPA-1; Tue, 10 Jan 2023 11:02:40 -0500
X-MC-Unique: 5FLsHFI2PH2Mt0MI1ywIPA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so9217722wmq.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/alYy8O92DxdcA4HyUkM0DF2NwTmR7PHdUG+Enp9h6M=;
 b=UseFVIEJkkoSx9xRPPmhmwbBJUY3es47JGnpFW61UxWKP09BoEYrn3mqAZrhkrhTr8
 szdSPirWKwKiKSxCmRUF3u0rnql1gG0SsPDFA0HKC45HTaU485jHU8d1QQYjdag1BiHE
 ecoyUUKpot0wKEhfSVhfvofIK5v+efXC0TBWHXmQN/Ij0FXMIz2FUP8pkw7zHb4MYr5o
 heejh7r6MJjXayJIrSnlhkNrgozGdWv+2eHdUAxziiw4BoCya+PB7nyjILZcFJGRo9vK
 q/cPGik+22+VGacyQ1+RN6PQPsYUyfPB39wihbujvUmFy1PK6YVFSEjEGzndlehc4XVg
 UkcA==
X-Gm-Message-State: AFqh2koq9dYwfxhWwZczyWwCaqcUNVnEKpFsGyYacl7d1jw4R9xjqmtz
 hlaJtQxix7jFnCR3gCIVQsw+U6AECM+GgIX5w98RtFPf3iMRgGyufNVoYNK4sqM2IQ0CbsJ/j8M
 ExAZIlcjkrYguTKEF0MwlI5pdsbVTCpdq9wv+wbnwPPk8c0DMQa4hl8HYhy+yqYoN0hQ=
X-Received: by 2002:a05:600c:3509:b0:3d9:e9a2:eea3 with SMTP id
 h9-20020a05600c350900b003d9e9a2eea3mr7983586wmq.37.1673366558664; 
 Tue, 10 Jan 2023 08:02:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtt8OU7peswHyKVJ+9TzfnLHTt9pWCkl/KtHxFuktsSdLs9wzQ3pL5fKDJcl4xr5uKsP4crPg==
X-Received: by 2002:a05:600c:3509:b0:3d9:e9a2:eea3 with SMTP id
 h9-20020a05600c350900b003d9e9a2eea3mr7983563wmq.37.1673366558428; 
 Tue, 10 Jan 2023 08:02:38 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bh13-20020a05600c3d0d00b003d358beab9dsm15182218wmb.47.2023.01.10.08.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:02:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?=D0=92=D0=B0=D0=BB=D0=B5=D0=BD=D1=82=D0=B8=D0=BD?=
 <val15032008@mail.ru>, qemu-stable@nongnu.org
Subject: [PULL 01/29] configure: fix GLIB_VERSION for cross-compilation
Date: Tue, 10 Jan 2023 17:02:05 +0100
Message-Id: <20230110160233.339771-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

configure uses "pkg-config" directly so that GLIB_VERSION is always based
on host glib version.   To correctly handle cross-compilation it should use
"$pkg_config" and take GLIB_VERSION from the cross-compiled glib.

Reported-by: Валентин <val15032008@mail.ru>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1414
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 22818926576c..6f5e77a71361 100755
--- a/configure
+++ b/configure
@@ -2375,7 +2375,7 @@ echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_BINDIR=$glib_bindir" >> $config_host_mak
-echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
+echo "GLIB_VERSION=$($pkg_config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
-- 
2.38.1


