Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B584D9AF6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:18:19 +0100 (CET)
Received: from localhost ([::1]:33496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU682-0001sf-MY
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:18:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62x-0005vj-Nw
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:03 -0400
Received: from [2a00:1450:4864:20::631] (port=37762
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62w-0000aY-2L
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:03 -0400
Received: by mail-ej1-x631.google.com with SMTP id bg10so40837214ejb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Uyr7rr6sVgEAUZirPZ3f9yzcZRSyq728z6nC7yYzoo=;
 b=zNSMkcCA39nt5oFZoaaylCH9oYHgPyvAs7NyUoB7kam0rfIHxtsqEkX597xdW2AeC9
 uqphjZCrhn7ynwT9Htystu2b690yK+QxzH96JyXZCg4FTOQEdtcVQLYxcDEaxzdV2G/k
 nwrI/xr0q8y1Ep8dvLWYPRthlO/HmAE2oi7SKw3HtTAEFJmZuNHQicMZWGOrSlb16Y3R
 PyO/k7SOyPl62dpu64BfK0JxDLQtrPW7B5poqPQu70WFQDgIwbXPCwTuOkED9zhC8kt9
 gjtC0tdMAKdmlJtZ9rYlek2E1AoOTRdlJSgqLxVwFshjHKcL6GSh41/kcGDS83Y5ZvJI
 ehoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Uyr7rr6sVgEAUZirPZ3f9yzcZRSyq728z6nC7yYzoo=;
 b=pcGK2ukZhm+/K76ak7Rw/4vhV5hYF5nIqPh08WSVfKE5L8OlW+x3khcWBkAbtMY1U2
 aCPyfhZwuikf/6yfhJrjSkCoGoyvYgNALQQ9XCQJfTpwWDytKuA2s7rz7ixF5VaVWB71
 twWw3eDPcvHixN1vPht15mATEoqGRquHvR09gf+D1fWl9JLAqn7kpblylPMoUcODjZrO
 K4fQdxRLn407WSeEe/iWFKJKAvdMJRWjZMZrO1Ba8CQyVDHpwL7cGp2unjG8QILSSuxv
 SvSXT8fsf1nZhcYNal2b8IrjfwZ6L3yqWDqn5Nw6IZzsjT3HTD+cTVv4zkt8KMGdIy7o
 ljlA==
X-Gm-Message-State: AOAM533GLk2Qq86Fe4hiNYnTRknyXWiuDsZJpzaxCV6NePCyS1sboRaM
 h8qkPK+5nVTK/19vMasBJJ4Q8Q==
X-Google-Smtp-Source: ABdhPJx2jNw6uYI2BS0bjtbFrtoNZu6shc3HlF88pFAlkAcm8DlUDMMx7IQHNp262YtdbeBJ5B5BUQ==
X-Received: by 2002:a17:906:2584:b0:6d6:e5c9:221b with SMTP id
 m4-20020a170906258400b006d6e5c9221bmr22618492ejb.514.1647346379898; 
 Tue, 15 Mar 2022 05:12:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q5-20020aa7cc05000000b004129baa5a94sm9361938edt.64.2022.03.15.05.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 05:12:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 635B01FFBD;
 Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 5/8] mailmap/gitdm: more fixes for bad tags and authors
Date: Tue, 15 Mar 2022 12:12:48 +0000
Message-Id: <20220315121251.2280317-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, sw@weilnetz.de,
 Jason Wang <jasowang@redhat.com>, Aaron Larson <alarson@ddci.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Michael Ellerman <michael@ellerman.id.au>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Aaron Larson <alarson@ddci.com>
Cc: Andreas Färber <andreas.faerber@web.de>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael Ellerman <michael@ellerman.id.au>

---
v2
  - added Aaron's acked by
  - dropped Peter Chubb from CC (bouncing emails)
  - used Michaels preferred coding email
  - dropped the identity map in aliases (I think gitdm still gets reported by correct)
---
 .mailmap              | 6 ++++++
 contrib/gitdm/aliases | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

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


