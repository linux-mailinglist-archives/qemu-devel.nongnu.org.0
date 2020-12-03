Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5751B2CD363
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:26:57 +0100 (CET)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklpA-0008Su-3K
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ml.linux@elloe.vision>)
 id 1kklnT-0007uI-5O
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:25:11 -0500
Received: from soggy.cloud ([2a01:7e00:e000:151::1]:47261 helo=iam.tj)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ml.linux@elloe.vision>)
 id 1kklnQ-0008Aq-Qs
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:25:10 -0500
Received: from [10.0.40.41] (unknown [51.155.44.233])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by iam.tj (Postfix) with ESMTPSA id 996E034076
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 10:25:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=elloe.vision; s=2019;
 t=1606991105; bh=1FsA6Z0Ms4BhhZ70kJ7mcZ9PItkFt0UANo7X8eAoM84=;
 h=To:From:Subject:Date:From;
 b=mfPdtOuvl1lKiDgGlssi2ol5VQ4/j4MOV062/PA8yziLQEwnXL1Wlw4L066aQkJ31
 FqiRmUrri/D/wC6Sqw+Q6TjKFNNQ+T3NENW4+6juqhhLBkdyJI/g9nERlIeF7q0Lx2
 OlkZFgsn2zCfzHxmgFKGjPXnH1eIU8j2eEkMM/zbqShyc92LMpttkZZPI1WdZgHkn9
 lUR8s9XG7v5bUiDlQWnWrM1/Y0F09tnooRp+CwRvCUv6ioeDXzP4aDZjJoPqsrZs2Z
 ag3CZ45byPMd1TKa3kIz+OT7pEe3JmHsld9Hp7e+uiWDizCuFgl5Yhf6g15tJrK6MX
 D/kjpO3fKcc8Q==
To: qemu-devel@nongnu.org
From: "Tj (Elloe Linux)" <ml.linux@elloe.vision>
Subject: qemu:handle_cpu_signal received signal outside vCPU context
Organization: Elloe CIC
Message-ID: <1c1a5ad6-de90-b7af-b285-dfbee52803cc@elloe.vision>
Date: Thu, 3 Dec 2020 10:25:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a01:7e00:e000:151::1;
 envelope-from=ml.linux@elloe.vision; helo=iam.tj
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're seeing this error on Ubuntu 20.04 amd64 host and aarch64
qemu-aarch64-static chroot when executing 'aptitude':

qemu:handle_cpu_signal received signal outside vCPU context
qemu:handle_cpu_signal received signal outside vCPU context

Research led us to an identical issue report against qemu-m68k [0] where
it is reported this issue is resolved in 5.0.0+.

Ubuntu 20.04 LTS currently ships v4.2 so I'm trying to identify the
commit(s) that resolved this issue so we can test a cherry-pick of the fix.

Do you know which commit(s) addressed this?

Some suggestions as to the responsible patch have been made but I've not
been able to find the patchwork patch [1] content in current upstream
which suggests its the wrong patch, it was never merged, or the code has
since changed so it is unrecognisable.


[0] https://github.com/vivier/qemu-m68k/issues/38

[1]
http://patchwork.ozlabs.org/project/qemu-devel/patch/1456850240-21096-1-git-send-email-peter.maydell@linaro.org/

