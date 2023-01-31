Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD95682F7C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:41:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMriC-0005at-JF; Tue, 31 Jan 2023 09:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMri9-0005ZO-Hy
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:34:13 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMri7-0001VI-Ou
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:34:13 -0500
Received: by mail-pl1-x62d.google.com with SMTP id v23so15264644plo.1
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 06:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D54DLt4YRviYnrI5QaUNzuTxNAIjevHrCkrv/ffBUi0=;
 b=YSSiN3dwNKGp5iSYCEFtvBHeiB9L4TrU5VULR/lqI4xBqBezLAFYZ2JSSKeHnXvWXY
 CkDxTF75/SL4OHiWD9YcZC/nbE5stugPpR83CFvsHlXZIZC1R8DW1CUlYodMYLs+mJNj
 d3Hv4FRpf+nGJ0K4KeIyxi93lJVyM9XrLCZjt2qL5HJKdhzYp0ipLVR/CHzLv+YluEgK
 4etHsIQkzSD1vaDhWQJYdzCMeYN0cYjgbCrTHOnFOvnDIhVa9KdJ7gvX2iJiMZekjCpZ
 cEXYzzXJdKhzRoLAyf6Av6FuzimYlFlfgF7qddNxX1Ng6IH/5jGwGLUuSwu2QNawLczV
 qmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D54DLt4YRviYnrI5QaUNzuTxNAIjevHrCkrv/ffBUi0=;
 b=klDD58TPmQxb3Et/OUg/IthcmOKmfGhB4I0scwyzbWqxmY8Kt8m0pxKj6PCh8tFGxY
 4mXoAPDkVz2IuS8W8vXqTuCw2j/2flDItLWxYefqw0vWXMjE9G/+acgGmaAEmekBNLLW
 WZSoONttDiclmmHlKuHrWNBzYeXSBJ29CxeRX529ZdiWJmhJltzUzeEvYkveU5bZ/2Jg
 YvLe+NTEkb/k8cl8gkG7F5kPvD6ymcYrGcpDLTRryIMO5G/6nSsHH5ZpfG9+Dray61IV
 lbLs0bcTQAGe+TdQkJH2OEBhVJ/XQSIF9Z6lSM8SnTDMwe9q8QY1xWfNrE8LtmxU6AXC
 ajmw==
X-Gm-Message-State: AO0yUKUme/wYFhA91e2L/57ZDxgrGD0Iz4uycArm5DvVXvtEkAgD2CRe
 8I86H0xYsIfZy6ARzCMSRiS8Ug==
X-Google-Smtp-Source: AK7set/1Y61b6qmAi3809zwSu9H7MHSE+eKBPhUNP3MwGQXAsWE+ApEy34IIa9sesr6WFJTzZoATJw==
X-Received: by 2002:a05:6a21:338a:b0:bc:36e4:4944 with SMTP id
 yy10-20020a056a21338a00b000bc36e44944mr20396846pzb.61.1675175649862; 
 Tue, 31 Jan 2023 06:34:09 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a170903249800b00195e6ea45a8sm9848819plw.305.2023.01.31.06.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 06:34:09 -0800 (PST)
Message-ID: <6b0ba291-37a4-eae6-9c68-742a5669e3b1@daynix.com>
Date: Tue, 31 Jan 2023 23:34:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 7/9] igb: Introduce qtest for igb device
To: Thomas Huth <thuth@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>
References: <20230130140809.78262-1-akihiko.odaki@daynix.com>
 <20230130140809.78262-8-akihiko.odaki@daynix.com>
 <56c0e734-ae48-f98d-2d1b-4957f4de243b@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <56c0e734-ae48-f98d-2d1b-4957f4de243b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/01/31 22:04, Thomas Huth wrote:
> On 30/01/2023 15.08, Akihiko Odaki wrote:
>> This change is derived from qtest for e1000e device.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   MAINTAINERS                             |   2 +
>>   tests/qtest/fuzz/generic_fuzz_configs.h |   5 +
>>   tests/qtest/igb-test.c                  | 243 ++++++++++++++++++++++++
>>   tests/qtest/libqos/igb.c                | 185 ++++++++++++++++++
>>   tests/qtest/libqos/meson.build          |   1 +
>>   tests/qtest/meson.build                 |   1 +
>>   6 files changed, 437 insertions(+)
>>   create mode 100644 tests/qtest/igb-test.c
>>   create mode 100644 tests/qtest/libqos/igb.c
> 
> The igb test code still looks very, very similar to the e1000e test code 
> ... would it be feasible to extend the e1000e code to support the igb 
> device instead of duplicating the code base here?
> 
>   Thomas
> 

I doubt it is worth as most of the duplicate code is more like 
boilerplate like registering qos nodes and tests. While such boilerplate 
code is currently identical except renamed identifiers, sharing it with 
e1000e and igb will prevent from changing the device configuration for 
one device (e.g., adding igbvf) or from adding tests specific to one device.

The core of the testing code which e.g. accesses registers is somewhat 
similar but diverged to the extent that it is hard to extract the 
commonalities. It is because the design of igb is diverged from e1000e 
to support more Rx/Tx queues and it changed the format of Rx/Tx descriptor.

Regards,
Akihiko Odaki

