Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8442A84B6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 18:19:08 +0100 (CET)
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaiuh-0006qW-18
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 12:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kairY-0004AM-Ud
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 12:15:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kairV-0000Gt-Cs
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 12:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604596547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jje+QkM8EIIDX196QXsItz5lUhUXvc2nsiwvd/KOGGQ=;
 b=H1KBJR+nV/VRwWYc6tYh3kXnFKVDzSpk2kcSog6VVeWjSv+vnZAM2+LLSSBF3mYj1dibHE
 yiUhbqwvxWCvr5s/S76i7xMTBM3Fi/s+isW199bDBZ/vZlKqzRuMTduSqq53XbHoIHinwY
 Ya5XPXRnlToIWS1r2u+mzfgwNcevPVw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-06V39P-wONG8m2lUSAtqsw-1; Thu, 05 Nov 2020 12:15:37 -0500
X-MC-Unique: 06V39P-wONG8m2lUSAtqsw-1
Received: by mail-wr1-f72.google.com with SMTP id t11so982944wrv.10
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 09:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jje+QkM8EIIDX196QXsItz5lUhUXvc2nsiwvd/KOGGQ=;
 b=aX0obmMLlj3dQBFcXy0K6xNue8NiTbrilQnnYMK8lvF5VendFM9AD50jPZq8NIIsgA
 dtghibpGhpxcwULu1utQz5vTNbzFNXla4YFIdwzXhETK+bAEhIZ7N4WgO2j8Puzmezoo
 Y0qNJw6Uk/Vn16gTJ8nhz8uMPDhIaPYYj/dUtaMUtiA08HA4IodTQHukZRCGjPHOnjz/
 tXw+W0b4w6I7tdsdSEU8dWnqOJ+XBmfhpyDp38HT73BcTXia62crSJ7J1iQooTAyfESR
 Cd1bTsb0R6rZ4z4BxOwidunO6ICXYlp0+2cuJWToO31M9ru8mDtsmaksAE5CYql/NZr9
 pNEQ==
X-Gm-Message-State: AOAM533XaK0ri1bNWsdLCGNvttKlSiGKcbQ3oLgOK41i3kyI3YFRVXuv
 sDRLdG9x9J6HutDRz0AZEHt/QMZS0oZ2i15+awQKDb3Q89dxjGJGwD68Iqrdi5OzqG4KsCSVjES
 GqdYg6gRqV2PoqYY=
X-Received: by 2002:a1c:a7ce:: with SMTP id q197mr3857505wme.138.1604596534996; 
 Thu, 05 Nov 2020 09:15:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyV0gc18Czo6wJ4bTL+BrnMjdbeemztbyN2h8rtztYYsoCnuilNKTAOa2FoTH0A7nieM9C6ew==
X-Received: by 2002:a1c:a7ce:: with SMTP id q197mr3857486wme.138.1604596534859; 
 Thu, 05 Nov 2020 09:15:34 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id d3sm3805176wrg.16.2020.11.05.09.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:15:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 01/11] gitlab-ci: Drop generic cache rule
Date: Thu,  5 Nov 2020 18:15:16 +0100
Message-Id: <20201105171526.3763499-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201105171526.3763499-1-philmd@redhat.com>
References: <20201105171526.3763499-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This cache rule is meant for Avocado artifacts, but affects
all jobs. Moreover the 'acceptance_template' template already
include a more detailled rule to cache artifacts.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3b15ae5c302..5763318d375 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -7,12 +7,6 @@ stages:
   - build
   - test
 
-# We assume GitLab has it's own caching set up for RPM/APT repositories so we
-# just take care of avocado assets here.
-cache:
-  paths:
-    - $HOME/avocado/data/cache
-
 include:
   - local: '/.gitlab-ci.d/edk2.yml'
   - local: '/.gitlab-ci.d/opensbi.yml'
-- 
2.26.2


