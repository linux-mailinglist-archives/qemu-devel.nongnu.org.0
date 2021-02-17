Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC1631DFE2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 20:57:09 +0100 (CET)
Received: from localhost ([::1]:58212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCSwd-0003Jq-ML
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 14:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lCStl-0001t0-Mi
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 14:54:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lCSte-0007pT-9Z
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 14:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613591639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6hXY4masLbkWHlvKj5l6PawF245XPCWohjn01V8id0=;
 b=HKLHO47bCc//Nx35BYrqSFVq8X1cAZHcLIr+A8eF3pCW5wDPpe6laUKlrJkVtRauCwvYm0
 vr5/vnMF5VNErqwhKRRYfrk0xBqlTuZBOoqqIaKtCP7EF37wBd5QgLj9n2zVY6KorXjLWb
 bgrhZvleUCj/e3/Mp0Hpx+q2I2QDZ8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-5JksHYXbMua9r17ItJ4t1A-1; Wed, 17 Feb 2021 14:53:55 -0500
X-MC-Unique: 5JksHYXbMua9r17ItJ4t1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CC6479EC1;
 Wed, 17 Feb 2021 19:53:54 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B9025D9C2;
 Wed, 17 Feb 2021 19:53:45 +0000 (UTC)
Subject: Re: [PATCH 1/6] Python: close the log file kept by QEMUMachine before
 reading it
To: Cleber Rosa <crosa@redhat.com>
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-2-crosa@redhat.com>
 <965f7460-bbaa-bde4-ef93-e8f968f06907@redhat.com>
 <YCsvJmgQbWywPUj1@localhost.localdomain>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <bb03ce75-1309-af3d-5708-491704fac5a5@redhat.com>
Date: Wed, 17 Feb 2021 16:53:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCsvJmgQbWywPUj1@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/15/21 11:34 PM, Cleber Rosa wrote:
> On Mon, Feb 15, 2021 at 03:30:16PM -0300, Wainer dos Santos Moschetta wrote:
>> Hi,
>>
>> On 2/11/21 7:01 PM, Cleber Rosa wrote:
>>> Closing a file that is open for writing, and then reading from it
>>> sounds like a better idea than the opposite, given that the content
>>> will be flushed.
>>>
>>> Reference: https://docs.python.org/3/library/io.html#io.IOBase.close
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>    python/qemu/machine.py | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>>> index 7a40f4604b..6e44bda337 100644
>>> --- a/python/qemu/machine.py
>>> +++ b/python/qemu/machine.py
>>> @@ -337,12 +337,12 @@ class QEMUMachine:
>>>                self._qmp.close()
>>>                self._qmp_connection = None
>>> -        self._load_io_log()
>>> -
>>>            if self._qemu_log_file is not None:
>>>                self._qemu_log_file.close()
>>>                self._qemu_log_file = None
>>> +        self._load_io_log()
>>> +
>>
>> IMO it's a too fragile fix. It needs the `self._qemu_log_file.close()` being
>> called before `self._load_io_log()` but a future change can make this
>> condition unmet again. Maybe you could document that in the code. Or change
>> the `_load_io_log()` to close the log file if it is open (also document it
>> in code).
>>
>> - Wainer
>>
> I'm glad you see this is needed... and then something else.  I'll investigate
> making this more robust as time allows it.
>
> Question is: do you ack/nack this change?

hmm... /me thinking hmmm... okay, good deal. :)

Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> Cheers,
> - Cleber.


