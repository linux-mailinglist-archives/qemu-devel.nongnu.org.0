Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3594BBBD1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 16:06:54 +0100 (CET)
Received: from localhost ([::1]:36576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL4qT-0005Sh-D1
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 10:06:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL4oS-000455-3T
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:04:48 -0500
Received: from [2607:f8b0:4864:20::112e] (port=40812
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL4oQ-0000uo-2q
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:04:47 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2d68d519a33so68126697b3.7
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 07:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=e+QyqZlDxLBBUhAS5cPHZ2+QKmCnHHxZWpK89DxpXII=;
 b=HOIehBa4nUTwT4ofVOrpeastIDaXwX3CZrQeIWWds5U/oMxsstcHvCqC0f8OH418xs
 e/rM/xxYmVSzJjRvreRXfIwy/WxLaf2I5HVUBdamcXnDTo+iYovDLoBvCw83KfhEL/J2
 MKAYaMB1K/9Vd5xrQfcRf0av/ZuZVjxEZBeHtqxKXZgTUsUdEryXo3Mz8wj6xd1udZIo
 asLhL9kLVtaKep+uASx7CcxdLR0ytDRnNL2L+wHyGDiBabQIVTMy3GwAqH5hZKOpld7O
 KUWyQVaaShC9GVzm01kFK6pZe8+aRVI0Ab0P+PYwWwQ7DDW2Uz317FsGg/CgUf3WcbQN
 VX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=e+QyqZlDxLBBUhAS5cPHZ2+QKmCnHHxZWpK89DxpXII=;
 b=gj4hbq+IVTvip8i53GF0XflPpBAUlGLdjFyISoO118Wyu01xcfDaE49rQ/uwquzjnH
 SyAUYgZQ96STR6spklH3keqkd0EeCuDdoUkeukj1oDuZ3fr3yAekhUGKR6dXSL4X9XWI
 IbwP0m7xDzWRilaKSTWOvEtCRyZapWEaWkPaJKLi7PSPOkghnczXeS/I7lS+ucQ6HOoF
 ZzPE78jKqLYaCaxLxpYM+oKE6UNqDOfK64w4u/gmOgGndeElnhlKur/5VTN0fDqfn2D7
 lXfEH0CO3jsBnaxeCCCPBGWQv98FI28x7jK3ig6QBr+/vtOZCNAMIpoZsAY7KoyUFrBQ
 Q25w==
X-Gm-Message-State: AOAM530D4/VsUvuQ1J5ZDRWNNsPDuEB5CSeLCGsKhJlJ+/ml6/TnKZng
 XXRHZvFaVTQz9aENJ5vT8k6fGQyjgwUSYCp+e/JeMahnCk8Izw==
X-Google-Smtp-Source: ABdhPJxpE1iFbr/kH5ROPtbozd+hV8K0zzQWxSAQMQSPQBrk+0IY648WLadu1TusvakOgBxWmw3wXyfsh8USs8EHu9Q=
X-Received: by 2002:a05:690c:314:b0:2d6:b95b:bf41 with SMTP id
 bg20-20020a05690c031400b002d6b95bbf41mr4575750ywb.64.1645196684934; Fri, 18
 Feb 2022 07:04:44 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 15:04:34 +0000
Message-ID: <CAFEAcA9uVgPzkYHZk3jFNKj6d-rOh25gNFM_bKz=G7G+0B=1+A@mail.gmail.com>
Subject: 'make check-acceptance' failing on s390 tests?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; is anybody else seeing 'make check-acceptance' fail on some of
the s390 tests?

 (009/183) tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'009-tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg',
'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/clang/tests/results/j...
(900.20 s)


 (090/183) tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora:
FAIL: b'1280 800\n' != b'1024 768\n' (26.79 s)


I've cc'd Daniel because the 090 at least looks like a resolution
baked into the test case, and commit de72c4b7c that went in
last month changed the EDID reported resolution from 1024x768
to 1280x800.

Not sure about the timeout on the boot test: the avocado log
shows it booting at least as far as
"Kernel 5.3.7-301.fc31.s390x on an s390x (ttysclp0)"
and then there's no further output until the timeout.
Unfortunately the avocado log doesn't seem to include useful
information like "this is the string we were waiting to see", so
I'm not sure exactly what's gone wrong there.

(I continue to find the Avocado tests rather opaque: when you
get a series of green OK's that's fine, but when you get a failure
it's often non-obvious why it failed or how to do simple things
like "rerun just that one failed test" or "run the failing command,
interactively on the command line".)

The 090 failure didn't cause the merge to be rejected because
in commit 333168efe5c8 we disabled both these tests when
running on GitLab.

Suggestion: we should either disable tests entirely (except
for manual "I want to run this known-flaky test") or not at
all, rather than disabling them only on GitLab. If I'm running
'make check-acceptance' locally I don't want to be distracted
by tests we know to be dodgy, any more than if I were running
the CI on GitLab.

thanks
-- PMM

