Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80C035FA0D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 19:48:42 +0200 (CEST)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWjd4-0006K6-18
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 13:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWjU3-0001p8-M9
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:39:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWjTz-0008EN-Lf
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618421957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TaI7JWPhrCcL9YjipiWrGob/NdE4jqDUD52mLJeqZMg=;
 b=iyvaVJFItgpOpSuxrs1meuxiVsGaV3HkmeAGcXWgOZ4aGxN8ywzbdklHLxpcp2aDTOI35v
 asz9NpW30+4ymwqoffccnkA/zC6MyLpg+BpDyJ7C7uOIkXr3iyD1gV6nNnxoZRRvJ0C6we
 xMPZnfYk7km6umKuYzbMei/ir5vVITQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-1gfOC4HYNVy6R-6o3zviYw-1; Wed, 14 Apr 2021 13:39:14 -0400
X-MC-Unique: 1gfOC4HYNVy6R-6o3zviYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7999FA0CAC
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 17:39:13 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 306AA60657;
 Wed, 14 Apr 2021 17:39:08 +0000 (UTC)
Subject: Re: [PATCH RFC 4/7] message: add QMP Message type
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210413155553.2660523-1-jsnow@redhat.com>
 <20210413155553.2660523-5-jsnow@redhat.com>
 <YHX6AbETd6Idbq//@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <25fb88b3-b2b4-e730-c61d-5a145c850dbb@redhat.com>
Date: Wed, 14 Apr 2021 13:39:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YHX6AbETd6Idbq//@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: armbru@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 4:07 PM, Stefan Hajnoczi wrote:
> On Tue, Apr 13, 2021 at 11:55:50AM -0400, John Snow wrote:
>> This is an abstraction that represents a single message either sent to
>> or received from the server. It is used to subclass the
>> AsyncProtocol(Generic[T]) type.
>>
>> It was written such that it can be populated by either raw data or by a
>> dict, with the other form being generated on-demand, as-needed.
>>
>> It behaves almost exactly like a dict, but has some extra methods and a
>> special constructor. (It should quack fairly convincingly.)
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   message.py | 196 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 196 insertions(+)
>>   create mode 100644 message.py
>>
>> diff --git a/message.py b/message.py
>> new file mode 100644
>> index 0000000..5c7e828
>> --- /dev/null
>> +++ b/message.py
>> @@ -0,0 +1,196 @@
>> +"""
>> +QMP Message format and errors.
>> +
>> +This module provides the `Message` class, which represents a single QMP
>> +message sent to or from the server. Several error-classes that depend on
>> +knowing the format of this message are also included here.
>> +"""
>> +
>> +import json
>> +from json import JSONDecodeError
>> +from typing import (
>> +    Dict,
>> +    ItemsView,
>> +    Iterable,
>> +    KeysView,
>> +    Optional,
>> +    Union,
>> +    ValuesView,
>> +)
>> +
>> +from error import (
>> +    DeserializationError,
>> +    ProtocolError,
>> +    UnexpectedTypeError,
>> +)
>> +
>> +
>> +class Message:
>> +    """
>> +    Represents a single QMP protocol message.
>> +
>> +    QMP uses JSON objects as its basic communicative unit; so this
>> +    object behaves like a MutableMapping. It may be instantiated from
>> +    either another mapping (like a dict), or from raw bytes that still
>> +    need to be deserialized.
>> +
>> +    :param value: Initial value, if any.
>> +    :param eager: When true, attempt to serialize (or deserialize) the
>> +                  initial value immediately, such that conversion exceptions
>> +                  are raised during the call to the initialization method.
>> +    """
> 
> Why define this class instead of using dicts? It's a very fancy way of
> calling json.dumps() and json.loads().
> 

Mostly just to associate the de/serialization methods of the 
unit-message with that data type, and it's nice for strict typing.

It does repeat a lot of boilerplate to just re-implement the 
dict-quacking; but I think I might actually be able to get around that 
by inheriting from MutableMapping to get all of that boilerplate "for free".

I'll see. I'll put it high on the list for the chopping block.

--js


