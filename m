Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7659D30043A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:32:57 +0100 (CET)
Received: from localhost ([::1]:37742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wYa-00038l-IY
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wW2-00021I-EY
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:30:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wVy-0004fR-UG
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611322211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8OIM286miPHP5nOXWXdJa07Pj6/hw2aFVkD/HVdU5o8=;
 b=a2bzqEkwrA9dDhJ/6gSFEFQGv4nLuXURGJjyCmHSH8ADHYNcg7AE5D2totkvL4jpXfVBvo
 pN4lcbAgdzIDgzlPOsk5p81AOUzdUv5FRW+s5+K8uOZTSeKkKm8CguKXdyziOw9mMAzH59
 UnIMXgmUVmbweXP7DFLtkb9s0KfDt1M=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-3-NbMpjgPny7kJPqyVxiFg-1; Fri, 22 Jan 2021 08:30:08 -0500
X-MC-Unique: 3-NbMpjgPny7kJPqyVxiFg-1
Received: by mail-ej1-f71.google.com with SMTP id n18so2180503ejc.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=igwzXdJu0UE4QyChI5266UzhbyDduaBfrK7oDELT1tw=;
 b=bwFYQ4trdnU2UdckpOSHMON5BSiKoPDe3loiN7a8NqkCuWcShlzEvAbii/1NuHU7Vf
 wxSub/qadvRFxZIZ0HaevjL7+kHDuTqdFJ6ivrQfu5CHTgYgXDOl3cT83n83OLFSfLas
 JDYZeT0UbnHRMabcBW+KJhz2fcmassyKbvXLAqu/odbt5lwtd8CGkEHsLkKX97rKsc5p
 K08DfxmNkG/6A/ThuXi6hjV8G0Dcymjr9wMpI3TudGK+fZBgrRBvqNBHnVUbkWolOlZP
 Jb6xGNNm3EJs+d2TrpF+REodFTUMF92LF/ZZf1hH/2X4oQNbo7HJ3i82vtqfnfJI/iCk
 yj5A==
X-Gm-Message-State: AOAM530uOT9Pz8EgMnq5lpZWW4gBG+XiWMd3Zn3UpdNGVznuVMIF3nc8
 uIyzwB7P+iFafBbVuaIX/Y7w4x3NHs6TMC8WCFu4zKW7fsklk8j59qVoMVp7q5hd9222MKEcj77
 NaahqjZSA362zXRnCcHPSAdthPH5l22DsYUfQiC/OFLrl6fQAKtXcSjHlog9uv2Eu
X-Received: by 2002:a05:6402:4d9:: with SMTP id
 n25mr3155209edw.111.1611322207171; 
 Fri, 22 Jan 2021 05:30:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXHhX9IT1CMMfZE9jpNtTQiGlDkhcvtksYEsQDGO/OfVK4cNujhQo0IaRyCSP5gFhElj/4xg==
X-Received: by 2002:a05:6402:4d9:: with SMTP id
 n25mr3155189edw.111.1611322206970; 
 Fri, 22 Jan 2021 05:30:06 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f20sm5238726edd.47.2021.01.22.05.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 05:30:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] meson: Try to clarify TCG / TCI options for new users
Date: Fri, 22 Jan 2021 14:30:00 +0100
Message-Id: <20210122133004.1913923-1-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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

Since v2:=0D
- Included Thomas suggestions=0D
=0D
Some new users get confused between 'TCG' and 'TCI' and enable=0D
TCI when TCG is better for they needs. Try to clarify it is=0D
better to not use TCI when native backend is available.=0D
=0D
Note, before Meson, warnings were summarized at the end of=0D
./configure. Now they are displayed earlier, and likely=0D
missed IMHO. No clue how to improve that :/=0D
=0D
Based-on: <20210121095616.1471869-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  meson: Explicit TCG backend used=0D
  meson: Warn when TCI is selected but TCG backend is available=0D
  configure: Improve TCI feature description=0D
  configure: Reword --enable-tcg-interpreter as --disable-native-tcg=0D
=0D
 configure   |  5 +++--=0D
 meson.build | 11 +++++++++--=0D
 2 files changed, 12 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


