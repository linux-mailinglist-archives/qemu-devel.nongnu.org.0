Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67F531D5B7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 08:33:49 +0100 (CET)
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCHLI-0003mq-Qu
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 02:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lCHJa-0003MY-3w
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 02:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lCHJY-0001Cj-Eg
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 02:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613547119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFAixhumjslryAMe7VWJBcvSj6SCYRCEYAg92BVsG4c=;
 b=PN8pR45AzNAcRgMgJFDAsvayfsbWLNG7d1xZS8HQBfNaOcDFOY/TF0E8NozbpXEKvPDgQ+
 FufnEQyR5/NUUl0MTwBD3hD2dIhU5cDcUywup/MlUsIo3xm5rbOHKlewPGYhKVr+h6B5dh
 xuQsPAMbvNxNlPHpnb4Tu+3AGtGFIBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-0_SvTjziNm2044Y_yBDB-A-1; Wed, 17 Feb 2021 02:31:57 -0500
X-MC-Unique: 0_SvTjziNm2044Y_yBDB-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4708F100CCC1
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 07:31:56 +0000 (UTC)
Received: from [10.40.192.67] (unknown [10.40.192.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 721182CFCE;
 Wed, 17 Feb 2021 07:31:55 +0000 (UTC)
Subject: Re: [PATCH RESEND] hostmem: Don't report pmem attribute if unsupported
To: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <dfcc5dc7e2efc0283bc38e3036da2c0323621cdb.1611647111.git.mprivozn@redhat.com>
 <20210216222357.GL4070@habkost.net>
 <6ecacba7-5a7b-a5ce-efac-e24dd65eb5ea@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <50884d4d-b6f4-b588-de75-d703ce31638b@redhat.com>
Date: Wed, 17 Feb 2021 08:31:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6ecacba7-5a7b-a5ce-efac-e24dd65eb5ea@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mprivozn@redhat.com;
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

On 2/17/21 12:07 AM, John Snow wrote:
> On 2/16/21 5:23 PM, Eduardo Habkost wrote:
>> On Tue, Jan 26, 2021 at 08:48:25AM +0100, Michal Privoznik wrote:
>>> When management applications (like Libvirt) want to check whether
>>> memory-backend-file.pmem is supported they can list object
>>> properties using 'qom-list-properties'. However, 'pmem' is
>>> declared always (and thus reported always) and only at runtime
>>> QEMU errors out if it was built without libpmem (and thus can not
>>> guarantee write persistence). This is suboptimal since we have
>>> ability to declare attributes at compile time.
>>>
>>> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1915216
>>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>
>> I'm not a fan of making availability of properties conditional
>> (even if at compile time), but if this helps libvirt I guess it
>> makes sense.
>>
> 
> Compile time might be OK, but if we want to describe everything via QAPI 
> eventually, we just need to be able to describe that compile-time 
> requisite appropriately.
> 
> Conditional at run-time is I think the thing that absolutely has to go 
> wherever it surfaces.

I'm open for discussion. How do you think libvirt (or any other mgmt 
tool/user) should inspect whether given feature is available?
What libvirt currently does it issues 'qom-list-properties' with 
'typename=memory-backend-file' and inspects whether pmem attribute is 
available. Is 'qom-list' preferred?


> 
>> CCing John, who has been thinking a lot about these questions.
>>
> 
> Thanks for the heads up. Good reminder that libvirt uses the existence 
> of properties as a bellwether for feature support. I don't think I like 
> that idea, but I like breaking libvirt even less.

That was at hand solution. If libvirt's not doing it right, I'm happy to 
make things better.

Michal


