Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71034281D12
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 22:43:54 +0200 (CEST)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kORuD-0001V6-2Z
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 16:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kORsa-0000r3-8U
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 16:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kORsX-0007ee-OH
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 16:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601671327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+pnd48btZ+ojFZD7fywCGNuhmWCzwbcMsuMGqQ46Bsw=;
 b=cVgC3uBQM8VDaQ+kngMsz9kOl2whWTIz0McbpknqlhWAgJFlJFT1LYdJneQm1rN31K9Av7
 Rjs97nx2xtczoan7zEIcUfDVltMzYxVXDw1jt3mMBmAi3//EG8EyKzE499aoe1X1DGb1b+
 +Ln3uZcJRH2b0N8jgoNzSnqbAxUHn+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-1DIZH4LiNCKien_XBz4WMw-1; Fri, 02 Oct 2020 16:42:06 -0400
X-MC-Unique: 1DIZH4LiNCKien_XBz4WMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 149641006703;
 Fri,  2 Oct 2020 20:42:05 +0000 (UTC)
Received: from [10.10.120.38] (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A68965D9D3;
 Fri,  2 Oct 2020 20:42:04 +0000 (UTC)
Subject: Re: [PATCH] scripts/qmp/qom-set: Allow setting integer value
To: Jonatan Palsson <jonatan.p@gmail.com>
References: <20201002201933.250878-1-jonatan.p@gmail.com>
 <c22a0594-9f8f-3531-cbc3-862ba15d89c9@redhat.com>
 <CAKm+giO8LQCw8g==0zKV2LYvfqxVmimnJ9oWcsdvFZtmPzcq_g@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <eb61cb73-2627-7872-0846-9f663fe4043b@redhat.com>
Date: Fri, 2 Oct 2020 16:42:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAKm+giO8LQCw8g==0zKV2LYvfqxVmimnJ9oWcsdvFZtmPzcq_g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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

On 10/2/20 4:36 PM, Jonatan Palsson wrote:
> On Fri, Oct 2, 2020 at 10:29 PM John Snow <jsnow@redhat.com> wrote:
>>
>> On 10/2/20 4:19 PM, Jonatan Pålsson wrote:
>>> If the value appears to be an integer, parse it as such.
>>>
>>> This allows the following:
>>>
>>>       qmp/qom-set -s ~/qmp.sock sensor.temperature 20000
>>>
>>> .. where sensor is a tmp105 device, and temperature is an integer
>>> property.
>>>
>>> Signed-off-by: Jonatan Pålsson <jonatan.p@gmail.com>
>>> ---
>>>    scripts/qmp/qom-set | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/qmp/qom-set b/scripts/qmp/qom-set
>>> index 240a78187f..61920680eb 100755
>>> --- a/scripts/qmp/qom-set
>>> +++ b/scripts/qmp/qom-set
>>> @@ -56,7 +56,10 @@ if len(args) > 1:
>>>            path, prop = args[0].rsplit('.', 1)
>>>        except:
>>>            usage_error("invalid format for path/property/value")
>>> -    value = args[1]
>>> +    try:
>>> +        value = int(args[1])
>>> +    except:
>>> +        value = args[1]
>>
>> Please catch the ValueError explicitly.
> 
> Sure, I'll send a v2.
> 
>>
>>>    else:
>>>        usage_error("not enough arguments")
>>>
>>>
>>
>> What happens when you don't convert it to int specifically? Does
>> something break? My understanding was that QOM received everything as a
>> string anyway, and does its own parsing.
> 
> With the current implementation, I see this:
> 
> scripts/qmp/qom-set -s ~/qmp.sock sensor.temperature 20000
> Traceback (most recent call last):
>    File "scripts/qmp/qom-set", line 66, in <module>
>      print(srv.command('qom-set', path=path, property=prop, value=value))
>    File "scripts/qmp/../../python/qemu/qmp.py", line 274, in command
>      raise QMPResponseError(ret)
> qemu.qmp.QMPResponseError: Invalid parameter type for 'temperature',
> expected: integer
> 

Oh, unfortunate. I hope there aren't any cases where QOM expects a 
string, but can accept a string where a numerical value is otherwise valid.

These are just debugging scripts, so I guess this is probably okay to 
just change and see if anything explodes.

(A more robust solution might actually attempt to query QEMU to get the 
QOM property types and judiciously apply conversions. A problem for 
another day?)

--js


