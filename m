Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11733573B7
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:56:31 +0200 (CEST)
Received: from localhost ([::1]:47936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCPm-0003ry-Uz
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUCMa-00005h-IT
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:53:12 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUCMX-0004vO-Ll
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:53:11 -0400
Received: by mail-ed1-x533.google.com with SMTP id w18so22009165edc.0
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C+NXK95Ubk+Qdf8OIvF/Q1CrZUK72+FRoW8OlnM+5rk=;
 b=OY0hoXK+3uSgj+vJ1nt3Y6pl3opgxtmwmeKiChNPbrKzWeS+lCnJ4MsskgVAyzlSwi
 IUKuIaS4BGT3CpOYa6YbImSOpUMvHRKcMJ3wlaFOvfr38jewg+61VVtWNIuUMFyfdpsI
 2Zv0tF/ArawFPTafdk8JTUEBLF1WDl8i2d4R/ouOGUBOlQLIIsYEps34qpYp5ceyhWZ4
 C8yZOGJQboOVXntqYEIKcj2Z/RRtQyoguBDdT3UYEaHe3bxOeSdrTIh8AnBBBhFVuf76
 btfypxHGeUoT7xQT3LVa7GiW5A+cqELFv+HylHvfdA0SzzKV2/GNOnFI3S8ekD/IQdpW
 y6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=C+NXK95Ubk+Qdf8OIvF/Q1CrZUK72+FRoW8OlnM+5rk=;
 b=S8x0jVr6PHMCnz5+GdoFA+gxJQzA3OMiGz83Dx8HMKyN4VZs4KGPrtpsFU3s9uvLeE
 8SHNZqR4wMWT+EJGMDJ3OAGFDzeGYjjIcY1kpg8F1a4R7sk18y9731ml1wE81FcYKomc
 7WHBKGP7l5dbV7NOxF1oxq3JQCFmCB/FW36nhxPJI14m39aMhe+I+t+ZC0a6GDP+ZrGj
 tDtDIONE3lVMWNRaXMEAXY/w06phBZRJHR4BAx3DdBNyJGvuFrY++/+XJlTLFtWYEdzg
 q7hOxF3kehf0erjqWlRKTpbztslK/9RfGelm+0LHom1o2c41zfjNzdoPezCJjC6g1r1l
 7UEA==
X-Gm-Message-State: AOAM530r4EzzXM+CB48pIviT/mxsIjbhUMvWBuPH2EwL9VV/g0xJow7W
 eJE5p8bzhrEMmaAhbYG+zcAuoF8Kmm0Xdg==
X-Google-Smtp-Source: ABdhPJymzpq22WcldeUrdbZyIjIlSDxZKQDLix2Yw+C/hFyd2m4nZlhbJR+s2zGYSTf6nC1gmBZliA==
X-Received: by 2002:aa7:dd98:: with SMTP id g24mr5929369edv.75.1617817987440; 
 Wed, 07 Apr 2021 10:53:07 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id ka11sm4812567ejb.43.2021.04.07.10.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 10:53:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 0/3] hw/sparc/sun4m: Introduce Sun4mMachineClass to
 access sun4m_hwdefs
Date: Wed,  7 Apr 2021 19:53:02 +0200
Message-Id: <20210407175305.1771069-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,=0D
=0D
This series QOM'ify a bit more the sun4m machines.=0D
I need it for a further memory maxsize check.=0D
It is mostly code movement (and the diff-stat is good).=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/sparc/sun4m: Introduce TYPE_SUN4M_MACHINE and Sun4mMachineClass=0D
  hw/sparc/sun4m: Factor out sun4m_machine_class_common_init()=0D
  hw/sparc/sun4m: Make sun4m_hwdefs a Sun4mMachineClass field=0D
=0D
 hw/sparc/sun4m.c | 178 ++++++++++++++++++-----------------------------=0D
 1 file changed, 69 insertions(+), 109 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

