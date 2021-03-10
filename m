Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885853345AA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:51:04 +0100 (CET)
Received: from localhost ([::1]:46094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2z9-00073v-Hy
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2aP-0000rs-HO
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:25:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2aG-0005ba-Ss
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615397120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWtEN7o4LjRgpvM3QOEVeX1ny7SlOrcR0YStdKt76Zs=;
 b=GMxQMGGE8emNejsqYd9AR6UpN02zSLMvWhvgeSzsJU729RumKFgQSnhd60tIgr4HZWsfS8
 ayDU1xT78Zu9ENzEIVAjbeCnkymQEetzzExx7ow8sWUdiAE/CJNTWQ/rLsdUpc/JiBNC9F
 uYZ3CHCu+hXpyyytIklsTYCTTl2nUDQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-_xHmoA5mNRyrg1vvpZALtg-1; Wed, 10 Mar 2021 12:25:18 -0500
X-MC-Unique: _xHmoA5mNRyrg1vvpZALtg-1
Received: by mail-ej1-f71.google.com with SMTP id v27so2769354ejq.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GWtEN7o4LjRgpvM3QOEVeX1ny7SlOrcR0YStdKt76Zs=;
 b=sebsKqgyquP9/FZ6lgCFolX1nWMBy9Kv2KDM84RSiPH+IFUpy0y2R6ohn+YOILDbPJ
 2Yi9hv9LrWdPgb5SC2N7IhFm7VcU3tq0IIAERDxaWuwGbTRRhcuav8oBwqIccknHWuFq
 zRGBQj8HP0rWtHKMvHCZ6xwNwYvmU2kmvqGp7NKDrHP8QNEsako3eIYgKioT5xGqT5dP
 MD/opfq0+wx1sEuukYngjTiy6aNh42LDVXFl4vwCCBwZaiKHrZgLYk16HfRTAAszzpSo
 Vi0WGN0JX5/d+uVmWvUPUXmcOu0IL3/PbMYLs+rtwU2BSHVLR3TS2duqCdzvdAca1Y0L
 k7Bw==
X-Gm-Message-State: AOAM531E8FEBhf5IuhEYlU12yWCezm4Nd0jE1eWAR1CnfmY3wsxi9/b2
 t7w/hqL7NeDOxlG+gedeHtTzWGruYAIwxn2JGSV97goHqrptymTiYfxs3fVVnKUlxa9Pd6yN5lb
 6Ir+RkqDzE+9u9iE=
X-Received: by 2002:a17:906:2c0c:: with SMTP id
 e12mr2403910ejh.408.1615397116971; 
 Wed, 10 Mar 2021 09:25:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPntekdjNJlZKDu46HQMkLc+TFa8Zg7UmcV0FFneCfMGtQKq/DLkuSCUDNvAzdVRkaHPsISw==
X-Received: by 2002:a17:906:2c0c:: with SMTP id
 e12mr2403895ejh.408.1615397116811; 
 Wed, 10 Mar 2021 09:25:16 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q10sm10938681eds.67.2021.03.10.09.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 09:25:16 -0800 (PST)
Subject: Re: [PATCH v5 3/7] net/eth: Make ip6_ext_hdr *ext_hdr pointer to const
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210310160135.1148272-1-philmd@redhat.com>
 <20210310160135.1148272-4-philmd@redhat.com>
 <20210310164639.qka4kalklqy7a7qg@steredhat>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <305e762b-621c-d0fe-8b43-eb6548034f1a@redhat.com>
Date: Wed, 10 Mar 2021 18:25:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310164639.qka4kalklqy7a7qg@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 5:46 PM, Stefano Garzarella wrote:
> On Wed, Mar 10, 2021 at 05:01:31PM +0100, Philippe Mathieu-Daudé wrote:
>> As the callee doesn't need to modify the ext_hdr buffer,
>> mark it const.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> net/eth.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/net/eth.c b/net/eth.c
>> index 6a5a1d04e0b..7c47a267a7a 100644
>> --- a/net/eth.c
>> +++ b/net/eth.c
>> @@ -402,7 +402,7 @@ eth_is_ip6_extension_header_type(uint8_t hdr_type)
>> static bool
>> _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
>>                         size_t ext_hdr_offset,
>> -                        struct ip6_ext_hdr *ext_hdr,
>> +                        const struct ip6_ext_hdr *ext_hdr,
>>                         struct in6_address *dst_addr)
>> {
>>     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *)
>> ext_hdr;
>> -- 
>> 2.26.2
>>
> 
> This patch is fine, but after the last patch of this series, 'ext_hdr'
> is not used anymore, so what about removing this parameter?

Clever :)


