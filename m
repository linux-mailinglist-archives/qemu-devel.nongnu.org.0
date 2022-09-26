Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4D25EAD56
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:58:16 +0200 (CEST)
Received: from localhost ([::1]:43204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrQs-0004Ms-HK
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocqqf-0003yF-7N
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocqqb-0005LF-Lb
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664209242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytPPU+PbxO7EJa13pfGHx6tPEH+MSgGODXDMbjkBocE=;
 b=fIkcQ7SutGzQQWNFK6qo6UwGcF3rJINc7zWHlDXXB1mbZvignRjO4wqYoluCcldl2Gy9Au
 pYqfZbNWBDw36obl+IfTD73qwx9K1sPPwDf+mm+b0kyNBB5xq3MSaEZoGV5BMSHq/SBrFN
 BFsQz/EUO1ykruQ/RGqUYeI3bApAQPQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-NLpgk410M8uoI990LH5kMQ-1; Mon, 26 Sep 2022 12:20:40 -0400
X-MC-Unique: NLpgk410M8uoI990LH5kMQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d25-20020adf9b99000000b0022adb03aee6so1350707wrc.6
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 09:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ytPPU+PbxO7EJa13pfGHx6tPEH+MSgGODXDMbjkBocE=;
 b=Mfk5ycbQhTFN/Jup9r2X3qa+r7PZUh232RddP2m1c90bEeomkomUGcr6erN0Gv2C6k
 w6zEMvmuSpVtA7QBhs/qyp8shUC4E6DYjsLEmN9pFn95EyG+JRLVVfrJQ53mSSpBnCLD
 ITRUKQN9RYFpqI0HkEJaAC3IwYNcbbBMWw+qnfPI7He2YI048S5jAcXzRKY7eJmmIxLZ
 Pq/r5nHaipJUhkI2pNfNsV3BfICkkgAI97Z0rydVEs4pQSo5PbNPNcaj/AOeyyixV5/K
 4wIUSLZRoMgCiWaBKJs5fgE6bYlOO5WQs903sEWfE+p2y/C/qaH9KO7Njhobrc+0U25k
 fOPA==
X-Gm-Message-State: ACrzQf2MD0UQZ7xY9cJlvRaHoCgHe5sogn4eSGOSsZc4yfys9pn2fxpK
 f8IBgqusov7+Pyu6eKcU207S1aFIYVFv2+zhdOIicLW9axtnH3SAZ8h0Z5DLSGErZpyNLC7/Yzp
 RTNcmfjhZTDpi0bw=
X-Received: by 2002:a5d:47cc:0:b0:22c:86fe:ad94 with SMTP id
 o12-20020a5d47cc000000b0022c86fead94mr10947444wrc.599.1664209239860; 
 Mon, 26 Sep 2022 09:20:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pnB7bdDDo4PZbIFV5EbP/nAin8Klo1UzvD67XXguGT1GLHbH2eJnqcGoqfDAosiikkrgegA==
X-Received: by 2002:a5d:47cc:0:b0:22c:86fe:ad94 with SMTP id
 o12-20020a5d47cc000000b0022c86fead94mr10947426wrc.599.1664209239550; 
 Mon, 26 Sep 2022 09:20:39 -0700 (PDT)
Received: from [192.168.8.103] (tmo-064-141.customers.d1-online.com.
 [80.187.64.141]) by smtp.gmail.com with ESMTPSA id
 w21-20020a1cf615000000b003a604a29a34sm11241343wmc.35.2022.09.26.09.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 09:20:38 -0700 (PDT)
Message-ID: <7e906143-363e-7a15-885c-8f3f8e4636b1@redhat.com>
Date: Mon, 26 Sep 2022 18:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 37/54] tests/qtest: {ahci, ide}-test: Use relative path
 for temporary files for win32
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-38-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220925113032.1949844-38-bmeng.cn@gmail.com>
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
> These test cases uses "blkdebug:path/to/config:path/to/image" for
> testing. On Windows, absolute file paths contain the delimiter ':'
> which causes the blkdebug filename parser fail to parse filenames.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> 
> (no changes since v1)
> 
>   tests/qtest/ahci-test.c | 21 ++++++++++++++++++---
>   tests/qtest/ide-test.c  | 20 ++++++++++++++++++--
>   2 files changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index 1d5929d8c3..66652fed04 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -1833,7 +1833,7 @@ static void create_ahci_io_test(enum IOMode type, enum AddrMode addr,
>   
>   int main(int argc, char **argv)
>   {
> -    const char *arch;
> +    const char *arch, *base;
>       int ret;
>       int fd;
>       int c;
> @@ -1871,8 +1871,22 @@ int main(int argc, char **argv)
>           return 0;
>       }
>   
> +    /*
> +     * "base" stores the starting point where we create temporary files.
> +     *
> +     * On Windows, this is set to the relative path of current working
> +     * directory, because the absolute path causes the blkdebug filename
> +     * parser fail to parse "blkdebug:path/to/config:path/to/image".
> +     */
> +#ifndef _WIN32
> +    base = g_get_tmp_dir();
> +#else
> +    base = ".";
> +#endif
> +
>       /* Create a temporary image */
> -    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
> +    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", base);
> +    fd = g_mkstemp(tmp_path);
>       g_assert(fd >= 0);
>       if (have_qemu_img()) {
>           imgfmt = "qcow2";
> @@ -1889,7 +1903,8 @@ int main(int argc, char **argv)
>       close(fd);
>   
>       /* Create temporary blkdebug instructions */
> -    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
> +    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
> +    fd = g_mkstemp(debug_path);
>       g_assert(fd >= 0);
>       close(fd);

It would maybe make sense to merge this with patch 05 ("tests/qtest: 
ahci-test: Avoid using hardcoded /tmp") ? ... but if you want to keep it 
separate, that's fine for me, too.

Reviewed-by: Thomas Huth <thuth@redhat.com>


