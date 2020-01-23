Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004051474B8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 00:24:01 +0100 (CET)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iulpQ-0001CW-Gf
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 18:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iuloM-0008HP-NO
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 18:22:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iuloL-0007Zk-Fu
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 18:22:54 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:51161)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iuloL-0007ZB-8N
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 18:22:53 -0500
Received: by mail-pj1-x1044.google.com with SMTP id r67so183367pjb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 15:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RoircKAFBAZMrOvjlCVOAiabpxz9R5dJatJCo0/3s5s=;
 b=UaC3VJhLc1HcJ3v95FJ1NCe2Pra4der/WngdAWngUEa9C9TTI0IqyI1BsVfpAWZwLM
 GAL7ZAlTnclSJYsoc/YTlxIo0WF8GWT4Iy9/773IRZhO5dW502rrWBuYdlubUw2OB60m
 LP9EfbE9C+FwFm9r0MiXIs9FvG5qkicu8rnYkLjtFEp9kTEjcUoO/XgzSgzQaS2mgwiR
 sdnqLZiDFIV9niYOmUV6XzqsNWls7uRgFauP++DIivGDU2HXV4iACa/R9k79ym4ceQau
 xVv/66uQ/4c6DXscxYbOoRATpNG/8GSP0nfJfCSYCiiZFX4NVng1lfequRWVTFq04dwX
 ZoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RoircKAFBAZMrOvjlCVOAiabpxz9R5dJatJCo0/3s5s=;
 b=s+GVyEBZAzt4VygEJyOKZdFBicN0cd2HwyU+SsNdND+R+NUGG9HEJ6vXgMMnwOZihD
 L+3V/OSFIvl30q7r8+nyqZAtmFnVLTT6aHpg/OPrHx2o4KZmwKdNdzmmC+BQckPF5iQw
 THuqcdWRPAk25M7s6IWUBKLezh/eyBGrs2yfZsUgtuNP6RGQDlHu377zLqrkUgguy08D
 TbMY7lfMcJzfhXk1egPYi7Azk2qDCHvrbCRWrRcAki/+4SRyuyliXocXvlWD26aCKkF0
 zZaPBu/aWDif74U1MfXs1SJEZztIemt1U+GIs4WEiZruZBHxikx/ERXf0EGlnGBcIlrm
 fjJg==
X-Gm-Message-State: APjAAAUTrY1iHvm2J6iV4YVdYYpHCfhlu2YvJ/wpJ/oXHfEYNj/yzpgx
 MnDfZyCDBTFJjp8sdEFCBnRvSWGYjQQ=
X-Google-Smtp-Source: APXvYqxCLfZc1EHOLu2Tf9M9G8f1lG7JZKnNZl+VTytmFVi+V+lgVNIQCJwRxzDsBRve177CENLlDw==
X-Received: by 2002:a17:902:a5c3:: with SMTP id
 t3mr558010plq.145.1579821771450; 
 Thu, 23 Jan 2020 15:22:51 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-198-77-92.west.biz.rr.com.
 [173.198.77.92])
 by smtp.gmail.com with ESMTPSA id z5sm4136008pfq.3.2020.01.23.15.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 15:22:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/s390x: Do not leak stack address in translate_one
Date: Thu, 23 Jan 2020 13:22:43 -1000
Message-Id: <20200123232248.1800-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: thuth@redhat.com, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas' patch avoids the leak, but I think we can do a bit more to
cleaning in this area, and move the structure inline to DisasContext.


r~


Richard Henderson (5):
  target/s390x: Move struct DisasFields definition earlier
  target/s390x: Remove DisasFields argument from callbacks
  target/s390x: Pass DisasContext to get_field and have_field
  target/s390x: Move DisasFields into DisasContext
  target/s390x: Remove DisasFields argument from extract_insn

 target/s390x/translate.c        | 982 ++++++++++++++++----------------
 target/s390x/translate_vx.inc.c | 649 +++++++++++----------
 2 files changed, 813 insertions(+), 818 deletions(-)

-- 
2.20.1


