Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07D5450AEE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 18:13:17 +0100 (CET)
Received: from localhost ([::1]:55152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfXg-0004kS-7D
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 12:13:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmfWa-0003wv-SG
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 12:12:08 -0500
Received: from [2a00:1450:4864:20::429] (port=39745
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmfWZ-00021i-4c
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 12:12:08 -0500
Received: by mail-wr1-x429.google.com with SMTP id d27so32154262wrb.6
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 09:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=AcZP8rnWJpZEctyo+17TASGg9QtCzX7lK73fe6yMB1I=;
 b=Os81k9solsKwQ/UEwCJC1Hr5Z3ScuQ9+wLYBlykv+ekGs9khO5/fSd51ogEaYVJTIV
 moGDA33/2ZKlXBRVdwa1URQjeX6FTJubdWSUkUJRI3o4orUyguS7hQBjWTcEi4uLGLXk
 vICsjVqM6MKAVDJ32t+w7RxmBrz19aqdwaZr8KC3p2Ehd7pYsj6N+oSc62Jm9wgUxGKw
 DKvaCn2m0u6gvACc2t9CKUQZloua+uZWyF1XCSYpviwQFLddF+TKnFXT9aJzv2yIJ7eY
 ThlfROctvWSAQbv1f7nd2+v1t01MyQP0jQwEu0l748P4Liv/0ZQqVpePjHsZg7x4AANB
 FJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=AcZP8rnWJpZEctyo+17TASGg9QtCzX7lK73fe6yMB1I=;
 b=f7IzqqnyeoUMaGocXYpZ+1cXw4O7602sRtT4NH4v1J67j5bYIN5+6UAQNPwlyeJ7zk
 DTKXnf26M2tipssayE7zLV+iy9k3r4wvtcPJzhL66rtFNVBDwnkJ4pHDbHi0q3wWxgWB
 KHFno8k/+CZ1XECDXtnIW10Ob2jBRHMfkKN1qCDD24dtkxeowUxjGrly2hMvdx3X5qYa
 +zT8w/0sCB8ShdmpeXMLUq7hQ7J3vVmUliGbxP0QK12uiU6fCNHXAKbPX2+Tyh3EzBZ7
 a4aoHvDGAV9ipY9q34zO8N5Olt1wq0Fc+U9t5nFIq9exLvjsijEv5FzkIYg8ZNePaP2s
 WskA==
X-Gm-Message-State: AOAM531uPUm9ILcZJtFJT+J9ObVLaUWd0dBGsxJx6Tevnn765FmUxGxk
 HcVcszRMotLFqnaV39Y7jVxMHCQmCZDTxOYc5s12zb1Ps5I4Fw==
X-Google-Smtp-Source: ABdhPJyCfYU23HpmqA5v+78cFlhsdOZB/TFMgxWgFZMtayPRriQeuKxNgmsdEFKn3Kw+2DugGFcuXCKns7QPx8dC1dA=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr717881wri.376.1636996325473; 
 Mon, 15 Nov 2021 09:12:05 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 17:11:54 +0000
Message-ID: <CAFEAcA-8jo5SmV41CP6aquyWWvrQQo5OoXbac=knD4z6A3fHxw@mail.gmail.com>
Subject: "make check" fails in a clang sanitizer build on "nbd-qemu-allocation"
 iotest
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; running a 'make check' on a clang sanitizer build one of
the iotests falls over due to a NULL pointer being passed to
memset():


  TEST   iotest-qcow2: nbd-qemu-allocation [fail]
QEMU          --
"/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/qemu-iotests/../../qemu-system-aarch64"
-nodefaults -display none -accel qtest -machine virt
QEMU_IMG      --
"/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/qemu-iotests/../../qemu-io"
--cache writeback --aio threads -f qcow2
QEMU_NBD      --
"/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- Linux/x86_64 e104462 5.4.0-89-generic
TEST_DIR      --
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmp13ihi_hj
GDB_OPTIONS   --
VALGRIND_QEMU --
PRINT_QEMU_OUTPUT --

--- /home/petmay01/linaro/qemu-from-laptop/qemu/tests/qemu-iotests/tests/nbd-qemu-allocation.out
+++ nbd-qemu-allocation.out.bad
@@ -14,6 +14,8 @@
 [{ "start": 0, "length": 1048576, "depth": 1, "present": true,
"zero": false, "data": true, "offset": 327680},
 { "start": 1048576, "length": 2097152, "depth": 0, "present": true,
"zero": false, "data": true, "offset": 327680},
 { "start": 3145728, "length": 1048576, "depth": 1, "present": false,
"zero": true, "data": false}]
+../../nbd/server.c:1027:16: runtime error: null pointer passed as
argument 1, which is declared to never be null
+/usr/include/string.h:61:62: note: nonnull attribute specified here
 exports available: 1
  export: ''
   size:  4194304
  TEST   iotest-qcow2: qsd-jobs
Not run: 172 186 192 220 287
Failures: nbd-qemu-allocation
Failed 1 of 118 iotests


Does this look familiar ?

-- PMM

