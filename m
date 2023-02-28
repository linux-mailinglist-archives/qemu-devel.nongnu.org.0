Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B76A5A1F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:44:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0GN-00079X-8Z; Tue, 28 Feb 2023 08:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0GL-00079B-71
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:43:25 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0GJ-0002BI-JQ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:43:24 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso5885413wmp.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 05:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hnx8XU930VwcTz1fYkgVuD+TU7d/GP3Y19CY6vBSp2U=;
 b=aOceM3uzY+sANLRHN/n8Wpj5Kc+uxBUy6TxuS8ooW1rdKWlHqg3ewELXrDSR06Xzd9
 V7RQvHe8oi6oxhKG/KwWYRSp/IFePwJngg3fjxr1rJ9cQowjTOItHZfxpETCXKJGXZ/R
 TENHYNKTmbFP0CiNon4K6S7hJdJKY/LDPyKVciov2pG2Ui7Ubj/xXwfqkQSQGpu3j2Bi
 mIZgdmPYg/RKzIuETKT1tZXvv1/ct8AL1sS0nAUS1cFZ9Q5P3BRMERZPIYI55dH6o/5q
 M1sPvagxrZwGynNtZ+fLnzDKMtYxHhNSC0i39yosAz2wDlKO21tLvi05M7FbXAqmikX4
 V77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hnx8XU930VwcTz1fYkgVuD+TU7d/GP3Y19CY6vBSp2U=;
 b=YvZ0AECmwj56vaT2npKO756Dk0O6fqNHl+k3Fdnd59DEvq0E0KypfTQaK+YHpc7B5L
 s+b2+jHoXLD2wzcvlmI5bINK1WapSDXYcI6aiQv8minTAv9CVW0LnUWR9HFCNgcHfl0f
 MqznD3iiEeLb6lTO65Eg67nt8hc8r97xXhOXHbAjUrxjUT9ePN5wA1bPhXo5Zpof5iwB
 nhG8bWFvmuNTX7EQr/pKjyAG1LB64w9yMSP3QhwP7KbLc3cwR+jcjHhPKd+iDR6dq0uK
 VHyA4QSyWaHT0i8w6NBq8gL0dJ9rLXxzRtaDEIHIgETh2WNcTEYDPoKWj7rwF8dXsK1H
 ly5A==
X-Gm-Message-State: AO0yUKUPEfKZp4DmF3XvcV6V0X4xytNcKPMjjY4eI5oi8FwJN1X6ELru
 t+w7aVriXXx6yj1m/suO1fSJR/jdIxKXJ5u5
X-Google-Smtp-Source: AK7set9SSNPfxcgA4X27OR+ONn/MBmY3KjEH1OfXwC+xJvu5P3YViP8flU6zISpHfqYbw9nZRObXtw==
X-Received: by 2002:a05:600c:4f4a:b0:3ea:ed4d:38f6 with SMTP id
 m10-20020a05600c4f4a00b003eaed4d38f6mr2282131wmq.4.1677591801759; 
 Tue, 28 Feb 2023 05:43:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003dc4a47605fsm16366024wmk.8.2023.02.28.05.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 05:43:21 -0800 (PST)
Message-ID: <52d46551-3969-7ad6-8047-77fd4cf40bd7@linaro.org>
Date: Tue, 28 Feb 2023 14:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/14] hw: Use QOM macros and remove DO_UPCAST() uses
Content-Language: en-US
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@163.com>,
 Thomas Huth <thuth@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>,
 xiaoqiang zhao <zxq_yx_007@163.com>
References: <20230213184338.46712-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 13/2/23 19:43, Philippe Mathieu-Daudé wrote:

> QOM housekeeping series which replace the DO_UPCAST() macro
> uses by equivalent QOM ones. Also:
> - Use DEVICE() macro
> - Define some TYPE_xxx
> - Define some type arrays using DEFINE_TYPES() macro
> - Introduce abstract QOM (QDev) parent when relevant.

> Philippe Mathieu-Daudé (14):
>    hw/char/serial-pci: Replace DO_UPCAST(PCISerialState) by PCI_SERIAL()
>    hw/char/serial-pci-multi: Batch register types using DEFINE_TYPES
>      macro
>    hw/char/serial-pci-multi: Introduce PCI_MULTISERIAL QOM abstract
>      parent
>    hw/char/serial-pci-multi: Factor multi_serial_class_initfn() out
>    hw/char/serial-pci-multi: Replace DO_UPCAST() by PCI_MULTISERIAL()

>    hw/ide/qdev: Replace DO_UPCAST(IDEDevice) by IDE_DEVICE()
>    hw/ide/qdev: Replace DO_UPCAST(IDEBus) by IDE_BUS()

>    hw/net/ne2000-pci: Replace DO_UPCAST(PCINE2000State) by PCI_NE2000()
>    hw/net/tulip: Finish QOM conversion

>    hw/pci/pci: Replace DO_UPCAST(PCIBus) by PCI_BUS()

>    hw/scsi/scsi-bus: Replace DO_UPCAST(SCSIBus) by SCSI_BUS()
>    hw/scsi/scsi-bus: Inline two uses of scsi_bus_from_device()

>    hw/usb/dev-hub: Use QOM USB_HUB() macro instead of casting
>    hw/usb: Replace DO_UPCAST(USBBus) by USB_BUS()

I'll respin as tiny series to help maintainers catch which patches
belong to their areas.

