Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5531EE3C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:29:28 +0100 (CET)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCo3L-00077v-VK
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCo1V-0006B5-Rp
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 13:27:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCo1R-0001wV-GX
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 13:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613672845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyLQgooh6E8vH1bWDBSfUECKFuMHud3xtLUsxTi2NYI=;
 b=dcR0YApLZU4xxT848+/mHy7LsKB7+Kl8sKkAFZIImQuAw5KJlj7n+RRiG9kS2H+qwfivaP
 ARxpJagPHTZDSexlb1emAPaLVaBIeu2AdQ1UO02Ivoew8AI0TOCY4RXy10zJxnihFHYlda
 ymv52agl/8HljyudiCmPkIjBuXTfVUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-1rkJjhR-MwOC_Fou1gfsvA-1; Thu, 18 Feb 2021 13:27:23 -0500
X-MC-Unique: 1rkJjhR-MwOC_Fou1gfsvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6992C19611C5
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 18:27:22 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBDD15D9C2;
 Thu, 18 Feb 2021 18:27:21 +0000 (UTC)
Subject: Re: [PATCH RESEND] hostmem: Don't report pmem attribute if unsupported
To: Michal Privoznik <mprivozn@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <dfcc5dc7e2efc0283bc38e3036da2c0323621cdb.1611647111.git.mprivozn@redhat.com>
 <20210216222357.GL4070@habkost.net>
 <6ecacba7-5a7b-a5ce-efac-e24dd65eb5ea@redhat.com>
 <50884d4d-b6f4-b588-de75-d703ce31638b@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <09add98c-82a8-355c-2a54-cf13e9e51e5a@redhat.com>
Date: Thu, 18 Feb 2021 13:27:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <50884d4d-b6f4-b588-de75-d703ce31638b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 2:31 AM, Michal Privoznik wrote:
> On 2/17/21 12:07 AM, John Snow wrote:
>> On 2/16/21 5:23 PM, Eduardo Habkost wrote:
>>> On Tue, Jan 26, 2021 at 08:48:25AM +0100, Michal Privoznik wrote:
>>>> When management applications (like Libvirt) want to check whether
>>>> memory-backend-file.pmem is supported they can list object
>>>> properties using 'qom-list-properties'. However, 'pmem' is
>>>> declared always (and thus reported always) and only at runtime
>>>> QEMU errors out if it was built without libpmem (and thus can not
>>>> guarantee write persistence). This is suboptimal since we have
>>>> ability to declare attributes at compile time.
>>>>
>>>> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1915216
>>>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>>
>>> I'm not a fan of making availability of properties conditional
>>> (even if at compile time), but if this helps libvirt I guess it
>>> makes sense.
>>>
>>
>> Compile time might be OK, but if we want to describe everything via 
>> QAPI eventually, we just need to be able to describe that compile-time 
>> requisite appropriately.
>>
>> Conditional at run-time is I think the thing that absolutely has to go 
>> wherever it surfaces.
> 
> I'm open for discussion. How do you think libvirt (or any other mgmt 
> tool/user) should inspect whether given feature is available?
> What libvirt currently does it issues 'qom-list-properties' with 
> 'typename=memory-backend-file' and inspects whether pmem attribute is 
> available. Is 'qom-list' preferred?
> 
> 
>>
>>> CCing John, who has been thinking a lot about these questions.
>>>
>>
>> Thanks for the heads up. Good reminder that libvirt uses the existence 
>> of properties as a bellwether for feature support. I don't think I 
>> like that idea, but I like breaking libvirt even less.
> 
> That was at hand solution. If libvirt's not doing it right, I'm happy to 
> make things better.
> 
> Michal

No, libvirt is doing it exactly correct. QAPI/QMP was designed exactly 
in this way with exactly this use-case in mind.

(So far as I understand it.)

My concerns that may have guided some patches by Eduardo that might have 
caused problems for you relate to my ability to publish an SDK for 
generic builds of QEMU, where if-conditionals that actually compile 
fields out of certain data structures can be difficult to deal with at 
static analysis time.

Until we connect to the server, we don't know if type FooStruct has 
field XYZ or not. Generally the way you handle this is by always having 
that field in the SDK and erroring out at runtime if for some reason it 
is not supportable.

In the long term, we want to (I think) bridge the data gap between QOM 
and QAPI and provide a unified set of types that we can use to construct 
a "QEMU Config File" that can be validated statically against, say, 
"qemu 6.0."

In this scenario, I have some nebulous but not necessarily meticulously 
reasoned out concerns about compile-time conditional fields. In this 
scenario, using the presence or absence of a field in a data type 
becomes a poor way to do feature detection.

QMP offers the "features" flag for certain commands where we use the 
presence or absence of that flag as the introspection data in order to 
determine behavior. Going forward, I suspect I will push for 
representing formerly-compile-time flags as runtime introspection 
feature flags instead.

...But that's stuff that isn't here now, so just keep doing what you've 
been doing, and I will take careful notice not to break that kind of 
introspection without a well-advertised alternative.

Especially right now, QOM stuff isn't in QAPI, so we don't have those 
kind of feature flags at all, so I think there really isn't another way 
at all, short of adding more capabilities and complexity to the existing 
introspection stuff, which I don't think we'd do.

--js


