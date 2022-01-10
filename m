Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90468489EBF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:02:27 +0100 (CET)
Received: from localhost ([::1]:38160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6yzy-0002w7-N2
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:02:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6ypA-0007JI-4l
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:18 -0500
Received: from [2a00:1450:4864:20::530] (port=38412
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp6-00066C-EX
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:15 -0500
Received: by mail-ed1-x530.google.com with SMTP id u21so34174630edd.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 09:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OTMi4ThvYsHdaxRQinDWagkVxuRjT1evPlMWwfqMwCE=;
 b=p5sNVTrVjR8UZZLKgzhhObOyHiTwbED+I/JKxtS3ZEPH63A9WvzdZNoPsJctyCkBIR
 ouMLdmNLyATCd+B1EOhqn1sdhbecGZHCWtyznCLf8Je+YCT82GPPc27dfUMEeUD1Tvfk
 5vveAFcXncmrsPEp5j9EJ+LAMTYN6pb51LvxwIbRHfbmAJkSVP4bNfuIwVH/s99JtGnb
 kKDh0691SRLOptIjq00Y8p6voTiqWzw0DQ2OTLY+Sin43uD6o2u8OaxSLll6FZLgY9ql
 4TOdYOxIBI5KpheVqtV89E52/qFApUjSlpnxYdn5parM0Wc7Y4fK5+LE0D0YVw6NsmZU
 +rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OTMi4ThvYsHdaxRQinDWagkVxuRjT1evPlMWwfqMwCE=;
 b=oz7wIyfbZcRMMnukn08Uw5iUzJWS3sdhDA4eIn5Y5mwRKnjhhi58z01N2pcBroz9iM
 4UUkjRIBfbK/s+S6P+FuDDAc5t4cIdatoqCUjzAKJLSKT9//BoDkQJ01nnkmLjcOy7SH
 oBgfGEyVlV1edF0/C23ktwTof6WBuHQn5tgqA4f+OkhsQNtfl1gbGe4S2o5FihHtTC72
 ORGIACM1BJXRYr4yOoPCAo3xYzhXyt6R4vFk9cN5soGncvXWsIILD5F85KWadlosx0Dq
 kaTgFThB452r0hED8c3MstLtwm5vsIk6H1c488MFjbCeuucXf2aBic6p6HKrT3epTzBL
 QMaw==
X-Gm-Message-State: AOAM531S+Bp0VU9kssLUh4xUL4U4UoR1bazst8jartJgX41P/Yej3nHH
 xZwbWbl8iGLx8BU6kph2rwuzRw==
X-Google-Smtp-Source: ABdhPJz2XEosrzRRJ9YHfJufTpyZH2krmn6Af9p6OwsuZ7aGZmtCH5WZd5zBvNbLaI/b5WgqdqHDDA==
X-Received: by 2002:a05:6402:1d84:: with SMTP id
 dk4mr798024edb.16.1641837070817; 
 Mon, 10 Jan 2022 09:51:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k21sm3826268edo.87.2022.01.10.09.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:51:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A517C1FFBC;
 Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  4/6] pc-bios: add pipico mask rom (!upstream)
Date: Mon, 10 Jan 2022 17:51:02 +0000
Message-Id: <20220110175104.2908956-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110175104.2908956-1-alex.bennee@linaro.org>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LOTS_OF_MONEY=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The boot code for the RP2040 is fully open source and can be found at:

  https://github.com/raspberrypi/pico-bootrom

it contains not only the initial boot code but a full USB stack (for
programming) and a number of library functions that the user code
might use. We really should be able to build this ourselves but until
I figure out how to integrate the build this will do. This image was
extracted from a B1 pipico by a friendly hardware hacker.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 pc-bios/pipico.rom | Bin 0 -> 16384 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 pc-bios/pipico.rom

diff --git a/pc-bios/pipico.rom b/pc-bios/pipico.rom
new file mode 100644
index 0000000000000000000000000000000000000000..8eb47ee7873678c8e82aeae8db9157fddf5e9de4
GIT binary patch
literal 16384
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
L-N4^D;otuOn>zy8

literal 0
HcmV?d00001

-- 
2.30.2


