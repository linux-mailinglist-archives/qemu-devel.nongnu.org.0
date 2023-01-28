Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B523567F7D7
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 13:47:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLkaZ-0000W5-H4; Sat, 28 Jan 2023 07:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLkaW-0000Vt-St
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 07:45:45 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLkaT-00038P-Df
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 07:45:44 -0500
Received: by mail-pj1-x1033.google.com with SMTP id o13so7140138pjg.2
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 04:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l55L8rftmxgLeTywbCJniPgpT79+8a7L41CxGkQLk6g=;
 b=XPkJPdTotiIsaa5FY+q2pkLyEn+xrz+jX8DUg0ytyMdzCk6x7CN9GFwKzX3i8uFOI3
 45GV8Tno1+qO9mQfivYzuX7+JUmLsheAkm5P++/eaHPvMgK+d+H2Sg/7kOSuc8NouGa5
 L8+mJrUxYFDAmnL3ikoWIjWzKSonl/zTekAIpb1kc7KzQisWB2zo3pIhKRNQ42hdS2op
 LoIqtyT1bHxOTbTyavK/bfjMu6A58b8jQs73fcIPyU/6amDDGzBaStcFML7Tjdgasq0b
 4L0Jl7uZRD1wYsCVam/A17jzZGBj8PH1fILMcNdp6Lg+1xp+4dwZPQx5L0JswI+oOv62
 zL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l55L8rftmxgLeTywbCJniPgpT79+8a7L41CxGkQLk6g=;
 b=zaC9Towkafwub2ovx/sEvzASSUONGL2/DVwgKPf1KB5d/RSxkiqgGW2IDjHz+9GJM2
 GrAK8GtZR1SYFnA4KJyjPW5xoNsXqmz8dMgSi7LT0p0NU6hATgiRLdto0cThC0Ar0ztH
 Ch2f5RuxnNAjeDizQTZ62iuGp7bvUlmKG/Xc3BTPEy0D/8izYRf90UMX8dFNg+imPTyo
 52xcKbTic6S31BY8rkTOeYHdGBMq8EU7+HtheUDUomN9YwyCakWzsuxmhzepZcFI+fmc
 zQXoV/4pES6McmkJHpynaFZjlEtZzjP/hkMHOB68My75sybVJ69V7SfVCQvBXcYYweiG
 ToPw==
X-Gm-Message-State: AO0yUKXf+z3aXAF2znLZNuL/znIVdE/CPjlLeJfle43CjeuF0wI15TFf
 kJHC32vW35XvrPMIFQDwMFpy1A==
X-Google-Smtp-Source: AK7set8/SPIo5DBsyLPj4D7Kl1u9GPfwbQD5m6PiaCJrgK8KvlpTgnDTYj04Qd/Ih3K/URPcVwQb+Q==
X-Received: by 2002:a17:902:d2c4:b0:196:3360:b09d with SMTP id
 n4-20020a170902d2c400b001963360b09dmr13702781plc.41.1674909936906; 
 Sat, 28 Jan 2023 04:45:36 -0800 (PST)
Received: from [10.4.162.76] ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a170902e84500b00194c6c63693sm4486224plg.80.2023.01.28.04.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 04:45:36 -0800 (PST)
Message-ID: <8b04c5f0-b33d-0f02-a8fd-de13a1b3040d@bytedance.com>
Date: Sat, 28 Jan 2023 20:45:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Re: [PATCH v3 00/12] Refactor cryptodev
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: arei.gonglei@huawei.com, berrange@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
References: <20230128035633.2548315-1-pizhenwei@bytedance.com>
 <20230128062802-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230128062802-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/28/23 19:30, Michael S. Tsirkin wrote:
> On Sat, Jan 28, 2023 at 11:56:21AM +0800, zhenwei pi wrote:
>> v3 -> v4:
>> - a small change in '0005-cryptodev-Introduce-query-cryptodev-QMP-command.patch':
>>    use 'uint32' instead of 'int' to describe CryptodevBackendClient:queue
> 
> what was the motivation for this change? we generally just use int
> unless width is important.
> 
Because we use uint32_t to describe the queues of a cryptodev:
struct CryptoDevBackendPeers {
     CryptoDevBackendClient *ccs[MAX_CRYPTO_QUEUE_NUM];
     uint32_t queues;
};

By the way, I also notice that 'int' and 'uint32_t' in several places, I 
think I need a followup patch to fix this(use 'uint32_t' only for queue 
index).

>> - fix compling warning(gcc)/error(clang-11) on 32 bit platform in
>>    '0007-hmp-add-cryptodev-info-command.patch':
>>    use 'printf("%u", client->queue)' instead of 'printf("%ld", client->queue)'
>>
> 
> Are you aware of PRIu64? And if you are going to print uint32 use PRIu32
> 
OK, I'll fix this in the next version.

>> v2 -> v3:
>> - rebase code against the lastest commist: fb7e7990342e59cf67d
>> - document the missing fields in qapi/cryptodev.json
>> - rework statistics part: use 'query-stats' command instead of
>>    'query-cryptodev'(cryptodev: Support query-stats QMP command)
>>
>> v1 -> v2:
>> - fix coding style and use 'g_strjoin()' instead of 'char services[128]'
>>     (suggested by Dr. David Alan Gilbert)
>> - wrapper function 'cryptodev_backend_account' to record statistics, and
>>     allocate sym_stat/asym_stat in cryptodev base class. see patch:
>>     'cryptodev: Support statistics'.
>> - add more arguments into struct CryptoDevBackendOpInfo, then
>>     cryptodev_backend_crypto_operation() uses *op_info only.
>> - support cryptodev QoS settings(BPS&OPS), both QEMU command line and QMP
>>     command works fine.
>> - add myself as the maintainer for cryptodev.
>>
>> v1:
>> - introduce cryptodev.json to describe the attributes of crypto device, then
>>     drop duplicated type declare, remove some virtio related dependence.
>> - add statistics: OPS and bandwidth.
>> - add QMP command: query-cryptodev
>> - add HMP info command: cryptodev
>> - misc fix: detect akcipher capability instead of exposing akcipher service
>>     unconditionally.
>>
>> Zhenwei Pi (12):
>>    cryptodev: Introduce cryptodev.json
>>    cryptodev: Remove 'name' & 'model' fields
>>    cryptodev: Introduce cryptodev alg type in QAPI
>>    cryptodev: Introduce server type in QAPI
>>    cryptodev: Introduce 'query-cryptodev' QMP command
>>    cryptodev-builtin: Detect akcipher capability
>>    hmp: add cryptodev info command
>>    cryptodev: Use CryptoDevBackendOpInfo for operation
>>    cryptodev: Account statistics
>>    cryptodev: support QoS
>>    cryptodev: Support query-stats QMP command
>>    MAINTAINERS: add myself as the maintainer for cryptodev
>>
>>   MAINTAINERS                     |   2 +
>>   backends/cryptodev-builtin.c    |  42 ++--
>>   backends/cryptodev-lkcf.c       |  19 +-
>>   backends/cryptodev-vhost-user.c |  13 +-
>>   backends/cryptodev-vhost.c      |   4 +-
>>   backends/cryptodev.c            | 419 ++++++++++++++++++++++++++++++--
>>   hmp-commands-info.hx            |  14 ++
>>   hw/virtio/virtio-crypto.c       |  48 +++-
>>   include/monitor/hmp.h           |   1 +
>>   include/sysemu/cryptodev.h      |  95 ++++----
>>   monitor/hmp-cmds.c              |  41 ++++
>>   monitor/qmp-cmds.c              |   2 +
>>   qapi/cryptodev.json             | 143 +++++++++++
>>   qapi/meson.build                |   1 +
>>   qapi/qapi-schema.json           |   1 +
>>   qapi/qom.json                   |   8 +-
>>   qapi/stats.json                 |  10 +-
>>   17 files changed, 743 insertions(+), 120 deletions(-)
>>   create mode 100644 qapi/cryptodev.json
>>
>> -- 
>> 2.34.1
> 

-- 
zhenwei pi

