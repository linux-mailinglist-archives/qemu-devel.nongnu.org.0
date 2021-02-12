Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D331A03C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:03:28 +0100 (CET)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZ2d-0006KK-Ck
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAYzJ-0004WC-B8
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:00:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAYzG-0000nH-79
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613138397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dk+Q1FRnuNkwlVUFO6S7mKxuaH6pIDe+Ln38PcRaTzs=;
 b=Dt+RFG40wJZpUQnWE+H1jOH6z3Lr1IlkpBMiU9f1P95VM+uxr2RP+WI12jO/9QXXkuPfLm
 AOAnsVIGrs2vfpmNkQvupQ/U3OA+efO1INb+SSvqsTPyD7fOqiBoX4yMEMJlH8Oukxtin+
 BN0CA0EnGBR0gWY26RWLeBWUp6DsDF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-oALcWVeZOa-umdTG6W1lpQ-1; Fri, 12 Feb 2021 08:59:55 -0500
X-MC-Unique: oALcWVeZOa-umdTG6W1lpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A38B318957E4;
 Fri, 12 Feb 2021 13:59:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B553760C17;
 Fri, 12 Feb 2021 13:59:49 +0000 (UTC)
Subject: Re: [PATCH] tests/qtest/boot-sector: Check that the guest did not
 panic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20210212113141.854871-1-thuth@redhat.com>
 <32e75366-22fb-823e-2778-ad8fec102060@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a733ffb4-7c2b-e284-2eef-51aa9161318e@redhat.com>
Date: Fri, 12 Feb 2021 14:59:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <32e75366-22fb-823e-2778-ad8fec102060@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/02/2021 14.18, Philippe Mathieu-Daudé wrote:
> On 2/12/21 12:31 PM, Thomas Huth wrote:
>> The s390-ccw bios code panics if it can not boot successfully. In
>> this case, it does not make sense that we wait the full 600 seconds
>> for the boot sector test to finish and can signal the failure
>> immediately, thus let's check the status of the guest with the
>> "query-status" QMP command here, too.
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/qtest/boot-sector.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
>> index 24df5c4734..ea8f264661 100644
>> --- a/tests/qtest/boot-sector.c
>> +++ b/tests/qtest/boot-sector.c
>> @@ -138,6 +138,7 @@ void boot_sector_test(QTestState *qts)
>>       uint8_t signature_low;
>>       uint8_t signature_high;
>>       uint16_t signature;
>> +    QDict *qrsp, *qret;
>>       int i;
>>   
>>       /* Wait at most 600 seconds (test is slow with TCI and --enable-debug) */
>> @@ -155,6 +156,14 @@ void boot_sector_test(QTestState *qts)
>>           if (signature == SIGNATURE) {
>>               break;
>>           }
>> +
>> +        /* check that guest is still in "running" state and did not panic */
>> +        qrsp = qtest_qmp(qts, "{ 'execute': 'query-status' }");
>> +        qret = qdict_get_qdict(qrsp, "return");
>> +        g_assert_nonnull(qret);
>> +        g_assert_cmpstr(qdict_get_try_str(qret, "status"), ==, "running");
> 
> Interesting idea. Does it make sense to have a similar (optional?) check
> done in QEMUMachine? This could benefit integration tests, quicker exit
> on failure.

Well, it only makes sense in cases where the guest is causing a panic event. 
That's what the s390 ccw bios is doing, but other firmwares do *not* panic 
in case they cannot boot the guest.

It might be also useful for the acceptance tests if they can trigger a panic 
event, but I think we already check for the "Kernel panic" in the console 
output in most cases, so I guess that's enough already?

  Thomas


