Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A6462B125
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 03:15:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov7vz-0002pV-Ao; Tue, 15 Nov 2022 21:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1ov7vx-0002pH-7q
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 21:13:49 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1ov7vt-0006Id-JT
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 21:13:48 -0500
Received: by mail-pg1-x530.google.com with SMTP id n17so7705699pgh.9
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 18:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZbNRtacG1oIgWGu2Y8PacwLvqasw3FamfK/2rjQDAhY=;
 b=fidLkiL9EwQhq6ivBDVOHfgyTOuadQnRtNXB3BXHQtwht0Naat4VxUUxBYkRjW1F5+
 ubKq+0FtzmXa+P75G1n2AS97XV9ahmruE7V0FOtSlO1+VbP8+UsCR27PBgtHjaGz6YVT
 u+fpiNB16iNCNKULhulEisX7J4Y8kqoYEBrtISW2W+Y9/dQH2peRwuATUR8rn8n2TBQp
 fnPxMGzkdkO2zz5cGo7uJAvFcEcWVhCzVsxfSiJetuBK5DAf5aUm1ynVQT2ozV50WAiM
 ZztwI66Wj4wV+qFCxzlAub/3ZIFBHt8vSX6TP1kHCAFVBvW7pngPlJlOkYQRSTnows1+
 rTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbNRtacG1oIgWGu2Y8PacwLvqasw3FamfK/2rjQDAhY=;
 b=PblLsXDl0cEoBlJnzCUEVEsw0YT1InDDg0JJJu/Ft1oiEZAFO6ldy7NATvyehZtgcA
 TDtdyUNlsiDYbxYjVCYr4b35eB5FUP1uskn3OGVo29APeASdiVpec+FKjc0NOIeSJSZH
 xK44KRrISuA+uoflUu/xcFyE7Y2gKkNSSdmzuRqozVimMxxLgp+X3jDCTDcvGHj61ji4
 0J8l5FTEQEv9OHp0BafHXeuNyk6/ROEeBSuFEtHK25v6z4SGRMXIOWUxn4wXPr07e8Px
 iTJP2UmuJOcaazUe6bGBGH5zZhzVzCxVJx99wKevO3kvRt+e1mNksYoA/jTbjZd1Rftu
 V+aA==
X-Gm-Message-State: ANoB5plBid0zY1QnUg7+dPDo4XXIXOJciTJs+X5ode3t6GabdqV0He7P
 OtS1tlpHb7IF0cYd/EV70ocqWg==
X-Google-Smtp-Source: AA0mqf6GWGpZoEFePw3WISVTRajPvPV+CCsMiC0lJpj4CuUfyyvOdSc//CooWwGcozBckw4v5oB/zQ==
X-Received: by 2002:a05:6a00:1f13:b0:567:546c:718b with SMTP id
 be19-20020a056a001f1300b00567546c718bmr21129806pfb.17.1668564822989; 
 Tue, 15 Nov 2022 18:13:42 -0800 (PST)
Received: from [10.255.131.232] ([139.177.225.246])
 by smtp.gmail.com with ESMTPSA id
 12-20020a630c4c000000b0047063eb4098sm8487325pgm.37.2022.11.15.18.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 18:13:42 -0800 (PST)
Message-ID: <d9715f21-6751-85b9-c02a-5edaaf9cade5@bytedance.com>
Date: Wed, 16 Nov 2022 10:17:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: PING: [PATCH for 8.0 0/8] Refactor cryptodev
To: arei.gonglei@huawei.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, eblake@redhat.com,
 michael.roth@amd.com, armbru@redhat.com, mst@redhat.com
References: <20221111064553.246932-1-pizhenwei@bytedance.com>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20221111064553.246932-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x530.google.com
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

Hi, Lei

Dr. David Alan Gilbert has already reviewed the hmp part, could you 
please review the cryptodev/virtio-crypto part?

I volunteer to co-maintain the cryptodev part, I'd like to add myself as 
cryptodev maintainer in the next version, do you have any suggestion?

On 11/11/22 14:45, zhenwei pi wrote:
> The main changes in this series:
> - introduce cryptodev.json to describe the attributes of crypto device, then
>    drop duplicated type declare, remove some virtio related dependence.
> - add statistics: OPS and bandwidth.
> - add QMP command: query-cryptodev
> - add HMP info command: cryptodev
> - misc fix: detect akcipher capability instead of exposing akcipher service
>    unconditionally.
> 
> Zhenwei Pi (8):
>    cryptodev: Introduce cryptodev.json
>    cryptodev: Remove 'name' & 'model' fields
>    cryptodev: Introduce cryptodev alg type in QAPI
>    cryptodev: Introduce server type in QAPI
>    cryptodev: Introduce 'query-cryptodev' QMP command
>    cryptodev: Support statistics
>    cryptodev-builtin: Detect akcipher capability
>    hmp: add cryptodev info command
> 
>   MAINTAINERS                     |   1 +
>   backends/cryptodev-builtin.c    |  46 +++++++---
>   backends/cryptodev-lkcf.c       |  11 +--
>   backends/cryptodev-vhost-user.c |  13 ++-
>   backends/cryptodev-vhost.c      |   4 +-
>   backends/cryptodev.c            | 101 ++++++++++++++++++----
>   hmp-commands-info.hx            |  14 ++++
>   hw/virtio/virtio-crypto.c       |  41 +++++++--
>   include/monitor/hmp.h           |   1 +
>   include/sysemu/cryptodev.h      |  61 ++++++++------
>   monitor/hmp-cmds.c              |  36 ++++++++
>   qapi/cryptodev.json             | 144 ++++++++++++++++++++++++++++++++
>   qapi/meson.build                |   1 +
>   qapi/qapi-schema.json           |   1 +
>   14 files changed, 401 insertions(+), 74 deletions(-)
>   create mode 100644 qapi/cryptodev.json
> 

-- 
zhenwei pi

