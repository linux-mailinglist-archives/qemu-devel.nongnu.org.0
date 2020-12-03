Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FCF2CD300
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:56:52 +0100 (CET)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklM3-00036S-Qt
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kklIp-0000Jv-8V
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:53:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kklIm-0005Pz-QD
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606989207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1e8zv+TeVmIVK6pNXoCO7QBNSEFfKDKYjRUMHLaJZQ=;
 b=JIwLJoA55hXPpLJilerMud2Qk3AldMsIijaD0C5cYVAjw5QIhz4K1+d8fBNfQ7Fw0PrqdL
 iwQz7AOvJ2WBdIRFZdk0k7PphDuRhmYr15P2+knBNJ5mngTisB19XgS/VhPO1eoNozmmK+
 Z5FeR5jfPP0v7pn7bi/yPviO60ZRdTM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-BD026nrbN1eYAqlYHVsgLA-1; Thu, 03 Dec 2020 04:53:26 -0500
X-MC-Unique: BD026nrbN1eYAqlYHVsgLA-1
Received: by mail-wr1-f72.google.com with SMTP id v5so1043829wrr.0
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 01:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D1e8zv+TeVmIVK6pNXoCO7QBNSEFfKDKYjRUMHLaJZQ=;
 b=FYgkxVrzLio5IJXM5PMsT/+1nTxglTrWoxuKATy/jJs7nd4ILTChiZCjoToqG3+ZYn
 lnQ9oruDGd5V7bI3uwxLhqceii4yirR6hpS6ZElvZRUawrxvjdWb8tqgWGw29dkg8LIO
 HA31lI/O1YRaiWMbDG213fZwL8o5iPxB+ySXZXJGlroo74m+qvqinkK4DqF5zTOfUn7f
 G8r+yvEXpWxG1EZQNQRA08nZ/VRGA1Vq2t4mfzgMqp18ZJK4dDyCeCeZoUOhpEcAqdYA
 np+jYPFY6Gqap4xTbPBjTht5LHcGxEw8g0UjECWaVruEOMUdnvdpEgprnqcrH0B90Odu
 Y2CQ==
X-Gm-Message-State: AOAM530yrvV2nI9ghG2zAwa6HpK1EHFl6TSFUoe5efS+c1d8Nfj/qm+3
 mOymYbCME50fqmZ+fSAPnIdlpyGD+gpDuMmABiEgrzk1BunnnCgYyGu9rvhTVRvH/DnLfJ4tTAQ
 +OJkeMDSkQPmK3LE=
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr2378350wmj.115.1606989204900; 
 Thu, 03 Dec 2020 01:53:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1WjeBIwv33KPxxN8gDXvOPNllBHg3d8jloIZ6lDhonzDqUFtu5bBEH3Ox/s//pQxBN/eYEg==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr2378326wmj.115.1606989204702; 
 Thu, 03 Dec 2020 01:53:24 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id e1sm737320wma.17.2020.12.03.01.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 01:53:24 -0800 (PST)
Subject: Re: [PATCH] scsi: allow user to set werror as report
To: Zihao Chang <changzihao1@huawei.com>, Fam Zheng <fam@euphon.net>,
 pbonzini@redhat.com
References: <20201103061240.1364-1-changzihao1@huawei.com>
 <33fd8330630defb91feb6c627800a3ca952a4b55.camel@euphon.net>
 <8e53dc93-2312-375e-b67e-4df1b6901890@huawei.com>
 <2130de2b-d1cd-cfb9-51ee-a775e253d4a6@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <37acb898-8d6d-725b-6b48-f6d4a2cfa9fd@redhat.com>
Date: Thu, 3 Dec 2020 10:53:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2130de2b-d1cd-cfb9-51ee-a775e253d4a6@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/20 3:55 AM, Zihao Chang wrote:
> Ping? This is a fix patch which has been reviewed, whose tree should it go via?

The change itself is in-between 'Block layer' and 'SCSI'
subsystems, so either Paolo or Kevin (Cc'ing qemu-block@).

> 
> Thanks
> Zihao
> 
> On 2020/11/3 22:03, Zihao Chang wrote:
>>
>>
>> On 2020/11/3 18:52, Fam Zheng wrote:
>>> On Tue, 2020-11-03 at 14:12 +0800, Zihao Chang wrote:
>>>> 'enospc' is the default for -drive, but qemu allows user to set
>>>> drive option werror. If werror of scsi-generic is set to 'report'
>>>> by user, qemu will not allow vm to start.
>>>>
>>>> This patch allow user to set werror as 'report' for scsi-generic.
>>>>
>>>> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
>>>> ---
>>>>  hw/scsi/scsi-generic.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
>>>> index 2cb23ca891..2730e37d63 100644
>>>> --- a/hw/scsi/scsi-generic.c
>>>> +++ b/hw/scsi/scsi-generic.c
>>>> @@ -664,7 +664,8 @@ static void scsi_generic_realize(SCSIDevice *s,
>>>> Error **errp)
>>>>          return;
>>>>      }
>>>>  
>>>> -    if (blk_get_on_error(s->conf.blk, 0) !=
>>>> BLOCKDEV_ON_ERROR_ENOSPC) {
>>>> +    if (blk_get_on_error(s->conf.blk, 0) != BLOCKDEV_ON_ERROR_ENOSPC
>>>> &&
>>>> +        blk_get_on_error(s->conf.blk, 0) !=
>>>> BLOCKDEV_ON_ERROR_REPORT) {
>>>>          error_setg(errp, "Device doesn't support drive option
>>>> werror");
>>>>          return;
>>>>      }
>>>
>>> Accepting the report sounds sane to me, it matches what we actually
>>> (always) do. Is the idea to allow users to spell it out explicitly in
>>> the command line?
>>>
>> Actually, qemu supports user to spell it out explicitly in the command
>> line like "enospc", "report" & "action". This patch just allows user to
>> set werror as "report" for scsi-generic, which is a common scenario.
>>
>>> Reviewed-by: Fam Zheng <fam@euphon.net>
>>>
>>> .
>>>
> 


