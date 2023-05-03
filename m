Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560BD6F4F6D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 06:21:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu3xv-0005oT-J6; Wed, 03 May 2023 00:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pu3xt-0005o7-9q
 for qemu-devel@nongnu.org; Wed, 03 May 2023 00:19:41 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pu3xq-0000fp-BV
 for qemu-devel@nongnu.org; Wed, 03 May 2023 00:19:41 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1aad55244b7so33743685ad.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 21:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1683087570; x=1685679570;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3dOlDvBpuyPDzkMiyIZ5idrcuVoeDsx9DFK4aVoH63A=;
 b=ZQ2cS4sXI87oBXKYl8S1XtRyPsHSR37TgZvLjmD6aDGiRKNCHieb6kWMRgr4AzoeFT
 lxlcuxdrty0ZYQHiMPch+9NBYIhxBnKEaIoh6DBmyl7mGn7Du/ZrW9Gge12ZZp614RuF
 Xii1JuOaxGbpez2OEsmQGESsdRF4P0Mb/KotxoR3LNDzXNRO/v6UvLQufDDX1nHoV4Az
 b11MnwVc70GZjJgR/w3sIuC9SUGmEHsRhl0L6wBbm1GlThqhIMboMXjU9uaLPBjxovPt
 ZqTGsO+w+cbNLTIYj7rh8w7qlJiacC5qjgS+emtbGauD//3adA5zr2982WBBb6vXT16j
 8/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683087570; x=1685679570;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3dOlDvBpuyPDzkMiyIZ5idrcuVoeDsx9DFK4aVoH63A=;
 b=mAHRQsLEQFrjXkYVUKRCVug33copd1VArgdnGZL4i9mVhSH+E7+JWHgXRmjfrv8NzV
 zk/BiMatIYBg++SWZF6/E04VOINmRzYWwZ+e9a/uPMFQ6SwoWQjfrF+udB5R/iBLZkhv
 ZERN01zK4hW+mzvf0AV/lSd8mdQTSocrOlJUN5rsr8KWVfo00rrGeiSDiaBlhDWY/W3q
 SWibaKFiXXt8/wgsIZa/US+a+nrAJ1zd44h7rcsfo89zo0a52IZjSs1jhdBdycGw+DrX
 Wy+XjeL69t165gU6IuqNcEfojZMnzP1vV9sNZKJL3VmSukUj4ZyZHtyzyNJDrqLwMetz
 blyw==
X-Gm-Message-State: AC+VfDx+vQTERqwghj14ZO/dOe/SGpwS7zdq+eOxepPPFSifN6rF/JBg
 0UaNoeh4Voxp5uYbVeTpvFmCzg==
X-Google-Smtp-Source: ACHHUZ5VBtSRvUbs/LCmw22AAc4yr7xF++T05+47Go5Wr1WVn59jCeUSB+AW9sroWTV2Mci9C0L/sw==
X-Received: by 2002:a17:903:182:b0:1a8:11d3:6b93 with SMTP id
 z2-20020a170903018200b001a811d36b93mr853057plg.66.1683087570377; 
 Tue, 02 May 2023 21:19:30 -0700 (PDT)
Received: from [10.255.178.60] ([139.177.225.225])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a170902e8d300b001ab05835a64sm2751155plg.290.2023.05.02.21.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 21:19:29 -0700 (PDT)
Message-ID: <d32401b2-c05c-b716-78ac-780b85d426ff@bytedance.com>
Date: Wed, 3 May 2023 12:19:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Re: [PULL 11/73] cryptodev: Support query-stats QMP command
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
 <f2b901098e14ad1aaffab82464917b8679499cc5.1678237635.git.mst@redhat.com>
 <CAFEAcA-ZKc1Q_rTH4XGNH+wu0cfJ5G2RPpEV=x0pitHNUnbe2w@mail.gmail.com>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <CAFEAcA-ZKc1Q_rTH4XGNH+wu0cfJ5G2RPpEV=x0pitHNUnbe2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/3/23 01:03, Peter Maydell wrote:
> On Wed, 8 Mar 2023 at 01:11, Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> From: zhenwei pi <pizhenwei@bytedance.com>
>>
>> Now we can use "query-stats" QMP command to query statistics of
>> crypto devices. (Originally this was designed to show statistics
>> by '{"execute": "query-cryptodev"}'. Daniel Berrangé suggested that
>> querying configuration info by "query-cryptodev", and querying
>> runtime performance info by "query-stats". This makes sense!)
> 
> Hi; Coverity points out (CID 1508074) that this change
> introduces a memory leak:
> 
>> +static int cryptodev_backend_stats_query(Object *obj, void *data)
>> +{
> 
>> +    entry = g_new0(StatsResult, 1);
>> +    entry->provider = STATS_PROVIDER_CRYPTODEV;
>> +    entry->qom_path = g_strdup(object_get_canonical_path(obj));
> 
> object_get_canonical_path() already returns allocated memory
> that the caller should free with g_free(), so we should not
> g_strdup() it (which then leaks that memory).
> 
>> +    entry->stats = stats_list;
>> +    QAPI_LIST_PREPEND(*stats_results, entry);
>> +
>> +    return 0;
>> +}
> 
> Would somebody like to send a patch?
> 
> thanks
> -- PMM

Hi,

Thanks for pointing out this, I'll fix this later.

-- 
zhenwei pi

