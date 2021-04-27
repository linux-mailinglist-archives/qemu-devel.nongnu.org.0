Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59AF36BF2D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 08:16:52 +0200 (CEST)
Received: from localhost ([::1]:45920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbH1g-0001nX-1Q
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 02:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbGz3-0001DW-9W
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 02:14:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbGz0-0005GW-QB
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 02:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619504045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NwzTFPZ/WBrBwJAPZzWvNtvrQ7Lae9rGATHr4kBuhpc=;
 b=WnU9Ai8ToAbqA2yn7UsXcKmJrDdAwAdD0z0vsJuF5IDViyVx79EN93ccHT9/NTfE2JTwYu
 abIqZ6GTbS28gtYdaLqQnnQUnOnvcnFJfeV0sWE5Ve6pXwlH+s1NnVoRVEfL6kmWp+YC6T
 rjfelr2HVrwXBx82jM9DXrek5yKAWGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-l-D_PDf4NeGuDo9VmZbsXg-1; Tue, 27 Apr 2021 02:14:02 -0400
X-MC-Unique: l-D_PDf4NeGuDo9VmZbsXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90B991006C85;
 Tue, 27 Apr 2021 06:14:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 606CE69FB4;
 Tue, 27 Apr 2021 06:14:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E0594113525D; Tue, 27 Apr 2021 08:13:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 07/22] qapi/parser: assert object keys are strings
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-8-jsnow@redhat.com>
 <87eeey962x.fsf@dusky.pond.sub.org>
 <822441ee-e877-d4dd-9078-d0a930d140d2@redhat.com>
Date: Tue, 27 Apr 2021 08:13:59 +0200
In-Reply-To: <822441ee-e877-d4dd-9078-d0a930d140d2@redhat.com> (John Snow's
 message of "Mon, 26 Apr 2021 13:46:27 -0400")
Message-ID: <87sg3c6yqg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 4/25/21 3:27 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> The single quote token implies the value is a string. Assert this to be
>>> the case.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/parser.py | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>>> index 6b443b1247e..8d1fe0ddda5 100644
>>> --- a/scripts/qapi/parser.py
>>> +++ b/scripts/qapi/parser.py
>>> @@ -246,6 +246,8 @@ def get_members(self):
>>>               raise QAPIParseError(self, "expected string or '}'")
>>>           while True:
>>>               key = self.val
>>> +            assert isinstance(key, str)  # Guaranteed by tok == "'"
>>> +
>>>               self.accept()
>>>               if self.tok != ':':
>>>                   raise QAPIParseError(self, "expected ':'")
>> 
>> The assertion is correct, but I wonder why mypy needs it.  Can you help?
>> 
>
> The lexer value can also be True/False (Maybe None? I forget) based on 

Yes, None for tokens like '{'.

> the Token returned. Here, since the token was the single quote, we know 
> that value must be a string.
>
> Mypy has no insight into the correlation between the Token itself and 
> the token value, because that relationship is not expressed via the type 
> system.

I understand that mypy can't prove implications like if self.tok == "'",
then self.val is a str.

What I'm curious about is why key needs to be known to be str here.
Hmm, is it so return expr type-checks once you add -> OrderedDict[str,
object] to the function?


