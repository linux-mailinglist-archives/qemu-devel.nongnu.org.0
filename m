Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531574804EA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 22:31:56 +0100 (CET)
Received: from localhost ([::1]:60786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1xb0-0001P4-88
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 16:31:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n1xW8-00077J-Rk
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 16:26:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n1xW5-0003fb-Op
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 16:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640640408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nA2YYtER/pIxbVF+sZswPX28wNxPLl+bccTF42ZH8Kk=;
 b=MvtFDpjKKvSbVWJxvOdK/C8hyAkSCI+CLIuBKQccDUWUwa8JqccQb+MyJzU4JkudmapFPY
 h27ebHR3CKc1E6zSOOhFZIW4AxuMbiAWSx00t9vfAnsIebMjA3qdECnrM24vExJ7Ish+xW
 21DXfbglrEsYwgsa+vGIQcOj3Ye44Ew=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-ourudBNPMLqipu19bwTkkg-1; Mon, 27 Dec 2021 16:26:47 -0500
X-MC-Unique: ourudBNPMLqipu19bwTkkg-1
Received: by mail-wr1-f70.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso3365764wra.18
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 13:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nA2YYtER/pIxbVF+sZswPX28wNxPLl+bccTF42ZH8Kk=;
 b=DEUTJMBbRg3KqTVQw7HezCv+AFoToWeRDW9pfc4Mdm3uosWup/zkWHF6r5GHjQApji
 JvDn/v51ihSqglvaZ41TOLcgOoF+m2mDAtjqwzh0wbc9hZoLJMK1yeYgSSbnlZvEDxhj
 MQHi1zlEqrHSGQyIpZRFmlvCAN1mChZBjPhgQSyt7oFT7cxvcJrNpfLzF/cOYT77TGiA
 SepVN7JOV4oG+8ModEFIDFVZv0K6fMKIee6JHNuFBJtbMMIpXH3luELtJhcrrIPbm02v
 IBdpnoEoR6M0G0NbrHm3izTjAI3qqp5riMeaDACJ2VyIQLPSUP8i3UBixNW6Zl1VirkI
 9dQQ==
X-Gm-Message-State: AOAM531Of7byaWzNWRJYHCv+XTwmW2kC8Hq8cdztzg3i4ISizyli5bVE
 N0A8+/0rr0MgjGhgu2VqYg49GwNvXaKGJBlWDcJqbdJ1l+bL7Kj27uBY2E7ao5iV/VMAwcZFEk4
 dFMM+hsPb0Q2sLN4=
X-Received: by 2002:a05:600c:34c4:: with SMTP id
 d4mr14847088wmq.53.1640640405909; 
 Mon, 27 Dec 2021 13:26:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYoiztUPxHuBSts9agPzXa74getfjSDiGaOMcG79AsA9+Q/KtBBUanH1ZqR7eQF9UqWw5r0Q==
X-Received: by 2002:a05:600c:34c4:: with SMTP id
 d4mr14847076wmq.53.1640640405675; 
 Mon, 27 Dec 2021 13:26:45 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id m12sm17375930wrp.49.2021.12.27.13.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Dec 2021 13:26:45 -0800 (PST)
Message-ID: <51e5d715-cf71-24b9-da10-cb539b4da6fc@redhat.com>
Date: Mon, 27 Dec 2021 22:26:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/4] acpi: fix QEMU crash when started with SLIC table
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20211227193120.1084176-1-imammedo@redhat.com>
 <20211227193120.1084176-2-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211227193120.1084176-2-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.575,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.363, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: serat@ucsd.edu, dlenski@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/27/21 20:31, Igor Mammedov wrote:
> if QEMU is started with used provided SLIC table blob,
> 
>   -acpitable sig=SLIC,oem_id='CRASH ',oem_table_id="ME",oem_rev=00002210,asl_compiler_id="",asl_compiler_rev=00000000,data=/dev/null
> it will assert with:
> 
>   hw/acpi/aml-build.c:61:build_append_padded_str: assertion failed: (len <= maxlen)
> 
> and following backtrace:
> 
>   ...
>   build_append_padded_str (array=0x555556afe320, str=0x555556afdb2e "CRASH ME", maxlen=0x6, pad=0x20) at hw/acpi/aml-build.c:61
>   acpi_table_begin (desc=0x7fffffffd1b0, array=0x555556afe320) at hw/acpi/aml-build.c:1727
>   build_fadt (tbl=0x555556afe320, linker=0x555557ca3830, f=0x7fffffffd318, oem_id=0x555556afdb2e "CRASH ME", oem_table_id=0x555556afdb34 "ME") at hw/acpi/aml-build.c:2064
>   ...
> 
> which happens due to acpi_table_begin() expecting NULL terminated
> oem_id and oem_table_id strings, which is normally the case, but
> in case of user provided SLIC table, oem_id points to table's blob
> directly and as result oem_id became longer than expected.
> 
> Fix issue by handling oem_id consistently and make acpi_get_slic_oem()
> return NULL terminated strings.
> 
> PS:
> After [1] refactoring, oem_id semantics became inconsistent, where
> NULL terminated string was coming from machine and old way pointer
> into byte array coming from -acpitable option. That used to work
> since build_header() wasn't expecting NULL terminated string and
> blindly copied the 1st 6 bytes only.
> 
> However commit [2] broke that by replacing build_header() with
> acpi_table_begin(), which was expecting NULL terminated string
> and was checking oem_id size.
> 
> 1) 602b45820 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> 2)
> Fixes: 4b56e1e4eb08 ("acpi: build_fadt: use acpi_table_begin()/acpi_table_end() instead of build_header()")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/786
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/core.c       | 4 ++--
>  hw/i386/acpi-build.c | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


