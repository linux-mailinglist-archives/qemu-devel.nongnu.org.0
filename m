Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E1409C34
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 20:28:10 +0200 (CEST)
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPqga-0001GJ-MR
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 14:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPqe4-0008CA-V8
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 14:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPqdw-000169-DL
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 14:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631557522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mUbl6kWKe6Xt2wLwczPXN5wnQrGUJ4OA9nq8JJgNV0I=;
 b=XXvuMY54LDOTNp9fhBQOUyfkYYoSH+Wxmaxccfw9Nx4xY1H7CJm1vwyOkhnTlyrCiu0WeQ
 5PTQWXaAAju/EANonxNyJXQdxQnqFPjtxEaXKoI+2Teg09VrG1uQW1iJ+8rh+kPrXcKP0g
 2+aGX5yBM09SBhiF2kc18YL/0AAnDVk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-q-sr0Z9eNS-IDFB-I46XZQ-1; Mon, 13 Sep 2021 14:25:18 -0400
X-MC-Unique: q-sr0Z9eNS-IDFB-I46XZQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u30-20020adfa19e000000b00159aba4fe42so2969692wru.9
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 11:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mUbl6kWKe6Xt2wLwczPXN5wnQrGUJ4OA9nq8JJgNV0I=;
 b=7aJ12j7xG2FYeBeJpVkiQFn4EbSDRFwtoxe9PQl3wDlaty0Cbn1nzR+7Qfekd7+jzI
 93xjXbZamDVUWH9+q+RLTyTCmELyZr8ACe0cnxKBXDaIhzPaJBI/e5Cx3kFsr7y5rIW6
 zVuH0HEtU3p4+6S310N/IUiFGN0fzs/tWFdK8YLVa9OTMLPFHLsq4XlUefGu7QquH8NO
 K98IPalN+XMmchBhYx6FJp/4gbbg9SLhX3tXG3LYFWv61RXNWjRo1+b8ciB4SCdxQ1Ph
 N+KT+770GtJdBQ9iPKjGQRr0Gwud3fR/aS7Y/5kqihWdO44End/X4TF0HWX0YufaN63M
 vLJw==
X-Gm-Message-State: AOAM531TzYvBDpM30zn0fgYHjaLzGF4t48ObuRk9dbOLvVCilG2Bf9vy
 8mRNYqJwHLuzsqI4lwZmbsehApSV32XgdCrtZ0YB1zpXGSBseiYP+/S4W6kOvWBRGYmeHI81Dof
 YAC7ZM8jcV+dcYViAls5UQ6+z+uKT06jBnuW8T5+eN1QOSwXDZdCYwLRtEFSgmQfO
X-Received: by 2002:adf:cf05:: with SMTP id o5mr14087121wrj.270.1631557515757; 
 Mon, 13 Sep 2021 11:25:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzhBf+Agxu8oNSIuWZv+J9eG0ke6g0II+XqCcuGwJjsn9WrWhQD4vuAj6W7jiS0BDqidBB1g==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr14087003wrj.270.1631557514136; 
 Mon, 13 Sep 2021 11:25:14 -0700 (PDT)
Received: from x1w.redhat.com (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d17sm4546921wrp.57.2021.09.13.11.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 11:25:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web RFC PATCH] Add Sponsors page
Date: Mon, 13 Sep 2021 20:25:12 +0200
Message-Id: <20210913182512.1021618-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a page listing QEMU sponsors and displaying their logos.

Logo sources:
- https://www.rackspace.com/es/newsroom/media-kit
- https://developer.arm.com/solutions/infrastructure/works-on-arm
- https://gitlab.com/fosshost/assets/logo
- https://www.linkedin.com/company/cip-united

Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
There are probably more, but I'm not aware of them.

Maybe we should list past sponsors, precising a year range?
---
 _includes/nav.html      |   1 +
 sponsors.md             |  22 ++++++++++++++++++++++
 sponsors/cipunited.jpg  | Bin 0 -> 10607 bytes
 sponsors/fosshost.png   | Bin 0 -> 18251 bytes
 sponsors/rackspace.png  | Bin 0 -> 7363 bytes
 sponsors/worksonarm.png | Bin 0 -> 9965 bytes
 6 files changed, 23 insertions(+)
 create mode 100644 sponsors.md
 create mode 100644 sponsors/cipunited.jpg
 create mode 100644 sponsors/fosshost.png
 create mode 100644 sponsors/rackspace.png
 create mode 100644 sponsors/worksonarm.png

diff --git a/_includes/nav.html b/_includes/nav.html
index 73b39b3..49ad4cd 100644
--- a/_includes/nav.html
+++ b/_includes/nav.html
@@ -8,6 +8,7 @@
 			</li><li {% if current[1] == 'contribute' %}class='current'{% endif %}><a href="{{ relative_root }}/contribute">Contribute</a>
 			</li><li {% if current[1] == 'documentation' %}class='current'{% endif %}><a href="{{ relative_root }}/documentation">Docs</a>
 			</li><li><a href="https://wiki.qemu.org">Wiki</a>
+			</li><li {% if current[1] == 'sponsors' %}class='current'{% endif %}><a href="{{ relative_root }}/sponsors">Sponsors</a>
 			</li><li {% if current[1] == 'blog' %}class='current'{% endif %}><a href="{{ relative_root }}/blog">Blog</a></li>
 		</ul>
 	</nav>
diff --git a/sponsors.md b/sponsors.md
new file mode 100644
index 0000000..da1bf19
--- /dev/null
+++ b/sponsors.md
@@ -0,0 +1,22 @@
+---
+title: QEMU sponsors
+permalink: /sponsors/
+---
+
+QEMU has sponsors!
+
+The website is hosted by [Rackspace Technology](https://www.rackspace.com/).
+
+For continuous integration and testing, hardware is provided by:
+- Arm and Equinix Metal via the [Works on Arm program](https://www.worksonarm.com/)
+- [Fosshost](https://fosshost.org/)
+- [CIP United](https://www.cipunited.com/)
+
+
+![Rackspace Technology](rackspace.png)
+
+![Works on Arm](worksonarm.png)
+
+![Fosshost](fosshost.png)
+
+![CIP United](cipunited.jpg)
diff --git a/sponsors/cipunited.jpg b/sponsors/cipunited.jpg
new file mode 100644
index 0000000000000000000000000000000000000000..d04c2cf74518ee9be80e9dcb6fc0f6d8f5a730ec
GIT binary patch
literal 10607
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
L`tOP~ed^x;@!w=*

literal 0
HcmV?d00001

diff --git a/sponsors/fosshost.png b/sponsors/fosshost.png
new file mode 100644
index 0000000000000000000000000000000000000000..c67ccee23ec359010501028ab4faeb075bc51157
GIT binary patch
literal 18251
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
J);T3K0RV!ZmZAUv

literal 0
HcmV?d00001

diff --git a/sponsors/rackspace.png b/sponsors/rackspace.png
new file mode 100644
index 0000000000000000000000000000000000000000..e949f33d35faea40543dfddd20aa7efdd74ebbe1
GIT binary patch
literal 7363
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

literal 0
HcmV?d00001

diff --git a/sponsors/worksonarm.png b/sponsors/worksonarm.png
new file mode 100644
index 0000000000000000000000000000000000000000..57af96a923312b49d815c49561229b4fd151c8ae
GIT binary patch
literal 9965
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
L14NCQL-_vz+=pxC

literal 0
HcmV?d00001

-- 
2.31.1


