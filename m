Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94493693A9
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:35:34 +0200 (CEST)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvy1-0004si-9u
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZvrS-0002A9-Q1
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZvrL-00080b-Qd
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619184514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2fImo1UBSn7MQHkyOHGDcoBJTKrDdZ1VVC6oYL9UIFU=;
 b=QI2tWq469jqI2LoBMktWlGrK3zkoPL9gvO/PmG6+POOf76o4heQV4/BbOq9OUSeN6lnV2T
 VeDAZ6sToMUjNhjFZJenOILp3zF346B8yBSMNMGNTpmXPELw4UcDFD5jxi3I4HWLzLVnWe
 4AFpB4MPxgmrQvKTmGDJGcZ5aCl29sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-pdr-RoFbNX2BFHGjqFFOKg-1; Fri, 23 Apr 2021 09:28:33 -0400
X-MC-Unique: pdr-RoFbNX2BFHGjqFFOKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74368107ACCA;
 Fri, 23 Apr 2021 13:28:31 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-143.ams2.redhat.com [10.36.115.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DE7760613;
 Fri, 23 Apr 2021 13:28:20 +0000 (UTC)
Subject: Re: [PATCH] target/s390x: fix s390_probe_access to check
 PAGE_WRITE_ORG for writeability
To: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>
References: <20210422154427.13038-1-alex.bennee@linaro.org>
 <20210423142209.03032dc5.cohuck@redhat.com>
 <CAFEAcA80L=xum=9m+2TLiP09OrjuRG4VghfxK8A42Y+0+EUB2g@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dae28ff3-5c32-2345-a336-30f59eb59b13@redhat.com>
Date: Fri, 23 Apr 2021 15:28:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA80L=xum=9m+2TLiP09OrjuRG4VghfxK8A42Y+0+EUB2g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/04/2021 15.06, Peter Maydell wrote:
> On Fri, 23 Apr 2021 at 13:22, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> On Thu, 22 Apr 2021 16:44:27 +0100
>> Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>> We can remove PAGE_WRITE when (internally) marking a page read-only
>>> because it contains translated code. This can get confused when we are
>>> executing signal return code on signal stacks.
>>>
>>> Fixes: e56552cf07 ("target/s390x: Implement the MVPG condition-code-option bit")
>>> Found-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>> Cc: Thomas Huth <thuth@redhat.com>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Laurent Vivier <laurent@vivier.eu>
>>> ---
>>>   target/s390x/mem_helper.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
>>> index 12e84a4285..f6a7d29273 100644
>>> --- a/target/s390x/mem_helper.c
>>> +++ b/target/s390x/mem_helper.c
>>> @@ -145,7 +145,7 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
>>>
>>>   #if defined(CONFIG_USER_ONLY)
>>>       flags = page_get_flags(addr);
>>> -    if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE))) {
>>> +    if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE_ORG))) {
>>>           env->__excp_addr = addr;
>>>           flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
>>>           if (nonfault) {
>>
>> What's the verdict on this one? I plan to queue this to s390-next; but
>> if we end up doing an -rc5, it might qualify as a regression fix.
> 
> What's your opinion? I think we do need an rc5 for the network backend
> hotplug crash. I don't want to open the doors for lots of new fixes
> just because we've got another rc, but on the other hand this one
> does look like it's a pretty small and safe fix, and letting intermittent
> crash bugs out into the wild seems like it could lead to a lot of
> annoying re-investigation of the same bug if it's reported by users
> later... So I kind of lean towards putting it in rc5.

IMHO: It's in a s390x-only file, within a #ifdef CONFIG_USER_ONLY ... so the 
damage this could do is very, very limited, indeed. Thus I'd also suggest to 
include it in a rc5.

  Thomas


