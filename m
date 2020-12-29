Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E782E72E7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 19:07:16 +0100 (CET)
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuJOt-0001Ih-PS
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 13:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kuJMq-0008Rh-6L
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 13:05:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kuJMm-0005yd-Mo
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 13:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609265103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7psoKIJum9K88UjYczP8FUCH2GCg19QWqjbM1I7/sfE=;
 b=JHOTWPn+6SAvPyL3rzor7CSuPWJn6Jk47+MaH4D/8CoMLoMHGI/dRYXwqcDNSTLZTKjPbt
 kQx4dtz4b59XSI1a/pbXTz9GilK2j1EGXORYnzzdtTWUCpk2Z5JvvTNs33FZcChViZt0SB
 +f3wyJRi+F7IuzPbaO2Jere64Gxfzfk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-Hqt8sdY5N3e3q2UX3Fm2ZA-1; Tue, 29 Dec 2020 13:05:01 -0500
X-MC-Unique: Hqt8sdY5N3e3q2UX3Fm2ZA-1
Received: by mail-wr1-f71.google.com with SMTP id r11so8020407wrs.23
 for <qemu-devel@nongnu.org>; Tue, 29 Dec 2020 10:05:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7psoKIJum9K88UjYczP8FUCH2GCg19QWqjbM1I7/sfE=;
 b=JEIT5lQFzUou9zvRjqrFNzZYVy90F7rLOSQx9wH79cDPGrB3CCd8Qg+ct7DrUMezkZ
 aYSSQ15GD4lLheD/DjncoW+LxAG8CKbDmav8XNaQe1uNk40/BqEYYjxjvsnM7NY4bNu+
 lZSqw25JOdub8OfHjRWIYwIEr4Jd2XGFhyuhxZaVx8kzq1CWWZRjcGlGlE60W1QAexDJ
 jdYgAFdoHfSCvVR0ERL7HE4r/36vZgRMTWmPqyv+nCjzbMMVSjHbaIIZ3KFgXoQuu0Aa
 VnQu44tH7D/6dZO7DGDSPLoGpfKcreuGUFdSZnjTj7NcDff69DUQW9L8OlE9yuW2YDYw
 LzGA==
X-Gm-Message-State: AOAM531nfPpuWlyMp1CeHX4RVtFFuHG2H6DurxMtZX1S3WO3cIKKZbdi
 cHUITOTfcRCwXzrf4w4cOXtZTCNaR9IJH2G9PsRpp4x16UPnPrB28TSXb2mnBU/AauZniB7mMC+
 SKIvGLPLXgXEDi2M=
X-Received: by 2002:adf:aad3:: with SMTP id i19mr56226290wrc.119.1609265100155; 
 Tue, 29 Dec 2020 10:05:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC/sCMUuiG352WfSitrPaF8QiR2cwvaS1lbDzGS5OkWdG7mcij0Y4eHwEYpoAWYRyFCuZJfQ==
X-Received: by 2002:adf:aad3:: with SMTP id i19mr56226269wrc.119.1609265099884; 
 Tue, 29 Dec 2020 10:04:59 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id z3sm64902445wrn.59.2020.12.29.10.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 10:04:59 -0800 (PST)
Subject: Re: [PATCH] Deprecate pmem=on with non-DAX capable backend file
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20201229172900.571309-1-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <328c04e7-4ddb-82f6-16e4-ce8f692ff753@redhat.com>
Date: Tue, 29 Dec 2020 19:04:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201229172900.571309-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.07, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: libvir-list@redhat.com, haozhong.zhang@intel.com,
 yi.z.zhang@linux.intel.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/29/20 6:29 PM, Igor Mammedov wrote:
> It is not safe to pretend that emulated NVDIMM supports
> persistence while backend actually failed to enable it
> and used non-persistent mapping as fall back.
> Instead of falling-back, QEMU should be more strict and
> error out with clear message that it's not supported.
> So if user asks for persistence (pmem=on), they should
> store backing file on NVDIMM.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  docs/system/deprecated.rst | 14 ++++++++++++++
>  util/mmap-alloc.c          |  3 +++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index bacd76d7a5..ba4f6ed2fe 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -327,6 +327,20 @@ The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
>  to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
>  machines have been renamed ``raspi2b`` and ``raspi3b``.
>  
> +Backend options
> +---------------
> +
> +Using non-persistent backing file with pmem=on (since 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +This option is used when ``memory-backend-file`` is consumed by emulated NVDIMM
> +device. However enabling ``memory-backend-file.pmem`` option, when backing file
> +is not DAX capable or not on a filesystem that support direct mapping of persistent

Maybe clearer enumerating? As:
"is a) not DAX capable or b) not on a filesystem that support direct
mapping of persistent"

> +memory, is not safe and may lead to data loss or corruption in case of host crash.
> +Using pmem=on option with such file will return error, instead of a warning.

Not sure the difference between warn/err is important in the doc.

> +Options are to move backing file to NVDIMM storage or modify VM configuration
> +to set ``pmem=off`` to continue using fake NVDIMM without persistence guaranties.

Maybe:

The possibilities to continue using fake NVDIMM (without persistence
guaranties) are:
- move backing file to NVDIMM storage
- modify VM configuration to set ``pmem=off``

> +
>  Device options
>  --------------
>  
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 27dcccd8ec..d226273a98 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -20,6 +20,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/mmap-alloc.h"
>  #include "qemu/host-utils.h"
> +#include "qemu/error-report.h"
>  
>  #define HUGETLBFS_MAGIC       0x958458f6
>  
> @@ -166,6 +167,8 @@ void *qemu_ram_mmap(int fd,
>                      "crash.\n", file_name);
>              g_free(proc_link);
>              g_free(file_name);
> +            warn_report("Deprecated using non DAX backing file with"
> +                        " pmem=on option");

Maybe "Using non DAX backing file with 'pmem=on' option is deprecated"?

Beside the nitpicking comments,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>          }
>          /*
>           * if map failed with MAP_SHARED_VALIDATE | MAP_SYNC,
> 


