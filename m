Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC045EAE33
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:29:46 +0200 (CEST)
Received: from localhost ([::1]:57812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrvN-00071u-4C
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrOL-0002JK-VE
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrOG-0002yQ-Ou
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664211331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9CCLlK6yfQFDnmvZnH4wWwP5c+biyWIshje7VO079U8=;
 b=gFsx4fbSNbaLvXwDUwCJOPAA4117F7w3HCaU0RNpiaUxDdjeH788F7BusuVrd5n87jNN4Z
 MMSzN5sNyRtJYIG3TLQCoqNl+VPV9cWddu8bfrcvwL1BEodOZiBCHrbnmkIfUKb3gG1hu8
 c1Ga+NGumyuhz1nxybap25FKxAB2OYE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-z0IGaJ8-NmuwXLdlh8HFDw-1; Mon, 26 Sep 2022 12:55:30 -0400
X-MC-Unique: z0IGaJ8-NmuwXLdlh8HFDw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c3-20020a7bc843000000b003b486fc6a40so2068960wml.7
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 09:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9CCLlK6yfQFDnmvZnH4wWwP5c+biyWIshje7VO079U8=;
 b=SNH7YMPqVaoqm6m/dWq1TyWX4/d2QjKyVcA+g+M4ESJ3HuzSVQdl6yJKcZdQsN10Ny
 kVdWKx0IApUXjc3VmGOsCeRxEI7arDAt0AKe1MsP8LJs9R+Zef+zLzpLSHRd24P75dsO
 hASKPX2STeyjNow7cCqQZNYcbDBy6CIcQ2uh3cms29LpfJeGk/ZX4O3/D6mZAGa634qs
 PIYNry7SL4jA5d60G2rHIy9odWOnlSFKy7SEoSbEhhecTmEUtEQQ5f72SX1DySya4kjz
 r4+lTGr+voWjlAQJYNeKUHb3drvepwuUNVoBe+LytFsvYw1rGD3Cib/HE5j4fCsH5mok
 8n4w==
X-Gm-Message-State: ACrzQf1fQxP4W2hG1oiC5IETJH30lwSvdVF0lPRbSwtqAwqvSyU8edCU
 qeFK+Tv00dFVGFGw68j3iVNHLYOAiXjDj6ZmWcpayQjG4tS/04yfDgjC+wsZQPj5cf1HwyCLSZ2
 fR66MN9XJfNqd+nY=
X-Received: by 2002:a05:600c:1c22:b0:3b4:b2bc:15e4 with SMTP id
 j34-20020a05600c1c2200b003b4b2bc15e4mr16310872wms.69.1664211329718; 
 Mon, 26 Sep 2022 09:55:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4SzHqb6aOjgtiIcLaJ0F0UQBkJ2EbqfkY/jzqvD0VfEMPI5QK70/7pbmZ0ZkncNYXbKi2JXw==
X-Received: by 2002:a05:600c:1c22:b0:3b4:b2bc:15e4 with SMTP id
 j34-20020a05600c1c2200b003b4b2bc15e4mr16310862wms.69.1664211329462; 
 Mon, 26 Sep 2022 09:55:29 -0700 (PDT)
Received: from [192.168.8.103] (tmo-064-141.customers.d1-online.com.
 [80.187.64.141]) by smtp.gmail.com with ESMTPSA id
 c126-20020a1c3584000000b003b4a699ce8esm11499229wma.6.2022.09.26.09.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 09:55:28 -0700 (PDT)
Message-ID: <268199c7-8866-6818-76ee-8174db0ffc99@redhat.com>
Date: Mon, 26 Sep 2022 18:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-55-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 54/54] docs/devel: testing: Document writing portable
 test cases
In-Reply-To: <20220925113032.1949844-55-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/09/2022 13.30, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Update the best practices of how to write portable test cases that
> can be built and run successfully on both Linux and Windows hosts.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> 
> (no changes since v3)
> 
> Changes in v2:
> - Minor wording changes
> - Drop patches that were already applied in the mainline
> - Drop patch: "qga/commands-posix-ssh: Use g_mkdir_with_parents()"
> - Drop patch: "tests: Skip iotests and qtest when '--without-default-devices'"
> - Drop patch: "tests/qtest: Fix ERROR_SHARING_VIOLATION for win32"
> 
>   docs/devel/testing.rst | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index aea5b42356..0eae9c4654 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -115,6 +115,36 @@ check-block
>   are in the "auto" group).
>   See the "QEMU iotests" section below for more information.

Looks like you've added the new text after the "check-block" section ... 
could you please add it after the "QTest" section instead?

> +Writing portable test cases
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Both unit tests and qtests can run on POSIX hosts as well as a Windows host.

Nit: better use plural in both cases: "on POSIX hosts as well as Windows hosts".

> +Care must be taken when writing portable test cases that can be built and run
> +successfully on various hosts. The following are some best practices:

Maybe better (but I'm not a native speaker either): "The following list 
shows some best practices"

> +* Use portable APIs from glib whenever necessary, e.g.: g_setenv(),
> +  g_mkdtemp(), g_mkdir().
> +* Avoid using hardcoded /tmp for temporary file directory.
> +  Use g_get_tmp_dir() instead.
> +* Bear in mind that Windows has different special string representation for
> +  stdin/stdout/stderr and null devices. For example if your test case uses
> +  "/dev/fd/2" and "/dev/null" on Linux, remember to use "2" and "nul" on
> +  Windows instead. Also IO redirection does not work on Windows, so avoid
> +  using "2>nul" whenever necessary.
> +* If your test cases uses the blkdebug feature, use relative path to pass
> +  the config and image file paths in the command line as Windows absolute
> +  path contains the delimeter ":" which will confuse the blkdebug parser.

s/delimeter/delimiter/

> +* Use double quotes in your extra QEMU commmand line in your test cases
> +  instead of single quotes, as Windows does not drop single quotes when
> +  passing the command line to QEMU.
> +* Windows opens a file in text mode by default, while a POSIX compliant
> +  implementation treats text files and binary files the same. So if your
> +  test cases opens a file to write some data and later wants to compare the
> +  written data with the original one, be sure to pass the letter 'b' as
> +  part of the mode string to fopen(), or O_BINARY flag for the open() call.
> +* If a certain test case can only run on POSIX or Linux hosts, use a proper
> +  #ifdef in the codes. If the whole test suite cannot run on Windows, disable
> +  the build in the meson.build file.
> +
>   QEMU iotests
>   ------------
>   

  Thomas


