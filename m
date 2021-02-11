Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205953193FC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:10:54 +0100 (CET)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIIf-0001Ef-6K
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lAI4u-00069e-Ke
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:56:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lAI4s-0001Oo-EC
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613073397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hygyt8AfFusAHCeezQiJOTWpBYqIRwBZeNZnc+acSiY=;
 b=gzcciKhdsJHG7OpJ8oNxy4VWLqu7/PFZD+wELa9zLFHb55iVWElLLZ/aMlSa9Xjej69l6O
 ONQyH6NA9YwGFiMQbv805ZHH280e3e/IVMIQiTlxPDvqutADRybbrYo7jEOD/QuCAEPBlx
 oZYb/m0TewA+JJySrZ93Pn4QUchygBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-BypY9QgXOCS6Y56HRuFBCQ-1; Thu, 11 Feb 2021 14:56:35 -0500
X-MC-Unique: BypY9QgXOCS6Y56HRuFBCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B5EA1009615;
 Thu, 11 Feb 2021 19:56:34 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CBD75D9D2;
 Thu, 11 Feb 2021 19:56:28 +0000 (UTC)
Subject: Re: [PATCH v2 21/21] tests/acceptance: add a new tests to detect
 counting errors
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-22-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <02fdf0a8-b3d4-0b72-c188-b9350e5f7405@redhat.com>
Date: Thu, 11 Feb 2021 16:56:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-22-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, Cleber Rosa <crosa@redhat.com>,
 kuhn.chenqun@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/10/21 7:10 PM, Alex Bennée wrote:
> The insn plugin has a simple heuristic to detect if an instruction is
> detected running twice in a row. Check the plugin log after the run
> and pass accordingly.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210209182749.31323-13-alex.bennee@linaro.org>
> ---
>   tests/acceptance/tcg_plugins.py | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)

Likewise,

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
> index b512979769..acab599505 100644
> --- a/tests/acceptance/tcg_plugins.py
> +++ b/tests/acceptance/tcg_plugins.py
> @@ -101,3 +101,34 @@ class PluginKernelNormal(PluginKernelBase):
>               else:
>                   logger.debug("Failed to find instruction count")
>                   self.fail
> +
> +    def test_aarch64_virt_insn_icount(self):
> +        """
> +        :avocado: tags=accel:tcg
> +        :avocado: tags=arch:aarch64
> +        :avocado: tags=machine:virt
> +        :avocado: tags=cpu:cortex-a57
> +        """
> +        kernel_path = self._grab_aarch64_kernel()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=ttyAMA0')
> +        console_pattern = 'Kernel panic - not syncing: VFS:'
> +
> +        plugin_log = tempfile.NamedTemporaryFile(mode="r+t", prefix="plugin",
> +                                                 suffix=".log", delete=False)


In case you find it useful to save the file in the Avocado's tests logs 
directory for debugging, just use the `self.outputdir` property:

diff --git a/tests/acceptance/tcg_plugins.py 
b/tests/acceptance/tcg_plugins.py
index acab599505..da5c8ae267 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -13,6 +13,7 @@ import logging
  import time
diff --git a/tests/acceptance/tcg_plugins.py 
b/tests/acceptance/tcg_plugins.py
index acab599505..da5c8ae267 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -13,6 +13,7 @@ import logging
  import time
  import tempfile
  import mmap
+import os
  import re

  from boot_linux_console import LinuxKernelTest
@@ -114,17 +115,16 @@ class PluginKernelNormal(PluginKernelBase):
                                 'console=ttyAMA0')
          console_pattern = 'Kernel panic - not syncing: VFS:'

-        plugin_log = tempfile.NamedTemporaryFile(mode="r+t", 
prefix="plugin",
-                                                 suffix=".log", 
delete=False)
+        plugin_log = os.path.join(self.outputdir, "plugin.log")

          self.run_vm(kernel_path, kernel_command_line,
-                    "tests/plugin/libinsn.so", plugin_log.name,
+                    "tests/plugin/libinsn.so", plugin_log,
                      console_pattern,
                      args=('-cpu', 'cortex-a53', '-icount', 'shift=1'))

          logger = logging.getLogger()

-        with plugin_log as lf, \
+        with open(plugin_log, 'rt') as lf, \
               mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
              m = re.search(br"detected repeat execution @ 
(?P<addr>0x[0-9A-Fa-f]+)", s)
              if m is not None and "addr" in m.groupdict():
---

> +
> +        self.run_vm(kernel_path, kernel_command_line,
> +                    "tests/plugin/libinsn.so", plugin_log.name,
> +                    console_pattern,
> +                    args=('-cpu', 'cortex-a53', '-icount', 'shift=1'))
> +
> +        logger = logging.getLogger()
> +
> +        with plugin_log as lf, \
> +             mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
> +            m = re.search(br"detected repeat execution @ (?P<addr>0x[0-9A-Fa-f]+)", s)
> +            if m is not None and "addr" in m.groupdict():
> +                logger.debug("detected repeat instructions")
> +                self.fail("detected repeated instructions")
> +            else:
> +                logger.debug("no repeats detected: %s", m)


