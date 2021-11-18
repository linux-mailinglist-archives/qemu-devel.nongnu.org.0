Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF47455B42
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 13:10:20 +0100 (CET)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mngF6-00042n-Ob
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 07:10:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngBk-0001d6-8V
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:06:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngBg-00040i-Jh
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637237200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2nbKYIyyjyXzQWT984PNGWxzqRyVHb+JtaRPE7rlcgI=;
 b=XqpocqP2OM/ut9KF/kJdYzSGqmtv/ph9MZcTQH3DVC45FpTNFQ0Mx2MvLSBt6xyO5Muhy1
 VQa87TthMoVuQX3F5CvcGqQlltC93IvNUJqPBUBp173Cb8iDF84TsIFAq2J8dDrNdIGNgK
 1BQIAAToVpexeubi9+NBNVi7zouCEQA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-AAEWEWTUMr2rpeTEUUrL9Q-1; Thu, 18 Nov 2021 07:06:39 -0500
X-MC-Unique: AAEWEWTUMr2rpeTEUUrL9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so2989668wmq.9
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 04:06:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fyYauTP3DLqqw/tUZRA8g5AATc8JYgijTThtiuAXaxc=;
 b=a1MmrF77Dp2MtvuYNSPWWaE7iY6Dlgj3M9IT7DAK2vygTjfssEP0rCGqux7ZmGYhtY
 0o8GLA+ZiDAhsHKmGgIiWFGFvJMV0yowOvrcNWmYvXNSHy4vIhMblmJN2azUYhqoc0qM
 BrOZxq7mc4n8YhU9oAW5f2iT+uLVZgoRe7FqqKYKPC5GHZsrIL699aWe2MtK9tBTs0mD
 odeqaf95Zo3qjuyTx3lcB3avebJCSb7K/x/VoZWiCbGhDWyg6tnTqpADOTVfVWeFUpT0
 RvAA/a2tPEZRki10c9zMOVXfJxx7TY020l49STrOXHq7vStE+yNfVPyW0vKuW9B2H4mm
 S8sw==
X-Gm-Message-State: AOAM5314zzPmBgxOur6AZX4X/r+imZ75TCnE6hnk0cclCDpkN2bkVwzF
 iV70iwpqIpi2Q5SoaWNvvlQgurKDPHhbKjp9laTL1KA+axt/BYVaimeKJ5anhTTdrsLLsCQQQGm
 YelPRgqwz//Dnk9IbnRnj7MVIKRQiVEESCbch+0P70iCoejj8ysNUF5FJiz9UVPz1
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr30216101wri.241.1637237198439; 
 Thu, 18 Nov 2021 04:06:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8oe7NXcl1LuSxbOlcHf10a33TM92X03Hihe/IANTJAhcu0EEsauf+fRb9N2qQrIE+ahWGcg==
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr30216011wri.241.1637237197954; 
 Thu, 18 Nov 2021 04:06:37 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l22sm2732048wmp.34.2021.11.18.04.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 04:06:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 0/2] hw/block/fdc: Fix CVE-2021-20196
Date: Thu, 18 Nov 2021 13:06:33 +0100
Message-Id: <20211118120635.4043197-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not sure what happened to v1 from Prasad, so since we are=0D
at rc2 I took a simpler approach to fix this CVE: create an=0D
empty drive to satisfy the BlockBackend API calls.=0D
=0D
Added Alexander's reproducer along.=0D
=0D
Since v2:=0D
- Reword comment (Darren)=0D
- Add Darren R-b tag=0D
=0D
v2: https://lore.kernel.org/qemu-devel/20211117232422.1026411-1-philmd@redh=
at.com/=0D
v1: https://lore.kernel.org/qemu-devel/20210123100345.642933-1-ppandit@redh=
at.com/=0D
Based-on: <20211118115733.4038610-1-philmd@redhat.com>=0D
=0D
Alexander Bulekov (1):=0D
  tests/qtest/fdc-test: Add a regression test for CVE-2021-20196=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196=0D
=0D
 hw/block/fdc.c         | 14 +++++++++++++-=0D
 tests/qtest/fdc-test.c | 21 +++++++++++++++++++++=0D
 2 files changed, 34 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


