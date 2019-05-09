Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A782C18EB1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 19:09:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOmXT-0006TI-OI
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 13:08:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hOmO9-00070y-Nd
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:59:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hOmO8-0004uJ-Qy
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:59:21 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36387)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hOmO8-0004tp-Jc
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:59:20 -0400
Received: by mail-wm1-x341.google.com with SMTP id j187so4086727wmj.1
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 09:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Tdq1lhooOg5isCiP/Tk4l5zr7fBDvEhDVLC+/j+f1ds=;
	b=IMDib/93ol23iPrWyW/F7kO/9wH92f8u59c5iSKm7GANCOH8PgYrtqqnFVJP5ShVMt
	kZX3XY+26CQVpfqHLulQTHm13DB2g8rCUosF3oJ2o7HcZnGkTqPbH+ScvfX0PEN0R4t2
	AqIZRSSj621U1EEJZoKEKFWoDJVZxq6/FphzrvoAyl4+zA2q93EHk+UVKoZXxIoiUs5b
	LVH01L/+Gapre4RFdvQQH7j1Ws32DETZnXChH8tfCSuB/2pqF/YZ88cM8vmEco7KloRz
	otQHv7bU8c8OHJEeofiz0uqz/C2fbiIU/o2YHb2dKawK8m2SSMxtPNYj98fPc4bDLD4L
	qyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Tdq1lhooOg5isCiP/Tk4l5zr7fBDvEhDVLC+/j+f1ds=;
	b=LMQc3ad13ogCmPFB5ABO0CWVRj+Lssp/64uvGc4JY3g5bSdK7ynpPNsH1+9PA8j0AP
	2zXfKbSTigac9TnZWGwhCo7+K/RVzsTL2EwQ+oOVgHDGDg8w8NAO9IyCmFcX/W4c4mpE
	Z7qDQwP+cm5L7bD+7fco/nKfWKbJymy9FRSb/E25iHa8tHuQm8XVxE/EG488CBAw11LU
	74h0331L6BZhNpAmpUkPvVmrRaxjoNHbM2fAHEjnEbzjwZ7bj1P6vGWjn46BlnAiIVCR
	XHM4Jd1wrS10Dardq3qJlAmWwodm6ixoZwIMO5Up0KL0oLJ0LUlZgWiesQRXNXFYnRiO
	stgA==
X-Gm-Message-State: APjAAAXpV5644VmalTo3zbdEEXOXIbQ9aSja/L5wl/TynjcBJNBIWttA
	eudevyUNVpIWmf7kOnbffBxzQg==
X-Google-Smtp-Source: APXvYqxH1oSgQ3WGcCK1WOH8KqwiX57S5dfFErkDMoxdiLvrN/sjbJgmBvBFUK0omjqB8B3lgeY99g==
X-Received: by 2002:a1c:b789:: with SMTP id h131mr3660096wmf.71.1557421159607; 
	Thu, 09 May 2019 09:59:19 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	o130sm1685061wmo.43.2019.05.09.09.59.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 May 2019 09:59:17 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C3F791FF99;
	Thu,  9 May 2019 17:59:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  9 May 2019 17:58:57 +0100
Message-Id: <20190509165912.10512-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509165912.10512-1-alex.bennee@linaro.org>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v1 09/23] tests/tcg/minilib: support %c format
 char
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/minilib/printf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/tcg/minilib/printf.c b/tests/tcg/minilib/printf.c
index 121620cb162..10472b4f585 100644
--- a/tests/tcg/minilib/printf.c
+++ b/tests/tcg/minilib/printf.c
@@ -119,6 +119,9 @@ void ml_printf(const char *fmt, ...)
             str = va_arg(ap, char*);
             print_str(str);
             break;
+        case 'c':
+            __sys_outc(va_arg(ap, int));
+            break;
         case '%':
             __sys_outc(*fmt);
             break;
-- 
2.20.1


