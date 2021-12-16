Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15B847730F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:24:04 +0100 (CET)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqjr-0000Kj-J1
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:24:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgR-0006ev-FH
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:20:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqgP-0008EI-1P
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639660828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VJ7YOUjdlkzlcNRbhLkMCwWwZMCHFg71MNYomo0s7g4=;
 b=ab7oArBNUOl+OyOXs3gahToLpuz1puWUqHyVZke1SlO5jRHJVDHKwRcjym4dglvnN9X/S4
 ZC1qK3Uiqon5c98V2FGH5ssRriLZ28lBbs3EKIjdhQ8mXO77ax3l/QY1xqkvHWm0NUfbYT
 3bU7a4lfPE5Kc22iu0fCDEUr4brAj9c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-VOSiDwpLOcu6jBEwXzB4Kw-1; Thu, 16 Dec 2021 08:20:27 -0500
X-MC-Unique: VOSiDwpLOcu6jBEwXzB4Kw-1
Received: by mail-wm1-f72.google.com with SMTP id
 z199-20020a1c7ed0000000b003456affcffaso1272870wmc.2
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPHqi2XWfNb0OMkEfV5JfcbdcAojSbcSN1Tsill8YPI=;
 b=gwcZqhFmVsdmS6PhgGQ+1Ae0q4Cpy0eeZnk1+JlLPA+ih5B0EOCSNTJL98g5CA8Qiz
 rZ9ltt2ORGLfhtwsQE0xV3elZXCYgr/hzjTw0Cdj5NPlLixwyruvJ7S2tJjg3sVPdcin
 fe/p17n2aEM3/UoJoinEllvHh273dBWb1vsAcvSZ/yBRKfCB2X7SaGCg+mTGOHtyHZUX
 QglWN9aqRyxXSBSMXwHZ3k+JWEjNXaRu90PTEudT2eIUTV7Qdc6PF/i1hD1579vsEfsG
 hGnRuR4KEHG64FnYH8CUwU1AWEZVSOCHkaIZXGEJrsfPeCXLkNY5XUALOU52QLVWyR3s
 v0lQ==
X-Gm-Message-State: AOAM530mjCY5fOwjSNXgAKQj7GHOyopxw4OuWskNFiLyLeh4Cspd25V+
 BVEYUSC0+eEBK6MEeCAli4Uha9/y8ttaDHXNBKvBqJU2wBv3r/zqEaC0xSN0sjUeGo/qIbbYDiQ
 wzvKtdBAfh+0fU+fLvZ7asOqalRDTRbMw4mCIPuBZUQoYRFxE4VyFWXvs5ZTPddBD
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr807273wmh.150.1639660825724; 
 Thu, 16 Dec 2021 05:20:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMndlGAkDhMkr/FzqlN0wq0wyPQdKkHDBs7i71i2ns3kTtfQPu3W1qThC4bbxR31zwr+mFNA==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr807258wmh.150.1639660825478; 
 Thu, 16 Dec 2021 05:20:25 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l9sm5750104wrs.101.2021.12.16.05.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:20:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/8] tests/unit: Rework test-smp-parse tests
Date: Thu, 16 Dec 2021 14:20:07 +0100
Message-Id: <20211216132015.815493-1-philmd@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v5:=0D
- Adapt test class names (Yanan Wang)=0D
=0D
Since v4:=0D
- Rebase (skipping merged patches)=0D
- Renamed tests (Yanan Wang)=0D
=0D
Since v2:=0D
- Restore 'dies_supported' field in test_with_dies (Yanan)=0D
- Add R-b tags=0D
- QOM-ify the TYPE_MACHINE classes=0D
=0D
Supersedes: <20211115145900.2531865-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  tests/unit/test-smp-parse: Pass machine type as argument to tests=0D
  tests/unit/test-smp-parse: Split the 'generic' test in valid / invalid=0D
  tests/unit/test-smp-parse: Add 'smp-with-dies' machine type=0D
  tests/unit/test-smp-parse: Add 'smp-generic-invalid' machine type=0D
  tests/unit/test-smp-parse: Add 'smp-generic-valid' machine type=0D
  tests/unit/test-smp-parse: Simplify pointer to compound literal use=0D
  tests/unit/test-smp-parse: Constify some pointer/struct=0D
  hw/core: Rename smp_parse() -> machine_parse_smp_config()=0D
=0D
 include/hw/boards.h         |   3 +-=0D
 hw/core/machine-smp.c       |   6 +-=0D
 hw/core/machine.c           |   2 +-=0D
 tests/unit/test-smp-parse.c | 181 +++++++++++++++++++++++-------------=0D
 4 files changed, 121 insertions(+), 71 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


