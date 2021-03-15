Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED4D33AFF2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:27:15 +0100 (CET)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkRO-0002tE-Tn
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLkOY-0001Ux-6C
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:24:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLkOW-0006vP-DZ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:24:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615803854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fl59j2wit7Z8NLdf7SNzvSAPEmiUGUIdnmwCgTK0TrU=;
 b=iHgrgu713JRIyKxlduKiaR41Nbm3rRlPHOsxRsel1sb3TD3rJnAQyz/sn6tdZ7FyWKAMPZ
 ajbvlt0SCXkjaCAQ/A/qUAK9KQxgupAZ7d2MSN4RW087eaTS+0gsgV+tUMfuD9rX8q36Yr
 cCfdPrMualK9DwcsgZgyqroncBuCm9E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-AUO0OL2-NnGuLZLaRVGDoA-1; Mon, 15 Mar 2021 06:24:10 -0400
X-MC-Unique: AUO0OL2-NnGuLZLaRVGDoA-1
Received: by mail-wr1-f69.google.com with SMTP id p15so14745322wre.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 03:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fl59j2wit7Z8NLdf7SNzvSAPEmiUGUIdnmwCgTK0TrU=;
 b=FQTClxyk1Ftu7zbGVLZaMyDLO9lleRPSsiFhoFsz+5BbjgNwAsfp9BvfUidEr1PK7Y
 0OydsCAQLaz9ITCc1C5fLpVVzhYipUB3BKA+Npw2eWQ35ulM/GfGuMw4J1rZqrdsgq05
 nXPaVbhOXT0wIZKtdhKk0WlTAW8pNHvuU7rmvJC9bPVozd/4hU7IGfuVucDG0mRU5ZBd
 4B7JE0r+oYbObAmvqi9/pwPXLnRbQQuSfdCBy26C4OLrrsDxCWdTmkwyAwLGIClW2zwY
 FmhhCYb569MOg57B1UDxeEWG6NifcJGzwgkZTEASgLSo8hk1Kdb+6n5eYkdUl1aNEP1q
 ginQ==
X-Gm-Message-State: AOAM533GOBrLws9HzDDbcbRZo1xS+St8qkbOrc2WUebkZPF+SEnIso+o
 +wtyfcLFgmI1XMYCT4N2AzjPPUX51yxURyUCAZhDOErO+/YMGcF7WY9MS5W4spXZtV7Xmp2Sxiv
 YtP5p+8H6Z5dWP9X9BSEiKl1SD1pi2pyVDEJ6rVfiPFDbgCaOQc4g2rDgHdy728Dq
X-Received: by 2002:adf:f711:: with SMTP id r17mr26602494wrp.358.1615803848801; 
 Mon, 15 Mar 2021 03:24:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDtUXCAG9+wEMUTkl5TFWAHLpb67CiEIORRercp0LOGIGZE3CayxzvLOthwHpsQgxrG2PK3A==
X-Received: by 2002:adf:f711:: with SMTP id r17mr26602474wrp.358.1615803848611; 
 Mon, 15 Mar 2021 03:24:08 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s84sm11844283wme.11.2021.03.15.03.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 03:24:08 -0700 (PDT)
Subject: Re: [PATCH v2 01/13] net: Add ETH_ZLEN define in eth.h
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
 <20210315075718.5402-2-bmeng.cn@gmail.com>
 <236293f1-c23c-78a9-3e1f-7b523280262a@redhat.com>
 <CAEUhbmWHQ9ifdeaGRDp-iEo2AyTV-bmTOd+xHJ+O1-BT0Nig0g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <222989ce-fbf3-7852-bec8-3e8934bdf177@redhat.com>
Date: Mon, 15 Mar 2021 11:24:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWHQ9ifdeaGRDp-iEo2AyTV-bmTOd+xHJ+O1-BT0Nig0g@mail.gmail.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 11:15 AM, Bin Meng wrote:
> Hi Philippe,
> 
> On Mon, Mar 15, 2021 at 5:13 PM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> On 3/15/21 8:57 AM, Bin Meng wrote:
>>> Add a new macro ETH_ZLEN which represents the minimum size of an
>>> Ethernet frame without FCS.
>>>
>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>> ---
>>>
>>>  include/net/eth.h | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/net/eth.h b/include/net/eth.h
>>> index 0671be6916..7c825ecb2f 100644
>>> --- a/include/net/eth.h
>>> +++ b/include/net/eth.h
>>> @@ -31,6 +31,7 @@
>>>
>>>  #define ETH_ALEN 6
>>>  #define ETH_HLEN 14
>>> +#define ETH_ZLEN 60     /* Min. octets in frame sans FCS */
>>
>> What means 'sans'?
> 
> sans-serif font? Does that sound familiar? :)
> 
> Please check:
> https://www.dictionary.com/browse/sans

Ah this is a British expression from French...

I'd use "without" instead as it is probably clearer for
non-British and non-French developers.

> This comment was not invented by me, but was just a copy from the one
> used in Linux kernel:
> https://github.com/torvalds/linux/blob/d635a69dd4981cc51f90293f5f64268620ed1565/include/uapi/linux/if_ether.h#L35
> 
>>
>> Otherwise:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
> 
> Regards,
> Bin
> 


