Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F0A44BCA3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 09:12:00 +0100 (CET)
Received: from localhost ([::1]:60838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkii6-0003Mw-Uc
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 03:11:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkigV-0001qO-Me
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkigO-0006Z0-KC
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636531807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RDBc9Nexzq98tkCp/mOIFYq2WBzyQAC4q4+nH9I9VP4=;
 b=EkXOFDZUAywqXed0QQ6ShshWORJBm5TR6z2lCAHd15QAHGz6g61uKgXg//HEF7CWz0vwAA
 ICleuLiFTfDOPX6b6rzAszFDxQyL9S8Pzc1pG7Zm6U3u7wlOajEoXIRYyt6jkHTRxoC/hC
 pFBpIn66Kms/xG4GNhL+YhEGU0rcEb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-f7q_ea5yO0ua0XQagHSdfw-1; Wed, 10 Nov 2021 03:10:05 -0500
X-MC-Unique: f7q_ea5yO0ua0XQagHSdfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADDF11018720;
 Wed, 10 Nov 2021 08:10:03 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEF6D1973B;
 Wed, 10 Nov 2021 08:10:02 +0000 (UTC)
Message-ID: <2eac9bd1-099c-bc0c-e5e3-6a04eaa91ddf@redhat.com>
Date: Wed, 10 Nov 2021 09:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 2/2] tests/unit: Add an unit test for smp parsing
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028150913.1975305-1-philmd@redhat.com>
 <20211028150913.1975305-3-philmd@redhat.com>
 <cb4307b9-e4b1-da06-3f69-556e8f074a88@redhat.com>
 <0d991e20-05d7-a182-5270-81c1892656b4@huawei.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <0d991e20-05d7-a182-5270-81c1892656b4@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/11/2021 13.18, wangyanan (Y) wrote:
> Hi,
> 
> On 2021/11/9 17:36, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 10/28/21 17:09, Philippe Mathieu-Daudé wrote:
>>> From: Yanan Wang <wangyanan55@huawei.com>
>>>
>>> Now that we have a generic parser smp_parse(), let's add an unit
>>> test for the code. All possible valid/invalid SMP configurations
>>> that the user can specify are covered.
>>>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Message-Id: <20211026034659.22040-3-wangyanan55@huawei.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>   tests/unit/test-smp-parse.c | 594 ++++++++++++++++++++++++++++++++++++
>>>   MAINTAINERS                 |   1 +
>>>   tests/unit/meson.build      |   1 +
>>>   3 files changed, 596 insertions(+)
>>>   create mode 100644 tests/unit/test-smp-parse.c
>> Could you have a look at this test failure please?
>> https://cirrus-ci.com/task/5823855357853696
>>
>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>> G_TEST_SRCDIR=C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/tests/unit 
>>
>> G_TEST_BUILDDIR=C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/build/tests/unit 
>>
>> tests/unit/test-smp-parse.exe --tap -k
>> Test smp_parse failed!
>> Input configuration: (SMPConfiguration) {
>>      .has_cpus    =  true, cpus    = 1,
>>      .has_sockets = false, sockets = 0,
>>      .has_dies    = false, dies    = 0,
>>      .has_cores   = false, cores   = 0,
>>      .has_threads = false, threads = 0,
>>      .has_maxcpus = false, maxcpus = 0,
>> }
>> Should be valid: no
>> Expected error report: Invalid SMP CPUs 1. The min CPUs supported by
>> machine '(null)' is 2
>> Result is valid: no
>> Output error report: Invalid SMP CPUs 1. The min CPUs supported by
>> machine '(NULL)' is 2
>> ERROR test-smp-parse - too few tests run (expected 2, got 0)
>> make: *** [Makefile.mtest:576: run-test-70] Error 1
>>
>>
>> .
> Obviously, the name string for the tested machine type in cirrus-ci is "NULL",
> while the expected name string is "null". It was also "null" when running on
> my Arm64 platform locally.
> 
> Anyway, I shouldn't have hardcoded this expected error message. I can
> send a fix patch to make it more flexible then more stable. :)

Yes, please do so. The "(null)"/"(NULL)" obviously depends on the libc that 
is used, so we should not rely on the correct spelling of the string in the 
tests here.

  Thomas



