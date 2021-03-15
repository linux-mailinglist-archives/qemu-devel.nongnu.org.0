Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1153833AEAA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:26:31 +0100 (CET)
Received: from localhost ([::1]:55968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjUc-0003jn-2p
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjMj-0002me-Cz
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:18:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjMh-00017e-LN
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTxzSmZNaLUuLyvVuGLDnfiK4O2iv31ltg2wVy6KHT0=;
 b=OW2mwbvueqXZjRvZMu6+QYyCvSvoMQfis3TFnUoHppWh8A8okzohSK4DrGmWYvNMLeIWxB
 T/q62BShAz679gCxvTAp4gHueu2mxq2HjIT8qic7U2f5mVePLHjUhp9qZQBBRLCXSGvGbV
 k/GTI4wBYrjhD6QRLec3Mt2Cew4lpT8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-LrMuR7DbNEGxx89l22ZOMw-1; Mon, 15 Mar 2021 05:18:16 -0400
X-MC-Unique: LrMuR7DbNEGxx89l22ZOMw-1
Received: by mail-wm1-f69.google.com with SMTP id v5so7901362wml.9
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 02:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lTxzSmZNaLUuLyvVuGLDnfiK4O2iv31ltg2wVy6KHT0=;
 b=gstaKHVH9v8873dPNepL2NZpGqiIcIo8SkiuhkxX4lQ5fg7+f4vxf2QUHNXyST0PKC
 i+zVJSwcS2WBwPBBzuQyaLpCvaSVglsLr0f5s75wmnS7ZpVVNOh6alf9vsmJlzTL14D3
 k6Tqzul8BAUkeF1qIg8OsmwczeAVcD1XwEp/xJspcp1zYfYmC8DAbAn5L0wZWK7YOmEN
 YHN6QDBN3nyeEb+vKh799RBjA7OFFu0HohyqOvi6ExslAO8gKEXsZwMP6asKYH/DUzaT
 llcMDwqq3OqZdPHMP6tFA+U+DaAWoQkhAQkThu8eDC3MYbeIVZktQQREmIcosl/KgRE1
 L7hQ==
X-Gm-Message-State: AOAM533/kvyLMKBRwj2RYJia6UsuaDcaJf1OXXNuq95Atk4oPvcplW1s
 dwvTZQBNwDW1mAOMerNI3QHBZK9B11b1rdS7NMoEdcHJE8qy2XHPW8Ut7FOFjkWgw84Bx0/0db8
 6A/qQODSPnhE80TdYUAFmY3Hb7awzABbqVmFFi6nXo0uhJ1znAjtXOXbSgKnQr9hM
X-Received: by 2002:a5d:410b:: with SMTP id l11mr26561401wrp.16.1615799895030; 
 Mon, 15 Mar 2021 02:18:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd4fYh9Nn3DaYtDz1dy0ujRhLbkDQLTybWqAY9WhB6r145u0lzB2dQrOrr0bWKvbWsOvX0wg==
X-Received: by 2002:a5d:410b:: with SMTP id l11mr26561380wrp.16.1615799894791; 
 Mon, 15 Mar 2021 02:18:14 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z82sm11477690wmg.19.2021.03.15.02.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:18:14 -0700 (PDT)
Subject: Re: [PATCH v2 02/13] net: Add a 'do_not_pad" to NetClientState
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
 <20210315075718.5402-3-bmeng.cn@gmail.com>
 <4093c094-ed8c-d8c4-09b7-4bad19529ec6@redhat.com>
Message-ID: <2884879b-d645-324b-e90c-95fd59b66daa@redhat.com>
Date: Mon, 15 Mar 2021 10:18:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4093c094-ed8c-d8c4-09b7-4bad19529ec6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 10:17 AM, Philippe Mathieu-Daudé wrote:
> On 3/15/21 8:57 AM, Bin Meng wrote:
>> This adds a flag in NetClientState, so that a net client can tell
>> its peer that the packets do not need to be padded to the minimum
>> size of an Ethernet frame (60 bytes) before sending to it.
>>
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> ---
>>
>>  include/net/net.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/net/net.h b/include/net/net.h
>> index 919facaad2..6fab1f83f5 100644
>> --- a/include/net/net.h
>> +++ b/include/net/net.h
>> @@ -100,6 +100,7 @@ struct NetClientState {
>>      int vring_enable;
>>      int vnet_hdr_len;
>>      bool is_netdev;
>> +    bool do_not_pad;
>>      QTAILQ_HEAD(, NetFilterState) filters;
>>  };
> 
> This is a bit pointless without the next patch, why
> not squash it there?

Ah one is SLiRP and the other is tap. OK then.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


