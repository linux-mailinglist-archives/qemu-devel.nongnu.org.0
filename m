Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FC05F4435
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:25:43 +0200 (CEST)
Received: from localhost ([::1]:43692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhva-0007tQ-4f
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgN-0007NX-4U
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:09:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgI-00008I-Tq
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:09:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id f11so18597832wrm.6
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zzVR8/oz0+lsWlrieGUIzeorIpITtDEzwa++gYuHD84=;
 b=qOyd4QixN8x7f64VC4W2UbvAkdMv2VuPJPh+RnPjY+dI+uSPUre8KVPn9Y0QQ/l6B9
 25cMRfNBUe6U3sOxFZNwkZAZ6qAUw36lc/1A0dsMwcXcbI9Ep5wLhIopr0KPYG9OhMOe
 KNTbs6v3wtRzcZL9s3w3m/+CchkARN16llxF0vWwzz7V2q3eFx4c09pjpY1PRYI08qKk
 p4IIGp+x/B8qFjMUS8WpOZHSjJaeNZdM6SFA6+ykJSJhXYL44IgJAmhfgP631Gdjoo5n
 uBfhHNKVUCfs1C2fPx9+SHbawy6jRKxZD7x6Pwylo+WhBRz4mW/rVIsGuZIrTEXMl37d
 RjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zzVR8/oz0+lsWlrieGUIzeorIpITtDEzwa++gYuHD84=;
 b=Ac1Y18oz5EcgIodhjbEByX8y0lECHYVxRsc5z5w1Vk9P+36oxDHVJO3wac2BO7XFY+
 RkX8JDDTD1p+zt6GfaUVMDX1CGBBezcHDN5U2dx1dyZU423BcUvCennkpSHpPCLWPS3D
 vWLTSYpiNGb7YnaGozNl84qk45ILuRYxnVlgyccTMRuJPQzr86ekFq86mz4+BdEc6B2G
 7bevXhmVQvdbCaEeRS21MRbQRcgwFU7j+C62HkMzK3FtYywvplaXaGZiyC5jAAdNFdGx
 +gLa2Jg3ok2cbQ96kWKlb+HkLjB9xxgKOE5sbAnpAseOVY7NL/LygvTGnNUmh/ubFjdb
 mBiw==
X-Gm-Message-State: ACrzQf0KXAgk4w78YrXYtA3kLMxIex5RnAjjMDUPTxb9+6qdz/ejXp2m
 QGisKbVY/hKhrtdaEQkplWefTA==
X-Google-Smtp-Source: AMsMyM7sXKUWmm7BDhuEMliQyKPa2HsxmNIUv6+4mXAaiTN5TDLhBfHjPx6aHull77ANbv7+8cjPBQ==
X-Received: by 2002:a05:6000:1786:b0:22e:41c0:cb0e with SMTP id
 e6-20020a056000178600b0022e41c0cb0emr4929842wrg.93.1664888992593; 
 Tue, 04 Oct 2022 06:09:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c19cf00b003a2f2bb72d5sm26443475wmq.45.2022.10.04.06.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:09:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 59D321FFE8;
 Tue,  4 Oct 2022 14:01:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 53/54] =?UTF-8?q?contrib/gitdm:=20add=20Universit=C3=A9=20G?=
 =?UTF-8?q?renoble=20Alpes?=
Date: Tue,  4 Oct 2022 14:01:37 +0100
Message-Id: <20221004130138.2299307-54-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

again to the academic group map.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220926134609.3301945-7-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/group-map-academics b/contrib/gitdm/group-map-academics
index 877a11e69b..082458e1bd 100644
--- a/contrib/gitdm/group-map-academics
+++ b/contrib/gitdm/group-map-academics
@@ -22,3 +22,6 @@ bu.edu
 
 # Institute of Software Chinese Academy of Sciences
 iscas.ac.cn
+
+# Université Grenoble Alpes
+univ-grenoble-alpes.fr
-- 
2.34.1


