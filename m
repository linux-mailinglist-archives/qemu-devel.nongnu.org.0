Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B868E17D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:50:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTyu-0006d0-Ks; Tue, 07 Feb 2023 14:50:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPTys-0006cR-8G
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:50:18 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPTyq-0003OP-HW
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:50:17 -0500
Received: by mail-pl1-x631.google.com with SMTP id h15so9436550plk.12
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 11:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xsQ6ggLr3rGxgwu5UthUJwiZQl4XJhVTywRjORcCgjg=;
 b=X0oierJgpkSApLVUEE0MqfscgRHeJ3yDHERl5NW5exvbCVnW7WLEUOTtItX7xDYtcn
 Gh9o7mr7iHNu6L7+V8HOCS4UMM5PGveR3IPSb4T0DECFFg1CG1X9OImnd8x43t+4mvl/
 a1NLsA7lqbfEfTFMtvTZkKQ2CNdS/b3WFO91KDW12SRvY9vwzzYn9xNJF8auDuAaDSTm
 VvKN/LRPTf28uxonFqOx0Jsh2EaDt9j+L5YCeDOe6Ena1fkoPRCH1TkN+pGT5YwFlzIt
 LDqqyWKOm4XeAA/5b1SQbos/BywIjO91PZZzQT+TiwqAbh3OmpMpQVzM9mWqqMenemme
 jKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xsQ6ggLr3rGxgwu5UthUJwiZQl4XJhVTywRjORcCgjg=;
 b=QqSsRLK366uBRexEJHB9fhZ0fmuyMkDcrlXbnbKZWIoGJAu7USm9g9/qHXrGNKGncX
 TKUurANGLsunOjNSzPOyChNHv34T5xG+v+9g4VfGmBe+1ptOo8rP+1014JLkcihqiYdT
 x++xS8PZYGNJCj9A2CfIojr9a5aHbuZQTR8wVh3XngrmpTWaVIorrP1lyD6kLEuNxwmb
 6Fhq0zjlbLZOXlFf6b4vpBTzMSOZYUgCVXHUnE56eUeiex8qENS6EhgksL6nR9gncxHQ
 pCXQsxMkGfaP7PkyLobU978TP+2yp1/eAI68bD9+X1xLre4CYMdM4OwtZG+CMU6dJpz7
 gReQ==
X-Gm-Message-State: AO0yUKUz2AE6XUqTP+gwHE9XGjveoWODTsyoDLnd5BaMGElFqyuq4ZS1
 WEaEFwWGJC/eOnDtFdhwdOFXj1eq8tR2/H8d4zmUyxBb1W3gKnUL
X-Google-Smtp-Source: AK7set9oG3SJC+6YtXYpJqYuJIrlFNu6kr+e2aHprKaUQNOEhtdhx3PZVGKiLZ8lR7k2w7X+s1jaVPRETvHYtZwVAaw=
X-Received: by 2002:a17:902:dac3:b0:199:f31:49fc with SMTP id
 q3-20020a170902dac300b001990f3149fcmr1191450plx.9.1675799413487; Tue, 07 Feb
 2023 11:50:13 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 19:50:02 +0000
Message-ID: <CAFEAcA8cHCbq64mtyG3G4VqnFe0VkmUsyQzbr1LfkAi=ZXvHyQ@mail.gmail.com>
Subject: random copy-before-write iotest failure
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

This is on ppc64 (big-endian), a random failure
(it was while testing the riscv pullreq, but that doesn't touch
any of the block stuff):

616/635 qemu:block / qemu-iotests qcow2
           ERROR
      101.88s   exit status 1
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:
--- /home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write.out
+++ /home/pm215/qemu/build/all/tests/qemu-iotests/scratch/copy-before-write=
/copy-before-wri
te.out.bad
@@ -1,5 +1,21 @@
-....
+..F.
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+FAIL: test_timeout_break_guest (__main__.TestCbwError.test_timeout_break_g=
uest)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write",
line 200, in test_ti
meout_break_guest
+    self.assertEqual(log, """\
+AssertionError: 'wrot[90 chars])\nwrote 524288/524288 bytes at offset
524288\[151 chars]c)\n' !=3D 'wrot[90 chars])\nwrite failed: Connection
timed out\nread 10[85 chars]c)\n'
+  wrote 524288/524288 bytes at offset 0
+  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
++ write failed: Connection timed out
+- wrote 524288/524288 bytes at offset 524288
+- 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+  read 1048576/1048576 bytes at offset 0
+  1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
 ----------------------------------------------------------------------
 Ran 4 tests

-OK
+FAILED (failures=3D1)

thanks
-- PMM

