Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DEF36CAD8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:04:36 +0200 (CEST)
Received: from localhost ([::1]:52642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbS4Z-0007br-9U
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbS2g-0006ji-Bt
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:02:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbS2d-0001zA-Qx
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619546555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJ+sl6sETgeH4oplyFdIgdJvGJ3wJh6qyGFz6bJ/+/E=;
 b=ExJn/zPukDweHiboPskf6AjAGbnBH10L0lct3ie7d2HkJfirpb80JgOJixXYcWO2dUgYnc
 DxNj5iROEDJOH14ZYLkfeSldJwvziaX2s85CwnymzqF6N3D0q1u7q+wdH1boKd+WJHyOPA
 Mi1w6cfN9wNbH6Ft2CRBzydhOC6F/IA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-WNdvkPSPPIC-P7GJ4zfS1Q-1; Tue, 27 Apr 2021 14:02:33 -0400
X-MC-Unique: WNdvkPSPPIC-P7GJ4zfS1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EFFE8049D1;
 Tue, 27 Apr 2021 18:02:32 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E597960C0F;
 Tue, 27 Apr 2021 18:02:27 +0000 (UTC)
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <4c1c6e99-066e-f916-31dc-acb50caa5320@redhat.com>
 <YIgXlp9Auj+b00aN@stefanha-x1.localdomain>
 <bf5d8b58-3364-3f61-0c89-53f16c64bcb3@redhat.com>
 <5bbdc5d9-692e-63bb-2ad6-38a5711c4021@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <9714a87d-95f7-a6f0-4c35-a7e9d1aa1144@redhat.com>
Date: Tue, 27 Apr 2021 14:02:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5bbdc5d9-692e-63bb-2ad6-38a5711c4021@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 1:54 PM, Philippe Mathieu-Daudé wrote:
> On 4/27/21 7:16 PM, John Snow wrote:
>> On 4/27/21 9:54 AM, Stefan Hajnoczi wrote:
>>> I suggest fixing this at the qdev level. Make piix3-ide have a
>>> sub-device that inherits from ISA_DEVICE so it can only be instantiated
>>> when there's an ISA bus.
>>>
>>> Stefan
>>
>> My qdev knowledge is shaky. Does this imply that you agree with the
>> direction of Thomas's patch, or do you just mean to disagree with Phil
>> on his preferred course of action?
> 
> My understanding is a disagreement to both, with a 3rd direction :)
> 
> I agree with Stefan direction but I'm not sure (yet) that a sub-device
> is the best (long-term) solution. I guess there is a design issue with
> this device, and would like to understanding it first.
> 
> IIUC Stefan says the piix3-ide is both a PCI and IDE device, but QOM
> only allow a single parent. Multiple QOM inheritance is resolved as
> interfaces, but PCI/IDE qdev aren't interfaces, rather abstract objects.
> So he suggests to embed an IDE device within the PCI piix3-ide device.
> 
> My view is the PIIX is a chipset that share stuffs between components,
> and the IDE bus belongs to the chipset PCI root (or eventually the
> PCI-ISA bridge, function #0). The IDE function would use the IDE bus
> from its root parent as a linked property.
> My problem is currently this device is user-creatable as a Frankenstein
> single PCI function, out of its chipset. I'm not sure yet this is a
> dead end or I could work something out.
> 
> Regards,
> 
> Phil.
> 

It sounds complicated. In the meantime, I think I am favor of taking 
Thomas's patch because it merely adds some error routing to allow us to 
avoid a crash. The core organizational issues of the IDE device(s) will 
remain and can be solved later as needed.

Do you agree?

--js


