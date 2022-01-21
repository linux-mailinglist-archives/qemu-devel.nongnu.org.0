Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDEC496256
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:51:15 +0100 (CET)
Received: from localhost ([::1]:47086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwC1-0001T8-Nl
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:51:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw2y-0001Hw-Vk
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:41:52 -0500
Received: from [2a00:1450:4864:20::32f] (port=43905
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw2t-0007h8-Pg
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:41:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so22974668wmq.2
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QHeqOg1fCgtx7ni/iHjS3u5wy+2uDfP4jJvs5BysbmY=;
 b=OwV1gvBqTdwAkPS2IgqWxE9JZPC7ke30HVEslbT8y2OzSMkM59vvcXQRwLwX+QsHUc
 kdJEdJ+oys65VhQSfHdcd2Vcyej8saJADtT4gxf6yiEZ4MD2JZk8djsbJGbjFgFG1Q5D
 DBKWdANgOQIXid2MQQtDJSzwkBlKpUf1LL+uubC5siEnhAU3Pg/8g9ZHOUbW7SdGF9YZ
 Mn6Pcmb/ZfVEnjxuUTp6lL+Dq0xAW09b4K7IOF41byARq73ruD2Vw+4Q50N7/xSiFTHQ
 hOUyFlyuL95gxfB8Q+j339Of8LkNE6I3T0fD15AUfSyT7TF48JglGWQXBZcUojX4liD2
 s5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QHeqOg1fCgtx7ni/iHjS3u5wy+2uDfP4jJvs5BysbmY=;
 b=KwbrEHHlAlBCCKYzIvZxybizHCkZCxQ8GcG+VHgkJHy2S7qrkhxyAbOhtCu6vAwFcY
 lAIf1lD9t+xeAAbL3Ta5QOlUCH7fg2GDmWj9sxTxAhpxdXL0XBB/rVJCS7mVyy9GY7m/
 uqviUR8TdePKxdfBNUzY3gmrRVaUZiKrGgJRZAgqmKGLcPbu44j9V6sxzkEdjJ7Wc6RW
 WPmscDmEX9UsHwmN2SXXsiOHft5Iqj24+r7m5MuNDATIfl9iWAg/GX4XtHDt6gufxbgL
 TuKzCu4sgbgJRZ4WDmg9rwCa+JLggOc6udzQgTSmEX6KWyn1k0ecMMJqi5iZePWJskB8
 iWnQ==
X-Gm-Message-State: AOAM530RhJ9ZW4p4cGGfe5++iu6wxC2ixJArskcwEoXk0uV3sIKof8zr
 V1yW91qEtC9suHKKat9gBbQU3uhL+zU=
X-Google-Smtp-Source: ABdhPJy3hW/VwXx/6LQAOytNOO1qE/9r58vKYekqJKKfCEjI/zQFG1PilcPuQsmh6X3u5TL16MV+hA==
X-Received: by 2002:a1c:544d:: with SMTP id p13mr1231723wmi.97.1642779706370; 
 Fri, 21 Jan 2022 07:41:46 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 y6sm4980371wma.48.2022.01.21.07.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:41:46 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 2/7] gitmodules: Correct libvirt-ci submodule URL
Date: Fri, 21 Jan 2022 16:41:29 +0100
Message-Id: <20220121154134.315047-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154134.315047-1-f4bug@amsat.org>
References: <20220121154134.315047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Correct the libvirt-ci repository URL to avoid this warning when
cloning / refreshing the submodule:

  warning: redirecting to https://gitlab.com/libvirt/libvirt-ci.git/

Fixes: 4ebb040f1fd ("tests: integrate lcitool for generating build env manifests")
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitmodules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitmodules b/.gitmodules
index 84425d87e28..f4b6a9b4012 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -66,4 +66,4 @@
 	url = https://gitlab.com/qemu-project/vbootrom.git
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
-	url = http://gitlab.com/libvirt/libvirt-ci
+	url = https://gitlab.com/libvirt/libvirt-ci.git
-- 
2.34.1


