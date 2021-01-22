Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8016F3000F6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:00:36 +0100 (CET)
Received: from localhost ([::1]:32914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uB9-00083L-FG
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2u9P-0006yw-9L
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:58:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2u9N-0003hE-1K
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611313123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8OIM286miPHP5nOXWXdJa07Pj6/hw2aFVkD/HVdU5o8=;
 b=BjbEgMKDAhuHpsE6+S74oopPp2DycBKF1zdWZXkaP6X7caCUerZWGu8MWvFped7yn3bDgE
 fvpkX/LNlU3pLSQP/txeg+FPZHEY7LM1gYC652/xtEzEu9p5G2aUEW8z+Y5VDMjA9J+sak
 c+rSSSRDb3jJqiwoDFZVI6geA9URz9o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-YVZcLYcpPfijOIjggyCJBw-1; Fri, 22 Jan 2021 05:58:40 -0500
X-MC-Unique: YVZcLYcpPfijOIjggyCJBw-1
Received: by mail-ed1-f69.google.com with SMTP id j11so1968223edy.20
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=igwzXdJu0UE4QyChI5266UzhbyDduaBfrK7oDELT1tw=;
 b=WZZp0kv4EaW1cbtwCiwgyGG5HxRus9Z2/w4DQM7AVELXBgOCJanNR35uNBXVcpfNWD
 /6KBJiS42b1li8J9qqowCMCeZfbqqkwVYHyXDZ9gfhilIFU3FtUOmUu//vLV80H1YJ45
 7qAF5AdtP0OTx5U9XgaeWD2645jlvII5+YiJObLLPcIVKLPrFcDyTqhfbYhhwLe93Mix
 nxgoVE0y4zR5IW7tcghBLIf8PCQcd1RvZKUdnl+5CdmOim0tQIpgKlkI7/5vP6VA8pZn
 sPide+OiEX90w+exRj3H0jPqDnqF4/IQVoOcXu+nGpTe3PNi2UkQ6y7FgJgvvmLnuinb
 XNGQ==
X-Gm-Message-State: AOAM53211tDmHF1QhjJHqfL9pHimCaOCPb3/vK8F1K2xF1t7c9RFveIt
 q47sOxJ1jbVtaU7lUs+ud00QSlDDPj0hN+8nIQdqW7jdxPDBNo+chi1lsdXhQRq7BcUW8QPp6Pb
 PYRHObD0CAtohP0325ViHOsWtKFmB3Y3umWidZKcJWoEoFaI9k88fz/P+2HbH/mf+
X-Received: by 2002:a17:906:a1c5:: with SMTP id
 bx5mr2678819ejb.284.1611313118913; 
 Fri, 22 Jan 2021 02:58:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+XSSY5JfmaF65rohzM2unW4rtEQ+s1riSEmfpGRP6ckSYDRxStDSAnXQu034saXnFDkiQNA==
X-Received: by 2002:a17:906:a1c5:: with SMTP id
 bx5mr2678805ejb.284.1611313118645; 
 Fri, 22 Jan 2021 02:58:38 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id zg24sm4175048ejb.120.2021.01.22.02.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 02:58:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] meson: Try to clarify TCG / TCI options for new users
Date: Fri, 22 Jan 2021 11:58:32 +0100
Message-Id: <20210122105836.1878506-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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


