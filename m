Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF73302674
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:49:04 +0100 (CET)
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43At-0004mS-CR
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l437f-0003qp-VS
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l437d-0002n3-Fd
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611585939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2IHNGZUBaAo9StI76N/uvNUvlwSnSwAveZj5OZStV7s=;
 b=MJHoZHHSuYd1zwpb4wXoVB564q7X5X3qQuHyYLKXSdr5w3Cs0KezwcKWgZqXaEExbUfBTs
 Xc5freRzOItj1Ks4UCu2zwnJgx9srjCP4dymg0UJdJbePrcryIlXPUMy/YM9MxNnC68jW/
 DkMlkYxaXUKxqQw6dHGKcx61yCI6wqo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-8pyhbmB8Oaq5cYK2Nqu1ZA-1; Mon, 25 Jan 2021 09:45:36 -0500
X-MC-Unique: 8pyhbmB8Oaq5cYK2Nqu1ZA-1
Received: by mail-ed1-f72.google.com with SMTP id a26so7581453edx.8
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSbENLTnkRVWIk5m3JYN1zNDEfHoE2NdZOJx2jEEJG8=;
 b=GHkM0AjyUDjNIH8MgBKBTzAuG4KzHeKPQulnhbtBp+gIiZIrTEwfz+p0mtdphDLfDm
 T6oQgMCJNeAM+QHKGw0VJX7TkO51uCcF5fT3XSOXkptUd+NeOSLqptIlwolLwB/O1ie2
 +iqqudpyP62axH64zPq22qanL+ivTCc0cK2iGA39C/TyfsBE6EViTQ6JHT1hWNnwBF8v
 u+P7ByaBzHv0OjY3vwaqUTZ+fsSqjPhoTS8LX4ZvacaZuIT3NE5Pa4/PF7leRJXyAuBA
 6js0/OHf+XiRgQmakJcUisgcQY3NBqWl+gAwGIwYTdYsoBnQhDYUd7BYanTxrx/kkLAr
 MyQg==
X-Gm-Message-State: AOAM530cqGcMumKVI0E7oJAszI1wo1TOMBWaGPur0s2Qabjpe/UDGOYC
 bDdzEfCe3uVVK8vHg+cZ4wSXgmTwIBIHBLDojC3miaq/Z9TeaAtRn3DVvAhDIy+c8xcNOKWF0dV
 pyJBmdgiloSOzzXFlps2WW4YIgeP9ZTxjKTlXTxWHz5FRgKblwPOszGq1DnoQZMCE
X-Received: by 2002:a17:906:4348:: with SMTP id
 z8mr577515ejm.371.1611585934507; 
 Mon, 25 Jan 2021 06:45:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3tleRftBvmN6Ot5HSoBOHC0P6Bo4R5vTv+VOBmvwXfyaW6wp2/g7yCpBHeUmZMgrEkGoPBw==
X-Received: by 2002:a17:906:4348:: with SMTP id
 z8mr577499ejm.371.1611585934316; 
 Mon, 25 Jan 2021 06:45:34 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a11sm2034758ejc.64.2021.01.25.06.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 06:45:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] meson: Try to clarify TCG / TCI options for new users
Date: Mon, 25 Jan 2021 15:45:26 +0100
Message-Id: <20210125144530.2837481-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v3:=0D
- Rebased=0D
- Include fix for 23a77b2d18b ("build-system: clean up TCG/TCI configury")=
=0D
- Use get_option() (Claudio)=0D
- Use warning message suggested by Daniel=0D
- Drop 'Reword --enable-tcg-interpreter as --disable-native-tcg' (Paolo)=0D
=0D
Some new users get confused between 'TCG' and 'TCI' and enable=0D
TCI when TCG is better for they needs. Try to clarify it is=0D
better to not use TCI when native backend is available.=0D
=0D
Note, before Meson, warnings were summarized at the end of=0D
./configure. Now they are displayed earlier, and likely=0D
missed IMHO. No clue how to improve that :/=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  configure: Improve TCI feature description=0D
  meson: Explicit TCG backend used=0D
  meson: Warn when TCI is selected but TCG backend is available=0D
=0D
Richard Henderson (1):=0D
  configure: Fix --enable-tcg-interpreter=0D
=0D
 configure   |  7 ++++---=0D
 meson.build | 15 +++++++++++++--=0D
 2 files changed, 17 insertions(+), 5 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


