Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4567336DE7E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:40:07 +0200 (CEST)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lboAQ-0005S9-9E
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lbo7f-00046w-Hi
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:37:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lbo7d-0003Hy-T4
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619631432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJeO5akA5ssBx3XnXUkUvM/2iJSp+th5oJAiwE/8b/w=;
 b=hncXvkcwykPW3iiH2q4ayouPsSejy0lHM7LbYeG3QdFWaGNprxSm3BuvfCKyFxeAnd54P5
 M6+XvYQS/M0H0HHf3rs5YZeRblm0dpaJeBXMDZwgMA4IAd+2ufGYzjr0MDtFmj+vnKmaoz
 WURYkDdLBHWltXw2TYxu9FYAxOqNZ4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-sZxJkjsvOtes1KcTQNU7ZA-1; Wed, 28 Apr 2021 13:37:08 -0400
X-MC-Unique: sZxJkjsvOtes1KcTQNU7ZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C7A58042CB;
 Wed, 28 Apr 2021 17:37:06 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-86.gru2.redhat.com
 [10.97.116.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BF491037EB3;
 Wed, 28 Apr 2021 17:36:53 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] tests/acceptance: Automatic set -cpu to the test vm
To: Cleber Rosa <crosa@redhat.com>
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-2-wainersm@redhat.com>
 <20210421201603.GB2153290@amachine.somewhere>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <3c2e33c1-29d6-897b-9ae1-48305efa9dea@redhat.com>
Date: Wed, 28 Apr 2021 14:36:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210421201603.GB2153290@amachine.somewhere>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, philmd@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 4/21/21 5:16 PM, Cleber Rosa wrote:
> On Thu, Apr 08, 2021 at 04:52:31PM -0300, Wainer dos Santos Moschetta wrote:
>> This introduces a new feature to the functional tests: automatic setting of
>> the '-cpu VALUE' option to the created vm if the test is tagged with
>> 'cpu:VALUE'. The 'cpu' property is made available to the test object as well.
>>
>> For example, for a simple test as:
>>
>>      def test(self):
>>          """
>>          :avocado: tags=cpu:host
>>          """
>>          self.assertEqual(self.cpu, "host")
>>          self.vm.launch()
>>
> So I tried a few tests with different CPU models and it works as
> expected.  One minor caveat is that using "host" has side effects
> in some cases, causing tests to fail because they may also require
> KVM to be enabled.
>
> But this is a generic mechanism so I don't think it should be
> concerned with that.


Good point. Certainly I will consider this when reviewing new tests.


>
>> The resulting QEMU evocation will be like:
>>
>>      qemu-system-x86_64 -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_pdgzbgd_/qemu-1135557-monitor.sock -mon chardev=mon,mode=control -cpu host
> Only thing is: can we please just break this line (I could not ignore
> a 174 character line :).
>
>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> ---
>>   docs/devel/testing.rst                    | 17 +++++++++++++++++
>>   tests/acceptance/avocado_qemu/__init__.py |  5 +++++
>>   2 files changed, 22 insertions(+)
> With the line broken mentioned above (which I can take care of when
> queueing this patch):


I will send a v3 to address your review for patch 06, so I can take care 
of it.


>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>


Thanks for the reviews!

- Wainer


