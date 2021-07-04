Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1423BADEF
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 19:09:22 +0200 (CEST)
Received: from localhost ([::1]:40788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05cP-00039o-7I
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 13:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m05ao-00016V-6x
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:07:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m05am-0006uI-KN
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:07:41 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso2103054wms.1
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 10:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ULn4pk7SYbRexpTbJwfXkh2AGTL4SFO3wLR63AwhQ8s=;
 b=KpZttHcHKKJf7lk7IbQaCvp59NCKnc0GL3qXqj69YnO3Tcpjjmn0N1vF79IcO6g0i2
 UJgVa1og8HPZSH9t+VEGv7KdtexBfPV/57NShSfe/DrZcX+pJH2kpy9qJxOjJDT1pTDu
 IOaE9woYtlxiThJTDfK3W0EIRRnAzNtnY1hwblC2OwyzFRhb4QXs5JfsxbpCR8iaIikr
 sWYM4dtW+Wr1AU6PtfxyDIxuHr2X790MXP83hSYrV61Jwm3nCD/1cxHC3wgiz5xsTQzt
 ko61Ks/3n7rT/iDgE4CaxjXa5vIYGwcspr6LJObOztFbcBj/hzlzasoprhG4KsSKQbsn
 2OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ULn4pk7SYbRexpTbJwfXkh2AGTL4SFO3wLR63AwhQ8s=;
 b=gzjjgZHWQ8EcO5aZ65RodHMbMfwC53yCliamSDiMqKFLBvnocYDL5WbSndsLJ5+arF
 TQvvCRA2C83dEpf3U7Ummx9fRmeBOP0au0plAwdc48mIaxzUm0lmbyWXv894Od2GZisM
 g6/Dply4LF7OMIfm4JHWI7curIyM5fPy0GS4A64MSKwXlfLKQxU4xQ4fpBi0Zb2v7DVw
 oiLmQ+CHF9uuLrT9j8W0UJktqe1zJ0KnBpKv/pGO/qIBnp/eSgyiTdnvfE5lnqcmEQHM
 pFWkqLAiWcBN1ybigYg4x9jndaRfFlnnMqLiLYzLZcg/PYSRVnyXh2UNiOY+/gimdqA/
 hvaQ==
X-Gm-Message-State: AOAM533kPXWOuogYklMsl7nALW/deG6zAneB5d4sxl7cUVn4oF8pGGFW
 gqIZU+JF0I4BLIvUpAplZ2chiFrgtQ8=
X-Google-Smtp-Source: ABdhPJxY8nUFpqrGcMR+B1mnxeZVxic9sfca4xP+xp5WpKQJXsm4Itm7L3bu2QrL+iR9R9+Fz24sZg==
X-Received: by 2002:a1c:f312:: with SMTP id q18mr10545851wmq.12.1625418458891; 
 Sun, 04 Jul 2021 10:07:38 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u1sm11279906wmn.23.2021.07.04.10.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 10:07:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/mips: Rewrite UHI errno_mips() to allow building
 on Haiku OS
Date: Sun,  4 Jul 2021 19:07:32 +0200
Message-Id: <20210704170736.617895-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Zak <richard.j.zak@gmail.com>, Leon Alrae <leon.alrae@imgtec.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Zak reported a build failure on Haiku OS which is due=0D
to using POSIX errno as array indexes:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg820587.html=0D
=0D
Work around by using a GHashTable.=0D
=0D
Since we were reviewing the UHI (semihosting) spec, fix the errno=0D
values and complete to support all the specified errnos.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  target/mips: Fix UHI error values=0D
  target/mips: Rename UHI err -> host_errno=0D
  target/mips: Rewrite UHI errno_mips() using GHashTable=0D
  target/mips: Complete UHI errno list and log unexpected errors=0D
=0D
 target/mips/tcg/sysemu/mips-semi.c | 105 ++++++++++++++++++++++++-----=0D
 1 file changed, 88 insertions(+), 17 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

