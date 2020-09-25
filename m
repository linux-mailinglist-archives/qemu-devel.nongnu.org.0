Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299F277D6F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 03:12:53 +0200 (CEST)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLcI8-0003C4-2e
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 21:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLbwY-00072L-Rw
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 20:50:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLbwX-0002j4-0M
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 20:50:34 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600995031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrDVGz/n/23SBC+0iYk5PpLY1dapDKmuCwxPuy6K3U8=;
 b=Q6RX78Y/g9XTJJPDdi61QIRdDRc68veXrDrJo4aIEjCRUpssBUXSa4+kYYmrEipYkD60ml
 cXQCv1DviAvc3puMf7WJ2qmRTXlhSGeDQOaLUr1r/M3r1QujFGV2jFzF3/Iw/3fXygdc7I
 CjGOc54iuDDLCTdfvlUa2UGNWzXBbrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-Pv-8iEdDMsm32EuWuti6Xg-1; Thu, 24 Sep 2020 20:50:30 -0400
X-MC-Unique: Pv-8iEdDMsm32EuWuti6Xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E10B11074652;
 Fri, 25 Sep 2020 00:50:28 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5934C60C04;
 Fri, 25 Sep 2020 00:50:28 +0000 (UTC)
Subject: Re: [PATCH 06/16] qapi/expr.py: Check type of 'data' member
To: Cleber Rosa <crosa@redhat.com>
References: <20200922211313.4082880-1-jsnow@redhat.com>
 <20200922211313.4082880-7-jsnow@redhat.com>
 <20200925003102.GI347918@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <37788a49-bce8-d04e-0d98-72c50fb9e2ec@redhat.com>
Date: Thu, 24 Sep 2020 20:50:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200925003102.GI347918@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.214, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/20 8:31 PM, Cleber Rosa wrote:
> On Tue, Sep 22, 2020 at 05:13:03PM -0400, John Snow wrote:
>> Iterating over the members of data isn't going to work if it's not some
>> form of dict anyway, but for type safety, formalize it.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/expr.py | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index 3f5af5f5e4..633f9b9172 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -247,6 +247,9 @@ def check_union(expr, info):
>>               raise QAPISemError(info, "'discriminator' requires 'base'")
>>           check_name_is_str(discriminator, info, "'discriminator'")
>>   
>> +    if not isinstance(members, dict):
>> +        raise QAPISemError(info, "'data' must be an object")
>> +
> 
> Don't you mean "must be a dict" ?
> 

This error is speaking JSON-ese! json objects become python dicts, so if 
we didn't get a python dict here, we didn't get a json object.


