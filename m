Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204AD2FE3D9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 08:24:44 +0100 (CET)
Received: from localhost ([::1]:45360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2UKg-0005Sc-OG
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 02:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2UIS-0004Zv-Mk
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:22:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2UIP-0003ta-LO
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611213739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wzes3WI9DOvZkALhnRZd8byzfZInD0VAEWyFsqNab50=;
 b=T5S7si5qMoTTMiftikAstAOra9ANHGB0dgNzStoh/WPOdKLptZsyPwrciEnHfrMy5WIKjq
 WzbHPDQ7QINQLy+Mz0FToVkdROP1H2sVbs1/Eoqs8wHTzPxPjfsC0Kw1nQH4xPzT+zqxtl
 LsQLgCKj06Bk+BXWf5tDjJBpSWN3JfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-Yg5_6TDVOKG-6ordLw1Cnw-1; Thu, 21 Jan 2021 02:22:09 -0500
X-MC-Unique: Yg5_6TDVOKG-6ordLw1Cnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C391780A5C0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 07:22:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B64B36B540;
 Thu, 21 Jan 2021 07:22:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 30210113865F; Thu, 21 Jan 2021 08:22:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 05/17] qapi: pass QAPISchemaModule to visit_module
 instead of str
References: <20210119180242.1570753-1-jsnow@redhat.com>
 <20210119180242.1570753-6-jsnow@redhat.com>
 <87eeifu805.fsf@dusky.pond.sub.org>
 <049e81a7-c7d7-65af-129d-4d0993aff559@redhat.com>
Date: Thu, 21 Jan 2021 08:22:03 +0100
In-Reply-To: <049e81a7-c7d7-65af-129d-4d0993aff559@redhat.com> (John Snow's
 message of "Wed, 20 Jan 2021 10:51:40 -0500")
Message-ID: <87k0s6lppg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 1/20/21 7:07 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
[...]
>>> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
>>> index e03abcbb959..f754f675d66 100644
>>> --- a/docs/sphinx/qapidoc.py
>>> +++ b/docs/sphinx/qapidoc.py
>>> @@ -463,11 +463,11 @@ def __init__(self, env, qapidir):
>>>           self._env = env
>>>           self._qapidir = qapidir
>>>   -    def visit_module(self, name):
>>> -        if name is not None:
>>> -            qapifile = self._qapidir + '/' + name
>>> +    def visit_module(self, module):
>>> +        if module.name:
>> Replacing the "is not None" test by (implicit) "is thruthy" changes
>> behavior for the empty string.  Intentional?
>> 
>
> Instinctively it was intentional, consciously it wasn't. I was worried
> about what "qapifile" would produce if the string happened to be
> empty.

It would produce a dependency on the directory.

>> I've had the "pleasure" of debugging empty strings getting interpreted
>> like None where they should be interpreted like any other string.
>> 
>
> assert module.name, then?

Let's avoid changing behavior in a refactoring patch.  If you want an
assertion to ease your worry, separate patch.

>>> +            qapifile = self._qapidir + '/' + module.name
>>>               self._env.note_dependency(os.path.abspath(qapifile))
>>> -        super().visit_module(name)
>>> +        super().visit_module(module)
>>>     
>> [...]
>> 


