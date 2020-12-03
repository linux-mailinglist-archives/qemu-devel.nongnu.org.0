Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE912CDD37
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 19:21:03 +0100 (CET)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kktDw-00069y-9G
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 13:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kkt7g-0002i6-AC
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:14:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kkt7c-0003ao-8o
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607019266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyuKJqCpJWpxZZfL23Cy9MqFg5XYfYZYPvtljR78i0g=;
 b=AN7PRfXTJmGE2SGSXKHii5+O6368KNnZ9QWUcIRMFf07jPz3eBKyILX1oLumPJ9HngUO3U
 1KJVyM2peRuBW8l5ktXot6dt3w5QIwaDjGJe/KToLzdt/uhPeIss+3tfV6PYixcf/m+v1W
 TE8LNS63FRjNyDL+tfWdks9G8nNCR2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-fCRYjwW9NyCCaC18T_OhYQ-1; Thu, 03 Dec 2020 13:14:23 -0500
X-MC-Unique: fCRYjwW9NyCCaC18T_OhYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DF3F10054FF;
 Thu,  3 Dec 2020 18:14:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-167.ams2.redhat.com [10.36.113.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBCD560854;
 Thu,  3 Dec 2020 18:14:14 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: test hot(un)plug of ccw devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20201203153917.66685-1-cohuck@redhat.com>
 <71a7ee0f-8ca1-e3d0-8817-e51d0cb4c02c@redhat.com>
 <4c4c7adf-4152-2f83-082f-f208aa8d7f7d@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <74310bfd-ec45-7ec0-ed7b-02fe49f71de0@redhat.com>
Date: Thu, 3 Dec 2020 19:14:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <4c4c7adf-4152-2f83-082f-f208aa8d7f7d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/12/2020 19.11, Philippe Mathieu-Daudé wrote:
> On 12/3/20 6:22 PM, Thomas Huth wrote:
>> On 03/12/2020 16.39, Cornelia Huck wrote:
>>> Hotplug a virtio-net-ccw device, and then hotunplug it again.
>>
>> Good idea! ... is it also possible with a pci device?
>>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> ---
> ...
>>> +        exec_command_and_wait_for_pattern(self, 'dmesg | tail -n 1', 'CRW')
>>
>> That looks like it could be a little bit racy ... what if the kernel outputs
>> another log message by chance, so that tail -n 1 reports that instead.
>>
>> I think it would be better to clear the dmesg log ("dmesg -c") before
>> plugging, and then look at all the new output of "dmesg" without using
>> "tail" afterwards.
> 
> "dmesg --follow"?

Then you'd need to send control-c afterwards to stop it? ... not sure
whether that's such a better solution...

 Thomas


