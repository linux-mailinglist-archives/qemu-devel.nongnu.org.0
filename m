Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433E32CE28
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 09:12:09 +0100 (CET)
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHj5c-0007PL-1b
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 03:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHj4R-0006pf-No
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 03:10:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHj4P-0002EJ-Dh
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 03:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614845452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhSMtZ+zuUDqe6n7FWAdnGluZjaxNBPwF/BO91OTUac=;
 b=ImrYJ/Bh4ttSAiFUMKaMxNcAoVBIFuiiWir1IH4yd2X7MCZ+Wjah/W9xoXCG5fE6RcB7ZF
 dx1PaoHxsDYaYRYx/qhGoAducJw1QrBz7jOOEp4ppQVMmiEq0+fCxu7dOYjZFJdnkltiHF
 jK3khLPnU1voM7vBULrgLfV3CJXQCX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-5NKVz1SWNxKUFtazhGZOfw-1; Thu, 04 Mar 2021 03:10:48 -0500
X-MC-Unique: 5NKVz1SWNxKUFtazhGZOfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2077B1842142;
 Thu,  4 Mar 2021 08:10:47 +0000 (UTC)
Received: from [10.36.113.171] (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96AA82C6F4;
 Thu,  4 Mar 2021 08:10:45 +0000 (UTC)
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
To: Richard Henderson <richard.henderson@linaro.org>
References: <1e13f11b-4c4f-83c6-5c83-8c8accc4f6cc@linaro.org>
 <42016B7B-A144-4319-9F48-92C029083274@redhat.com>
 <0ac4007e-001b-73b5-8023-fbfc9ef94eed@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <67723c0d-eb1b-a69c-794d-67d2c31269ac@redhat.com>
Date: Thu, 4 Mar 2021 09:10:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0ac4007e-001b-73b5-8023-fbfc9ef94eed@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.21 22:36, Richard Henderson wrote:
> On 3/3/21 1:22 PM, David Hildenbrand wrote:
>>
>>> Am 03.03.2021 um 22:19 schrieb Richard Henderson <richard.henderson@linaro.org>:
>>>
>>> ﻿On 3/3/21 1:11 PM, David Hildenbrand wrote:
>>>> MMIO on s390x? :)
>>>
>>> hw/s390x/s390-pci-bus.c, memory_region_init_io*().
>>>
>>
>> ... part of system address space where a CPU could stumble over it?
> 
> Impossible to tell within 3 layers of object wrappers.  :-(
> I suppose I have no idea how "pci" was hacked onto s390x.

You've used the right words to describe "pci" (!) on s390x.

IIRC, there is no MMIO: configuration space accesses etc. are performed 
using special access instructions - which will "emulate" the MMIO access 
performed on other archs via simple read/write instructions.

Ordinary instructions (e.g., mvpg) that operate on the system address 
space should never stumble over MMIO regions - because that concept does 
not exist on s390x.

-- 
Thanks,

David / dhildenb


