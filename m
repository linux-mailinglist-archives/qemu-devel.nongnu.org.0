Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EFE1623C9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 10:46:14 +0100 (CET)
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3zSH-0003ex-Lj
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 04:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQK-000118-Lr
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:44:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQJ-0005oI-Ku
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:44:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34536
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQJ-0005o0-HO
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btZAH3Xrx0pyrx59uFmBzC/cYn5q/bWIwtOk/dCCUTM=;
 b=TyhAvfZFBAgxqPhmiH31tk0TpljK98uGmic+0mM4/Z8MEsTjx4MqS7IUfENNBTFqxUdMoE
 B2KqzWpIgh4SnFaUcVwYc+baYSnp8EwylCVtoLMX2gvsvXAC0WSW9++NP8ls1RlR5EcQs+
 KIP7OVYqu1GYfp91NcvdxNUHeWxI0Us=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-jirusWv-NaC87Z7BBY7R6Q-1; Tue, 18 Feb 2020 04:44:09 -0500
Received: by mail-wr1-f69.google.com with SMTP id o9so10555217wrw.14
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 01:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOzWP1vq62G/ytTmsfycrX2X8S1L1HhF+6M2xyNPCUI=;
 b=uRWmJMaJymH6C6YaLqABsZCa/RkWXNPEQlkZ1lTipLFGn06bra/X2TsJLiMTgDvy1K
 MnLsOkWHOOhmvXwBs8DeKYaelYI2VQTX3IoYy9uwuU1X3jZNm+yzc2+g9TMRrwgefwyJ
 udMk8qLnU5S6MnJTzSFtYAuAkRNzVtoZXtL3ovjE/1i0yeGvp4ULbduZrj+C44a9KZQI
 jdLL1zzBW8mWvMro3tj2xbtn0/Gk4AQBHWcSd40Pkglk9IM4lgJksIJvltyAlKQpjc04
 6V6RL5n/Z1F/vK6lm9FqFjRSqgt2PprTJudZI/yEnxaUSKEt/1kztxb8OKUYxQYaKkeG
 SVgA==
X-Gm-Message-State: APjAAAWf10J0pYhD3TuLrTOFNmBFe7MotZ3NN+FhF1UAs6Rv53Wx5hOs
 c5p3eamQvyBZmDAeDh16JgeLki5r92aA44NQtCCevN49g4/3HU2i9F28VT/7Xa4Oo7yWolarMZ6
 fB0ob8lZ+YJCDLRQ=
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr29455585wrt.271.1582019047889; 
 Tue, 18 Feb 2020 01:44:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXex4vto7lSeGOFbORf+sCSg5xUWpiaGjzs6/mdvqQsy3YvYopDH4Mp9VdIz25S+VFHYwaLg==
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr29455545wrt.271.1582019047665; 
 Tue, 18 Feb 2020 01:44:07 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 01/13] scripts/checkpatch.pl: Detect superfluous
 semicolon in C code
Date: Tue, 18 Feb 2020 10:43:50 +0100
Message-Id: <20200218094402.26625-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: jirusWv-NaC87Z7BBY7R6Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Display error when a commit contains superfluous semicolon:

  $ git show 6663a0a3376 | scripts/checkpatch.pl -q -
  ERROR: superfluous trailing semicolon
  #276: FILE: block/io_uring.c:186:
  +                ret =3D -ENOSPC;;
  total: 1 errors, 1 warnings, 485 lines checked

Reported-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/checkpatch.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ce43a306f8..11512a8a09 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1830,6 +1830,11 @@ sub process {
 =09=09=09ERROR("suspicious ; after while (0)\n" . $herecurr);
 =09=09}
=20
+# Check superfluous trailing ';'
+=09=09if ($line =3D~ /;;$/) {
+=09=09=09ERROR("superfluous trailing semicolon\n" . $herecurr);
+=09=09}
+
 # Check relative indent for conditionals and blocks.
 =09=09if ($line =3D~ /\b(?:(?:if|while|for)\s*\(|do\b)/ && $line !~ /^.\s*=
#/ && $line !~ /\}\s*while\s*/) {
 =09=09=09my ($s, $c) =3D ($stat, $cond);
--=20
2.21.1


