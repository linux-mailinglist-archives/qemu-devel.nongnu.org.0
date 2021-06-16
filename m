Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C9E3AA155
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:30:53 +0200 (CEST)
Received: from localhost ([::1]:42734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYRH-0001VS-0N
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJF-0008Ut-DE
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJC-000214-6e
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623860549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z5BMsGRnwxabhI5oTMOwAF5S8mvyAIX/FXP5Uc1bOaU=;
 b=Ty29hM8qzZ63RYNe1PU++MAHuOntsowAqR2hrwHB/KX552llZm7iIVRRZ1+9vcBmN68hpH
 jtCWRki0smCF7jdCDdToWVzirILRZpKa+gGEjjE9F2c3sziUxMEXYfhTPwIXt6N/oS0Yx1
 ldWH7mkRAGXhs3paQOMulZ7tEr132A0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-zoBWiwtePfmatelN5R2zNQ-1; Wed, 16 Jun 2021 12:22:28 -0400
X-MC-Unique: zoBWiwtePfmatelN5R2zNQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z62-20020a1c65410000b0290179bd585ef9so306174wmb.7
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nj5NxzCzmFdf14G3sBX51zObysyZeqlo2q5ZWaJVo58=;
 b=nqpi9a7TIl9s2Q/ap+bAlAPHEJ5uUelMYjw91GuJhaFwB22dOlBQXWPRrjHHqzGI6v
 oFkFPWx/bSqHLRfDPEMTt/KXgTUjuAmZREkXgDYJktYXOlFHXcMxjJyeM53so37mjNZP
 UuEyMn/jkrT2BUrdIwuLW16kTnnjGUQerb2Jpy6/ITnCB3N7u92uYYzCcnlu00U1HIW0
 6zHBBk+0NNx55BI7Bh7DCDMOuo0MSkxlxtYkq3sfAklBE77mvc4vNax0jFwFFqFAUqn5
 3o4n2hqPkYhj9C9HMPFfUuBEKth3X/+PBUscPh0sgO4SJbtteOh162e20sE3YBjV62Jy
 iuug==
X-Gm-Message-State: AOAM531uMiOxHO/OoRWGOTjbBZPFulBFQjVPLbG2mP8jIfZMpczbuU59
 uaSJhXvUkTPuwCItmnSnI46ZjlpXpADEihhF76nNGtZyl53bbrMQXWOUvCcEiqnSL8oEe7fdeEU
 E3IeaNHuEJ/s1dH3QrWXiU6f/KdAkc95oilSCIwADJjq8FL1I2wdAd7geqhDRxVZ2
X-Received: by 2002:adf:d204:: with SMTP id j4mr266621wrh.3.1623860547027;
 Wed, 16 Jun 2021 09:22:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK7C8+jc9nM8x8Srj39/DSk6V3noUbvRQAaxyOMO3WhYZVN1ozqsawoMsJA1xbyeFbtkMj9Q==
X-Received: by 2002:adf:d204:: with SMTP id j4mr266592wrh.3.1623860546772;
 Wed, 16 Jun 2021 09:22:26 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n9sm2265874wmc.20.2021.06.16.09.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:22:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] crypto: Make QCryptoTLSCreds* structures private
Date: Wed, 16 Jun 2021 18:22:18 +0200
Message-Id: <20210616162225.2517463-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow Daniel suggestion to simplify qcrypto TLS implementations,=0D
aiming to solve the OSX build failure.=0D
=0D
Since v3:=0D
- Added missing @errp docstring description=0D
=0D
Since v2:=0D
- Add Error* argument (Daniel)=0D
- Move structure definitions to "tlscredspriv.h"=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  crypto/tlscreds: Introduce qcrypto_tls_creds_check_endpoint() helper=0D
  block/nbd: Use qcrypto_tls_creds_check_endpoint()=0D
  chardev/socket: Use qcrypto_tls_creds_check_endpoint()=0D
  migration/tls: Use qcrypto_tls_creds_check_endpoint()=0D
  crypto/tlssession: Introduce qcrypto_tls_creds_check_endpoint() helper=0D
  ui/vnc: Use qcrypto_tls_session_check_role()=0D
  crypto: Make QCryptoTLSCreds* structures private=0D
=0D
 crypto/tlscredspriv.h              | 45 ++++++++++++++++++++++++++++++=0D
 include/crypto/tls-cipher-suites.h |  6 ----=0D
 include/crypto/tlscreds.h          | 30 ++++++++++----------=0D
 include/crypto/tlscredsanon.h      | 12 --------=0D
 include/crypto/tlscredspsk.h       | 12 --------=0D
 include/crypto/tlscredsx509.h      | 10 -------=0D
 include/crypto/tlssession.h        | 15 ++++++++++=0D
 block/nbd.c                        |  6 ++--=0D
 blockdev-nbd.c                     |  6 ++--=0D
 chardev/char-socket.c              | 18 ++++--------=0D
 crypto/tls-cipher-suites.c         |  7 +++++=0D
 crypto/tlscreds.c                  | 12 ++++++++=0D
 crypto/tlscredsanon.c              |  2 ++=0D
 crypto/tlscredspsk.c               |  2 ++=0D
 crypto/tlscredsx509.c              |  1 +=0D
 crypto/tlssession.c                |  8 ++++++=0D
 migration/tls.c                    |  6 +---=0D
 ui/vnc.c                           |  6 ++--=0D
 18 files changed, 122 insertions(+), 82 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


