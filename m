Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAC62DEB1C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 22:32:04 +0100 (CET)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqNM3-0007ro-5U
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 16:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kqNKl-0007Le-Lx
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 16:30:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kqNKi-00079d-OL
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 16:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608327038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctoP7Y4p24WO9eIKq5DKmLl3g4kfLIc3G1NTOZQtRBo=;
 b=I3PLhePEaQXUCx6GC4sKhlCxEJP27A7gXLZDMPzgOgJCLP6Og8H9/TzyqhbSGLQzFkeK6S
 KbVcd7JkOsJdaEAqTna97S130bsO0yQ1f3tWfq8Byz2WO0+9dvE24QOY2DGcjVWG6B3kmu
 rWth/IsqX5oNl9+sEPs/J/6aM7Ck+Ow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-wAVw5LAYPQWH5ymcLGXUZA-1; Fri, 18 Dec 2020 16:30:36 -0500
X-MC-Unique: wAVw5LAYPQWH5ymcLGXUZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C114107ACE4
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 21:30:35 +0000 (UTC)
Received: from [10.10.112.131] (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A152B2CC9B;
 Fri, 18 Dec 2020 21:30:31 +0000 (UTC)
Subject: Re: [PATCH 08/12] qapi/schema: make QAPISourceInfo mandatory
To: Markus Armbruster <armbru@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-9-jsnow@redhat.com>
 <875z52rr3h.fsf@dusky.pond.sub.org>
 <60c5ae45-c1c4-8bac-9617-5366e49dac7e@redhat.com>
 <87pn38lv1d.fsf@dusky.pond.sub.org>
 <e9f43898-1c0b-54e3-59a7-d9064c2d86ea@redhat.com>
 <87mtybd6ut.fsf@dusky.pond.sub.org>
 <e99196f0-8ea7-6627-04c3-e07754321e01@redhat.com>
 <87mtya7rxn.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <b55a8ae1-ca08-e4dd-9153-5f4b3062e651@redhat.com>
Date: Fri, 18 Dec 2020 16:30:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87mtya7rxn.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 3:57 PM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 12/18/20 12:24 AM, Markus Armbruster wrote:
>>>> I could conceivably use source line information and stuff, to be
>>>> needlessly fancy about it. Nah. I just think singleton patterns are kind
>>>> of weird to implement in Python, so I didn't.
>>> Stupidest singleton that could possibly work: in __init__,
>>> self.singleton = ...
>>>
>>
>> Yeah, you can make a class variable that has a builtin singleton, then
>> make the class method return that class variable.
>>
>> Feels fancier than my laziness permits. I just put it back to using
>> one copy per definition.
> 
> Why have a class method around the attribute?  Just use the stoopid
> attribute already ;-P
> 

Something has to initialize it:

```
class Blah:
     magic = Blah()

     def __init__(self):
         pass
```

Won't work; Blah isn't defined yet. a classmethod works though:

```
class Blah:
     magic = None

     def __init__(self) -> None:
         pass

     @classmethod
     def make(cls) -> 'Blah':
         if cls.magic is None:
             cls.magic = cls()
         return cls.magic
```


