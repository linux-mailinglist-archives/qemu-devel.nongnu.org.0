Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DB250CA89
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:20:54 +0200 (CEST)
Received: from localhost ([::1]:50340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFgz-0001BZ-8r
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFw-0007VG-VF
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:59 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFu-0005DL-Bu
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:55 -0400
Received: by mail-ej1-x634.google.com with SMTP id t11so21111536eju.13
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fzpifrkxn/qoSo8/9uyWd3pvXOS+EDX6XI+xXN+aSoU=;
 b=ldhcto01CGrEIt7vCGt6HfuiU0Nvb1OqWUBKqfutKu8hAEU2Lz0aWvYnVNiv5ifezW
 MUBNxINZfLjAk3705sSq1qhgcg+nn2TBfXeH1OayrnC9vTj9f7RCP0CaBgl7vExGJ0Et
 hUiUfx2DVQaccNMgpNOAYCB2IgETU9MgCOghnltTdu3Uy+v6sZ2pLIIgJuPyR3WTl4xx
 MBITKrFsXmjGuod7GJSaXOl60KTVMYerCWbv+Aa2e9SMNzRio51xnLyFDm52Cmziv6L6
 1z2mnMbteuOz0swrbUtxGurARxhkveVUAkGEvkkiI4JLx0HdXwzUKLwyP74rAauYq1qb
 Kc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fzpifrkxn/qoSo8/9uyWd3pvXOS+EDX6XI+xXN+aSoU=;
 b=ynX7Pdu2aEsIYUZCp+VBaQNj9QG9MWRfYxJUw9gxn4siPTUV/1TkVaj4HfcJ3L+RL1
 JUjtMPbWe82MAUsrVq4vgawpbqeRYOgA+iNwgt4Yn/ONvCtL72mb6rjbKapGIpOO0kOX
 XY6Ko9XGwO6AcbIquuo4MTNjzc0I/KqrSvfMHruBCxOFt5R4YCYbvOdDhgig3mXPJ6AG
 JAq4eo6bN5rajCUoihE4pKTpaSOv6eSISUi6e/A+Z5aXj10OtnbsKllELTKoA4Ul5FK3
 aPqNob4suuzdZzihIvyAcgM7vqZDLix8pAA4CciGkrZIbtIToceH4D/Wa4JILWCPQLrx
 aPTQ==
X-Gm-Message-State: AOAM532vIbWVsOxoiFZuKSDJqBBGv+MI2SyMVgdMCwHrqbIFGJRRYf5H
 GQCR83LddsJLeWyfeyxRz7fqTVQhQekUOg==
X-Google-Smtp-Source: ABdhPJzWMNRsIM339spQNYZPhdNJHG4Pw5Ag9qT5eaO56RoP/Gsnok9ofFzQf3N3EHT0ZNs371KrJQ==
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id
 t1-20020a1709061be100b006ceb0a8017dmr8208376ejg.413.1650718373167; 
 Sat, 23 Apr 2022 05:52:53 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/34] configure: simplify vhost-net-{user,
 vdpa} configuration
Date: Sat, 23 Apr 2022 14:51:45 +0200
Message-Id: <20220423125151.27821-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleanup to ease review of the conversion to meson.  vhost_net_user and
vhost_net_vdpa are never assigned anything in the command line parsing
loop, so they are always equal to $vhost_user and $vhost_vdpa.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/configure b/configure
index 19947d8d6c..c5bffcf703 100755
--- a/configure
+++ b/configure
@@ -1554,10 +1554,6 @@ if test "$vhost_vsock" = "yes" && test "$vhost_kernel" != "yes"; then
 fi
 
 # vhost-user backends
-test "$vhost_net_user" = "" && vhost_net_user=$vhost_user
-if test "$vhost_net_user" = "yes" && test "$vhost_user" = "no"; then
-  error_exit "--enable-vhost-net-user requires --enable-vhost-user"
-fi
 test "$vhost_crypto" = "" && vhost_crypto=$vhost_user
 if test "$vhost_crypto" = "yes" && test "$vhost_user" = "no"; then
   error_exit "--enable-vhost-crypto requires --enable-vhost-user"
@@ -1566,16 +1562,11 @@ test "$vhost_user_fs" = "" && vhost_user_fs=$vhost_user
 if test "$vhost_user_fs" = "yes" && test "$vhost_user" = "no"; then
   error_exit "--enable-vhost-user-fs requires --enable-vhost-user"
 fi
-#vhost-vdpa backends
-test "$vhost_net_vdpa" = "" && vhost_net_vdpa=$vhost_vdpa
-if test "$vhost_net_vdpa" = "yes" && test "$vhost_vdpa" = "no"; then
-  error_exit "--enable-vhost-net-vdpa requires --enable-vhost-vdpa"
-fi
 
 # OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicity
 if test "$vhost_net" = ""; then
-  test "$vhost_net_user" = "yes" && vhost_net=yes
-  test "$vhost_net_vdpa" = "yes" && vhost_net=yes
+  test "$vhost_user" = "yes" && vhost_net=yes
+  test "$vhost_vdpa" = "yes" && vhost_net=yes
   test "$vhost_kernel" = "yes" && vhost_net=yes
 fi
 
@@ -2104,10 +2095,10 @@ fi
 if test "$vhost_net" = "yes" ; then
   echo "CONFIG_VHOST_NET=y" >> $config_host_mak
 fi
-if test "$vhost_net_user" = "yes" ; then
+if test "$vhost_user" = "yes" ; then
   echo "CONFIG_VHOST_NET_USER=y" >> $config_host_mak
 fi
-if test "$vhost_net_vdpa" = "yes" ; then
+if test "$vhost_vdpa" = "yes" ; then
   echo "CONFIG_VHOST_NET_VDPA=y" >> $config_host_mak
 fi
 if test "$vhost_crypto" = "yes" ; then
-- 
2.35.1



