Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C912DB03D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:41:21 +0100 (CET)
Received: from localhost ([::1]:40398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCS0-0002ec-6H
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpCCy-0006Z2-HZ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:25:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpCCv-00030e-On
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QoSZltVa3pDhpcAqMYL3nXZDuw3718MGTOOnrVr8TvM=;
 b=dozbsNmW8o7nm6Rq9PfLTfEUFUYBUmYs1a8nMGaXbO2SFvq76LJrlQHOrKjbt6NuJ7PEzP
 rWkQDgv1AwGlQC3pNM09ChbPf9G9MDIdIfPJbaADfMt0zNQBOEQg6iuT19lLZlD51zBKM8
 fTrjEB7UUvCoYciweOxHJRITHuMOj2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-SAAeZvUnPuehn4D4ML--4w-1; Tue, 15 Dec 2020 10:25:41 -0500
X-MC-Unique: SAAeZvUnPuehn4D4ML--4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 877B6802B40
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:25:40 +0000 (UTC)
Received: from [10.10.116.117] (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 104D25C224;
 Tue, 15 Dec 2020 15:25:39 +0000 (UTC)
Subject: Re: [PATCH v2 10/11] qapi/introspect.py: improve readability of
 _tree_to_qlit
To: Markus Armbruster <armbru@redhat.com>
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-11-jsnow@redhat.com>
 <87tutpzjvh.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <172527bd-e88b-b9e3-adda-09edb5a39f53@redhat.com>
Date: Tue, 15 Dec 2020 10:25:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87tutpzjvh.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 5:17 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Subjective, but I find getting rid of the comprehensions helps. Also,
>> divide the sections into scalar and non-scalar sections, and remove
>> old-style string formatting.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 37 +++++++++++++++++++++----------------
>>   1 file changed, 21 insertions(+), 16 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index a261e402d69..d4f28485ba5 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -100,7 +100,7 @@ def indent(level: int) -> str:
>>   
>>           ret = ''
>>           if obj.comment:
>> -            ret += indent(level) + '/* %s */\n' % obj.comment
>> +            ret += indent(level) + f"/* {obj.comment} */\n"
>>           if obj.ifcond:
>>               ret += gen_if(obj.ifcond)
>>           ret += _tree_to_qlit(obj.value, level, suppress_first_indent)
>> @@ -111,31 +111,36 @@ def indent(level: int) -> str:
>>       ret = ''
>>       if not suppress_first_indent:
>>           ret += indent(level)
>> +
>> +    # Scalars:
>>       if obj is None:
>>           ret += 'QLIT_QNULL'
>>       elif isinstance(obj, str):
>> -        ret += 'QLIT_QSTR(' + to_c_string(obj) + ')'
>> +        ret += f"QLIT_QSTR({to_c_string(obj)})"
>> +    elif isinstance(obj, bool):
>> +        ret += "QLIT_QBOOL({:s})".format(str(obj).lower())
> 
> Changed from
> 
>             ret += 'QLIT_QBOOL(%s)' % ('true' if obj else 'false')
> 
> Doesn't look like an improvement to me.
> 

Momentary lapse of judgment and/or just got lost in a sea of 150 
patches, please pick your preferred excuse.

(I've made this one use an f-string, too.)

>> +
>> +    # Non-scalars:
>>       elif isinstance(obj, list):
>> -        elts = [_tree_to_qlit(elt, level + 1).strip('\n')
>> -                for elt in obj]
>> -        elts.append(indent(level + 1) + "{}")
>>           ret += 'QLIT_QLIST(((QLitObject[]) {\n'
>> -        ret += '\n'.join(elts) + '\n'
>> +        for value in obj:
>> +            ret += _tree_to_qlit(value, level + 1).strip('\n') + '\n'
>> +        ret += indent(level + 1) + '{}\n'
>>           ret += indent(level) + '}))'
>>       elif isinstance(obj, dict):
>> -        elts = []
>> -        for key, value in sorted(obj.items()):
>> -            elts.append(indent(level + 1) + '{ %s, %s }' %
>> -                        (to_c_string(key),
>> -                         _tree_to_qlit(value, level + 1, True)))
>> -        elts.append(indent(level + 1) + '{}')
>>           ret += 'QLIT_QDICT(((QLitDictEntry[]) {\n'
>> -        ret += ',\n'.join(elts) + '\n'
>> +        for key, value in sorted(obj.items()):
>> +            ret += indent(level + 1) + "{{ {:s}, {:s} }},\n".format(
>> +                to_c_string(key),
>> +                _tree_to_qlit(value, level + 1, suppress_first_indent=True)
>> +            )
>> +        ret += indent(level + 1) + '{}\n'
>>           ret += indent(level) + '}))'
>> -    elif isinstance(obj, bool):
>> -        ret += 'QLIT_QBOOL(%s)' % ('true' if obj else 'false')
>>       else:
>> -        assert False                # not implemented
>> +        raise NotImplementedError(
>> +            f"type '{type(obj).__name__}' not implemented"
>> +        )
> 
> Not covered by the commit message's mandate.
> 
> Why bother?
> 

Somewhat as a debugging mechanism while I was toying with various 
refactors. I like my error messages to be informative, I guess.

>> +
>>       if level > 0:
>>           ret += ','
>>       return ret


