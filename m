Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D480E4E51DB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:07:31 +0100 (CET)
Received: from localhost ([::1]:39888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzly-00078i-Mg
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:07:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz94-0001sb-Nz
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:20 -0400
Received: from [2a00:1450:4864:20::42a] (port=36839
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz93-00063y-27
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u3so1668781wrg.3
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TbbPPCqTZc45SGVi0XVYpJfX7KbJJqjQnBanPlloFno=;
 b=eUtgAPYJ6m6zSSMCtk2pQk7fRvTdtjrBUFK7PkklcNwcL9wOl5fHhsoCd5+4K/6PRd
 rCE4m5ZeHcz6b+xR0pOOqSaMcMGOhFxEKDYszV4lF6sj0PbMGRK3n8v371HjoTUVjrc3
 WcfyCy01YGtrhYPZRZvVMrAPEimUvrGb4Wtiu78tJIl5useF6w+WJHRtSAmwp5Zg8drg
 QxF9hm77Xkl7chNVEiYv1bRPJN3KdvyNKjLcmvCEwLqH1fMAxm1SOerJMPDZBPhSfPgf
 ydE9U8aDP4g0tbtOp/6Er0O703C5I2Jz9OnuFQIREorQr/2m1543avaWKetIH3JjrmMu
 HMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TbbPPCqTZc45SGVi0XVYpJfX7KbJJqjQnBanPlloFno=;
 b=snLuCthkXUgfEvT9IRaLxSZd/NkK1N4IcQysqWkFCQ93xiei3i6A4uuo7rnAe6liDx
 AcMZJe3cIY5M2guWyHBGjRW623Eux3Zyc/4yc6rLWi5/p8Qa2Fx3XEnDLEbqoxYgcvyR
 fQ7t6Qligd3gUgOGw+iVfbwjugUM0xbErEeZc39XTKFoDJmPlnTvy+VLkwp1WEkb+UKl
 SMCXI0J28m8h29XLjyB/b5Po76CNJhbv0pnpOzCFIdtwFpXROR3F9ecgqvpCK/lF41Lx
 Codt9+CDlYm7BL9jY54KZx1B2pQZ87KfgFetyiM50uzPSAGKnSd/JbExMobXriNjr8W2
 IhcQ==
X-Gm-Message-State: AOAM531J9W1DJB5OuZp4oo2+Y7Gv4HSC0SxX+bMDS+OdWPSWAnMl6xZC
 NRyGHos9pW/JbLyw1/GtCL+GWA==
X-Google-Smtp-Source: ABdhPJyvpEgLSrxl1KFBZWDbywJ1PNzVPTbjr+HKLjnPr6PhIhyNvkr0+0bqIYht/pgHXxJNno5FAA==
X-Received: by 2002:a05:6000:2aa:b0:204:1472:39b5 with SMTP id
 l10-20020a05600002aa00b00204147239b5mr11639706wry.347.1648034835726; 
 Wed, 23 Mar 2022 04:27:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a5d6612000000b00203fbd39059sm11538803wru.42.2022.03.23.04.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB2C01FFBB;
 Wed, 23 Mar 2022 11:27:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 3/8] mailmap/gitdm: more fixes for bad tags and authors
Date: Wed, 23 Mar 2022 11:27:06 +0000
Message-Id: <20220323112711.440376-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323112711.440376-1-alex.bennee@linaro.org>
References: <20220323112711.440376-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
 Aaron Larson <alarson@ddci.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was running some historical tags for the last 10 years and got the
following warnings:

  git log --use-mailmap --numstat --since "June 2010" | ~/src/gitdm.git/gitdm -n -l 5
  alarson@ddci.com is an author name, probably not what you want
  bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 552: invalid continuation byte) in patchm skipping
  bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 342: invalid continuation byte) in patchm skipping
  michael@ozlabs.org  is an author name, probably not what you want
  Oops...funky email nicta.com.au
  bad utf-8 ('utf-8' codec can't decode byte 0xe9 in position 232: invalid continuation byte) in patchm skipping
  Oops...funky email andreas.faerber
  Grabbing changesets...done
  Processed 76422 csets from 1902 developers

The following fixes try and alleviate that although I still get a
warning for Aaron which I think is from 9743cd5736.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220315121251.2280317-6-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Aaron Larson <alarson@ddci.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andreas Färber <andreas.faerber@web.de>
Cc: Jason Wang <jasowang@redhat.com>

diff --git a/.mailmap b/.mailmap
index 5113f55b3a..09dcd8c216 100644
--- a/.mailmap
+++ b/.mailmap
@@ -28,7 +28,11 @@ Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 
 # Corrupted Author fields
+Aaron Larson <alarson@ddci.com> alarson@ddci.com
+Andreas Färber <andreas.faerber@web.de> Andreas Färber <andreas.faerber>
+Jason Wang <jasowang@redhat.com> Jason Wang <jasowang>
 Marek Dolata <mkdolata@us.ibm.com> mkdolata@us.ibm.com <mkdolata@us.ibm.com>
+Michael Ellerman <mpe@ellerman.id.au> michael@ozlabs.org <michael@ozlabs.org>
 Nick Hudson <hnick@vmware.com> hnick@vmware.com <hnick@vmware.com>
 
 # There is also a:
@@ -70,6 +74,7 @@ Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 # Also list preferred name forms where people have changed their
 # git author config, or had utf8/latin1 encoding issues.
 Aaron Lindsay <aaron@os.amperecomputing.com>
+Aaron Larson <alarson@ddci.com>
 Alexey Gerasimenko <x1917x@gmail.com>
 Alex Chen <alex.chen@huawei.com>
 Alex Ivanov <void@aleksoft.net>
@@ -144,6 +149,7 @@ Pan Nengyuan <pannengyuan@huawei.com>
 Pavel Dovgaluk <dovgaluk@ispras.ru>
 Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
 Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
+Peter Chubb <peter.chubb@nicta.com.au>
 Peter Crosthwaite <crosthwaite.peter@gmail.com>
 Peter Crosthwaite <peter.crosthwaite@petalogix.com>
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
diff --git a/contrib/gitdm/aliases b/contrib/gitdm/aliases
index 4792413ce7..e26b00a71d 100644
--- a/contrib/gitdm/aliases
+++ b/contrib/gitdm/aliases
@@ -34,8 +34,10 @@ malc@c046a42c-6fe2-441c-8c8c-71466251a162 av1474@comtv.ru
 # canonical emails
 liq3ea@163.com liq3ea@gmail.com
 
-# some broken tags
+# some broken DCO tags
 yuval.shaia.ml.gmail.com yuval.shaia.ml@gmail.com
+jasowang jasowang@redhat.com
+nicta.com.au peter.chubb@nicta.com.au
 
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
-- 
2.30.2


