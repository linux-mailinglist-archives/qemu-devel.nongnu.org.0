Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DD33C21C5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:46:09 +0200 (CEST)
Received: from localhost ([::1]:39340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1n5D-0007zI-T6
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1m1n3p-0007G6-JX
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:44:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1m1n3n-0004mQ-5m
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625823877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oiIWVKNFXZF61YvklDbM4B2AXc8Q9fNtLHQv936cq9M=;
 b=OIyYxd9Z/Qin0FlzET3AwQeOBIjhDaz7of6idUqpMnr0fCIvdL29Nw0Ubo7XilAL55Ejoy
 nkRitcnWW8+taij+XiS+QBGpKX1YJO9sogUZ7txczlhzUgaRzCHcQXDlToFXYWZ+meN3tl
 d4GoW/Rnj3CiW4/mwQI0Aa2eb7t/m4c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-nWanbUnNMo6LLUleLr_iqQ-1; Fri, 09 Jul 2021 05:44:36 -0400
X-MC-Unique: nWanbUnNMo6LLUleLr_iqQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m7-20020a05600c4f47b02901ff81a3bb59so1942800wmq.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 02:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oiIWVKNFXZF61YvklDbM4B2AXc8Q9fNtLHQv936cq9M=;
 b=O+KDFWt5KsacPQyWwS3B7aR28PSIO6wRimokmvBzvzQVDBauBe0CRJEvtB1221aJOJ
 dANaNI0i8/K4yYRJ5g7CXrV3nWiIe3NgnDvS72Xtj7hjOJvtikMeru9nIG/Ic7RKIfHZ
 /FqDHTyf0gENggAWcV9egXfI3pd9ZZ4DN6/NLVxskPY8WtczAI5cRxf/NQkdSQ2Dl5AB
 8vVzqb8dbntV8sH8TPl7C5rgySwzmIB/On1FMIp//LFpE9OJ+EFPP++JnH2KTlqFhhlB
 xJYkwZE+HWfrd6YAPwWx5XPtgCbWH7F92LFMi/o2RdOFAXhr5xAvTwCSeU3aVC6AMD1x
 sfbw==
X-Gm-Message-State: AOAM533N+L8JYTQcpDc45x+If9JmTXsEWasIfjU+yHmIRoclYTVetODk
 EYq1uIY9PpYC4+VxWDkwwD7BNa0IZ8sE8MMfhfkXp8u5KYyUiX0bcz+7ofEcjnU8FtD63a41Qo0
 XI4BD890fSlLcpnE=
X-Received: by 2002:a5d:550e:: with SMTP id b14mr22070224wrv.16.1625823875158; 
 Fri, 09 Jul 2021 02:44:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3eq23qSLqRsNhRVLHesLUQhJ8tK78UWMiU9wV0i6NwcDCmFNEmrgTysmk0TqgJFqGFpkS4Q==
X-Received: by 2002:a5d:550e:: with SMTP id b14mr22070203wrv.16.1625823874992; 
 Fri, 09 Jul 2021 02:44:34 -0700 (PDT)
Received: from [192.168.0.5] (ip4-95-82-160-17.cust.nbox.cz. [95.82.160.17])
 by smtp.gmail.com with ESMTPSA id b16sm4839002wrs.51.2021.07.09.02.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 02:44:34 -0700 (PDT)
Subject: Re: [PATCH 2/2] numa: Parse initiator= attribute before cpus=
 attribute
To: Igor Mammedov <imammedo@redhat.com>
References: <cover.1625662776.git.mprivozn@redhat.com>
 <b27a6a88986d63e3f610a728c845e01ff8d92e2e.1625662776.git.mprivozn@redhat.com>
 <20210709112659.5a03a52d@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Message-ID: <165737d8-c23f-033e-adf3-86046be13965@redhat.com>
Date: Fri, 9 Jul 2021 11:44:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709112659.5a03a52d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: tao3.xu@intel.com, qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 11:26 AM, Igor Mammedov wrote:
> On Wed,  7 Jul 2021 15:40:30 +0200
> Michal Privoznik <mprivozn@redhat.com> wrote:
> 
>> When parsing cpus= attribute of -numa object couple of checks
>> is performed, such as correct initiator setting (see the if()
>> statement at the end of for() loop in
>> machine_set_cpu_numa_node()).
>>
>> However, with the current code cpus= attribute is parsed before
>> initiator= attribute and thus the check may fail even though it
>> is not obvious why. But since parsing the initiator= attribute
>> does not depend on the cpus= attribute we can swap the order of
>> the two.
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> FYI:
> I'm planning to deprecate '-numa node,cpus=' in favor of '-numa cpu'.

Yes, I'm aware of that and I remember I posted some patches for libvirt
that you reviewed. I need to return to them rather sooner than later.
Meanwhile, this patch helps.

Thanks,
Michal


