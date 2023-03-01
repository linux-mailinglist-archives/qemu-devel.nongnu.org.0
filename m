Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C2C6A65D6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:55:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCcS-00071Y-A6; Tue, 28 Feb 2023 21:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCcQ-00071N-8o
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:55:02 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCcN-0002J2-Mc
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:55:01 -0500
Received: by mail-pl1-x633.google.com with SMTP id n6so11173971plf.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c1VOpra6mFq7VgXvgjRDAZhU8UTLeFmzAMvP0wUEsH0=;
 b=Gq5Dr2vy4mDLVFSndXoH419uM6EI3Wtc7gjXDnI2/GHulhJ8WORCgReypifK3nmIHX
 tT8QYkkbvg8xuCKGm93/f1zsjCIDGE/BXCcMq2NhHxUOVZ0w89imx3Xz+JMIWvFbFqej
 OU6vPITWyXzTkpcRUBTcvGk7MZVdpv4oSyv1I4sdrdrvjyxlPlN+1Icg5M+XO9sckdQg
 4ps/LH8CHBfTVsai+kgSWAVpog5PlZTb/0GA6T3z/wBp4l6tc/Y85jXkZTa5K0m8rC+P
 kHhw9Hp3caQhnR+whFL2MPhwR2GJJFV+6v9H8BBePNfl0MYlqTek6YKWjZrNfgpvno6z
 /TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c1VOpra6mFq7VgXvgjRDAZhU8UTLeFmzAMvP0wUEsH0=;
 b=uqu6kIJXAuV8h8BeZD4unpAFO8Xam0okbjG5H5tYpBhT/orhoQQMQFy3JIb42zvVvV
 vFaXxvz8abCXsd6FM6Kr9CoPgTDwL0Aiet/kXu98AMeL5CJuwmijXeCCE9GGHB1uWQfK
 H1ylasUM7JX0qYYGJ/bYddOAh5/PyzuNBFspgwW0EIby+GYGeD5aGSP+jI2Pglw255CB
 TDuFY6vszsXIcd5nblQK4ahVpndg99vTpeI77NT5LLGVhLa4Luc9IlX+GXnknE+9/VoB
 1mkbWF/y51GiNsBn/hSbMCi8eUGU7yXouIZAdmrD2ZyOD4PM1eB0/wxGdq49rV3lts4e
 Hc4A==
X-Gm-Message-State: AO0yUKXWqfZ2Cp2arApANIByFGNqMOzgbQ52MJDkhX10eM8+o7+b0Bsy
 n8pMT2S6bBcsuJpI3BIRFziZsw==
X-Google-Smtp-Source: AK7set+wZLHNgVe9PivhbZ/T9UGkXBdmy3lNOJKAQ1eqGAoswIQM8V5SR//SMj8OgPI1nUsuB9Wlqw==
X-Received: by 2002:a17:902:d2ce:b0:19e:3b41:1828 with SMTP id
 n14-20020a170902d2ce00b0019e3b411828mr3375299plc.22.1677639297348; 
 Tue, 28 Feb 2023 18:54:57 -0800 (PST)
Received: from [10.3.43.196] ([61.213.176.14])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170902b78500b0019c922911a2sm7160437pls.40.2023.02.28.18.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 18:54:56 -0800 (PST)
Message-ID: <cdbd5949-7377-356a-a307-0b2314e1dae9@bytedance.com>
Date: Wed, 1 Mar 2023 10:53:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Re: [PATCH v4 11/12] cryptodev: Support query-stats QMP command
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: arei.gonglei@huawei.com, dgilbert@redhat.com, pbonzini@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
 <20230129025747.682282-12-pizhenwei@bytedance.com>
 <20230228075511-mutt-send-email-mst@kernel.org> <Y/3/AJqXD4aDdtrP@redhat.com>
 <20230228091303-mutt-send-email-mst@kernel.org> <Y/4N3br1nEAl4X9Q@redhat.com>
 <20230228095807-mutt-send-email-mst@kernel.org>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230228095807-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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



On 2/28/23 22:58, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 02:21:17PM +0000, Daniel P. Berrangé wrote:
>> On Tue, Feb 28, 2023 at 09:13:30AM -0500, Michael S. Tsirkin wrote:
>>> On Tue, Feb 28, 2023 at 01:17:52PM +0000, Daniel P. Berrangé wrote:
>>>> On Tue, Feb 28, 2023 at 07:56:14AM -0500, Michael S. Tsirkin wrote:
>>>>> On Sun, Jan 29, 2023 at 10:57:46AM +0800, zhenwei pi wrote:
>>>>>> Now we can use "query-stats" QMP command to query statistics of
>>>>>> crypto devices. (Originally this was designed to show statistics
>>>>>> by '{"execute": "query-cryptodev"}'. Daniel Berrangé suggested that
>>>>>> querying configuration info by "query-cryptodev", and querying
>>>>>> runtime performance info by "query-stats". This makes sense!)
>>>>>>
>>>>>> Example:
>>>>>> ~# virsh qemu-monitor-command vm '{"execute": "query-stats", \
>>>>>>     "arguments": {"target": "cryptodev"} }' | jq
>>>>>> {
>>>>>>    "return": [
>>>>>>      {
>>>>>>        "provider": "cryptodev",
>>>>>>        "stats": [
>>>>>>          {
>>>>>>            "name": "asym-verify-bytes",
>>>>>>            "value": 7680
>>>>>>          },
>>>>>>          ...
>>>>>>          {
>>>>>>            "name": "asym-decrypt-ops",
>>>>>>            "value": 32
>>>>>>          },
>>>>>>          {
>>>>>>            "name": "asym-encrypt-ops",
>>>>>>            "value": 48
>>>>>>          }
>>>>>>        ],
>>>>>>        "qom-path": "/objects/cryptodev0" # support asym only
>>>>>>      },
>>>>>>      {
>>>>>>        "provider": "cryptodev",
>>>>>>        "stats": [
>>>>>>          {
>>>>>>            "name": "asym-verify-bytes",
>>>>>>            "value": 0
>>>>>>          },
>>>>>>          ...
>>>>>>          {
>>>>>>            "name": "sym-decrypt-bytes",
>>>>>>            "value": 5376
>>>>>>          },
>>>>>>          ...
>>>>>>        ],
>>>>>>        "qom-path": "/objects/cryptodev1" # support asym/sym
>>>>>>      }
>>>>>>    ],
>>>>>>    "id": "libvirt-422"
>>>>>> }
>>>>>>
>>>>>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>>>>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>>>>
>>>>> I assume since this has been out a long time and no
>>>>> comments by maintainers it's ok from QAPI POV.
>>>>
>>>> I'm not the QAPI maintainer, but I think this worked out
>>>> pretty nicely compared to the previous versions of the
>>>> series which didn't use query-stats.. just a minor point
>>>> below.
>>>
>>> Hmm applied already ... is this ok to fix with patch on top
>>> or do I have to revert?
>>
>> Not a big deal. It'd be fine as a followup improvement if
>> zhenwei wants to submit a later cleanup.
>>
>> With regards,
>> Daniel
> 
> zhenwei can you confirm pls?
> 

Hi,
I noticed that Markus has already separated HMP commands from monitor/* 
into subsystems, so I need rework this part of this series.
I sent a new version which includes: 1, HMP part; 2, suggested by Daniel

>> -- 
>> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
>> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
>> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

-- 
zhenwei pi

