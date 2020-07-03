Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAB2213C50
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 17:05:18 +0200 (CEST)
Received: from localhost ([::1]:50954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrNFd-0007LC-K4
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 11:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrN76-0003vm-U5
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 10:56:28 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrN74-0006lK-ER
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 10:56:28 -0400
Received: by mail-wr1-x441.google.com with SMTP id b6so32991399wrs.11
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DlVNGvmFOuroNPsVcl6xee1wnTJNkNDxh9QND76iGNw=;
 b=nQ1V8V586VCT77NAIzlFIqKJPcU9nPvI0+IrXh5vuUkyIDyhlLsy5hYB4Z5kV5Mdyv
 T/CBVvzrjV3u76hLbPwXes3EijMIn20IWoA8uxteP2Ljy1xUZ2zRzqGjTHMFo+m6hwmw
 z9J6VEfafVBj3G4X9yiQKcMFZdOu4LcpHgUd7e60oDc8+W/2bb8qMwdmTn1IIdVz7uCF
 a9XQAmA43s8bemxUd/d7+g+x+MLCYnMrwt3j7+YeZUj+qBYU3lMjoBFZ+guEWgMCgHIn
 n2zrqEnPFI288R/FhY3A7VRmHwvM03Naz+Pa5MvzHfCGOxSFzM2E52Xh8zPwnX7QJyAz
 9m3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DlVNGvmFOuroNPsVcl6xee1wnTJNkNDxh9QND76iGNw=;
 b=uZd3Omlsjj4r4u6Nn8Qhgab7FD+OfP+DqndyypF0iP4skx6YeZzzdvEHfODlBpnCWc
 3UwEuJnKyR98ejlp+EU6euLwuNefAd4jKG9PjC/daTc47Qxi/XEcay8MLgQybNvVzJoD
 6jtrNaruI7QEos5gwEIoj9Yxih00CCG6madkS2soiIF9jkULJAzcMFgPAUsWr6jlf2WW
 Q+83YRpbGqj8g1WmUDDaMYyhz5y9hBqcGEHyklXHv90AoeSD+z1Z/OAhvc8LmxERvBOG
 RqFYl6AlbPbrXlDWoWz5sfC+CFQLhjXWtO65LNJUf3+z7Bgoa9iXuO5Z88TIsr9KsDVW
 72ew==
X-Gm-Message-State: AOAM532k81KU7rDom+lVMe7JRcKGoi3oLsn6QL/8VhtGEKdZuJwf4XuJ
 HxVbxe0NVAaqizVDhpvrPditgknQhS7lqg==
X-Google-Smtp-Source: ABdhPJyqybwuby3mivuSv/RmIUMu5btJAaW8AyhWpLO2cOkV3CMaMoWp6ANHwRRVHh/WwOrqrrsCog==
X-Received: by 2002:adf:db4d:: with SMTP id f13mr36657311wrj.336.1593788184952; 
 Fri, 03 Jul 2020 07:56:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm14078347wme.31.2020.07.03.07.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 07:56:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/9] util/compatfd.c: Only include <sys/syscall.h> if
 CONFIG_SIGNALFD
Date: Fri,  3 Jul 2020 15:56:12 +0100
Message-Id: <20200703145614.16684-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200703145614.16684-1-peter.maydell@linaro.org>
References: <20200703145614.16684-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: David Carlier <devnexen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David CARLIER <devnexen@gmail.com>

util/compatfd.c includes <sys/syscall.h> so that the CONFIG_SIGNALFD
code can use SYS_signalfd. Guard the #include with CONFIG_SIGNALFD
to avoid portability issues on hosts like Haiku which do not
provide that header file.

Signed-off-by: David Carlier <devnexen@gmail.com>
[PMM: Expanded commit message]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 util/compatfd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/util/compatfd.c b/util/compatfd.c
index c296f55d148..ee47dd80897 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -16,7 +16,9 @@
 #include "qemu/osdep.h"
 #include "qemu/thread.h"
 
+#if defined(CONFIG_SIGNALFD)
 #include <sys/syscall.h>
+#endif
 
 struct sigfd_compat_info
 {
-- 
2.20.1


