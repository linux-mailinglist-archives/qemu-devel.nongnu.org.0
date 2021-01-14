Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB622F6349
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:39:49 +0100 (CET)
Received: from localhost ([::1]:34798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03mu-0004aN-Ni
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l03j5-0001Hq-1A
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:35:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l03j3-0005kh-5O
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610634948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IcdH7HPQOQyHbpcooL4SSWDRC5JQlUiSyTiah7KaJic=;
 b=RfwPPQiKm6TtjyCkF/YEe30j/gETjIiMVprm6TyMiCapfzfPap1vWzofYq2I3tFJ7Yg1b0
 U5tNysJ17Zu4+IZVMiI7//LLZ2Af4L7W9sdmWmNANnBRrzSCwcqDgd3KZSSbS6hotz/JV1
 CcPDCBMa6PXw/kALQWHQfr/2faC/tWU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-4LtjJCIuNBGi2TNT0oM5dw-1; Thu, 14 Jan 2021 09:35:44 -0500
X-MC-Unique: 4LtjJCIuNBGi2TNT0oM5dw-1
Received: by mail-wr1-f72.google.com with SMTP id v5so2691052wrr.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IcdH7HPQOQyHbpcooL4SSWDRC5JQlUiSyTiah7KaJic=;
 b=KPxfWDvYJ1TGPgPkBLmiFcuK7PvzMuNhuESzFuQk+6g/dfySxt7XakT/2WJUyAalEX
 sxOfYsy3GuBY8V4GwolmsXQn8UGjcnAu/+RswqU+pEdMnfENZY5Fsfx6iadcViSfvghV
 +bAWmu8blKPNrXjE6yDU6Jv2Rxw6QO3XgQvyuRp3CtV2YMTdmLF7tAtWbvA7ICTB5Ta0
 nMfv8bQk+KDp5mQ6WEbsvEW3OJfFtAjwcPrwELdCesIMeh0+9LWV8a7ZvCW8ediaZ6Zd
 KPNYKbPhg26zBlCYuDUNh0tY64c4c0jgJ/QPsiv7/mALwOIjns+vkTHVYfR9P9teP/KC
 UDJw==
X-Gm-Message-State: AOAM530QBF+DCKPu+uFoLbcDd/eZ2aby46zLJkm5Riiz+GFq7VWQlpPR
 LD4ArvQqw87qSQGU32i+J5d+m3xOo58P2MeV2m6pPCecsUGZ+S0F+COhWx+5hnok30qq3wfUucU
 JrER5ld0W6YLNiwUkJJHzfjRVb/gPKFzicyMHbuOA3QG7stmL1TVL20rIfW2jC4WB
X-Received: by 2002:a05:6000:1565:: with SMTP id
 5mr8415739wrz.109.1610634943207; 
 Thu, 14 Jan 2021 06:35:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylfx1J6mghf/RImq0OzJdwjF96N9BRVZnWln+eUC53Sk6z1h4M8NPJhtO+tZtnrnH+VzyQcA==
X-Received: by 2002:a05:6000:1565:: with SMTP id
 5mr8415715wrz.109.1610634943010; 
 Thu, 14 Jan 2021 06:35:43 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x17sm10216485wro.40.2021.01.14.06.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 06:35:42 -0800 (PST)
Subject: Re: [PATCH v3 1/2] Fix net.c warning on GCC 11
To: Alexander Bulekov <alxndr@bu.edu>
References: <cover.1610607906.git.mrezanin@redhat.com>
 <dcb4bfa3fe810236475b338f2f6401ec3d1a1c57.1610607906.git.mrezanin@redhat.com>
 <4fd8d2a3-e665-4422-79e0-4e2a7337e4fc@redhat.com>
 <20210114141920.qjsnlt3cmkauggtw@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9a611ea5-697c-26ea-875e-0f1b2cb0bff3@redhat.com>
Date: Thu, 14 Jan 2021 15:35:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114141920.qjsnlt3cmkauggtw@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 3:19 PM, Alexander Bulekov wrote:
> On 210114 1415, Philippe Mathieu-Daudé wrote:
>> +Jason +Dmitry
>>
>> On 1/14/21 8:07 AM, Miroslav Rezanina wrote:
>>> When building qemu with GCC 11, compiling eth.c file produce following warning:
>>>
>>>    warning: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Warray-bounds]
>>>
>>> This is caused by retyping from ip6_ext_hdr to ip6_ext_hdr_routing that has more
>>> attributes.
>>>
>>> As this usage is expected, suppress the warning temporarily through the function
>>> using this retyping.
>>
>> This is not expected, this is a bug...
>>
> 
> Seems related: https://bugs.launchpad.net/qemu/+bug/1879531

Yes!


