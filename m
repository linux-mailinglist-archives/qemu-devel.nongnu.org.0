Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646A62FE6E0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:58:03 +0100 (CET)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Wj4-0003Wa-ET
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WhZ-000296-6y
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:56:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WhW-0007Zp-3f
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611222984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W5Ty40QWAHzUbJleObSE3w7YcSWp87+oyoR4/ojctVw=;
 b=WZw8o1sBPjhMevvoYSWMxCNdFXHIs4kbqEscV1wE8Ci3OyYq9+ZQmC2pkA4ZM9UXFtnboD
 /8EevpjtcqIj8y5lh2V3fFOagtImkcXx9fcUW5QDqUKzbYra2Un+KMeNwGrupGORtfEkOQ
 Y4I/gfywxMy+AfF2sLkoIegcyT1FNb8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-uVDLCMG8OIq-sKm137oMNg-1; Thu, 21 Jan 2021 04:56:20 -0500
X-MC-Unique: uVDLCMG8OIq-sKm137oMNg-1
Received: by mail-ej1-f71.google.com with SMTP id rl8so546044ejb.8
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ftS1PwDRTyx/FO3pQ0ndMWJudnzwg5kLTGGeH9RyLrU=;
 b=hUXh2D75JK+ZBml3Gq+zYETK5WpQkVYA0tsLvcNWgrjnzEfPV4nA2ehBlf6zI7Z9Mx
 fkhEu7+vyPzjTf32OWA1bWI9JZyw10ShLIGkiiBZ0xCgAi6JmNVP3iewl/ekNbp6m87g
 uBgwSv0Fu/fbwoAlM1BN9UhUj7u20toikbOlNWgjLBlkPw4sEgP7X4L92cM7tSzDlcEp
 zQTJ/sfpIJKj3+9MwgHZy/SXxkPtc8l0JeajmAVP0paSKvpLrrBC9q3fPebPvoubbLmI
 jEjjdCaH4CnGIo+QZ1oOGlGqdAe6S+annwATVXZ/lWxVy8gAxgGALDs+VWiJOdTxVgiG
 IR5Q==
X-Gm-Message-State: AOAM531CHcENxEv3IXkS9z4PrMGh874h1rJLU+zq/7iR58+TlYFND77M
 pFuG4+3m4nyCZtxK3eyKqzzi3/IRzS4Bod1A6icOkVgEg9QrHHwrZp7dH+pt9ZI5Q+mi42IZSyu
 UqAuaJHXHRsPBo3+9t/lbunT2VJUZQcXTQXAxw50NLnu5AHhFfTU8m6qbm5zfKoyY
X-Received: by 2002:a17:907:7356:: with SMTP id
 dq22mr8789842ejc.318.1611222978664; 
 Thu, 21 Jan 2021 01:56:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgafDmSqUdgqKEEfvf0mtEtat52vZmiV9eGwTRUFVXcx6rSSZiR7tuRu2/LO6kqTcQVXFsdg==
X-Received: by 2002:a17:907:7356:: with SMTP id
 dq22mr8789834ejc.318.1611222978460; 
 Thu, 21 Jan 2021 01:56:18 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a11sm2465776edt.26.2021.01.21.01.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 01:56:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] meson: Clarify summary
Date: Thu, 21 Jan 2021 10:56:08 +0100
Message-Id: <20210121095616.1471869-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reorder stuffs in summary to quicker understand bug reports.=0D
=0D
Remove information from deselected features when not necessary.=0D
=0D
Since v2:=0D
- integrate Paolo's summary sections=0D
- simpler sort=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  meson: Summarize information related to directories first=0D
  meson: Display host binaries information altogether=0D
  meson: Summarize overall features altogether=0D
  meson: Summarize compilation-related information altogether=0D
  meson: Display accelerators and selected targets altogether=0D
  meson: Display block layer information altogether=0D
  meson: Display cryto-related information altogether=0D
  meson: Display library dependencies altogether=0D
=0D
 meson.build | 295 ++++++++++++++++++++++++++++++----------------------=0D
 1 file changed, 171 insertions(+), 124 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


