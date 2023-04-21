Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381816EABBE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:34:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqtS-0002QG-Q9; Fri, 21 Apr 2023 09:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqtP-0002Pn-IR
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:33:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqtN-0005m3-PR
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:33:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so10486065e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682084016; x=1684676016;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DsFE5uMmZymhMCO7Yoaf4qPJeOJAaioHwB4seniFfnY=;
 b=g69Emy4cac75eD1zEUqQFdRDUBjmhD7v8xq8xIDvRaTTIvFhGEjjfEIaIemaBOMOTJ
 weu6p7oBJSyJd8KWLmPU4wegnker2VrxpeH5FboXaweKAul5LoST4+DCx7VhaFzPdVYR
 6Y0POnPSQfnM8ncXf51bCI+QolnjI00aSZxkiSa3tqoKU8dyLFgsZRW+PZOJ9fXyMBut
 uvfe/t7w+F8Rx6Y3xZ4sSKGemOl2ezE8S/MErc/ufAlaTQAX6iZ80LkuyOHaMo2YbULq
 V4aNHWgmEwsqYpb8O7jPq0+LRxJ4PTARC8njJh4Ty0TbaPJYX6mgGARehcridacq7R33
 pMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682084016; x=1684676016;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DsFE5uMmZymhMCO7Yoaf4qPJeOJAaioHwB4seniFfnY=;
 b=NmegJ/K2w3FrbqQ64ma2wRR1t+iEcG5L9bIz1WM5/UUJPow1nUdweL2sM8v1rEebkU
 tkbE/dCoNs7ykVpa+mfeqKvdI8O91FUPH5N0nitBbvBcCE8ds4NR0Xu2f1n9KKgrjrWA
 xlmQYXt1+vfKcPh7m9j6/8KTiDM6TlwFBf4EWLNaZLLV+z8eIqURV/pUCZ/ahrZSaEN4
 EWkTb/47Pt83Cf/zqfd4I7oN1Izn7hU+9khJrK1mJa1ynGQLOjWWNMXOrLKj1ZIGCdqY
 x1QJag6f0AOLzPVkXFOtXAJLwQj6dcrFX30FpJwg3WM9qkNIAjhzkdHsS6kI520a+o1o
 NPXQ==
X-Gm-Message-State: AAQBX9duLTMHCKrzoPuhLEnEnxekoCxMvW5ddr5ihg5prJm3wdGwZKPk
 puEDjmolbEQ0Wt58qGJbFspb9A==
X-Google-Smtp-Source: AKy350ZyUpNBTGAizeJHHFRrp2yKtiZ1WJ3Ap0lZPrUPe61CU/5gpxp7BT4bdONzECx6AG37AdZo9w==
X-Received: by 2002:a1c:7211:0:b0:3f1:6880:3308 with SMTP id
 n17-20020a1c7211000000b003f168803308mr2154314wmc.1.1682084016053; 
 Fri, 21 Apr 2023 06:33:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a7bce09000000b003f049a42689sm4864802wmc.25.2023.04.21.06.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:33:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E6C51FFB7;
 Fri, 21 Apr 2023 14:33:35 +0100 (BST)
References: <20230421042322.684093-1-kconsul@linux.vnet.ibm.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 0/2] Improve code coverage for ppc64
Date: Fri, 21 Apr 2023 14:29:38 +0100
In-reply-to: <20230421042322.684093-1-kconsul@linux.vnet.ibm.com>
Message-ID: <875y9pbbrk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:

> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> boot_linux.py test-case due to which the code coverage for ppc
> decreased by around 2%. As per the discussion on
> https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> was mentioned that the baseline test for ppc64 could be modified
> to make up this 2% code coverage. This patchset attempts to achieve
> this 2% code coverage by adding various device command line
> arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> test-case.

I've pulled the first patch into my testing/next, but the second
conflicts with the inflight patch which adds checksums:

  Message-Id: <20230417134321.3627231-3-alex.bennee@linaro.org>
  Date: Mon, 17 Apr 2023 14:43:17 +0100
  Subject: [PATCH v4 2/6] tests/avocado: use the new snapshots for testing
  From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>

You can either wait and re-base once the PR goes in (I'll send a pre-PR
Monday) or do you can re-base directly off my branch at:

  https://gitlab.com/stsquad/qemu/-/tree/testing/next

and send the tested patch mentioning its based off my testing/next and
I'll include it in the pre-PR.

>
> Changes since v3:
> - Create a common ppc64_common_tuxrun routine in tuxrun_baselines.py
>   and call that from the ppc64 and ppc64le test case routines.
>
> Kautuk Consul (2):
>   avocado_qemu/__init__.py: factor out the qemu-img finding
>   tests/avocado/tuxrun_baselines.py: improve code coverage for ppc64
>
>  tests/avocado/avocado_qemu/__init__.py | 27 +++++-----
>  tests/avocado/tuxrun_baselines.py      | 68 ++++++++++++++++++++++++--
>  2 files changed, 80 insertions(+), 15 deletions(-)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

