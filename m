Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B7B455EE9
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:04:20 +0100 (CET)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnixX-0006IU-F3
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:04:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnir3-0004eg-M0
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnir1-00083p-BR
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637247453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DiSDv3PdVbuzBwVbsPBRsE403y5aRBjXVqhRXtzZwI=;
 b=CL1xe1rtwsDeCo3UIbKDgVZWXjX1VhB1cCeZIbdouJr2BUq6XguXaMGeZU8U4U+qpgAZ3r
 dkqi2Jd19GjfgG8QkOyUB8fqrczHamlbHiAh1vkRfGoZMl0AuaX+kZLYyLBRL+CMAvQQNv
 AsdYnr6oNNd/luux5gMxaSV55yXQhBs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-zLNRpDigMSG0OHDAfjKciA-1; Thu, 18 Nov 2021 09:57:32 -0500
X-MC-Unique: zLNRpDigMSG0OHDAfjKciA-1
Received: by mail-wm1-f71.google.com with SMTP id
 187-20020a1c02c4000000b003335872db8dso2206063wmc.2
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 06:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6DiSDv3PdVbuzBwVbsPBRsE403y5aRBjXVqhRXtzZwI=;
 b=a51JBxYvD9snmRFd/UPyCWCmnayvy4K43lOlO7/v5Mv27UvZzZ36LZ1ZjGWvDuQqRM
 hb+UxIG6yUS7s6/6ObtmKYj9cxXPqA3s4HI3m1JOPwFdiTe5tDe8KOLUteGvBFvya8QA
 9yue+Aw55kgZ9uE+/NWxSUxhiq+NCXNdGAlieLpo4Hqf+mm6bqit3KS2eZdN9iNo+Vc4
 mK9Y9hol9rm8lapMJL033itWXyI7gc/M08mq3+xCsY2bPpxdBxV8IBYVTNmG8QdJHj7C
 2qQ3AH3z4+l7Vbilmr7uRVOuKVROIrOFUXfD47jbJZZrhr+BPyUrjvZbnbK3hxxwl4Ta
 x1/g==
X-Gm-Message-State: AOAM5336RwENUk24TLNb11btc/eEVzKMWW4aXnjxtrG2t+qEr0HjTq/K
 BT54AXKRuy4FkqghCxE3WDgoNVsM69JnaL1fOXrfw/2iY323njUIp3niylFnJ53bjuPyK2EBMtJ
 TyOv+KnzoGo4ii//fubSuJjr4Fg9CdBYyQPZcLRZCu2Rru1YkGUXUKkALmVaMKsT1
X-Received: by 2002:a1c:a715:: with SMTP id q21mr10926062wme.23.1637247450957; 
 Thu, 18 Nov 2021 06:57:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFehAPCodWGX22DYzque1Ork/YjeZDpJjpMHY+Bq8h0Rt0bxqYzveTzZqKA3MfHMEK+z02Mg==
X-Received: by 2002:a1c:a715:: with SMTP id q21mr10926028wme.23.1637247450721; 
 Thu, 18 Nov 2021 06:57:30 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 b10sm81077wrt.36.2021.11.18.06.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:57:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? v2 3/5] docs/devel/style: Improve string format rST
 rendering
Date: Thu, 18 Nov 2021 15:57:14 +0100
Message-Id: <20211118145716.4116731-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118145716.4116731-1-philmd@redhat.com>
References: <20211118145716.4116731-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/style.rst | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 1a23021bc3e..a7487d867e6 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -471,11 +471,11 @@ instead of plain strdup/strndup.
 Printf-style functions
 ======================
 
-Whenever you add a new printf-style function, i.e., one with a format
-string argument and following "..." in its prototype, be sure to use
-gcc's printf attribute directive in the prototype.
+Whenever you add a new ``printf()``-style function, i.e., one with a format
+string argument and following '``...``' in its prototype, be sure to use
+gcc's ``printf()`` attribute directive in the prototype.
 
-This makes it so gcc's -Wformat and -Wformat-security options can do
+This makes it so gcc's ``-Wformat`` and ``-Wformat-security`` options can do
 their jobs and cross-check format strings with the number and types
 of arguments.
 
@@ -659,10 +659,10 @@ Note that ``&error_fatal`` is just another way to ``exit(1)``, and
 trace-events style
 ==================
 
-0x prefix
----------
+``0x`` prefix
+-------------
 
-In trace-events files, use a '0x' prefix to specify hex numbers, as in:
+In trace-events files, use a '``0x``' prefix to specify hex numbers, as in:
 
 .. code-block:: c
 
@@ -676,27 +676,28 @@ PCI bus id):
 
     another_trace(int cssid, int ssid, int dev_num) "bus id: %x.%x.%04x"
 
-However, you can use '0x' for such groups if you want. Anyway, be sure that
+However, you can use '``0x``' for such groups if you want. Anyway, be sure that
 it is obvious that numbers are in hex, ex.:
 
 .. code-block:: c
 
     data_dump(uint8_t c1, uint8_t c2, uint8_t c3) "bytes (in hex): %02x %02x %02x"
 
-Rationale: hex numbers are hard to read in logs when there is no 0x prefix,
-especially when (occasionally) the representation doesn't contain any letters
-and especially in one line with other decimal numbers. Number groups are allowed
-to not use '0x' because for some things notations like %x.%x.%x are used not
-only in QEMU. Also dumping raw data bytes with '0x' is less readable.
+Rationale: hex numbers are hard to read in logs when there is no '``0x``'
+prefix, especially when (occasionally) the representation doesn't contain any
+letters and especially in one line with other decimal numbers. Number groups
+are allowed to not use '``0x``' because for some things notations like
+'``%x.%x.%x``' are used not only in QEMU. Also dumping raw data bytes with
+'``0x``' is less readable.
 
-'#' printf flag
----------------
+'``#``' printf flag
+-------------------
 
-Do not use printf flag '#', like '%#x'.
+Do not use printf flag '``#``', like '``%#x``'.
 
-Rationale: there are two ways to add a '0x' prefix to printed number: '0x%...'
-and '%#...'. For consistency the only one way should be used. Arguments for
-'0x%' are:
+Rationale: there are two ways to add a '``0x``' prefix to printed number:
+'``0x%...``' and '``%#...``'. For consistency the only one way should be used.
+Arguments for '``0x%``' are:
 
 * it is more popular
-* '%#' omits the 0x for the value 0 which makes output inconsistent
+* '``%#``' omits the ``0x`` for the value ``0`` which makes output inconsistent
-- 
2.31.1


