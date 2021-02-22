Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1532223F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 23:40:43 +0100 (CET)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEJsf-0001gj-VI
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 17:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrA-0000nC-FT
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:08 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJr8-0005KO-N6
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:08 -0500
Received: by mail-ej1-x632.google.com with SMTP id lu16so31722034ejb.9
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 14:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3R7FPO2OcoA2dkjTq2P+JEFvLMsI7UDfP3DOUw+crFI=;
 b=nj2s/YMRgMCH/T6EN6a7vE/7VaEraJAE55XuWEX7Urn/zQpnA0Pa5VNNdtZKb2jFOF
 8ZOr5zqHJtOm67PhG2fx6qXB67+W4kZonDuvDqxqZ+BhCjhGMIK9FLPgjitUoHUEyEML
 L2moUkaLhxmrj/Smii8DsT6GuhIjBZWmYZT+EMHoYeCAUTrZSBfbgWDqnRK/n2hY9efN
 QjdIclZzSpOhm2p+J28AcjuugPoLrA+3Y7v2/HFouTcvXaWls9y/O7IEC/TVg6tPYo4v
 Xy0bZFgbjUA73PqNmZCQguoD3esNjZcgGqkIbm4QvH/o7EMqQ8Vkdc6Z94PNwTVCRT0y
 jhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3R7FPO2OcoA2dkjTq2P+JEFvLMsI7UDfP3DOUw+crFI=;
 b=sCMjjZ77fahvSoC9i2ZJQLfUGworhic3UHEEmoVpwYjN8uQjuebjAPHPdBTPKYqeml
 3MuaiAIxO7Y/hZXvwQaNlPaaVcaFLlbHJ3KYcLW9reiJe+ZfzOgZf3vlvYdopAbK/C17
 EoshfCy+NIOBBONR00R2RzTb/K8kq/6jfKQJzCcc1BLBKYUM7CMPncKKzLwwy96mYXC0
 eA0caLElUndVD16gljhwRFk5FT2qJ5olIU6NdSmaTlVJ9cOn0qlhtxNNPbtqjQ/lPuYx
 UX72VWc2U0wTM7RAmSIlM0Yse8ULYcxiKorLi45isj5vln6zGZ503cMMC56Mg4pbC2jC
 8C3w==
X-Gm-Message-State: AOAM533lhL7kke28vKx4FLSw9tbZhOgnayAYOQ2QXp0OHuo4i2/+4OI9
 OwRmdOOwj6BTvH4czUEEoJQvFE4jkHY=
X-Google-Smtp-Source: ABdhPJw5/xKLsBXByAKkuOza5/kd3NRIptd/6c2U8CEkLGDF50z/75oVk+FoM97mnDCP1CFC6ttC1g==
X-Received: by 2002:a17:906:7687:: with SMTP id
 o7mr23317674ejm.209.1614033544218; 
 Mon, 22 Feb 2021 14:39:04 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g10sm6003235edu.63.2021.02.22.14.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 14:39:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/10] target/mips: Extract MXU code to new mxu_translate.c
 file
Date: Mon, 22 Feb 2021 23:38:51 +0100
Message-Id: <20210222223901.2792336-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This is a respin of "Extract XBurst Media eXtension Unit=0D
translation routines" v2:=0D
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05889.html=0D
=0D
But instead of an included C file (.c.inc) we now have an=0D
independent C unit. We gain faster recompilation time when=0D
hacking translate.c or mxu_translate.c, and we also gain=0D
in code maintainability.=0D
=0D
Review should be trivial, with almost no logical code change.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  target/mips: Rewrite complex ifdef'ry=0D
  target/mips: Remove XBurst Media eXtension Unit dead code=0D
  target/mips: Remove unused CPUMIPSState* from MXU functions=0D
  target/mips: Pass instruction opcode to decode_opc_mxu()=0D
  target/mips: Extract decode_ase_mxu() from decode_opc_mxu()=0D
  target/mips: Use OPC_MUL instead of OPC__MXU_MUL=0D
  target/mips: Introduce mxu_translate_init() helper=0D
  target/mips: Make mxu_translate_init() / decode_ase_mxu() proto public=0D
  target/mips: Simplify 64-bit ifdef'ry of MXU code=0D
  target/mips: Extract MXU code to new mxu_translate.c file=0D
=0D
 target/mips/translate.h     |    4 +=0D
 target/mips/mxu_translate.c | 1625 +++++++++++++++++++=0D
 target/mips/translate.c     | 2909 +----------------------------------=0D
 target/mips/meson.build     |    1 +=0D
 4 files changed, 1645 insertions(+), 2894 deletions(-)=0D
 create mode 100644 target/mips/mxu_translate.c=0D
=0D
-- =0D
2.26.2=0D
=0D

