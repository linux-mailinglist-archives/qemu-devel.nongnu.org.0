Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017B86A5A30
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0HC-0007nx-EF; Tue, 28 Feb 2023 08:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0H6-0007gQ-5J
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:44:13 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0H4-0002IY-7M
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:44:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id e37so7316933wri.10
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 05:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AwW/oRfOR3DEjVQSwIZ6xL3Vmd3fHPSnJlREv/kl3jk=;
 b=R6pi136pUFTc8rHCwYRad3toIIoC5ODrVSqrAD9/sNgwp74m9D933XtItuthixcBIB
 M8j9qi9SXqdrq5bLFmQN8ZtXtB4B9R7pbNwbb/CKbD4T8NkX66F3eunOKmuBbgreIDWw
 ffpAWtlnnHNStmPYQoDkplhUbmNINpAyCZXGnUHlSHiHPvlK1n9HZz/kz7Kn5j3+d+rk
 DvUfzs/fAJlVJlIzg3hpfgXqGhA9b4v5E9KxAjBrk2TWAZYzLzc7rzjCMwS2Ht5cQaEH
 jyyWXDM+6UdnVZy57IHcEqvmwPsOxRzvnFo0u3jKJHgk00xjXdH847gPxjjkYDh2LyeU
 ieTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AwW/oRfOR3DEjVQSwIZ6xL3Vmd3fHPSnJlREv/kl3jk=;
 b=mmovXFDCAV5g899XHE8/MvT7+Eb2pPZQ83x22jPFkcIS5xcUB40H+01PLLnTYDSlF6
 rfZXFYD54a4TFt1rQk4pyB42wEcJn/mbEDvsdq7+trVcLUBatfVdmRQTdITO6mSLAYEH
 IfJ+2l5DlmnoSM7hESvJ65EAnBtIsy88Yd9LW6ca0Ny2DHnSlxoyoxdZ6EU1lc41Av+d
 KxVu6+Y9ztFwXc8d/OdK5nxvVWMBpcGHPj8J7scoc3ZKntJjtPEFsoAh+CxxrLPiYKmw
 hQhSsy4GnfAsqtrQqjCX70VaR54rY9hOXw6d2dFoaTCH4lF7/PHgzLGYD39/CAYtjqoj
 PJwA==
X-Gm-Message-State: AO0yUKWPUj/kQp5/PkOD8VVO/qAQ+OMB2UADhFlZtPUnIrEFUBYxIMjZ
 pMucT+ec/RIYynO8vwxDQKqlfFWUeF6Xixq5
X-Google-Smtp-Source: AK7set8eN9TqWpBXTn8O0EwyTh8zqj6n7Iv9g2jnJ1PiZrXQIEQYZtczY4LOP7FQ5w5cSRHBKWol1w==
X-Received: by 2002:a5d:5604:0:b0:2c7:832:8fc0 with SMTP id
 l4-20020a5d5604000000b002c708328fc0mr2174717wrv.3.1677591848215; 
 Tue, 28 Feb 2023 05:44:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b002c5d3f0f737sm9787754wri.30.2023.02.28.05.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 05:44:07 -0800 (PST)
Message-ID: <f90891e3-2e46-ac7a-8b1e-4486a5ebcd20@linaro.org>
Date: Tue, 28 Feb 2023 14:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/14] hw: Use QOM macros and remove DO_UPCAST() uses
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@163.com>,
 Thomas Huth <thuth@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>,
 xiaoqiang zhao <zxq_yx_007@163.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
 <52d46551-3969-7ad6-8047-77fd4cf40bd7@linaro.org>
In-Reply-To: <52d46551-3969-7ad6-8047-77fd4cf40bd7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

(meanwhile, forgot to Cc Alex)

On 28/2/23 14:43, Philippe Mathieu-Daudé wrote:
> On 13/2/23 19:43, Philippe Mathieu-Daudé wrote:
> 
>> QOM housekeeping series which replace the DO_UPCAST() macro
>> uses by equivalent QOM ones. Also:
>> - Use DEVICE() macro
>> - Define some TYPE_xxx
>> - Define some type arrays using DEFINE_TYPES() macro
>> - Introduce abstract QOM (QDev) parent when relevant.
> 
>> Philippe Mathieu-Daudé (14):
>>    hw/char/serial-pci: Replace DO_UPCAST(PCISerialState) by PCI_SERIAL()
>>    hw/char/serial-pci-multi: Batch register types using DEFINE_TYPES
>>      macro
>>    hw/char/serial-pci-multi: Introduce PCI_MULTISERIAL QOM abstract
>>      parent
>>    hw/char/serial-pci-multi: Factor multi_serial_class_initfn() out
>>    hw/char/serial-pci-multi: Replace DO_UPCAST() by PCI_MULTISERIAL()
> 
>>    hw/ide/qdev: Replace DO_UPCAST(IDEDevice) by IDE_DEVICE()
>>    hw/ide/qdev: Replace DO_UPCAST(IDEBus) by IDE_BUS()
> 
>>    hw/net/ne2000-pci: Replace DO_UPCAST(PCINE2000State) by PCI_NE2000()
>>    hw/net/tulip: Finish QOM conversion
> 
>>    hw/pci/pci: Replace DO_UPCAST(PCIBus) by PCI_BUS()
> 
>>    hw/scsi/scsi-bus: Replace DO_UPCAST(SCSIBus) by SCSI_BUS()
>>    hw/scsi/scsi-bus: Inline two uses of scsi_bus_from_device()
> 
>>    hw/usb/dev-hub: Use QOM USB_HUB() macro instead of casting
>>    hw/usb: Replace DO_UPCAST(USBBus) by USB_BUS()
> 
> I'll respin as tiny series to help maintainers catch which patches
> belong to their areas.


