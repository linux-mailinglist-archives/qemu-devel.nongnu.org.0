Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4FE6616C2
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:40:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYhx-0000oG-52; Sun, 08 Jan 2023 11:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYhu-0000io-Bu
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:39:38 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYhs-0002eJ-LT
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:39:38 -0500
Received: by mail-qt1-x82c.google.com with SMTP id h26so6175946qtu.2
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 08:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cl8FwAybGnTJ+yL/0+GnWbPqMAxypxP/E1tZMcbHi4o=;
 b=KqLqVtduIq64Qtj7Xres8Ny7fw8icXn8bYq4yokYRN4l0F1jR2tj+mBsyy/sWDOwX1
 E4TdqVqkjcrXlm9ThbMfVa9JpgT9rKCDIxGiUUXDd9lv7lqNdayRpELwyoKDvCzvM6Qa
 hE/dPoh/7gAtOxCPWRwtT6uwBtpeMKEVj6RQEDvffKgyVaEGsoEBqflypT3Sa0E3OGBO
 Dnm5FuuRe6rATfx+NpiJoKxEKb8iASBoN387008n48Co5IdoRtxvr36DBUQtPfLRKl5d
 FSnIO0Lg3lANazG6zCzNyC9s+qiTQOkkI+60VSmCEDPZ7kwUVKnfvlVNopK9gR4detv4
 Hicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cl8FwAybGnTJ+yL/0+GnWbPqMAxypxP/E1tZMcbHi4o=;
 b=RZreuieDxci2HGxqkWGghQo/kHSIy/2aTloq4G6kTX1wbNQL6UUFiScjmRie0XNcxP
 ffCLup1pokPpjwragcLZxrtLO82CFKoMSPoe3C2ujg+N79CwzghOodaFNAXB7pBqleOi
 1d8QmrT77YuVYDHA+DqwdiXCMTi9GLIzy4/E3uT1lv7dasLlCvOACZs4Ek0bF3E/F1Lu
 G9N1Tas957UegHT6mMGKA28UaSD5wtCLLVztAZvmGYjvoakBNH83uJUc4Z6lGuMrABxy
 danslnDHX1rHrHnbLeimFlScamPWleAmjv9Snm2uZi5AsfIbbx/oUb/GHu5zxym7iPOd
 feRQ==
X-Gm-Message-State: AFqh2kqer7eK5XnSZ5P2/1BmmSC7KzAkJih5w/N8VVpVJ7Va/TP1DwIR
 FtCqYTEnLcgp7IzuZb1fuZWTvkfC2/JSNw8tyHA=
X-Google-Smtp-Source: AMrXdXvbuwt1dwotmiWFFdP/gqurUuuYXGFEdi6ixZ/N7gqDDDFbe7PCLLG8WVTVbqisfLT5wQOJKQ==
X-Received: by 2002:ac8:5383:0:b0:3a9:81f0:d8e9 with SMTP id
 x3-20020ac85383000000b003a981f0d8e9mr84647790qtp.68.1673195974937; 
 Sun, 08 Jan 2023 08:39:34 -0800 (PST)
Received: from localhost ([185.156.46.146]) by smtp.gmail.com with ESMTPSA id
 l13-20020ac8724d000000b00399fe4aac3esm3408508qtp.50.2023.01.08.08.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:39:34 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH 0/4] tsan fixes
Date: Sun,  8 Jan 2023 11:39:01 -0500
Message-Id: <20230108163905.59601-1-cota@braap.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::82c;
 envelope-from=cota@braap.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

Here are some fixes for tsan issues that I've encountered.

The most important patch is 3/4, which allows us to run tsan for
non-trivial workloads.

Thanks,
		Emilio



