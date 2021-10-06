Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4A542480F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 22:38:41 +0200 (CEST)
Received: from localhost ([::1]:48172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYDgW-0001r2-Od
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 16:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYDdc-0000R8-IF
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:35:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYDdZ-00080w-J4
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633552531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OXUZxsK1QdLO6xng6hFlFsgbFwbh30BDsuNSdVeIo/U=;
 b=SKsOffgT1VMaANnBqaXed8q5EGT7uPVjhwciPe/qIZQjLwy0uAwIaxIkC6xXSYLUWZlrso
 7xlZ4y00o1+WJxMRUCiv/63bF5qRlnjPTzO52quwlo2L2GKtUpndMgOBHesHOxYjXNc7M9
 sTEBSSqWQeAWyPqTa1TVKpLLt7oFSos=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-_qfSl5q2OvGU8SkfRiQirA-1; Wed, 06 Oct 2021 16:35:30 -0400
X-MC-Unique: _qfSl5q2OvGU8SkfRiQirA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso2962626wrg.1
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 13:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OXUZxsK1QdLO6xng6hFlFsgbFwbh30BDsuNSdVeIo/U=;
 b=lHhWNgG5IOnWhXk8sH09BOx9398dufSVCZ6aqLuwwKa9KCb1UsvkuRpjoLyob35QpY
 Kk2M/0QDJlxqYKHJBUzfaPr4H9Ut66lHzpnlvi7VaY5exDB1J49OOvaWdj7zEtPJqDYB
 eyeH0Gz7dYPndlX+zCVWBn4SUbzjk0oQQPW5/+yPGMj+pXETV9IQjaL1auQHNOoEUUjQ
 wC/Qg2H9x+pFbfHNDC8O/Fv3ULP+Sg7b+Nb+XzbXU2ZfeYJ+56BrfhZwfwlPMkTQFtQ9
 xNnZE4kVF+1JeDQgAB3deb94PUxdS9KqWH6PTvryhU9fhKIzpgMmn8H9a1olbx9IlZ3F
 OONA==
X-Gm-Message-State: AOAM530GilqUp7RUCkEgBw7fqAqhs25tlE6RnC3fqp99wQZhI4+Rrmfk
 zoSM8wiUpSV4wEJ43CbZ11jJHAhSBLsT4qHcFhzJREuPE4GKxNUD6EbJa4ivCalqeG0jUehocV2
 Gh2EBByilKUmUFD0=
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr12371023wmc.86.1633552529626; 
 Wed, 06 Oct 2021 13:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAV1sU0EbX3shysQeMn1nSNxCQsb3Xblx9vhq06zqPcFS58jo633atJc2QNjsRG4oLLhGD6A==
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr12370995wmc.86.1633552529397; 
 Wed, 06 Oct 2021 13:35:29 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n186sm6489688wme.31.2021.10.06.13.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 13:35:28 -0700 (PDT)
Message-ID: <bf016462-0409-b08a-211e-91cfa34f5776@redhat.com>
Date: Wed, 6 Oct 2021 22:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 22/22] MAINTAINERS: Cover AMD SEV files
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-23-philmd@redhat.com>
 <a603ce87-e315-06e0-ff53-2c961c046b82@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <a603ce87-e315-06e0-ff53-2c961c046b82@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 10:27, Paolo Bonzini wrote:
> On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
>> Add an entry to list SEV-related files.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   MAINTAINERS | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 50435b8d2f5..733a5201e76 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3038,6 +3038,13 @@ F: hw/core/clock-vmstate.c
>>   F: hw/core/qdev-clock.c
>>   F: docs/devel/clocks.rst
>>   +AMD Secure Encrypted Virtualization (SEV)
>> +S: Orphan
>> +F: docs/amd-memory-encryption.txt
>> +F: target/i386/sev*
>> +F: target/i386/kvm/sev-stub.c
>> +F: include/sysemu/sev.h
> 
> I don't think it qualifies as orphan; it's covered by x86 maintainers.

$ ./scripts/get_maintainer.pl -f docs/amd-memory-encryption.txt
get_maintainer.pl: No maintainers found, printing recent contributors.
get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.
Connor Kuehl <ckuehl@redhat.com> (commit_signer:2/3=67%)
Eduardo Habkost <ehabkost@redhat.com> (commit_signer:2/3=67%)
Tom Lendacky <thomas.lendacky@amd.com> (commit_signer:2/3=67%)
Laszlo Ersek <lersek@redhat.com> (commit_signer:2/3=67%)
Greg Kurz <groug@kaod.org> (commit_signer:1/3=33%)
qemu-devel@nongnu.org (open list:All patches CC here)

$ ./scripts/get_maintainer.pl -f target/i386/sev.c
get_maintainer.pl: No maintainers found, printing recent contributors.
get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.
"Philippe Mathieu-Daudé" <philmd@redhat.com> (commit_signer:15/29=52%)
"Dr. David Alan Gilbert" <dgilbert@redhat.com> (commit_signer:7/29=24%)
Paolo Bonzini <pbonzini@redhat.com> (commit_signer:7/29=24%)
David Gibson <david@gibson.dropbear.id.au> (commit_signer:7/29=24%)
Eduardo Habkost <ehabkost@redhat.com> (commit_signer:5/29=17%)
qemu-devel@nongnu.org (open list:All patches CC here)

$ ./scripts/get_maintainer.pl -f target/i386/sev.h
get_maintainer.pl: No maintainers found, printing recent contributors.
get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.
"Philippe Mathieu-Daudé" <philmd@redhat.com> (commit_signer:8/12=67%)
Paolo Bonzini <pbonzini@redhat.com> (commit_signer:4/12=33%)
James Bottomley <jejb@linux.ibm.com> (commit_signer:3/12=25%)
"Dr. David Alan Gilbert" <dgilbert@redhat.com> (commit_signer:3/12=25%)
Connor Kuehl <ckuehl@redhat.com> (commit_signer:3/12=25%)
qemu-devel@nongnu.org (open list:All patches CC here)

I will update the patch to add these files to the "X86 KVM CPUs"
section.

Thanks,

Phil.


