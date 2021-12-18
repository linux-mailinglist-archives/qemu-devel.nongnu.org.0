Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A17C479BB2
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 17:11:26 +0100 (CET)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mycIv-0002iu-1X
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 11:11:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mycH1-0001K9-Ia
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mycGy-0001E1-Ln
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639843763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=38EeRGy7Bn7dlaAR4wNLZ4ttKoEzxtIvok+VDIsUDQY=;
 b=MWN1PduyqBFMehvpjzcpBlUo7/f2jk/wlBW1AlbB+8+7MUuK9yoThXQwqD+xy/wX7tQ04D
 NCEKheyEyELZmR0FewswCgqWqxejxvepK/IvuaWde/dM9U7qPAp0JTWX8eWM5pkl7uIuFV
 SsC+PN9FVfjO/royCmI0MgGZN2xGIsY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-UOrz5M38N8SyHzejiPPcTQ-1; Sat, 18 Dec 2021 11:09:17 -0500
X-MC-Unique: UOrz5M38N8SyHzejiPPcTQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i15-20020a05600c354f00b0034566ac865bso2535011wmq.6
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 08:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V5oO3vvuy0KpnL/6kODQtRXeTRCF5soj8esL5ek/PtM=;
 b=NguMHAoYXpHpJTTZocy/Kew/o4yB1QM7JM3GRpVeytQ/UdcIbmGukN3ALggF6UDFic
 WaFfHY5FPnVehSI8uEFotqRsUdLyI3akk+8nbQDKhFz2MgnR/hhHQZKtxjYB6XdL6XSd
 q7eSJzpqXe/aWClImVepkv46puBIbQ0SQrkqG1Urf5/M1ldI8QQ+7Z+84rxPrg4ass4q
 ppJVwymEEtcYnsKoTZAbthDyE+NZGh+YbeSrNyEn6xqVPiVTrLQrLdTuRC8VMzHICZ5d
 0qXKOkikpw++IX+Il53fFQtgYwC6eGdoIF4DTodWaV2f8HL56dtwtX51I+ccrvWB7Nul
 BCEw==
X-Gm-Message-State: AOAM5300uBZBP6OdLBsPp2tUX1mL2y4iyhPY5B8amZHtxQnklPkzgNau
 x4BMymQTSKGlLfqXmzwuo7k5/KfkmO/tszXNDik3LKhj9oHZ0Jz5bAQmvmMz94lTNdHUFa442Od
 7ZoJrN6LdbVeE3K/Tu3dsbgghD6h1Ric7XO/VurmaGIciT/jHXBOXt1sHvgvOpcPO
X-Received: by 2002:adf:dbc3:: with SMTP id e3mr4861300wrj.150.1639843755965; 
 Sat, 18 Dec 2021 08:09:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUS4SHVEwH3qfKMU97eknmKiL7rP2oiQ4EaUAN+Oy5hJHD6FlRms5Zi0pFZ5KEdX8mJP86Fg==
X-Received: by 2002:adf:dbc3:: with SMTP id e3mr4861278wrj.150.1639843755732; 
 Sat, 18 Dec 2021 08:09:15 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id e12sm13281139wrq.20.2021.12.18.08.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 08:09:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/3] hw/audio/intel-hda: Restrict DMA engine to memories
 (non-MMIO devices)
Date: Sat, 18 Dec 2021 17:09:09 +0100
Message-Id: <20211218160912.1591633-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Martin Schrodt <martin@schrodt.org>,
 Thomas Huth <thuth@redhat.com>,
 Gianluca Gabruelli <gianluca.gabrielli@suse.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Li Qiang <liq3ea@gmail.com>, Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Jon Maloy <jmaloy@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, crazybyte@protonmail.com,
 Matt Parker <mtparkr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An attempt to fix the Intel HDA DMA reentrancy problem by=0D
restricting the DMA engine to memories, and reporting invalid=0D
I/O region accesses as overruns.=0D
=0D
Based-on: <20211218151053.1545962-1-philmd@redhat.com>=0D
"hw: Have DMA API take MemTxAttrs arg & propagate MemTxResult (part 4)"=0D
https://lore.kernel.org/qemu-devel/20211218151053.1545962-1-philmd@redhat.c=
om/=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/audio/intel-hda: Do not ignore DMA overrun errors=0D
  hw/audio/intel-hda: Restrict DMA engine to memories (not MMIO devices)=0D
  tests/qtest/intel-hda-test: Add reproducer for issue #542=0D
=0D
 hw/audio/intel-hda.c         | 11 ++++++++---=0D
 tests/qtest/intel-hda-test.c | 34 ++++++++++++++++++++++++++++++++++=0D
 2 files changed, 42 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


