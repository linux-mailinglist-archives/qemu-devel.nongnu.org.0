Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E5932B7F0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:12:02 +0100 (CET)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRIH-00008Q-EZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHRDY-00040r-Pa
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:07:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHRDX-0004yr-93
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614776826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jtVEBb8KqqGwFb+BAHh+Nm5Kj6eNLFMWBhKJpmGhd8w=;
 b=HRWGD4IR0c+IKAMCwwU3L85jZAkNV21PjtCsBQv0qkxnnn00iTzkDpTLe+ildBtb03NCqI
 Ayv4oLfk5is50ePdrsYPaiNpvTpGN/+QDG/TeoengY3MvsOR4KZbQKE1dtd7HaoGY4E/5c
 Km+7El5LjWmFjqbYBWKgCFePDFQzWsE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-wFdM2sEnOB6nWzoRA_zqOQ-1; Wed, 03 Mar 2021 08:07:05 -0500
X-MC-Unique: wFdM2sEnOB6nWzoRA_zqOQ-1
Received: by mail-wr1-f71.google.com with SMTP id y5so2205943wrp.2
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 05:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jtVEBb8KqqGwFb+BAHh+Nm5Kj6eNLFMWBhKJpmGhd8w=;
 b=hHjCAkdbaOIAe56CREvT9q5fMdnwDvdRIMDypXxAUbFVxUEsF1/aR14D5OPxRmRA9y
 2lJMI6XG0HxSHt4NHC4OMtMUJBQgb8fAYpv9joI6LRosPbs0SMoWGykLWnqxWTCr2b7r
 +wmC/m4oUFHS9Eh1jrocY6LEnpZP50JPmlFrMWBJ9pmNeP3Gd9arlbhe8ER6l0bzb56h
 0yaQ0CiFczg/02Kvw7tzOj27aAZv+yD7+YgCeUudl+tD/X95ahj4NG1lGr+f1StOM37+
 IWNOqyg+IPuAzovUnQcTTJn0x3hrSlTyfPoNYHjKgSfrDqPFYtDBcdxXM3tm7uksukbJ
 +FaA==
X-Gm-Message-State: AOAM531eu2ngi+lmjr7CseftMfhdx90tbt+vyUBtV10X7mHfiO+uGc/w
 NH0+oKmdPnZOlez3zA78rmZ/OfbP+9oMyUBNf/FLiYBhMAZ1BwfJLkkzTgXJ4I3IPubPzKAt2Pf
 CyZusyahQCN7LfmU=
X-Received: by 2002:a7b:ce06:: with SMTP id m6mr8852000wmc.38.1614776823999;
 Wed, 03 Mar 2021 05:07:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLnE2wVGnWClVZHpw2M5ylVu7il98PYW9t/wpXte2ctk0HPAxMMEM4z2k90EgJoI1tvy2Rkw==
X-Received: by 2002:a7b:ce06:: with SMTP id m6mr8851993wmc.38.1614776823825;
 Wed, 03 Mar 2021 05:07:03 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l6sm15564425wrm.71.2021.03.03.05.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:07:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] docker: OpenSBI build job depends on OpenSBI container
Date: Wed,  3 Mar 2021 14:06:46 +0100
Message-Id: <20210303130646.1494015-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303130646.1494015-1-philmd@redhat.com>
References: <20210303130646.1494015-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add missing dependency build-opensbi -> docker-opensbi.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/opensbi.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 5b13047e2ab..f66cd1d9089 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -25,6 +25,7 @@ docker-opensbi:
 
 build-opensbi:
  stage: build
+ needs: ['docker-opensbi']
  rules: # Only run this job when ...
  - changes: # ... roms/opensbi/ is modified (submodule updated)
    - roms/opensbi/*
-- 
2.26.2


