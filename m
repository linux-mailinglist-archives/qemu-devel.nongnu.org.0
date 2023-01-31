Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38BF683024
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:00:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMrl9-0007O1-IO; Tue, 31 Jan 2023 09:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrks-0007CG-Az
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:37:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrkp-00028m-Pr
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675175815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrHKrGojpqKEPk4KKzPHxVAuJk/GgEAP/NontHHN0qI=;
 b=GYufk5ugNSYkMjvCAM5mqhispt56JtmsmzTgvtu8v52XJ05oay/o+VC9UbgTyqtBLOZigz
 kv9myKczHe1IHz/QOWjZnd/9+BCWtxdUo7nqZVqR61p7KBkR0ifcZoiuJIQnqkpK+ZbcrA
 gb4yDcGqwjCIYOUayLsRnLCPPRy9O/U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-12-W_oyrTExMH-x3AlNGeIrmw-1; Tue, 31 Jan 2023 09:36:54 -0500
X-MC-Unique: W_oyrTExMH-x3AlNGeIrmw-1
Received: by mail-qk1-f198.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso9318240qkp.20
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 06:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wrHKrGojpqKEPk4KKzPHxVAuJk/GgEAP/NontHHN0qI=;
 b=K4f+zZZEkLQ9Iy7GzOQmZmwlEqwKNkycy8E1F4Hescv1lcSLJgID2SA6F0/QE+zJyq
 faasU/258sJbbfO28Qs7aDaR+Jz/RvOLldOlbS2mIxbjbSbOzfQj6HQjlS7enuBgId6X
 bwI/JTH21x3poisU40cGQnSmt3CHTrK697vVt6hav7OLqCkuqQcjt6BU9QjXI0AsRmYy
 d5nqtNf/Kaa62OaYazeHKy3fYmViXZhNY1Nvt1r+RbQd7VuudjGk3SiO2byDR4W9E4Ul
 yrr+7HXDlm+9+M/Ke2lg4o2jZRLXKphKYrPI4JhDd+ekke594Xudj1FeWRDcYJZziVQV
 ToZw==
X-Gm-Message-State: AO0yUKX8em5A/F9YyorCPd2drPcJU71CWc5bb3AWr8E+gzWDEwZHoBlu
 P134H/+hF4avHHHHveGVqj8QRP1HN8fFeSdUbhZh0KR0tPxeaNZYFoQocdxQHN7sv3mwuvG8+qU
 hrGRX44ZLXDS+vP8=
X-Received: by 2002:a05:622a:1a0c:b0:3b8:ea00:7021 with SMTP id
 f12-20020a05622a1a0c00b003b8ea007021mr9104083qtb.28.1675175813649; 
 Tue, 31 Jan 2023 06:36:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/hdegbLn1zmgr1g6MSIwd/dt8QfsZgkwWGLBHGVruguftFE0/jvIw0lWWXpC7t3majEtmGLA==
X-Received: by 2002:a05:622a:1a0c:b0:3b8:ea00:7021 with SMTP id
 f12-20020a05622a1a0c00b003b8ea007021mr9104037qtb.28.1675175813359; 
 Tue, 31 Jan 2023 06:36:53 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac80085000000b003b323387c1asm18665qtg.18.2023.01.31.06.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 06:36:52 -0800 (PST)
Message-ID: <24b776bf-8c7e-29a9-e5c2-4a8c2a10722a@redhat.com>
Date: Tue, 31 Jan 2023 15:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 7/9] igb: Introduce qtest for igb device
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
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
 <6b0ba291-37a4-eae6-9c68-742a5669e3b1@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <6b0ba291-37a4-eae6-9c68-742a5669e3b1@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 31/01/2023 15.34, Akihiko Odaki wrote:
> On 2023/01/31 22:04, Thomas Huth wrote:
>> On 30/01/2023 15.08, Akihiko Odaki wrote:
>>> This change is derived from qtest for e1000e device.
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>   MAINTAINERS                             |   2 +
>>>   tests/qtest/fuzz/generic_fuzz_configs.h |   5 +
>>>   tests/qtest/igb-test.c                  | 243 ++++++++++++++++++++++++
>>>   tests/qtest/libqos/igb.c                | 185 ++++++++++++++++++
>>>   tests/qtest/libqos/meson.build          |   1 +
>>>   tests/qtest/meson.build                 |   1 +
>>>   6 files changed, 437 insertions(+)
>>>   create mode 100644 tests/qtest/igb-test.c
>>>   create mode 100644 tests/qtest/libqos/igb.c
>>
>> The igb test code still looks very, very similar to the e1000e test code 
>> ... would it be feasible to extend the e1000e code to support the igb 
>> device instead of duplicating the code base here?
>>
>>   Thomas
>>
> 
> I doubt it is worth as most of the duplicate code is more like boilerplate 
> like registering qos nodes and tests. While such boilerplate code is 
> currently identical except renamed identifiers, sharing it with e1000e and 
> igb will prevent from changing the device configuration for one device 
> (e.g., adding igbvf) or from adding tests specific to one device.
> 
> The core of the testing code which e.g. accesses registers is somewhat 
> similar but diverged to the extent that it is hard to extract the 
> commonalities. It is because the design of igb is diverged from e1000e to 
> support more Rx/Tx queues and it changed the format of Rx/Tx descriptor.

Ok, fair point.

Acked-by: Thomas Huth <thuth@redhat.com>


