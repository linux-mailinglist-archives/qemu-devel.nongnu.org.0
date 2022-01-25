Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56249AE76
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:52:14 +0100 (CET)
Received: from localhost ([::1]:55480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHYj-0005fQ-0x
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:52:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCH0q-0002gN-8N
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:17:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCH0n-0001gu-PL
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643098628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QowzXW3+zgILZlg+DAjYJz1IvhbppaLPnBfYtM/T8Js=;
 b=XOI5dSgT25WL5a5T1xxNunC4bnSTh/egPb5c3clEK8Mk7obVOZwnggzsX2rnzM2Lxu/Ubh
 pcYnSnXCayT4A2bHPHpM+ITO61nsavwVNeYVWk2G03BaLE8/G/8iSZCUbwKQjfvcjjPInB
 EcmMDmJXFNiMKnkI69ZyjpwUmk1v0zA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-FtQvQ7JTMsKa9MBKciZn6Q-1; Tue, 25 Jan 2022 03:17:07 -0500
X-MC-Unique: FtQvQ7JTMsKa9MBKciZn6Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 i16-20020adfa510000000b001d7f57750a6so2651988wrb.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 00:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QowzXW3+zgILZlg+DAjYJz1IvhbppaLPnBfYtM/T8Js=;
 b=JoG2XbrR0fW9xSMav+1j7vs6w6wHRP+G5hcVuRwpOI1gj5lU01cCL+6ZLTaGIPqiX0
 pu8LJKoVukGi72TGGPmrm0is+O443DXf+q381Smsl1+gnwZbxd2EdUwyzOMpH2I3+JRf
 vg0fqEU7cOnkr9QYSVNV65uRF7NFvajiLGGNLEbWd0e8+6p/4RXGtHnK21KrqxsFnGLY
 aL5qgr8jTpWOf7jr9BRtASztoPRcSUiPGBlpov3wBxNW5egyHpplamAiUGzI0xmdEHdL
 oyglIgLxz6bl4EAHNW6cARRsYxy7mbNJLuLc4Gh00TqaL68sCWPnzzzapc9s6phX7g6t
 ryrQ==
X-Gm-Message-State: AOAM532Eou3qXBaKsC265fEaMcEfCQH2ju/0oHzz4Y6tPY/sU8bfVDkw
 5hmwyu+/sAjsibn3GzqQMjneoQD0XFMVmk4792ErRdR+WCSJ2fqNvi/DnYuZfjiZikBRpYFJvet
 m9HThjnmX51U7294=
X-Received: by 2002:a1c:4407:: with SMTP id r7mr1794586wma.112.1643098626596; 
 Tue, 25 Jan 2022 00:17:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxY3TrGBm6O9md4aZQ0yCgfKisZIPixjV07ZaGeCTYDBxpIO+nNSR/4g49X/ypZ7eEJEcY/fw==
X-Received: by 2002:a1c:4407:: with SMTP id r7mr1794573wma.112.1643098626396; 
 Tue, 25 Jan 2022 00:17:06 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id d9sm17060642wrp.14.2022.01.25.00.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 00:17:05 -0800 (PST)
Message-ID: <9e8b013c-5340-0cd4-0bee-7b48ba4dc525@redhat.com>
Date: Tue, 25 Jan 2022 09:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 12/22] plugins: stxp test case from Aaron (!upstream)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220124201608.604599-13-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, minyihh@uci.edu,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, Alexandre Iooss <erdnaxe@crans.org>,
 ma.mandourr@gmail.com, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2022 21.15, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
> Message-ID: <YXCA62xdRDeueQR6@strawberry.localdomain>
> 
> ---
> [AJB] this was for testing, I think you can show the same stuff with
> the much more complete execlog now.
> ---
>   contrib/plugins/stxp-plugin.c     | 50 +++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/stxp.c          | 28 +++++++++++++++++
>   contrib/plugins/Makefile          |  1 +
>   tests/tcg/aarch64/Makefile.target |  3 ++
>   4 files changed, 82 insertions(+)
>   create mode 100644 contrib/plugins/stxp-plugin.c
>   create mode 100644 tests/tcg/aarch64/stxp.c
> 
> diff --git a/contrib/plugins/stxp-plugin.c b/contrib/plugins/stxp-plugin.c
> new file mode 100644
> index 0000000000..432cf8c1ed
> --- /dev/null
> +++ b/contrib/plugins/stxp-plugin.c
> @@ -0,0 +1,50 @@
> +#include <stdio.h>
> +#include <stdarg.h>
> +#include <qemu-plugin.h>
> +
> +QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
> +
> +void qemu_logf(const char *str, ...)
> +{
> +    char message[1024];
> +    va_list args;
> +    va_start(args, str);
> +    vsnprintf(message, 1023, str, args);
> +
> +    qemu_plugin_outs(message);
> +
> +    va_end(args);
> +}
> +
> +void before_insn_cb(unsigned int cpu_index, void *udata)
> +{
> +    uint64_t pc = (uint64_t)udata;
> +    qemu_logf("Executing PC: 0x%" PRIx64 "\n", pc);
> +}
> +
> +static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo, uint64_t va, void *udata)

Could you please break the line to avoid checkpatch errors:

ERROR: line over 90 characters
#63: FILE: contrib/plugins/stxp-plugin.c:25:
+static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo, 
uint64_t va, void *udata)

ERROR: line over 90 characters
#77: FILE: contrib/plugins/stxp-plugin.c:39:
+        qemu_plugin_register_vcpu_insn_exec_cb(insn, before_insn_cb, 
QEMU_PLUGIN_CB_R_REGS, (void *)pc);

ERROR: line over 90 characters
#78: FILE: contrib/plugins/stxp-plugin.c:40:
+        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb, 
QEMU_PLUGIN_CB_NO_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);

ERROR: "(foo*)" should be "(foo *)"
#78: FILE: contrib/plugins/stxp-plugin.c:40:
+        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb, 
QEMU_PLUGIN_CB_NO_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);

total: 4 errors, 1 warnings, 92 lines checked

  Thanks,
   Thomas


