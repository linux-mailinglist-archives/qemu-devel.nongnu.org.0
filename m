Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC23A68B339
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 01:25:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOpJY-0000bQ-7o; Sun, 05 Feb 2023 19:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pOpJW-0000b0-4D
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 19:24:54 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pOpJT-0000OM-6i
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 19:24:53 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so12001343pjq.1
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 16:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/06Cav0wb7hi23Toi34xSI0jlbDRwSb8E+vXUSowvXY=;
 b=dInqtYPiCBaCN+Cr2TPE+HFtVV8n5ZoI1w0PvDExg5PpqX/IONhYewn3z3UxrX7h+A
 sgK7ICcAc0cMfc0RYSz9tLVghLTPxkQf/FHvaHlGcydYZ5lDUiuym0H6DYWZfHIVEbSn
 8d5yaoYJfDKmjrwQABF+FEhdgLFpdkuPq3rhHa3W2MRgTj6knPurvt7o4RumMbV4bdUY
 9/DtLGMFpe6lJmBLXlLNKpNcWkhKv3jiG0AMqCmrN6OsrOtbxVBtmdjT5WQRwj54JvH8
 GbDfu4y5rB5bfsDMOQLD8WZyBD10jAzJOnQVKnmaubmcrqDaEfc+40RljFX8Z4kt1Man
 uFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/06Cav0wb7hi23Toi34xSI0jlbDRwSb8E+vXUSowvXY=;
 b=KkihqECesN0YkIAhx3OnlY+A5huKMq0N6gWkFaPTT3E/jq1YzgHgflDWkKTDtXz3+P
 igrXD0QCQDoc6/p6bV+DaxWJncI7TZ/VPegNvf03r4Opp2eGWtdelOP0ooEcnEnQ8/x+
 yFK6VXpE4GbNy4SnA5eCgf1jHpB44Z2/zcel2S+GemRuWkz0QKAvaMk7CGL0vA2oFOEf
 6BLCQ/1SwR33RWnzhp0WcNBg3BEVP26PkuOVyMy+BjlnOcY/r5CZj4Tj2DcpPlqMQsKB
 QuwFI3SLVPzFi68oxnZhpNm7vfY9JS1exB6bGUMsBmpaT0nSvREv9iM9+uw7SLcZWMBk
 kCuA==
X-Gm-Message-State: AO0yUKVVp5Do/3HubAzmjD1Q0lLLYZhudaz2Nhlsv+FnYqMzjY9WK9f1
 rQckuLy89tjffbqsjf7f2VyXBA==
X-Google-Smtp-Source: AK7set+/MJpaKxThUS9BkKyKnNuOIIQQIFntHSiXhSxDaJG4PyLqOe5RFs3cLiebj7z17AmajWW4Cw==
X-Received: by 2002:a17:902:f1ca:b0:199:7b4:8204 with SMTP id
 e10-20020a170902f1ca00b0019907b48204mr3038392plc.32.1675643085934; 
 Sun, 05 Feb 2023 16:24:45 -0800 (PST)
Received: from [10.3.43.196] ([61.213.176.9]) by smtp.gmail.com with ESMTPSA id
 12-20020a170902e9cc00b00178143a728esm3241778plk.275.2023.02.05.16.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 16:24:45 -0800 (PST)
Message-ID: <1a6df753-5286-dcfa-2e7b-87eb9c8b06f4@bytedance.com>
Date: Mon, 6 Feb 2023 08:23:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: PING: [PATCH v4 00/12] Refactor cryptodev
Content-Language: en-US
To: mst@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org, arei.gonglei@huawei.com,
 dgilbert@redhat.com, berrange@redhat.com, pbonzini@redhat.com
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230129025747.682282-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi Michael

Please correct me if I miss anything...

On 1/29/23 10:57, zhenwei pi wrote:
> v4 -> v5:
> - suggested by MST, use 'PRIu32' instead of '%u' to print a uint32_t value
> - correct *QCryptodevBackendClient* and *QCryptodevInfo* in qapi/cryptodev.json
> 
> v3 -> v4:
> - a small change in '0005-cryptodev-Introduce-query-cryptodev-QMP-command.patch':
>    use 'uint32' instead of 'int' to describe CryptodevBackendClient:queue
> - fix compling warning(gcc)/error(clang-11) on 32 bit platform in
>    '0007-hmp-add-cryptodev-info-command.patch':
>    use 'printf("%u", client->queue)' instead of 'printf("%ld", client->queue)'
> 
> v2 -> v3:
> - rebase code against the lastest commist: fb7e7990342e59cf67d
> - document the missing fields in qapi/cryptodev.json
> - rework statistics part: use 'query-stats' command instead of
>    'query-cryptodev'(cryptodev: Support query-stats QMP command)
> 
> v1 -> v2:
> - fix coding style and use 'g_strjoin()' instead of 'char services[128]'
>     (suggested by Dr. David Alan Gilbert)
> - wrapper function 'cryptodev_backend_account' to record statistics, and
>     allocate sym_stat/asym_stat in cryptodev base class. see patch:
>     'cryptodev: Support statistics'.
> - add more arguments into struct CryptoDevBackendOpInfo, then
>     cryptodev_backend_crypto_operation() uses *op_info only.
> - support cryptodev QoS settings(BPS&OPS), both QEMU command line and QMP
>     command works fine.
> - add myself as the maintainer for cryptodev.
> 
> v1:
> - introduce cryptodev.json to describe the attributes of crypto device, then
>     drop duplicated type declare, remove some virtio related dependence.
> - add statistics: OPS and bandwidth.
> - add QMP command: query-cryptodev
> - add HMP info command: cryptodev
> - misc fix: detect akcipher capability instead of exposing akcipher service
>     unconditionally.
> 
> Zhenwei Pi (12):
>    cryptodev: Introduce cryptodev.json
>    cryptodev: Remove 'name' & 'model' fields
>    cryptodev: Introduce cryptodev alg type in QAPI
>    cryptodev: Introduce server type in QAPI
>    cryptodev: Introduce 'query-cryptodev' QMP command
>    cryptodev-builtin: Detect akcipher capability
>    hmp: add cryptodev info command
>    cryptodev: Use CryptoDevBackendOpInfo for operation
>    cryptodev: Account statistics
>    cryptodev: support QoS
>    cryptodev: Support query-stats QMP command
>    MAINTAINERS: add myself as the maintainer for cryptodev
> 
>   MAINTAINERS                     |   2 +
>   backends/cryptodev-builtin.c    |  42 ++--
>   backends/cryptodev-lkcf.c       |  19 +-
>   backends/cryptodev-vhost-user.c |  13 +-
>   backends/cryptodev-vhost.c      |   4 +-
>   backends/cryptodev.c            | 419 ++++++++++++++++++++++++++++++--
>   hmp-commands-info.hx            |  14 ++
>   hw/virtio/virtio-crypto.c       |  48 +++-
>   include/monitor/hmp.h           |   1 +
>   include/sysemu/cryptodev.h      |  95 ++++----
>   monitor/hmp-cmds.c              |  42 ++++
>   monitor/qmp-cmds.c              |   2 +
>   qapi/cryptodev.json             | 143 +++++++++++
>   qapi/meson.build                |   1 +
>   qapi/qapi-schema.json           |   1 +
>   qapi/qom.json                   |   8 +-
>   qapi/stats.json                 |  10 +-
>   17 files changed, 744 insertions(+), 120 deletions(-)
>   create mode 100644 qapi/cryptodev.json
> 

-- 
zhenwei pi

