Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C467F6C338F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:00:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecWo-0002sJ-7J; Tue, 21 Mar 2023 09:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pecWm-0002pk-9d
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:59:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pecWk-0000kd-D7
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:59:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o7so13797879wrg.5
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679407189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=61pZLnpOi/qdViF19dIzeKDPia4U2GhAlweboBBH0bI=;
 b=c+uGXf0V5snlkmnsuY78Uum+iLS2Wj5FLooqqPlfimOAMXxKCuTQzOxv5PGuhHXtcs
 YhRohVLDvx6+1eK+r15RUVn0RfOMAiyI+eWQFRbWzCjAY+fA8SqDMkDNgiC/Fd1luGhC
 7o8nG8Ggw7r95y/5T+DvhCb6J+LhTc2wxv4NHIcqccr1WixWs4uq6zw0TziAJUBA4Cq5
 ViNcYLpsTvX72KTGo6A/ShWuHNv/EnEofnzSBmEVY/+9jSkwlAKhrj50Lhi4ACaHPfNF
 B2UYYPT9151AHVX2yUWmcRyXm9+tKfrGvfrm6SZwm/mDGDQR+bfwGNqIOkApG4352FVi
 Wx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679407189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=61pZLnpOi/qdViF19dIzeKDPia4U2GhAlweboBBH0bI=;
 b=eIZ9JMJZYNyo6m+UQPbdqihnsfK5jG4ZHA9099VCrM0rHgIBInY7r3c1+Ab8EPjJJ/
 kT313m3ExU3erUlvTJsTrd/l/kvOPuk1IboA4ZySZZNYfJBFh4MHk/g3/MBf8AFlXn1S
 e0y8hQtC2FO9NmuzB5PI2AaEMgv3yBGW2rV3S0uj2Raj7HfScwZmVFbJ9fCfYRXYje5K
 YHTBGsfVYZnquI60bH6bx8lqUbwxG7Sr0T7+GW2R4+zfcjpSuL0Kr8s2pjAb/nVMv+bE
 +pX0Z0NbezRh1LcRIizr6fUe//Sjn1xChGmf/8uPBH+nvUOxwKGGIOSMfrDx743rIXeJ
 HTkA==
X-Gm-Message-State: AO0yUKXyxZt7m0d41rSl2m5XSO0g+twIHhIsvxTwCNjpqjV5gR/KLRZV
 neywIeAqaXcwW6NIBUE8tbH/NQ==
X-Google-Smtp-Source: AK7set8RzlclSShcXr2Qg8J2OuN+w4jpb4/2YHVwPs68BMEm0I9/eNq3HVJ1BAn9pQ7Ku+3LkfgGgQ==
X-Received: by 2002:adf:fec8:0:b0:2d5:39d:514f with SMTP id
 q8-20020adffec8000000b002d5039d514fmr2181650wrs.65.1679407188759; 
 Tue, 21 Mar 2023 06:59:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d684a000000b002d89e113691sm2356900wrw.52.2023.03.21.06.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:59:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E1651FFB7;
 Tue, 21 Mar 2023 13:59:48 +0000 (GMT)
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: vma-pthread unstable on aarch64 hardware
Date: Tue, 21 Mar 2023 13:59:48 +0000
Message-ID: <875yau6w8b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Date: Tue, 21 Mar 2023 13:48:20 +0000
User-agent: mu4e 1.9.22; emacs 29.0.60

Hi,

Chasing down some unstable check-tcg tests and I can get vma-pthread to
fail fairly reliably on the CI configuration ('../../configure'
'--enable-debug' '--static' '--disable-system' '--disable-pie') although
it seems to hold up on the default configuration ok.

  retry.py -n 30 -c -- ./qemu-aarch64 ./tests/tcg/aarch64-linux-user/vma-pt=
hread
  ...
  **
  ERROR:../../accel/tcg/cpu-exec.c:1019:cpu_exec_setjmp: assertion failed: =
(cpu =3D=3D current_cpu)
  Bail out! ERROR:../../accel/tcg/cpu-exec.c:1019:cpu_exec_setjmp: assertio=
n failed: (cpu =3D=3D current_cpu)
  ...
  Results summary:
  0: 29 times (96.67%), avg time 1.503 (0.00 varience/0.00 deviation)
  -5: 1 times (3.33%), avg time 0.252 (0.00 varience/0.00 deviation)
  Ran command 30 times, 29 passes

That said it might be responsible for some of the other tests that fail
when I do something like:

  cd tests/tcg/aarch64-linux-user/
  retry.py -n 30 --until -- make -f ../Makefile.target run

where I've seen random failures in float_convs, mte-1 and testthread
which make me wonder if this is some sort of toolchain/build config
issue?

Any ideas?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

