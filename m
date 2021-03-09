Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25E3330B8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:16:29 +0100 (CET)
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjiO-0004q9-O1
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJjY0-0006wd-J2
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJjXx-0008IM-Rf
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615323941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X5im3UEiouqN6pvd1si/T4sK4vbM7Q1FBphGYl/J4gQ=;
 b=P1eC+7g0nUaefkcMVSVaI97Z+NSQU450fXKo2okzbrGIcnCkQnu2t9ovHhdnvsKEoriXrA
 q65St2182x8Tjq+DugvzW3nMNIPzMyh2q1U+vufv8Ol/p0Eg+bGMuhmwjZp5+kDeFQo3iA
 /f+DBF+gsV8HIZIfcHv/62hozm2fZdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-Kjjr540JOQeL86OFvMH10Q-1; Tue, 09 Mar 2021 16:05:36 -0500
X-MC-Unique: Kjjr540JOQeL86OFvMH10Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D36451005D4C;
 Tue,  9 Mar 2021 21:05:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C737B60C13;
 Tue,  9 Mar 2021 21:05:29 +0000 (UTC)
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
To: David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <1e13f11b-4c4f-83c6-5c83-8c8accc4f6cc@linaro.org>
 <42016B7B-A144-4319-9F48-92C029083274@redhat.com>
 <0ac4007e-001b-73b5-8023-fbfc9ef94eed@linaro.org>
 <67723c0d-eb1b-a69c-794d-67d2c31269ac@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5630635a-f605-dd73-4b06-844988f17dc6@redhat.com>
Date: Tue, 9 Mar 2021 22:05:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <67723c0d-eb1b-a69c-794d-67d2c31269ac@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/03/2021 09.10, David Hildenbrand wrote:
> On 03.03.21 22:36, Richard Henderson wrote:
>> On 3/3/21 1:22 PM, David Hildenbrand wrote:
>>>
>>>> Am 03.03.2021 um 22:19 schrieb Richard Henderson 
>>>> <richard.henderson@linaro.org>:
>>>>
>>>> ﻿On 3/3/21 1:11 PM, David Hildenbrand wrote:
>>>>> MMIO on s390x? :)
>>>>
>>>> hw/s390x/s390-pci-bus.c, memory_region_init_io*().
>>>>
>>>
>>> ... part of system address space where a CPU could stumble over it?
>>
>> Impossible to tell within 3 layers of object wrappers.  :-(
>> I suppose I have no idea how "pci" was hacked onto s390x.
> 
> You've used the right words to describe "pci" (!) on s390x.
> 
> IIRC, there is no MMIO: configuration space accesses etc. are performed 
> using special access instructions - which will "emulate" the MMIO access 
> performed on other archs via simple read/write instructions.
> 
> Ordinary instructions (e.g., mvpg) that operate on the system address space 
> should never stumble over MMIO regions - because that concept does not exist 
> on s390x.

Sorry, guys, you've lost me here ... is there now something left to do for 
this patch or is it good as it is?

  Thomas



