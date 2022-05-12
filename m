Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886545248EF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 11:26:29 +0200 (CEST)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np55Y-0002IS-Kx
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 05:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np4YS-00081l-95
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:52:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np4YP-00019R-Oh
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652345533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fApG5Ikogb017bWMxtNr5IPgwhik1kO+53mr1o3YqUw=;
 b=Z48oK6Q3QDitJjiSQg5ADwMk7GT5ZMATYJrs0/YhOpl6manX6UhUoE70U/c4x3VwpZfNLB
 I01XQbJBe3tb9mGG0VDYnPBLf/pOD/LJgnuc2uORsJ4N7qu0Y8v3to2iqVs1Zs6sVWPbwj
 Pzdm/8yMFk0L9r1FRPq6HDwvRQ80Nlk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-Au3oUaJ-MQukUGcHfRdSJQ-1; Thu, 12 May 2022 04:52:11 -0400
X-MC-Unique: Au3oUaJ-MQukUGcHfRdSJQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so1379778wmr.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 01:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fApG5Ikogb017bWMxtNr5IPgwhik1kO+53mr1o3YqUw=;
 b=QY2aBwQrDy5LQoTXMs5rB+DB1o09nLw5LC1xR1Msdfq3G3lC4/t+9pB8QZQS6AC/6u
 33j/0Icx5LbKNb+CcdLCLd0Vl66clZ5dPnjAmzR2642/b1kKsDCQY+kOmbi91iPrTD/N
 E//2tL/nSu/BUqWTGRbbq6OqGihpRSpP/5dwFQIqy3gOe45dwthrPrrZX28ZIbxd+Pke
 ktLf8QU2O6oSwe+w6ZFjIehKjLh8mPUhJUAzKPt3PIq1ReGwMDGzxb11UYSx0v1rsXCC
 A9AKOPwbFUv4QrScl/WHnwG0o86P1SN8l41oNLaOZ2ePjrLFhiQm+MaaPDoCC7T1voow
 +HQA==
X-Gm-Message-State: AOAM533wbVQjOXZugD5V9sHHlq+eAqFr//2WLCdowKVPR0c0zEffCZ+W
 wKQBun/SabcBsSYQs2kaD9xNLb/sx035mm8/Fq6EcKz1jsrbngkIuRoG7z1tiK1KDITEkTmqezC
 fFkcrMTbWeikMKAE=
X-Received: by 2002:adf:eb82:0:b0:20c:a2eb:5fe6 with SMTP id
 t2-20020adfeb82000000b0020ca2eb5fe6mr26190281wrn.563.1652345530196; 
 Thu, 12 May 2022 01:52:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1/nI/GuoycDkCzQpaTuT36zvDweiWOdh2s2aJHrx7BAfk3JCbahVCzC4d5jr8Q/tYKPJRMA==
X-Received: by 2002:adf:eb82:0:b0:20c:a2eb:5fe6 with SMTP id
 t2-20020adfeb82000000b0020ca2eb5fe6mr26190253wrn.563.1652345529907; 
 Thu, 12 May 2022 01:52:09 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b0039456c00ba7sm2390898wmq.1.2022.05.12.01.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 01:52:09 -0700 (PDT)
Message-ID: <b5f7d4bf-176e-ebee-833f-21a139d5c1ed@redhat.com>
Date: Thu, 12 May 2022 10:52:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] s390x: kvm: Honor storage keys during emulation
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20220506153956.2217601-1-scgl@linux.ibm.com>
 <87o8073zae.fsf@redhat.com>
 <b55e6882-50d5-5e6b-602e-85a984b9961f@linux.ibm.com>
 <87tu9x1p1r.fsf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87tu9x1p1r.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/05/2022 15.43, Cornelia Huck wrote:
> On Tue, May 10 2022, Janis Schoetterl-Glausch <scgl@linux.ibm.com> wrote:
> 
>> On 5/9/22 10:06, Cornelia Huck wrote:
>>> On Fri, May 06 2022, Janis Schoetterl-Glausch <scgl@linux.ibm.com> wrote:
>>>
>>>> Make use of the storage key support of the MEMOP ioctl, if available,
>>>> in order to support storage key checking during emulation.
>>>>
>>>> I did not update all the headers, since that broke the build,
>>>> not sure what the best way of dealing with that is.
>>>
>>> Yeah, the vfio change is expected to break the build; the fix should be
>>> easy (simple rename), and the code affected is deprecated anyway (there
>>> hasn't been any upstream implementation that actually exposed the
>>> interfaces). I think we should do that in a single commit to preserve
>>> bisectability; I have not seen any patches posted yet to actually use
>>> the new vfio migration interface, so a simple compile fixup should be
>>> all that is needed.
>>
>> So basically this patch (pasted below)
>> https://lore.kernel.org/qemu-devel/20220404181726.60291-3-mjrosato@linux.ibm.com/
>> squashed with the updated headers.
> 
> Yes. We should probably queue that seperately, just to disarm that trap
> for everyone; unless there's already a vfio update in flight? (Sorry, I've
> lost track a bit.)

Unless somebody else has queued this already, I can try to come up with a 
separate pull request for the header update today or tomorrow.

  Thomas


