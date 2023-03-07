Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B136AE3AB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:02:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYoj-0003S4-Je; Tue, 07 Mar 2023 10:01:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZYoV-0003RI-TI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:01:17 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZYoU-0005eQ-Cp
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:01:15 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso10587399wmi.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 07:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678201273;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pDAWSr8kpIwBV/zpb0NGws8w5VjCGA8zlP2KHK3Jp44=;
 b=DOXGRLuLKfuhooyqnBR4Yivwz8hxVS4gkTsVJn6DzCzl+RctzWwvF8UgmnSVu9e7oP
 n4ZdR9xe9w0eYCMelhHhCPRl1Ygy5unO0kPWLGimUGbdMJG88fuVeCITFs6rPALJuUqf
 qWcsjDc3EelBAoQSnQCPPp0F9l6uaCDsbur0UDe+iNTXkDE355gR+ES0jFN1MopKlgVq
 N24hlKygJbG5Bs/zx8JfDRC1dWoEFlZo5WL0NH0SfySKlvB75RWFX5JZR9d7l5LvQcws
 +5jUh2jkLiYX9uNvNQ55KvnqIjAgp2NZQH2ATiNSpn38hdFIz+wDlqyZ1L8r8SVOrfKk
 GcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678201273;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pDAWSr8kpIwBV/zpb0NGws8w5VjCGA8zlP2KHK3Jp44=;
 b=n8Vuj7miAFT2hgrBVe4kgJFddnw4cqbE5p6wfF405QHZE/qFxOnJa6Hg5V3c5s0D/h
 XTzr9ko8XXh0otN5L0/vilnOHcKAXKTZezrc2hZPDOwQInWr4d75yOiBPdEEvEyIjDtk
 geMd31y+bOrux4KPbmKB78pj2/YHhDjvUMLFE7WfVvUwbkf35c9XsSy2rgfq92dy/qTS
 nLqME3ndMNGJzKgEQ/2edzdrZoStifVSPunrfUbxxBCFV8ngvm5iNadgSn9M4Ae3W93y
 PBCA+6jsZ0YAzalkZYfgDIXsm+1RNaG683FZ0HcoFTQpiXXX2w8uCUFwLcTHegyl/htr
 AVog==
X-Gm-Message-State: AO0yUKXGYp1ugWrDBGcRdvp2MpyKyxMSGVLKF6+ThA0XkWIA6b4FZ38Z
 Okk6NX53+PVvNTti9i0HsD2fbg==
X-Google-Smtp-Source: AK7set97KKdnTUuw5ixDwqnt0ymMAtGTOQ5BEY2FLpAMZrcGQYn0eWNJvs4xR1y9T/dqB7qGelZD6Q==
X-Received: by 2002:a05:600c:3549:b0:3eb:323e:de79 with SMTP id
 i9-20020a05600c354900b003eb323ede79mr13466235wmq.6.1678201272724; 
 Tue, 07 Mar 2023 07:01:12 -0800 (PST)
Received: from [192.168.248.175] (131.red-95-127-34.staticip.rima-tde.net.
 [95.127.34.131]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c431500b003daf672a616sm12949008wme.22.2023.03.07.07.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:01:12 -0800 (PST)
Message-ID: <67f67c63-3706-cb3f-94a8-beea99f62c05@linaro.org>
Date: Tue, 7 Mar 2023 16:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/2] MIPS Virt machine
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/3/23 23:38, Jiaxun Yang wrote:
> Hi there,
> 
> This patchset is to add a new machine type for MIPS architecture, which
> is purely a VirtIO machine.

> Jiaxun Yang (2):
>    hw/misc: Add MIPS Trickbox device
>    hw/mips: Add MIPS virt board
Thanks, applied with following changes:

- remove pointless mask in mips_trickbox_write(),
- declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE(),
- declare machine type using DEFINE_TYPES(),
- do not select PCI in Kconfig,
- compile virt.o using fdt flags in meson.build,
- use HWADDR_PRIx,
- name MachineState variable 'ms',
- fix conflict in docs/system/target-mips.rst,
- fix style

