Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7321331ADB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 00:13:11 +0100 (CET)
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJP3m-0003Fk-Mj
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 18:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJP27-0001gM-OX
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 18:11:27 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:33160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJP26-0005jL-35
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 18:11:27 -0500
Received: by mail-qk1-x733.google.com with SMTP id l4so11254205qkl.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 15:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wFlfdENY4Hsp6KG6WBQza+olq0T99MhK2MPAKbv7nBs=;
 b=nTqi9kr2FyK8KeJrkwmEyiw3I1K/8d73y+YHUPQyQ8laULZl6QwDEk8w7prx7pQf7w
 uLpiQaZ/1KoKWXzlCXuoQoH611NoC4Hfc1emK7GqeYgwlGZX3czflRV8jrV24w271gyF
 VfRQzsaEVYdiVWBFdoXKXnKAn0nO3HbsFAO/9y6Szy1lCuW0YM/zkrBp357JhHZFm18h
 3t6i1IzNhZMh8mzTu8VBb9WcPpHGCbta4nEg7tcwvkK++B1B9/bgJejLkGsXnH59ZUzd
 /qDXmUwWD2c1GBuPczNPYYRvOHGLkB8iw5CgtePMbbrJO9dPmgrUqbjlmd5NeB2CsqbP
 HoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wFlfdENY4Hsp6KG6WBQza+olq0T99MhK2MPAKbv7nBs=;
 b=BF54tUn1L5m7rJ/oGt094xQFrZ1bGIiVai8fWnpFtPmGssg7+yYzR4TWWEZCH+7odU
 XX8yaOegrx3dD8PRYfuTDv/OyIvbJI59zo7qDXieQhkmBN2Z+yau1SYTfz9KRf7m5agA
 oTH8DI8lLERASosi/HhcbB9J0BlEHRqW7AYLCr38eIU0cz6KADwxJg1I3j4lkQD5Dvkw
 WU3l2mOf9RIa/MKOG8J9f+WzSoqKWhP+Sc6ovv6JL9SSCe1HGNTkBesXbCeW5rArP5ue
 SCyYbzaAcFH4vWcPfwyIGosZlo0aAfluk74Tg2ltDg/HASekP8zI+r2RPLfHdXAvYWoq
 n1Fg==
X-Gm-Message-State: AOAM53146utySif8hCFJIKq6Oifr3I29Bmc4X069mu1uY14RzPHg5pMS
 3Afe4Ml1r+QDTk8m1Mr/HwsCzw==
X-Google-Smtp-Source: ABdhPJw7d7IwPz74EynMZl/5/Ynj3A7PuzvFgvhHf65IH4aHg2YmwyR/t2/IFJiswIzFpbqniHih3w==
X-Received: by 2002:a37:a192:: with SMTP id
 k140mr23008740qke.278.1615245085105; 
 Mon, 08 Mar 2021 15:11:25 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id z6sm3312342qto.70.2021.03.08.15.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 15:11:24 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Date: Mon,  8 Mar 2021 16:11:14 -0700
Message-Id: <20210308231117.12650-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.
    
Changes from v1 to v2:

o Split new instructions into different ARMCPRegInfo sections, and only
  add them if ID_AA64ISAR0.TLB indicates they're supported.
o Improve the performance of the new code in cputlb.c.

Testing:
  o Ran scripts/checkpatch.pl: functions in exec-all.h fail,
    but I think that's acceptable?
  o Built all targets
  o Ran test code that executed the new instructions
  o Ran "make test": a qtest-sparc repeatedly timed out,
    but that's unlikely to be due to my changes.

Rebecca Cran (3):
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      |  67 ++++
 include/exec/exec-all.h |  41 +++
 target/arm/cpu.h        |  11 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 323 ++++++++++++++++++++
 5 files changed, 443 insertions(+)

-- 
2.26.2


