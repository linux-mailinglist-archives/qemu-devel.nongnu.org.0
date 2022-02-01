Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369E84A5E74
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 15:41:09 +0100 (CET)
Received: from localhost ([::1]:33424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEuLD-0005KG-7u
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 09:41:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nErJM-0004mR-HL; Tue, 01 Feb 2022 06:27:01 -0500
Received: from [2a00:1450:4864:20::42f] (port=33640
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nErJL-0005qt-4z; Tue, 01 Feb 2022 06:27:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id e8so31423163wrc.0;
 Tue, 01 Feb 2022 03:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PZ35l7CjtV3WL2864kyY88nFmotZiBZ+szN38cxDcqI=;
 b=pGclzqloh9odis36NFV54ZlP1tHmlyJ4RkX75EN3kUih3f9mKX/jsF+OHR83ETuapn
 mAuoJRRKW2YOWEfjmCZx+xDZSrp48FKlvN252/mcDQhnaaqAziwHMMFVbQqv4UA+wYdu
 QTr1CAfPWiG1TJGVL8NJkcDAUYCG0dEoOwb7KO+sf9PaSia/V5KFoXxYttlbwGa2lIIV
 LZlTrUmOlKXSRY0DMoqADm6B6aAt8paZFCDsgrNFQ2NFFu55ffZp3sBWn7S/x4HdfwEH
 2RYQ9eklc/0gBgssXgXy1ixBpHqYb0uHmJO8+2x0K1iMEskkS41PEBfcqnwlCCuzrceo
 k5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PZ35l7CjtV3WL2864kyY88nFmotZiBZ+szN38cxDcqI=;
 b=pcrWPYa7E2JQfJHbmnHy79zWTrGGa+mMeZ6g+slchj8zb5fHgtkN9PdWEzACHVhRam
 Iynu9RxoqV7Ru9CDUtsfazyyBBzHeR8Nw000A6Vi5LURc5kDm/k80+6+4PYmJVqVAAKw
 iUxVW9LTvyvTDjPy1VjOzPD9npoYSAv7sZcr7FhIDMPcWRr4nBHEtiz1ZZJHnHDJnvXl
 k2DV1hkTZiiZmKin3k5CGhID+yVeBPkm+asrVxLfRKeGPGYwbdvUsbns0I0hxAeyPqOq
 vyFgZyrOlaKBDwg1T7DVeenww1Uox52LQ8cybgPofRlStp+OlJTcLJXcyTeBv4RS+FW8
 KfAw==
X-Gm-Message-State: AOAM533wW3Egy0RIrjXt8YBspJi+fAqgrCy6vRGP8h9sIcGAvWeqJONZ
 jGnU8C6fp/H1/NUPnK2XBBy05WMdldU=
X-Google-Smtp-Source: ABdhPJwDXF/rZzTry/rjf5PLwqTgo7cVt7rkdX/ezJN9mwn4V02SC9WtHEZiN0np2Q1HbeIPIixcUw==
X-Received: by 2002:a5d:4c81:: with SMTP id z1mr20952291wrs.568.1643714817262; 
 Tue, 01 Feb 2022 03:26:57 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 i13sm13206687wrf.3.2022.02.01.03.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:26:56 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Hanna Reitz <hreitz@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 0/2] block/export/fuse: Fix build failure on FreeBSD
Date: Tue,  1 Feb 2022 12:26:53 +0100
Message-Id: <20220201112655.344373-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Since v2:=0D
- Rearrange if-else-if ladder first (Kevin)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  block/export/fuse: Rearrange if-else-if ladder in fuse_fallocate()=0D
  block/export/fuse: Fix build failure on FreeBSD=0D
=0D
 block/export/fuse.c | 45 +++++++++++++++++++++++++--------------------=0D
 1 file changed, 25 insertions(+), 20 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

