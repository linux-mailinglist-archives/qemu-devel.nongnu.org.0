Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3964E5217
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:19:48 +0100 (CET)
Received: from localhost ([::1]:54934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzxr-0001DD-HF
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:19:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWzhe-0007FB-8w
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:03:03 -0400
Received: from [2607:f8b0:4864:20::535] (port=37787
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWzhU-0006Sr-TU
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:02:59 -0400
Received: by mail-pg1-x535.google.com with SMTP id bc27so937617pgb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 05:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Cnwy7YkS16AX3papsisjAr2v4JbQ9Ju+S5vXD4BQkNY=;
 b=C6RWTfUAleZEzdAq8Xx0ieJFLbhT3U7x86lSoWH9pfr/eUGmPaBPq/ymqNBGcAk7sc
 eoPa6zoPAx2ay2jslutV3KF61l/Wrn5capBgm60m1bogXzoarObQRoOuDF/XTT2PgM3q
 OT/fzQSmQaesV4h8BysH5rrVN/243uFbAtEDoNQ70OiL6Rp01uVDgs9crWef88cx6uM+
 6jPlUOgsbxjkhWPwDA0Uk55rARXY33DMz1pDOlXDOZrO2GLPSlKDh9Cc4zifH2FC+F5t
 /LrR9WD8AYMvkGhNgBkVN27e73l5bKxEU2EhIwJ9dWhmyvervUPEWKF4VPp/jUVns+8D
 rX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cnwy7YkS16AX3papsisjAr2v4JbQ9Ju+S5vXD4BQkNY=;
 b=Oe1J1OlSpEr7DyVv8U6MEH3Cdm054BaLqJ0BP2982g5kO6VWjTAVECOyjdWXdFMV25
 IFSMNcuPzU6d0SN2L8SkS3L+kcKO2HxE0u9Br4+ZmbkKnoaHwvzVBHL5ORxSA5PN/nCg
 ZmzhxbPQ3VKJnw99KoJ0q+jYKZoHPPvi9xABeYIeWFR/5lPFE8rWVOGvqeAvThZacM0X
 32gpVd1T58ZccHSQKTnfx8/R9TXjV3QNXK3Yg48ovFRB8vGQoqtT5EMbI7S60a4J2JNj
 6A8kz8MZYGbUbcdQBZvcfnV6xgvaBUeONLRm4p+PNEOuDxJacJ6Qnwm8BX7JABZ34fG9
 fxrQ==
X-Gm-Message-State: AOAM532B0jEqoDlpq6dKQhOuqSNsf4lQ8mJdO2JHSB3aSn4h+Hesl3UH
 rNXiO62Su2axGC1CuUZFEnAblw==
X-Google-Smtp-Source: ABdhPJwzWPqJyMXkKxqJAZUuX9PpZbxcvgx6Mn6IAqlBSB5i3iZOF/ysZZZhLHXg0bpjfSK85QZ/Vw==
X-Received: by 2002:a05:6a00:2349:b0:4fa:934f:f6db with SMTP id
 j9-20020a056a00234900b004fa934ff6dbmr17601375pfj.44.1648036970868; 
 Wed, 23 Mar 2022 05:02:50 -0700 (PDT)
Received: from [10.255.146.117] ([139.177.225.224])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a056a0008ce00b004f66dcd4f1csm29187971pfu.32.2022.03.23.05.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 05:02:50 -0700 (PDT)
Message-ID: <47a85d1b-f1ed-bc93-2a6e-a0b9cb69d216@bytedance.com>
Date: Wed, 23 Mar 2022 19:59:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Re: [RESEND 1/2] qga: Introduce NVMe disk bus type
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, armbru@redhat.com, michael.roth@amd.com
References: <20220323101958.300848-1-pizhenwei@bytedance.com>
 <20220323101958.300848-2-pizhenwei@bytedance.com>
 <d1a01b0c-732d-9808-1a96-80a97fa27e30@gmail.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <d1a01b0c-732d-9808-1a96-80a97fa27e30@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/23/22 18:53, Philippe Mathieu-Daudé wrote:
> On 23/3/22 11:19, zhenwei pi wrote:
>> Assigning a NVMe disk by VFIO or emulating a NVMe controller by QEMU,
>> a NVMe disk get exposed in guest side. Support NVMe disk bus type and
>> implement posix version.
>>
>> Test PCI passthrough case:
>> ~#virsh qemu-agent-command buster '{"execute":"guest-get-disks"}' | jq
>>    ...
>>      {
>>        "name": "/dev/nvme0n1",
>>        "dependencies": [],
>>        "partition": false,
>>        "address": {
>>          "serial": "SAMSUNG MZQL23T8HCLS-00A07_S64HNE0N500076",
>>          "bus-type": "nvme",
>>          "bus": 0,
>>          "unit": 0,
>>          "pci-controller": {
>>            "bus": 0,
>>            "slot": 22,
>>            "domain": 0,
>>            "function": 0
>>          },
>>          "dev": "/dev/nvme0n1",
>>          "target": 0
>>        }
>>    ...
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   qga/commands-posix.c | 5 ++++-
>>   qga/qapi-schema.json | 3 ++-
>>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
>> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
>> index 94e4aacdcc..4ea2a50228 100644
>> --- a/qga/qapi-schema.json
>> +++ b/qga/qapi-schema.json
>> @@ -827,13 +827,14 @@
>>   # @mmc: Win multimedia card (MMC) bus type
>>   # @virtual: Win virtual bus type
>>   # @file-backed-virtual: Win file-backed bus type
>> +# @nvme: NVMe disks (since 7.0)
> 
> If this patch isn't merged soon, this will need to be updated.
> 
> BTW I think I already review this patch, anyhow:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks a lot! I'll update the version info if this patch is deferred.

-- 
zhenwei pi

