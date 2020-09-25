Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD97278928
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 15:16:25 +0200 (CEST)
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLnaK-0004LX-9S
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 09:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLnLm-00045e-Qd
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:01:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLnLe-0002fC-8r
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:01:22 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601038873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qUArKmlPK5/VerW4h13hLFpPcgajTWxHgyBedYhWml0=;
 b=IE5vCIzZqYrUCCQCPx4vIvLqeMNh6g/xy0Y57DbTVzq8Vsb9rRHADPuJhDPRwA4V/jOzQS
 /1H74Ycf+SvIpdTzL0ZujqvvZm3fYM31nWJFZse2B1SvS9tt1zc6hJwPYGP5VjgoHd1hk9
 hPsunMz/h0eMGezvQI6iGSEVaz7lz3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-ocQCuyaVNfqN6g-ezMR8Vw-1; Fri, 25 Sep 2020 09:00:58 -0400
X-MC-Unique: ocQCuyaVNfqN6g-ezMR8Vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA606ACE32;
 Fri, 25 Sep 2020 13:00:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-70.ams2.redhat.com
 [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F165672CD;
 Fri, 25 Sep 2020 13:00:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 092F7113865F; Fri, 25 Sep 2020 15:00:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 24/38] qapi/gen.py: Fix edge-case of _is_user_module
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-25-jsnow@redhat.com>
 <20200923151743.GK3312949@habkost.net>
Date: Fri, 25 Sep 2020 15:00:51 +0200
In-Reply-To: <20200923151743.GK3312949@habkost.net> (Eduardo Habkost's message
 of "Wed, 23 Sep 2020 11:17:43 -0400")
Message-ID: <87wo0iroxo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Tue, Sep 22, 2020 at 05:00:47PM -0400, John Snow wrote:
>> The edge case is that if the name is '', this expression returns a
>> string instead of a bool, which violates our declared type.
>> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  scripts/qapi/gen.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> index 9898d513ae..cb2b2655c3 100644
>> --- a/scripts/qapi/gen.py
>> +++ b/scripts/qapi/gen.py
>> @@ -251,7 +251,7 @@ def __init__(self, prefix, what, user_blurb, builtin_blurb, pydoc):
>>  
>>      @staticmethod
>>      def _is_user_module(name):
>> -        return name and not name.startswith('./')
>> +        return name is not None and not name.startswith('./')
>
> This changes behavior if name=='', and I guess this is OK, but
> I'm not sure.

@name is either

(1) A module pathname relative to the main module

    This is a module defined by the user.

(2) system module name, starting with './'

    This is a named system module.  We currently have two: './init' in
    commands.py, and and './emit' in events.py.

(3) None

    This is the (nameless) system module for built-in stuff.  It
    predates (2).  Using './builtin' would probably be better now.

Note that (1) and (2) are disjoint: relative pathnames do not begin with
'./'.

name='' is not possible, because '' is not a valid pathname.

>                I miss documentation on `visit_module()`,
> `visit_include()`, and `_is_user_module()`.  I don't know what
> `name` means here, and what is a "user module".

Valid complaints!  The code is subtle in places, without helping its
readers along with comments or doc strings.

>
>>  
>>      @staticmethod
>>      def _is_builtin_module(name):
>> -- 
>> 2.26.2
>> 


