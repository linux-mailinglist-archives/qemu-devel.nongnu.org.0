Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B97528B78
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:00:27 +0200 (CEST)
Received: from localhost ([::1]:58002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqe54-0007hD-DW
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdyO-00071a-7J; Mon, 16 May 2022 12:53:33 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:43223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdyM-0004ii-K8; Mon, 16 May 2022 12:53:31 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-ee1e7362caso20879003fac.10; 
 Mon, 16 May 2022 09:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p5j6V1rwcHVovhq/aWk4W9zeKe3ABNBpkOmYz5XcpBw=;
 b=Yyqq+tVlfnMjaHRWmZctSl180lRUAlMdRKW8m9c6WUHm62tfqUxHxEf/FWHThr2hFu
 +TKycrPXIftr5MG/oHW8piFb/DLgoS/8k/8pMpVIIrCTwMc3E1M/B4XCU+Rv5ybc3bN2
 6F/Gc+U1Wxr7Odl28V7mTH4FosBJizs4wiTKHMi0bd489K2Dj9SD9BdgS54+NOV2M1ve
 ESj5VVdQF3eGjUT/fBPmV3yMUKvuFt3XqG117a9Z90yjZVOUjlY5vTpVIualMAfMfsAi
 MdDcUnGSYoct/jEYcjQfc72e+9DZ3ClnSUUN/M5uEbaPrDWVmwsaRNeHty4KNoNz5Zv+
 TjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p5j6V1rwcHVovhq/aWk4W9zeKe3ABNBpkOmYz5XcpBw=;
 b=FS5MvzSa0Z2cGY91yTb6wsENOOcWnLEN1LE+2OJDNzDkkB49374MRAfd7Kcay1vBd9
 9xTn6u6ZlcLu4IhWWrTba2BoH5qTyjp7BqPnCEFJParobUMUDsLMtUDbxGk2EBgFX9hO
 fioRjfGh5tEmSFi5PqOrjJaKz7ACwvQXR/qwguoMdt8Cp42WRtojt3Sa3BosXuHKAoMa
 EwNz9u9YTxTLEzBc7rutaTyMMg40LewXz3I+dmztDNNqQJgG4aDk1vV2tH9fhdEefEoz
 amdil/mtQHfEsx3xY7tKEl/7MyuXodCEWsvBHcLaffyml2adn5RkVdWBmCIc0+mhlZPu
 0wVg==
X-Gm-Message-State: AOAM531sUfEG9amGi2YaoHUqRYDZNAAYHkW+z+Og734jbD3g6frQHkCv
 iIxMo3D/eILk2FuxhLi6JFUyWj93Zro=
X-Google-Smtp-Source: ABdhPJzd/EaqNywB/yIgUAryCnL8lBB9Z9G3jWhsy1tl1WdNZOh+b1W5X21t85tGzGw5kPPaAMDGgA==
X-Received: by 2002:a05:6870:d288:b0:e9:257d:db3f with SMTP id
 d8-20020a056870d28800b000e9257ddb3fmr10608402oae.96.1652720008917; 
 Mon, 16 May 2022 09:53:28 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.151.26])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a056870e30e00b000e686d13889sm5780731oad.35.2022.05.16.09.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:53:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 jsnow@redhat.com, crosa@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 bleal@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 0/5] machine.py fix for ppc64 tests + avocado changes
Date: Mon, 16 May 2022 13:53:16 -0300
Message-Id: <20220516165321.872394-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series fixes a problem I'm having when running avocado tests in an
IBM Power9 ppc64 host, without firmware modifications that breaks the
default machine options of a pseries guest running KVM, and with
--disable-tcg. The problem is described in detail in patch 02.

The proposed fix consists of checking whether we're running a pseries
guest in the launch() method of  machine.py. A simple fix, if we could
rely on the QEMUSystemTest self.machine attribute to be set all the time
a machine type is being set.

This is not the case for some tests, e.g. the empty_cpu_model.py test
that, instead of using 'tags=machine:none' to set the 'none' machine
type, it hardcodes '-machine none' via self.vm.add_args(). This doesn't
set self.machine in the QEMUSystemTest class, and then we're left
wondered whether the machine is being run with the binary defaults (i.e.
no machine were set) or if the machine were set manually and we need to
verify every -machine option to check it up. Which is not trivial by any
means: multiple machine options can be passed via avocado and  you'll
have to parse a string using all known machine types to see if it was
set or not. 

To fix the issue I needed to make the assumption that the machine type
will be set in a way that self.machine is also set (i.e. using the
avocado tag). Making this assumption for empty_cpu_model.py alone (patch
01) is enough for me to fix the issue I'm experiencing in patch 02.

I decided to make this assumption across the board in all tests that
were setting the machine type by hand instead of using an avocado tag.
So in the end, after this series, all avocado tests that sets a machine
type are now setting via "avocado: tags=machine:<type>" annotation. 


Daniel Henrique Barboza (5):
  avocado/empty_cpu_model.py: use machine:none tag
  machine.py: add default pseries params in machine.py
  avocado/multiprocess.py: use tags=machine:pc|virt
  avocado/boot_linux.py: avocado tag fixes in BootLinuxAarch64
  avocado/virtio-gpu.py: use tags=machine:pc

 python/qemu/machine/machine.py   | 13 +++++++++++++
 tests/avocado/boot_linux.py      |  7 +++----
 tests/avocado/empty_cpu_model.py |  5 ++++-
 tests/avocado/multiprocess.py    | 14 ++++++++------
 tests/avocado/virtio-gpu.py      |  6 ++++--
 5 files changed, 32 insertions(+), 13 deletions(-)

-- 
2.32.0


