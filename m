Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A173A2F1242
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:26:07 +0100 (CET)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywGs-0000HU-Oq
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kywFv-00083f-3L
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kywFt-0005fS-HH
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610367904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEDp+HUEhbBAmwMPnxQVzM3L6KyP2nnx1ZYR0bl7ReE=;
 b=ISaFt5hx5HUV+zZdQ8i/Mfe7i7SX6pA9b0+wCEuzohR77zph9fSK3QJR9gTJ2Cw6Q59T89
 AAeD7uNLala24mCsMjJ+rRzm01hosDXMRPF56dF5yImds5FgZg7mCYlW22Fj6sGEftYKFJ
 5gVkQQXlZLS38TqT+wsiAPSjQPLl/SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-OO5Tam-SME6JCysfyOltng-1; Mon, 11 Jan 2021 07:25:01 -0500
X-MC-Unique: OO5Tam-SME6JCysfyOltng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4DE8107ACF8;
 Mon, 11 Jan 2021 12:25:00 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 308755D9F4;
 Mon, 11 Jan 2021 12:24:58 +0000 (UTC)
Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 mrezanin@redhat.com, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <cover.1610364304.git.mrezanin@redhat.com>
 <e1ad733af7b23929456d05aacae693ce6462d4b3.1610364304.git.mrezanin@redhat.com>
 <5acb5521-fdd2-e511-9cc3-176086183dd5@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <88c2eb01-f8f5-18d5-6513-57322930cc77@redhat.com>
Date: Mon, 11 Jan 2021 13:24:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5acb5521-fdd2-e511-9cc3-176086183dd5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2021 13.10, Philippe Mathieu-Daudé wrote:
> Hi Miroslav,
> 
> On 1/11/21 12:30 PM, mrezanin@redhat.com wrote:
>> From: Miroslav Rezanina <mrezanin@redhat.com>
>>
>> There are two cases when vm name is copied but closing \0 can be lost
>> in case name is too long (>=256 characters).
>>
>> Updating length to copy so there is space for closing \0.
>>
>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>> ---
>>   target/s390x/kvm.c         | 2 +-
>>   target/s390x/misc_helper.c | 4 +++-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
>> index b8385e6b95..2313b5727e 100644
>> --- a/target/s390x/kvm.c
>> +++ b/target/s390x/kvm.c
>> @@ -1918,7 +1918,7 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
>>        */
>>       if (qemu_name) {
>>           strncpy((char *)sysib.ext_names[0], qemu_name,
>> -                sizeof(sysib.ext_names[0]));
>> +                sizeof(sysib.ext_names[0]) - 1);
>>       } else {
>>           strcpy((char *)sysib.ext_names[0], "KVMguest");
>>       }
> 
> What about using strpadcpy() instead?

Yes, strpadcpy is the better way here - this field has to be padded with 
zeroes, so doing "- 1" is wrong here.

  Thomas


