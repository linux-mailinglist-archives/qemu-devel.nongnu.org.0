Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B642FC008
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:33:19 +0100 (CET)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wkg-0007Er-TG
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5n-0003vA-N2
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:51:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5i-0003cH-MK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611082258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//hd/I1O24ac7UR3zEAltgSvNx6iaQojONXnidegjJw=;
 b=B+7j+loYHESUX0D1Z0shA1sgfqDwkix+KeGQO/KjnebKt2bnjiBa5JgHkFGCO6vMXL0KTl
 J7SgAoVRH7BIURDg7pvprY8YYQWA95alMt+udjR9ZwagFoe1dnsCEuHBgKxAGGve8qisT3
 qFnHt0Re4SSe+juloVEaiiOsRZ28Hqs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-RMb5jVCyNPupTt9xjg5kbQ-1; Tue, 19 Jan 2021 13:50:55 -0500
X-MC-Unique: RMb5jVCyNPupTt9xjg5kbQ-1
Received: by mail-ej1-f70.google.com with SMTP id f1so3264732ejq.20
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=//hd/I1O24ac7UR3zEAltgSvNx6iaQojONXnidegjJw=;
 b=FunJ3Cxctd3TNKUpbA5lxsXtt+l61rks9U6P4cSn1n01GbzKCsEviP8fkrf9EzDs7i
 PGqJI3P5mC+DWhijLlW13W7mtlJzhcvfFJhTFIOzQqz8q/khpqR/Pi805t9JAOb7D60L
 ClD2Px4REdUhaefffInr8FcIiw3kICqdMioUozh2mX9eyDnjgXzsobjM0gepKKtp+NJv
 39ziU8T2lNU9w4XtNtXH9YnI0mTlP656jqwCCJ+N9I5Tla5tESjKIW+CWL+P7BW8Upwc
 /YJwhctO2P7R29BcTp/GjmbI5GTw0x1atXb019HHvVzcz9ETkNjZDwlMRx3EITavD+6Z
 V7Iw==
X-Gm-Message-State: AOAM531dghE5PGWiWprM0BGp/Y0ASxuqGJsG+FQ632VNYyAb98VQlPIc
 9RBYdGfqBfWMjwBthdcdn9Lwtx3MG3tVr3iA2Dp+KS418hZGgp4WbQ6z4Ge/n4ty+lssmw5Lwn3
 38kIU9bM56c4GP555albCqeQ81n+JE1US304Bv9IYB82t4sMpR11Yt/LF5Z6r3a1R
X-Received: by 2002:a05:6402:487:: with SMTP id
 k7mr4557565edv.130.1611082254468; 
 Tue, 19 Jan 2021 10:50:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws5dBPIxtBuS4ph7IzusNm+ncn0ztAsoqvY3avgv4aqxAnSdfgiY+WKJgE80A9RYH5mVmHdQ==
X-Received: by 2002:a05:6402:487:: with SMTP id
 k7mr4557555edv.130.1611082254310; 
 Tue, 19 Jan 2021 10:50:54 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i6sm6525768ejd.110.2021.01.19.10.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:50:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] meson: Summarize block layer information altogether
Date: Tue, 19 Jan 2021 19:50:05 +0100
Message-Id: <20210119185005.880322-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119185005.880322-1-philmd@redhat.com>
References: <20210119185005.880322-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Display if block layer is built. Do not display the block
specific information if not enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: qemu-block@nongnu.org
---
 meson.build | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/meson.build b/meson.build
index 0435bfd1c51..dd4129ae8fd 100644
--- a/meson.build
+++ b/meson.build
@@ -2372,6 +2372,7 @@
 
 summary_info += {'system-mode emulation': have_system}
 summary_info += {'user-mode emulation': have_user}
+summary_info += {'block layer':       have_block}
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
@@ -2429,8 +2430,10 @@
 if have_system
   summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
 endif
-summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
-summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
+if have_block
+  summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
+  summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
+endif
 summary_info += {'VirtFS support':    have_virtfs}
 summary_info += {'build virtiofs daemon': have_virtiofsd}
 summary_info += {'Multipath support': mpathpersist.found()}
@@ -2492,7 +2495,6 @@
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
-summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
 summary_info += {'lzo support':       lzo.found()}
 summary_info += {'snappy support':    snappy.found()}
 summary_info += {'bzip2 support':     libbzip2.found()}
@@ -2500,16 +2502,19 @@
 summary_info += {'zstd support':      zstd.found()}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
 summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
-summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
-summary_info += {'bochs support':     config_host.has_key('CONFIG_BOCHS')}
-summary_info += {'cloop support':     config_host.has_key('CONFIG_CLOOP')}
-summary_info += {'dmg support':       config_host.has_key('CONFIG_DMG')}
-summary_info += {'qcow v1 support':   config_host.has_key('CONFIG_QCOW1')}
-summary_info += {'vdi support':       config_host.has_key('CONFIG_VDI')}
-summary_info += {'vvfat support':     config_host.has_key('CONFIG_VVFAT')}
-summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
-summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
-summary_info += {'sheepdog support':  config_host.has_key('CONFIG_SHEEPDOG')}
+if have_block
+  summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
+  summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
+  summary_info += {'bochs support':     config_host.has_key('CONFIG_BOCHS')}
+  summary_info += {'cloop support':     config_host.has_key('CONFIG_CLOOP')}
+  summary_info += {'dmg support':       config_host.has_key('CONFIG_DMG')}
+  summary_info += {'qcow v1 support':   config_host.has_key('CONFIG_QCOW1')}
+  summary_info += {'vdi support':       config_host.has_key('CONFIG_VDI')}
+  summary_info += {'vvfat support':     config_host.has_key('CONFIG_VVFAT')}
+  summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
+  summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
+  summary_info += {'sheepdog support':  config_host.has_key('CONFIG_SHEEPDOG')}
+endif
 summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capstone_opt}
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
-- 
2.26.2


