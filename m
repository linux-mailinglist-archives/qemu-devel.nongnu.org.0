Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B975F55E7CD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 18:34:10 +0200 (CEST)
Received: from localhost ([::1]:57692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6EAC-0000We-Rf
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 12:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6E90-0008DS-Rn
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 12:32:54 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6E8z-0000sY-9V
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 12:32:54 -0400
Received: by mail-pg1-x532.google.com with SMTP id h192so12720785pgc.4
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=f8gp5Ifk467fDi3LTu3ZtEuq/vU7SjxLG+pI13HnWhY=;
 b=Fpjh02rpNc0RzB/3/c773/0PUBP8qPljE6hiN5Af90hcEBntMI+/4qcOcbzuqnqlql
 oVjIqRPWdJaVJo1eiVZXQp910EtY5ICR+VeVcjf9EWIFehg8W+1i2/hvNoyyJw31M5m6
 L8L3UqUYkXXvKSfMilND9w1ze+cPQ9WZ+JqSKEQys8ZABvkTXEZp6r3S8Mobf2jlbCS4
 Xkg71Qj9sGPGPZuHxxr8BiTHBa60B+aXljxlHUd0dIQm6OcesVHFSZi3RxeSikmc2vjH
 A2O065FPiFVqAa2TSdwsXEcDPMrOoQV0tSh9MhiRC+tVfMhcGrQrEQrhv7AFy+z6UftT
 rgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=f8gp5Ifk467fDi3LTu3ZtEuq/vU7SjxLG+pI13HnWhY=;
 b=Y874Ppe7P4VPmb7YbuJGnfHUmrrfF7XK0M250j4TDBU0MSJ7ui5tUrpkwfYRlADhuU
 0HQSi22ljJFDPODUaKVVAsqyzocjz1nzKRFBmuHujo5sA95L6OxQ92SqXWCd/RXlp3q5
 4TrHFCJFAkb1eL2Xg17mXy6O2+Zl6J1ExG5nMu4MIV7K9sFzGBYCLtFfLy2CrF1tq4eS
 9tonZfNNO3ci+SxeiASFsLbilU3Mo4kkC+NeylUMR0xDoJ4wWGV2NiVs90UJyrID/NrS
 OBaY/KM/+r+4VjkS55Q3FGvsYsJJj247g5GNHAN/ZXHW7obGbPtVc5ALz1UxS9+eAUua
 cusQ==
X-Gm-Message-State: AJIora8gHjOUugVMig5pEvGQ0E9dWVfz6fnOU66t/5JiW7/e3jwkDG1u
 rGcshek4y5hZQM0DkGW5Yz7puhqoNYOSYOWUQsM=
X-Google-Smtp-Source: AGRyM1tfNGxrExuIUiazwdT6j7Rf/vMZPyBCs0+k9PnD7tAOvKGRwfddSpw4FW2MXmxQox9yj+gdPz5vVASYAfjMV+A=
X-Received: by 2002:a62:4ed3:0:b0:525:5a10:d5ac with SMTP id
 c202-20020a624ed3000000b005255a10d5acmr4415151pfb.65.1656433971765; Tue, 28
 Jun 2022 09:32:51 -0700 (PDT)
MIME-Version: 1.0
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 28 Jun 2022 09:32:47 -0700
Message-ID: <CAMo8Bf+9B8Cv3gJ1Ti_Wj3AQtdnbB=XvK-L6xWvNtdBGZJuP6Q@mail.gmail.com>
Subject: running softmmu tcg target tests locally
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hello,

there used to be an option to run tcg tests for a softmmu target with
make check-tcg
but since the commit 5377a1000192 ("tests/tcg: list test targets in
Makefile.prereqs")
it is no longer working for me.

Is it supposed to be working and was broken by accident? Or what is the correct
way to run these tests now?

-- 
Thanks.
-- Max

