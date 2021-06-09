Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676F3A16B2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:12:18 +0200 (CEST)
Received: from localhost ([::1]:50052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqywL-0006CP-5a
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqyuS-0003iJ-6Q
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:10:21 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqyuO-0006Kn-Hx
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:10:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id y7so21015060wrh.7
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6J9Ek/jmJQvJKuLPueaJ1YNh/Xr7n9nbcv1E4FDLkls=;
 b=KeiMi7szOaafqkuks1wiGi7PVBRIm49YnIAzQFFSAqTIRcAxYFEZZKKS8I5lR9M5RL
 72PSruTax/hhBKIzvt6JjDdFQInaqfvd9IYlWtBPN/tW++9hFwHbvNx3syXB8wiFly4J
 NYsz4iP9jKj0DKCE38DdQ515tYtZsrG4GoWc5bx+d4O3Td9gc4XKpSJZihCHomqKOk3a
 TiYSEI/VvH6E7EoIcVDumkZ1jL6lHPrgmI0OL1Ko/de03FysiZO2aRMZDh9XTWiozN88
 aFoWhW+hk9Dgph1yhbRWTcdmEJRANhy9DRDcsZkz1kthgkSsSsr1kdJNgHJFgYcn6Xzs
 Rs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6J9Ek/jmJQvJKuLPueaJ1YNh/Xr7n9nbcv1E4FDLkls=;
 b=l/9jHwi3i/jN67KMh2evUeEhYQIid/f0XMoUbeGyQTOnPmUK/6A3ooHz5EQRfCH/Ql
 v4SPp6gDl063pJEafjiNUpfmVsmuPF7m8wKUlNs+8T88IUcawc9nnFOp9q4mlfeVMq6u
 BdbmBZLqH7x50A6DepI6IvQhUpD0iHfb2zehvpstenrEgH5s0T+nt7SZMPYWZcxZflH/
 kTRM/JIOqeab/k3OigAYl84x1cAaA9TcnMM9Ab1muvgZmiY0BPhHEy4XkBzYauuu3Jg9
 PIu20k7uS/0pouE2bR+dWZ5U4BB6S3fhv4DkuOnm9/F4vbOVT/AnbudCaj4BR+w3XAvH
 FRpw==
X-Gm-Message-State: AOAM533kov+1fJjGEwEnX9F/AaAeytQHYUwp3kWLX91mmkCbvmaitiuZ
 w5KHgIpr9a24A4IoFUK5bqQ77yXG0/+GDQ==
X-Google-Smtp-Source: ABdhPJxmH5X2iswnAiMWHFoBXgmxj/4lbLSKGILpmjlhV3ycxzRNg6aLgUof6cCbnY+6Lt+KSOzd6A==
X-Received: by 2002:a5d:664c:: with SMTP id f12mr10292wrw.206.1623247812230;
 Wed, 09 Jun 2021 07:10:12 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id m65sm21728526wmm.19.2021.06.09.07.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 07:10:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/2] cputlb: implement load_helper_unaligned() for
 unaligned loads
Date: Wed,  9 Jun 2021 16:10:08 +0200
Message-Id: <20210609141010.1066750-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reposting Mark's patch:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg814227.html=0D
but split in 2 patches for easier review.=0D
=0D
Mark Cave-Ayland (1):=0D
  cputlb: implement load_helper_unaligned() for unaligned loads=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  accel/tcg/cputlb: Extract load_helper_unaligned() from load_helper()=0D
=0D
 accel/tcg/cputlb.c | 106 ++++++++++++++++++++++++++++++++++++---------=0D
 1 file changed, 85 insertions(+), 21 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

