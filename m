Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE856CBF86
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:45:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8hC-00013b-Bx; Tue, 28 Mar 2023 08:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph8h4-00012n-Lu
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:44:56 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph8h2-0007Xc-Us
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:44:54 -0400
Received: by mail-ed1-x52d.google.com with SMTP id x3so49103027edb.10
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680007491;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jFCGxfuFF59osaFbM0B8Mf6lxoJGQeI5+TQ+fW09r58=;
 b=spazUOvtyMe+2gnf5wr8cn3ifKk3HiGurtXaR7RhWRm8rUKvRhbUJjxpSnBC1YTebK
 OJEdNebnATmASSuuw4BOaKc4JGK7MGQrFhgUka2XdITFSx1KoqnBzpo0rTJUJ+wApP59
 Hu6AUBatLV7mSia4sBZ943ieeIYXz+NJqb2KielAiz6tCIKHM8mbiEl94hfBxtT24dtI
 1a0qV/RoQEHHjRFRmysvP4A95VsNULnh8A2LHyXKf1KrLw8JX7T7xPD17F2sJmL0cpi2
 9cfS1CtweRjTMVSNoZxRD84q9LLbefBZXA3BoX99QZZBhc8NJX+ADujorCozWeuz6GUg
 LbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680007491;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jFCGxfuFF59osaFbM0B8Mf6lxoJGQeI5+TQ+fW09r58=;
 b=3x3+EJqI2i5+MlkhSQ/Dq2MofxCgObNbHPqwCB1bfRhPMQ9DyAsWF3cb8f9ZfIlPQV
 YuQf5xJ4nPQ679OE+4rKy20+F4hBu8Wt8ilOH6QzqLkJIxTk027cUeswDT8gj+bSgFs1
 fRPssG/ibWwJk/WddJRCCuxdMeA7BJuQXmCuOFdppXAv5H+RXxcgaiAWrIFSzOkBNX1u
 h3ns47UlrnBcNY9fxGdFOA/I5ocrn9Hk+n2A3mlREQ5FJm835DCZc7R+s/CBPrFkKvGg
 j6P7Uq2z/bgsgFc8AQ5vK3xPKg7P9h+M/UF4qhfDn44rvbpxLwz5/w0HpZpGFjELbp1f
 eiEQ==
X-Gm-Message-State: AAQBX9fRik6OqlYYNwlSW22KEXTrpT++48QMp+M92zgFScmgz/plICQ6
 nptafhBQwiTWZWx+pd1DvNTzGB6tqEFyn++AjQ5kT5oR1mLTRd8pCkc=
X-Google-Smtp-Source: AKy350Zq5vc4JNmcslJMpv6JC+8e/+4aLFwWuekQ0b9N0kEK3K5SpnEzTPzs/lIcjnzS5fxg9JbS0KhFW+OUdR7appk=
X-Received: by 2002:a17:906:cf89:b0:932:4577:6705 with SMTP id
 um9-20020a170906cf8900b0093245776705mr8165591ejb.6.1680007491151; Tue, 28 Mar
 2023 05:44:51 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 13:44:40 +0100
Message-ID: <CAFEAcA-Xdw6uL+w-Qh+pLFVXEcvQhQZi-o3Xup4iwJuSGNYgmg@mail.gmail.com>
Subject: io-qcow2-copy-before-write intermittent failure (ppc64 host)
To: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

ppc64 host:

737/761 qemu:block / io-qcow2-copy-before-write
           ERROR           6.77s   exit status 1
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
+++ /home/pm215/qemu/build/all/scratch/qcow2-file-copy-before-write/copy-be=
fore-write.out.bad
@@ -1,5 +1,21 @@
-....
+...F
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+FAIL: test_timeout_break_snapshot
(__main__.TestCbwError.test_timeout_break_snapshot)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write",
line 210, in test_timeout_break_snapshot
+    self.assertEqual(log, """\
+AssertionError: 'wrot[195 chars]read 1048576/1048576 bytes at offset
0\n1 MiB,[46 chars]c)\n' !=3D 'wrot[195 chars]read failed: Permission
denied\n'
+  wrote 524288/524288 bytes at offset 0
+  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+  wrote 524288/524288 bytes at offset 524288
+  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
++ read failed: Permission denied
+- read 1048576/1048576 bytes at offset 0
+- 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
 ----------------------------------------------------------------------
 Ran 4 tests

-OK
+FAILED (failures=3D1)

(test program exited with status code 1)

This is an intermittent; we've seen it before on this host:
https://lore.kernel.org/qemu-devel/CAFEAcA8ipWKpv09pyQWNQBiUhd2JYM=3Dsn4qv2=
YBen-pN3beU0Q@mail.gmail.com/


-- PMM

