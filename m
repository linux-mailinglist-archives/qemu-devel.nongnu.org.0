Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4722853ACCB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:28:50 +0200 (CEST)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwT5L-0007DX-Ss
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrJ-0002ND-Pe
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:17 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrI-0006bG-8P
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:17 -0400
Received: by mail-ej1-x630.google.com with SMTP id gi33so5425976ejc.3
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKJN+0byB62TurI1iE/iR4Hl0KYyS1GPnfCuVvTNJ/8=;
 b=OZPcqmJlbcLVisMoVS80x8Q6bAgi3dODeV/wcr5bdpr5pSlL3qqNOoxsaYfETDr/Do
 aBOPvP3garnNH4/hKNtru287vpMq0r38gcVey9X1LNRn29t/AwfXgk0L7/n78Xw0koeB
 NGkinc1sar1FeRObm47MHcROWH8qMpO2F+WmnM7eVhpOCSwg99L7g5a9xPQCcYrtgCan
 faBsidxqu2ginCuKMBWdWdQwoxUuIsyhqzRUvoE7iIzu/NO8A/DMHT3Xqk34wGzV4NT9
 vJrRrJ6I1jgKFgwhMdHhdEpzeBC90uEPwjENqgfNDBwPbAM9KDx6uTkQfiRzU27hye1J
 PGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QKJN+0byB62TurI1iE/iR4Hl0KYyS1GPnfCuVvTNJ/8=;
 b=UDjzVhG4vlx9unFpQ5nm7w2fAwH99270wkSIy2ba1+fQRmK9zYJqPP3RHIkCn2Rkd5
 0tuYxUVt+jNWIT0fO70E26AIQqklk43pxvhwpm4F/pGR/ObKo13uS7BMPEGl7QqFvefg
 qmbpZFDxK7WdrDcusZ6f/+qzpNR0JDtkiTnYPb2wy/zxZQFnDQbNtCKR49iei0QWxHVY
 QTEpRLuyOesslBXOJjFi/GQW6KvZxkxvFA9mJKdDjIDtUkC8wVUY7srLUMCKy0TYOJfk
 y/ODEmU+EL7EfdBB5R3ooXsnMOVssnoyCzid7YHdp5FdeIuxiCxdGMgCwV0ClYRQUF3d
 67LA==
X-Gm-Message-State: AOAM530LSBg5I3tBMp/w8url0O1ciltpoWHC36QTzltRk8FKoqhhTYy6
 TLKKg6B0KrXeTPmv8ubnNMdZdw==
X-Google-Smtp-Source: ABdhPJyK68bGqPxNMwI9TMTT/8wve5Vm4+jdljJs6o399Eq7kH45X2S2yRRDdJPDkdsqSLUWHTHfHA==
X-Received: by 2002:a17:907:2dab:b0:6fe:e1f0:3e8b with SMTP id
 gt43-20020a1709072dab00b006fee1f03e8bmr733281ejc.55.1654107254875; 
 Wed, 01 Jun 2022 11:14:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u19-20020aa7db93000000b00428bb4c952bsm1298886edt.31.2022.06.01.11.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:14:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 43CB01FFD2;
 Wed,  1 Jun 2022 19:05:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 27/33] configure: remove unused variables from config-host.mak
Date: Wed,  1 Jun 2022 19:05:31 +0100
Message-Id: <20220601180537.2329566-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The only compiler variable that is still needed is $(CC), for
contrib/plugins/Makefile.  All firmware builds have their own
config-host.mak file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220517092616.1272238-17-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220527153603.887929-28-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 11e7f30553..b9ccff9067 100755
--- a/configure
+++ b/configure
@@ -2397,11 +2397,6 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
-echo "AR=$ar" >> $config_host_mak
-echo "AS=$as" >> $config_host_mak
-echo "CCAS=$ccas" >> $config_host_mak
-echo "OBJCOPY=$objcopy" >> $config_host_mak
-echo "LD=$ld" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
@@ -2410,7 +2405,6 @@ echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_BINDIR=$glib_bindir" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
-echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
 # use included Linux headers
-- 
2.30.2


