Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B807321835
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:16:44 +0100 (CET)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEB4t-0005bf-Hb
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEB1w-0004fJ-4b
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:13:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEB1n-00006a-NL
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:13:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613999608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jCcpNSbDrqUuBYEkakiNOCpMxE+MUQcI9GV9KqIbYNQ=;
 b=dqzXXvBEe4AbHuvRrrH7tKZ/bp3ee2Jf1XP1SMrIpfUanqGu9e49qJV0mUXsPAIA3mf2bG
 e8hZowCDZEKMCn9Fsc2fijhvUn4H5/xiDSwNZhWfdJyv32TBIgkK4YPQ5NzsIrpKv7wNhl
 YEHffg2+qSYAwwsYgpiJJvOVfaM5jfI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-lQ_6d1PLPKm8KmiTPWSbNA-1; Mon, 22 Feb 2021 08:13:27 -0500
X-MC-Unique: lQ_6d1PLPKm8KmiTPWSbNA-1
Received: by mail-ed1-f72.google.com with SMTP id t9so6966396edd.3
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jCcpNSbDrqUuBYEkakiNOCpMxE+MUQcI9GV9KqIbYNQ=;
 b=ZiQCk8RLV0glRTFR2ZJ+A3jilhdPZVDrtfjm4QeEb+kSUpjBY70zuk6qM5SswRKgro
 CVcmAj3NssIA/We4gKCxCqWmxLTnD8o9txvr0LCSVNkj9MdCD2u7Vd36EhhM8/kbxIQN
 ZyoXQ02k3wY47WtD/nCcQuWxIv3drPZD0RfsXijuLZxpQzJ6bCerybvqSJg1Wpw4sbxO
 w9RkjCB5vuDWzL0gb6MkKjELuplshkTIPgzDr4awMNbRcoV7+wP0Sqhqd/ZWOeu9dWqT
 0/G5TgtN88NdISHzeV/QzjmH3Fsg08h0nC7H5zweJ0RKD/qvexk84jB96Gwa1pigTCAP
 hbkg==
X-Gm-Message-State: AOAM530YeDNJ7vqQF7QjUo6cLXdIbOysrD84C7S2nTaBfO4ultNm2tae
 QkQc/b6u9TT/IoiTKAupqF6Wt6K7bcIZmgvbR3peOJYf4JgjTyPnbDFHGRSLTTsjEAlLigGj18L
 aOX8eYY2cYwTueAg=
X-Received: by 2002:a17:907:2bcd:: with SMTP id
 gv13mr2772570ejc.95.1613999605805; 
 Mon, 22 Feb 2021 05:13:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGlT4MQz5ya7pUdDmHSuXcdKTF/4PcN7879+muCjzwQ4Uu9VTGxmdT8gDJxv41LKsCVEQDPQ==
X-Received: by 2002:a17:907:2bcd:: with SMTP id
 gv13mr2772538ejc.95.1613999605489; 
 Mon, 22 Feb 2021 05:13:25 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m19sm11496872eds.8.2021.02.22.05.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:13:24 -0800 (PST)
Subject: Re: [PATCH 1/3] hw/block/nvme: nvme_identify fixes
To: Minwoo Im <minwoo.im.dev@gmail.com>, Klaus Jensen <its@irrelevant.dk>
References: <20210222070615.9177-1-its@irrelevant.dk>
 <20210222070615.9177-2-its@irrelevant.dk>
 <20210222120004.GB2856@localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd236cb9-3203-ef6b-93af-0139b862dae2@redhat.com>
Date: Mon, 22 Feb 2021 14:13:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222120004.GB2856@localhost.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 1:00 PM, Minwoo Im wrote:
> On 21-02-22 08:06:13, Klaus Jensen wrote:
>> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>
>> Remove an unnecessary le_to_cpu conversion and add trace event for
>> Identify.
>>
>> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>>  hw/block/nvme.c       | 5 ++++-
>>  hw/block/trace-events | 1 +
>>  2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>> index 1cd82fa3c9fe..ddc83f7f7a19 100644
>> --- a/hw/block/nvme.c
>> +++ b/hw/block/nvme.c
>> @@ -3415,7 +3415,10 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
>>  {
>>      NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
>>  
>> -    switch (le32_to_cpu(c->cns)) {
>> +    trace_pci_nvme_identify(nvme_cid(req), c->cns, le16_to_cpu(c->ctrlid),
>> +                            c->csi);
> 
> I think it would be great if it can be separated into two.

Agreed.

> Anyway, changes look good to me.
> 
> Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>


