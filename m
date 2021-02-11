Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D71318824
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:29:28 +0100 (CET)
Received: from localhost ([::1]:43700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9Dz-0001Kb-KN
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA99W-0005CP-Ud
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:24:50 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA99V-00029w-FH
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:24:50 -0500
Received: by mail-wm1-x32a.google.com with SMTP id n10so3320076wmq.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=53LWhiklPqnE4QDrrfSmwHbFmKnLomunti2W24gBsGc=;
 b=CGBoqXg5fV7Y7piiUAz0yuDWh6Ku+Oq98+IzDkmsge/O4k30hBvfEU0WOibi44oHOs
 ZeM2u0cShbvyTP+/184czIJsItgMLYmks4G9QMXaBgwm0mDJFC4lerX5i2/WKP+nRAXO
 sf1JAg5DEOnk5DZnSV37oVzakAcfhzaErry7EDoJ2cas+uUR+J6M9bjgIzaYPXVtnEkG
 SSao5BNTisZ3AjbQm66mk8IMKg6kHs04z+WwLReORXmiYpT9YrGA94a2FdoaIHIf5srj
 Cx6ST+YpbzgTY+pOBP1JqKQVFFbs3Rwxf2DfJThWIXZslANdckPbrzbqgtBynGDY0Uq3
 YBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=53LWhiklPqnE4QDrrfSmwHbFmKnLomunti2W24gBsGc=;
 b=lDzlNvOpDu0OJ8wELbvLq2AHVdnPs4hNKC3zgX8MnOjukYW11fUvFebs9jNgCIEXc0
 I+e2yZPVEPkyVDrwTi29m7FS0i+jhl77AVYBQEIUHv9ZWwpLm/PiQ74IrMHFhHBGxbbZ
 p+1G3qPd6MoMQ1qaq+0DAmJfpGYOcU7yD8DhdzU+515zu2BmqxWc4OqVtQC9uw+ViOcT
 T64CQxTwQZz4tJ4oPom1djotczlRC6X8wE1VMQ/SkISRmyn2PWMKDEwD3sYZRoD2KGmx
 nFVgfL3TfIVg5Yunft8lUr0p3sdSDXqXO8Tr9rMgRbjgN9vZogRrotASBA1hH0buEJ91
 2JfA==
X-Gm-Message-State: AOAM532GJ3XbWzh2KhIWAcKlduDRkchyuuqnPvJp0xARVCs5GJC6zt2G
 EiIGsduUgamoLfAZ8hjZwIM=
X-Google-Smtp-Source: ABdhPJwSck0AYPswkVCvj08CRgPjoU/Yh4r+siR21/lNzT9Xi7xK2+aAQwY2+CcmGcB/leAAADF3dg==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr4492742wmc.185.1613039088134; 
 Thu, 11 Feb 2021 02:24:48 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t197sm28689916wmt.3.2021.02.11.02.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:24:47 -0800 (PST)
Subject: Re: [PATCH v2 21/21] tests/acceptance: add a new tests to detect
 counting errors
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-22-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f0c2dc73-e8be-4a9c-3863-22aa80c5b59b@amsat.org>
Date: Thu, 11 Feb 2021 11:24:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 11:10 PM, Alex Bennée wrote:
> The insn plugin has a simple heuristic to detect if an instruction is
> detected running twice in a row. Check the plugin log after the run
> and pass accordingly.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210209182749.31323-13-alex.bennee@linaro.org>
> ---
>  tests/acceptance/tcg_plugins.py | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
> index b512979769..acab599505 100644
> --- a/tests/acceptance/tcg_plugins.py
> +++ b/tests/acceptance/tcg_plugins.py
> @@ -101,3 +101,34 @@ class PluginKernelNormal(PluginKernelBase):
>              else:
>                  logger.debug("Failed to find instruction count")
>                  self.fail
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

I suppose this is debug left-over and we can remove this line now.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +                self.fail("detected repeated instructions")
> +            else:
> +                logger.debug("no repeats detected: %s", m)
> 


