Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6853A8780
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:29:11 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCsA-0006UR-N4
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCqx-00042H-Ib
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:27:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCqt-0003e8-0w
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TiKa64h/Tq9kBDpNxq21iKYn6Y0/i6k9DguvVObXjbs=;
 b=Wlk3uoSh+qArlmW0zXg9w+uBTj6QboOPRNVWqGFT7ncYSPpgJQHzOeMJQ+4gda+v/NyI9g
 oZ8kFe1LZYB95rKUnZ0hIJBLWh7NXHkwT6p77300fVZKRiD/3EmUwpSDA3R/kZ8rjqRsss
 +rJT7+XrCLVMV4ZlIAxssQFCjZPRAmI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-P_gdKJtdMHuGBkeIk6_dhQ-1; Tue, 15 Jun 2021 13:27:49 -0400
X-MC-Unique: P_gdKJtdMHuGBkeIk6_dhQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 a25-20020a7bc1d90000b029019dd2ac7025so50964wmj.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FiwMfkcXgRbnG3bNZTcJOIFQ21JmpOTccMNjrR33TA4=;
 b=jVPPA5e0fiinCtiIzDcKReC6h3GUUT2yqX6fu77MBJpJuJeQUy5P1N2RCzII5126oP
 ASc+9LT9j4Es5arPkGhuXayoEG3wK3ps33duipOaE4+0pIYweOAsqCjiK06T94e4eoHU
 EOcHCp50vzC/HnvlPBK0Hrt4FiMxNNIb9l1CogJQ/4rXJoGG7F2ltsmh/0sthPVf6xHn
 7twCk69T6zTLvPS/bEhdkNkIZ+KAjHASpRDBqN0vNt62b7KNoxGqd/gikR5wOyj3sPho
 GXwUo8gwmd1bdPRviMXxNlbxhMFvm9gPlSd9DQRAMPzQ4FfIgJ+0AfWsU8Srj8XgTugi
 ZWEA==
X-Gm-Message-State: AOAM532FrwrxJCe5p7xffeox2q8QvwpPkbx/fK1aMtKYrTzVSYmV2U5T
 4aPnQBKlOORFPS4r3ET+iSaEUBcJFxUOWCw5EJMyl5Iwft+WQ/YP0+Xjr6/Blc+PsR6siWsQbnP
 3N/J21RNztB7UOnaMJmWiUyNosKe2FK7pJqGkeU3N7DU6zHsMw+3XiR0NfzuYY5St
X-Received: by 2002:a7b:c346:: with SMTP id l6mr380138wmj.109.1623778067984;
 Tue, 15 Jun 2021 10:27:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKYmTG3Ce6CMwO8SYzR1Hdjsb4s9d0zmSw8LdILesVi+KZOo8NwkVKbDdowtS8ZBQnD1iNUA==
X-Received: by 2002:a7b:c346:: with SMTP id l6mr380114wmj.109.1623778067782;
 Tue, 15 Jun 2021 10:27:47 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m21sm2592971wms.42.2021.06.15.10.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:27:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] crypto: Make QCryptoTLSCreds* structures private
Date: Tue, 15 Jun 2021 19:27:39 +0200
Message-Id: <20210615172746.2212998-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Leonardo Bras <leobras.c@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow Daniel suggestion to simplify qcrypto TLS implementations,=0D
aiming to solve the OSX build failure.=0D
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
 include/crypto/tlscreds.h          | 29 +++++++++----------=0D
 include/crypto/tlscredsanon.h      | 12 --------=0D
 include/crypto/tlscredspsk.h       | 12 --------=0D
 include/crypto/tlscredsx509.h      | 10 -------=0D
 include/crypto/tlssession.h        | 14 ++++++++++=0D
 block/nbd.c                        |  6 ++--=0D
 blockdev-nbd.c                     |  6 ++--=0D
 chardev/char-socket.c              | 18 ++++--------=0D
 crypto/tls-cipher-suites.c         |  7 +++++=0D
 crypto/tlscreds.c                  | 12 ++++++++=0D
 crypto/tlscredsanon.c              |  3 +-=0D
 crypto/tlscredspsk.c               |  3 +-=0D
 crypto/tlscredsx509.c              |  4 +--=0D
 crypto/tlssession.c                |  8 ++++++=0D
 migration/tls.c                    |  6 +---=0D
 ui/vnc.c                           |  6 ++--=0D
 18 files changed, 120 insertions(+), 87 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


