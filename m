Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAD742DF57
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:43:11 +0200 (CEST)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3p0-0007Jf-Fj
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cA-0003dZ-7O
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:54 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c8-0000dy-LG
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:53 -0400
Received: by mail-ed1-x529.google.com with SMTP id g8so26693263edt.7
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gsm23bgs7Pj7klX00892e7fbNkblmLvDLJsh6ZqSJ/M=;
 b=MciX2ZTNrt8mdMqpnMLDnNCmkf8pFdyt/5IuOSdSA8K7VcM5pnTD4aMlCWLjtaXMwe
 0m/vMJXJZXSxDfWw0DieFX05hcCNSRUQ7v0ptLorm0O39w5m4tFDEG597R/EnsP3Oq7i
 bVg2pl7xgm1zfDtELqjQS0U0Dl2Rsm5X98NoqI6Kh2sSPnGWoI90Xf/PHXnNKVDPO8xz
 GB6LXxI9qek7zB6zx3+P+MF6/LcNuNgz5iY6XMkGbGnRRu/epdWD6wpBNc2BvdspnZs5
 W1MFbO27dF5gHOJpisCVnbGQ58z6iQXyX4Ux7XqdNlljivRqbm/4FuIutxPwzhsxafPE
 sPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gsm23bgs7Pj7klX00892e7fbNkblmLvDLJsh6ZqSJ/M=;
 b=lTDyuxWKazpYw067YUNXkwfqgs27MHrapHPvC9j0WgU43n78H2GfTWbWbEygiM9tIv
 FJaofJeGmy5NT3FyPYwCtJZ6haIJYyJXUrQSTxgE+HLbhViCccex9jxK3T0AmWs1hFNR
 qlcrQmOmPFUQ7Hhun31lW2Hez4Ks1/aZafUrXngAoRpnoGWHlByt3mT3kDNQVo7cAsL1
 YqTm9IP0kXPNvB60WZ/733mZcoC0nogcjjrcjXqw1Q+Sov2T9O79/kvozLps5JR8fDQM
 jCww3Edi4kflZIE5wdCPIJ9yr634TkPl8KcwmndlvazUJzIyYzmuMv7CKWhdUu4t1Uzr
 5O2Q==
X-Gm-Message-State: AOAM5317IEZcYt5uxM50Vj4LFilsVnaIVd4yGTLQjjroTd+hDGadMrj5
 WTz9mrP3rnQvFss/zVWs18eMR+ph6Dc=
X-Google-Smtp-Source: ABdhPJz0AXnVaw0ZuPH8rxQ+ia30TW34iHynUy0FGVRvoUFY/2yfYBl8lNzfhUXfbWGyD2chRi2pAQ==
X-Received: by 2002:a17:906:eda6:: with SMTP id
 sa6mr4819874ejb.443.1634228991408; 
 Thu, 14 Oct 2021 09:29:51 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/26] configure, meson: remove CONFIG_GCOV from config-host.mak
Date: Thu, 14 Oct 2021 18:29:24 +0200
Message-Id: <20211014162938.430211-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-7-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 3 ---
 meson.build | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 648ba09f70..6efea3cfc6 100755
--- a/configure
+++ b/configure
@@ -4630,9 +4630,6 @@ echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
-if test "$gcov" = "yes" ; then
-  echo "CONFIG_GCOV=y" >> $config_host_mak
-fi
 
 if test "$rng_none" = "yes"; then
   echo "CONFIG_RNG_NONE=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 5c3823d143..ff19d54fc6 100644
--- a/meson.build
+++ b/meson.build
@@ -1402,6 +1402,7 @@ config_host_data.set('CONFIG_ATTR', libattr.found())
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_FUZZ', get_option('fuzzing'))
+config_host_data.set('CONFIG_GCOV', get_option('b_coverage'))
 config_host_data.set('CONFIG_LIBUDEV', libudev.found())
 config_host_data.set('CONFIG_LZO', lzo.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
-- 
2.31.1



