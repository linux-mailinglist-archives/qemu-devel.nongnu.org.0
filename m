Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC42FE42E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 08:41:41 +0100 (CET)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Ub6-0004SJ-S1
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 02:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2UZv-0003vD-90
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:40:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2UZs-0003HB-63
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611214822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uztK40h8qTphTLCnxAXryxpsbghd48x9DPIb5EZtr/I=;
 b=ID660BQFYSck1oYLGowqALW2MFkIZ4RSkSDK99OoX9ivRbp/Mf10NIAAclXpXD3wlB5oX/
 iGKcB7hkSzof++akARFlY3pqDPwcTr2/BZY0hiVFaCczI2U/wNzSCed9CQ4qXy7/tcjnMo
 Q4rQvUUzMknTGwT4dmnchH2KqWC1AWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-u-sRSG6xO6qoyYEN1CYatg-1; Thu, 21 Jan 2021 02:40:20 -0500
X-MC-Unique: u-sRSG6xO6qoyYEN1CYatg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7416B107ACE3
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 07:40:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58D447086A;
 Thu, 21 Jan 2021 07:40:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C8F59113865F; Thu, 21 Jan 2021 08:40:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 10/17] qapi/gen: Combine ._add_[user|system]_module
References: <20210119180242.1570753-1-jsnow@redhat.com>
 <20210119180242.1570753-11-jsnow@redhat.com>
 <87y2gnpu4m.fsf@dusky.pond.sub.org>
 <941acfa1-940a-b264-7da3-6df4e08661c2@redhat.com>
Date: Thu, 21 Jan 2021 08:40:14 +0100
In-Reply-To: <941acfa1-940a-b264-7da3-6df4e08661c2@redhat.com> (John Snow's
 message of "Wed, 20 Jan 2021 11:10:52 -0500")
Message-ID: <87wnw6kaap.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 1/20/21 9:20 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
[...]
>>> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>>> index 55acd7e080d..b5505685e6e 100644
>>> --- a/scripts/qapi/gen.py
>>> +++ b/scripts/qapi/gen.py
[...]
>>> @@ -313,7 +306,8 @@ def visit_module(self, module: QAPISchemaModule) -> None:
>>>                   self._genc = None
>>>                   self._genh = None
>>>           else:
>>> -            self._add_user_module(module.name, self._user_blurb)
>>> +            assert module.user_module, "Unexpected system module"
>> The string provides no value.
>> 
>
> That's just, like, your opinion, man. It has value to me.
>
>
> Compare:
>
> ```
> #!/usr/bin/env python3
>
> def main():
>     assert False
>
> if __name__ == '__main__':
>     main()
> ```
>
> ```
> # ./foo.py
>
> Traceback (most recent call last):
>   File "./foo.py", line 7, in <module>
>     main()
>   File "./foo.py", line 4, in main
>     assert False
> AssertionError
> ```
>
> With:
>
>
> ```
> #!/usr/bin/env python3
>
> def main():
>     assert False, "Unexpected system module"
>
> if __name__ == '__main__':
>     main()
> ```
>
> ```
> # ./foo.py
>
> Traceback (most recent call last):
>   File "./foo.py", line 7, in <module>
>     main()
>   File "./foo.py", line 4, in main
>     assert False, "Unexpected system module"
> AssertionError: Unexpected system module
> ```
>
> I like the extra string for giving some semantic context as to
> specifically what broke (We don't expect to see system modules here) 
> instead of just a stack trace.

Your test uses assert with an argument that tells us nothing.  But the
assert we're arguing about has a nice, expressive argument.

The string improves the report from

      File "/work/armbru/qemu/scripts/qapi/gen.py", line 325, in visit_module
        assert module.user_module
    AssertionError

to

      File "/work/armbru/qemu/scripts/qapi/gen.py", line 325, in visit_module
        assert module.user_module, "Unexpected system module"
    AssertionError: Unexpected system module

Even if you value the difference, I very much doubt it justifies the
clutter.  Also, slippery slope towards pigs wearing way too much
lipstick.

Tested with

    diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
    index f3f4d2b011..bbfb30dc5a 100644
    --- a/scripts/qapi/gen.py
    +++ b/scripts/qapi/gen.py
    @@ -321,6 +321,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
                     # be generated.
                     self._current_module = None
             else:
    +            module.name = "./HACK"
                 assert module.user_module, "Unexpected system module"
                 self._add_module(module.name, self._user_blurb)
                 self._begin_user_module(module.name)


>
>>> +            self._add_module(module.name, self._user_blurb)
>>>               self._begin_user_module(module.name)
>>>         def visit_include(self, name: str, info: QAPISourceInfo) ->
>>> None:


