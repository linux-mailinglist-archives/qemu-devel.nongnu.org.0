Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3212B433C26
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:29:33 +0200 (CEST)
Received: from localhost ([::1]:40578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrzW-0003V3-Vs
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcrgH-00037r-N3
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:09:37 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcrgD-0005iE-E4
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:09:37 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t184so6819944pgd.8
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BmHhT6Eu1siEcsobY7Jr9GLQmBv2VeVAvYC4nxhtsPs=;
 b=NpOQTZCNGE9Z41MZx0qLDWI1d0GqG1FlYWdxcmRPgkrNMDt3AIa/ve/lOSwi22Tt8r
 A1fHsGY+3kA/YvbGrqX7gcoaPzXORlyRtrZEBny8Xzwb+o43f436hb1M95ZKtuLVMnvz
 0x3IbsNwrz2hpgkA0AEMw4IEiNLqhcBIsU6mGPw5cqqVLZPZufY3GEpZqsnE3XtNK5DI
 NsP8CT7VJhcoP04rduNQeyKpyMi2IcZI+aQmUXYTd00XafsPKqS5sA4O6d2F3h0oKUFu
 6NZoncw1LY5WKbRSNZCyHGcW8aRUuGRL5U1DW4GPKRd3ls9qd2Km/cgXNZET38vcWmwh
 GQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BmHhT6Eu1siEcsobY7Jr9GLQmBv2VeVAvYC4nxhtsPs=;
 b=GzTeh6F+ftSfiTxpStsBurnrLk8ILBtSN6dn1X0hdIG3CUBCC/23/i9G+WY3PSQNP9
 Y050NmEZ2Hz8+MwH/SNefwFfZmI8orCxR9LfXMxsQLHYxtCpVbT6IYaUmz+N2rNPuYHd
 Ubnwa6dKBdvakDUzJs9KWvbm2dhQsNv3RsG79kKF5PIIYhU9Mwg5q3Agxyq6JYxqpUrm
 2HBxk5vS+DbuX4GAp5gjCsycNwQiQOW8KNGsdM/e3byCTGcE8iHaYBAaMJkoGHCm7XQ7
 T6MbJ7FsuDDmukyQHFa6o0rxkpR6ZVllN5Qotu72hr88UVo5W2xGLC8CXLie1LtZMlC6
 EotA==
X-Gm-Message-State: AOAM5310X+BF+SSZ84TRlDqiDq4QtcxudfFbyjg1prWiyAv6Wsazst9b
 sY36ovMEEDJBg9uJJmRfQcxbAA==
X-Google-Smtp-Source: ABdhPJyDvY/sUHYqHhrPfa+utzkPLFtQ/Oo6ljNd9lc4/tuNs7nyEWkmw3iMpDgkxstVprG9LnB+2A==
X-Received: by 2002:aa7:8243:0:b0:44e:599:bfe8 with SMTP id
 e3-20020aa78243000000b0044e0599bfe8mr672730pfn.36.1634659771842; 
 Tue, 19 Oct 2021 09:09:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a11sm8638743pfv.11.2021.10.19.09.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 09:09:31 -0700 (PDT)
Subject: Re: [PATCH v5 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 mst@redhat.com, imammedo@redhat.com, philmd@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, ardb@kernel.org, drjones@redhat.com
References: <20211019080037.930641-1-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1571ebb-5d40-ebb4-04aa-c4701e98b684@linaro.org>
Date: Tue, 19 Oct 2021 09:09:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019080037.930641-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 1:00 AM, Eric Auger wrote:
> This series generates the ACPI DBG2 table along with machvirt.
> 
> The DBG2 specification can be found at
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.
> 
> DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
> behind is Windows requires it on all systems).
> 
> The DBG2 is used to describe a debug port, used by the kernel debugger.
> 
> The series can be found at:
> https://github.com/eauger/qemu.git
> branch: dbg2_v5
> 
> History:
> 
> v4 -> v5:
> - added Drew and Igor's R-b on patch 2.
> 
> v3 -> v4:
> - fix revision in header (0)
> - added Michael's R-b
> - address 2 minor style issues (Drew, Igor)
> 
> v2 -> v3:
> - addressed all comments from Igor on v2:
>    patches 2/3 swapped
>    style adjustments in "hw/arm/virt_acpi_build: Generate DBG2 table"
>    + more precision on spec references
> 
> v1 -> v2:
> - rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
>    and build_append_int_noprefix()
> 
> 
> Eric Auger (3):
>    tests/acpi: Add void table for virt/DBG2 bios-tables-test
>    hw/arm/virt_acpi_build: Generate DBG2 table
>    bios-tables-test: Generate reference table for virt/DBG2
> 
>   hw/arm/virt-acpi-build.c  |  63 +++++++++++++++++++++++++++++++++++++-
>   tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
>   2 files changed, 62 insertions(+), 1 deletion(-)
>   create mode 100644 tests/data/acpi/virt/DBG2

Thanks, applied to target-arm.next.

r~


