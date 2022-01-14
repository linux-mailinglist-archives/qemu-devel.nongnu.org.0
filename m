Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E456D48E2C0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 03:58:54 +0100 (CET)
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Cnl-0004aY-LW
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 21:58:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Clr-0003DJ-2x
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 21:56:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Cln-00010M-H4
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 21:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642129009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=klH2OwqkhqNOjQ0Hmm+zp7CCY/ffQm3vYURKoWp/BU8=;
 b=b1SfdEh5yQsPY3sxiOYDxWIAe3wIXC/7+J0mqJtswXbzYsZ47veAye7xvN2VpyBei/IX/y
 06D4DWI3dDG4V4gmxhE3gYnZRv82P6+/JMrf3yuI3L4FNVrjOoxwyucrjxd97MUZmAw1dd
 yN2a7l9x7T4k0snpqGqiHPLP2Jkroog=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-sZsjUycZNP20RtwfpGyt5g-1; Thu, 13 Jan 2022 21:56:48 -0500
X-MC-Unique: sZsjUycZNP20RtwfpGyt5g-1
Received: by mail-pj1-f71.google.com with SMTP id
 x1-20020a17090ab00100b001b380b8ed35so8103087pjq.7
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 18:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=klH2OwqkhqNOjQ0Hmm+zp7CCY/ffQm3vYURKoWp/BU8=;
 b=qfEW6t9It7Fl5vF1OOKYBqSijNR/K89E34XLYPVgxy+qIABuYjx/DDc0r6hLEdFW5W
 hZPW3F8tWX1erhGVoKQcvMfplyOkY8pvqlfS4rHhza2ySAzKABXAG1A2c5hvDVI0u1gK
 OgxNTjKtX8FejN+J0d90PIueWTBjmta7ZGaw1FimkIcJT1ucVC8nZkKqI9GZVFfzxKOH
 GUg1+1A9+rqB9CpmOO2SS0Gco9Hage6s2XWqoB94ani0Bw9nsmuCTnfkrAho4iAnTynY
 FfshqF1eGr09mkydMcAD+l0yv5a+sV5fhGJocwUYVhY4MwINE+bsBxHGM8d1jbdoxtzW
 GynQ==
X-Gm-Message-State: AOAM533Vquwhxn2lvyVsEfrOMLLvCYCki+sbNWv2CUYFPS6trgYDmftN
 vVFCAZjfM7M/ayO5CC/3K2YxRzn3xL6BaCAy2sKHdedhcn1WxLB42wTrOdic9NAJ6RLjfQq9doX
 //DXO0sVOtc/QTyg=
X-Received: by 2002:a17:90b:3787:: with SMTP id
 mz7mr8428206pjb.17.1642129002807; 
 Thu, 13 Jan 2022 18:56:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzV5HSfu9rel/oJr3NCr+pyYz84cOvKfb62uA4PnfucuVEG926dOJ8O79n9Vz0aGXF2KVTLmQ==
X-Received: by 2002:a17:90b:3787:: with SMTP id
 mz7mr8428186pjb.17.1642129002559; 
 Thu, 13 Jan 2022 18:56:42 -0800 (PST)
Received: from [10.72.13.172] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id pg12sm11557576pjb.4.2022.01.13.18.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 18:56:41 -0800 (PST)
Message-ID: <4f1f9064-91b8-112b-76fc-a5f8da0b2510@redhat.com>
Date: Fri, 14 Jan 2022 10:56:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 1/3] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-3-jasowang@redhat.com>
 <20220113020527-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220113020527-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yi.l.liu@intel.com, yi.y.sun@linux.intel.com, qemu-devel@nongnu.org,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/13 下午3:06, Michael S. Tsirkin 写道:
> On Wed, Jan 05, 2022 at 12:19:43PM +0800, Jason Wang wrote:
>> We use to warn on wrong rid2pasid entry. But this error could be
>> triggered by the guest and could happens during initialization. So
>> let's don't warn in this case.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   hw/i386/intel_iommu.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
>> index 4c6c016388..f2c7a23712 100644
>> --- a/hw/i386/intel_iommu.c
>> +++ b/hw/i386/intel_iommu.c
>> @@ -1524,8 +1524,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
>>       if (s->root_scalable) {
>>           ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
>>           if (ret) {
>> -            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
>> -                              __func__, ret);
>> +            /*
>> +             * This error is guest triggerable. We should assumt PT
> typo
>
> And drop "We should" pls, just use direct voice:
> "Assume PT not enabled".


Fixed.

Thanks


>
>
>> +             * not enabled for safety.
>> +             */
>>               return false;
>>           }
>>           return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
>> -- 
>> 2.25.1


