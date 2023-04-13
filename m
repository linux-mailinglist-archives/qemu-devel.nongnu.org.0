Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154186E10A1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 17:09:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmyXv-00081J-6K; Thu, 13 Apr 2023 11:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmyXu-000812-0U
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:07:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmyXq-000543-S6
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:07:33 -0400
Received: by mail-wr1-x433.google.com with SMTP id o29so3445066wro.0
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681398447; x=1683990447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XXW6QJh6/JXb2dsz+rpzSbaUTSNXqu/MJHrT/IybeR4=;
 b=SJvt4LsrVnTjoomIDHejsmGeCozZqvwzjkeFn6RhDQeq80jLsR8Xp1giRDWCFOxnBw
 ho93WboSwogPNMlBmr57sE+Ct2soJ++VRIFUkpU+saa65MLetq491pGjYWhb5DqcPo6C
 cZ35EgmAMhUX/xCKHMEML/JP4KmSsY9h/CQvQsRsj5ndGBVFxZ46dNIvyw8FdcoKWTIp
 ZhBagMoTvYzyOaEldor50rEZmx37nWJC6PDLJZwA2qkfFy1CIH0E2MsUcqxgxYYiHioB
 DeDzYZ4iKvIDXknQJlh47ZBvfthcp2BdO0Db8u76DfTrYa/1dqlxssqCpSgg0SC+/ufu
 cYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681398447; x=1683990447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XXW6QJh6/JXb2dsz+rpzSbaUTSNXqu/MJHrT/IybeR4=;
 b=TTl/g40FFCqe0lIfMm3H8eLj5+8l09jt6sSwaRfw5QWraWhEmTcdpXdaGt4a/uBrJy
 aJGvAtGX0LX5KiNReYad/yB9089DAVKuo7p5U7SEPRujeofkLe+WXKhae2YzCmv2tcjY
 O6awlB/Kt53vTlhfmMpRhskBmTaelWOmu6AX0BK8NfxIYoXNDQ3J2aBfKWNCMRIi4uUJ
 ZEfp5nP6J8l7OfKKd2wBLn2PPto9beUxX4n7QqtFcFGGXpHdJjdzA2dAbC3c5Pwm/i0c
 5E68iVAnsmmFWMScGVW9Q/v7hCpX4M1wGfDbPHkW/cvIj7COovhDB/Ejf3Nl2Bm0lqCA
 ADdQ==
X-Gm-Message-State: AAQBX9dpW2I24Z70SvBBaDhw7OukTP9ifeC/v8YClqcqtvkS8N5dMAm0
 2d9tK0hud6yHWNeVUDvjRjdsMETKtWsOCEzzqT4=
X-Google-Smtp-Source: AKy350ZceUY12a0wH+nOzbvTadmyh8W9yGTRBQavw9/wZdVTBLvQKF6KRJ4mFsNn9Gkmwb5syrdpWA==
X-Received: by 2002:a5d:6d4c:0:b0:2f0:2d96:1c5a with SMTP id
 k12-20020a5d6d4c000000b002f02d961c5amr1698923wri.32.1681398446972; 
 Thu, 13 Apr 2023 08:07:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d5343000000b002c55521903bsm1484870wrv.51.2023.04.13.08.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 08:07:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 0/2] chardev/char-file: Allow setting input file on command
 line
Date: Thu, 13 Apr 2023 16:07:22 +0100
Message-Id: <20230413150724.404304-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Our 'file' chardev backend supports specifying both an
input and an output file, but only if you create it via
the QMP interface -- there is no command-line syntax
support for setting the input file. This patchset adds
an extra 'input-path' option to the chardev.

The specific use case I have is that I'd like to be able to
feed fuzzer reproducer input into qtest without having to use
'-qtest stdio' and put the input onto stdin. Being able to
use a file chardev like this:
 -chardev file,id=repro,path=/dev/null,input-path=repro.txt -qtest chardev:repro
means that stdio is free for use by gdb.

The first patch in the series fixes an assertion failure
in the qtest code if you try to pass it a named chardev;
the second patch adds the new option to the file backend.

thanks
-- PMM

Peter Maydell (2):
  qtest: Don't assert on "-qtest chardev:myid"
  chardev: Allow setting file chardev input file on the command line

 chardev/char-file.c |  8 ++++++++
 chardev/char.c      |  3 +++
 softmmu/qtest.c     |  2 +-
 qemu-options.hx     | 10 ++++++++--
 4 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.34.1


