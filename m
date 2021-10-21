Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64691435C74
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:52:35 +0200 (CEST)
Received: from localhost ([::1]:40722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSsM-00039f-Hy
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdSm9-0002X1-PU
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:46:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdSm6-0002kB-1L
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634802363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gi4hRFBFI3/IqCBYnwg5xe2pKkFVVlTSTDSMD+ITVIY=;
 b=hAHfmtvZvdnFhU862t8SGqdzy6rBZDP4vkAxcHLcx2LNKJd0rZ1LPrVPe796eO8H1OGbXb
 OiU4Lvv87hlxgteUQoAdnt3+ZUZUa2ES/Cq/fJgiP8BoN+ChGxSa5fuL8ODPLLT+fnxfsM
 5SIqNPjJMeuTinh7wob0p82tM+VDkD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-UObytIAIOaiHAYIdEhdw9w-1; Thu, 21 Oct 2021 03:46:00 -0400
X-MC-Unique: UObytIAIOaiHAYIdEhdw9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F15B10A8E00;
 Thu, 21 Oct 2021 07:45:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09D895BAE0;
 Thu, 21 Oct 2021 07:45:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 91CC111380A7; Thu, 21 Oct 2021 09:45:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 1/5] qapi: Enable enum member introspection to show
 more than name
References: <20211009120944.2858887-1-armbru@redhat.com>
 <20211009120944.2858887-2-armbru@redhat.com>
 <YWVeoc4nUhOq63Mj@redhat.com>
Date: Thu, 21 Oct 2021 09:45:11 +0200
In-Reply-To: <YWVeoc4nUhOq63Mj@redhat.com> (Kevin Wolf's message of "Tue, 12
 Oct 2021 12:08:33 +0200")
Message-ID: <871r4eg6t4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, libvir-list@redhat.com,
 eblake@redhat.com, mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 09.10.2021 um 14:09 hat Markus Armbruster geschrieben:
>> The next commit will add feature flags to enum members.  There's a
>> problem, though: query-qmp-schema shows an enum type's members as an
>> array of member names (SchemaInfoEnum member @values).  If it showed
>> an array of objects with a name member, we could simply add more
>> members to these objects.  Since it's just strings, we can't.
>> 
>> I can see three ways to correct this design mistake:
>> 
>> 1. Do it the way we should have done it, plus compatibility goo.
>> 
>>    We want a ['SchemaInfoEnumMember'] member in SchemaInfoEnum.  Since
>>    changing @values would be a compatibility break, add a new member
>>    @members instead.
>> 
>>    @values is now redundant.  In my testing, output of
>>    qemu-system-x86_64's query-qmp-schema grows by 11% (18.5KiB).
>> 
>>    We can deprecate @values now and drop it later.  This will break
>>    outmoded clients.  Well-behaved clients such as libvirt are
>>    expected to break cleanly.
>> 
>> 2. Like 1, but omit "boring" elements of @member, and empty @member.
>> 
>>    @values does not become redundant.  @members augments it.  Somewhat
>>    cumbersome, but output of query-qmp-schema grows only as we make
>>    enum members non-boring.
>> 
>>    There is nothing to deprecate here.
>> 
>> 3. Versioned query-qmp-schema.
>> 
>>    query-qmp-schema provides either @values or @members.  The QMP
>>    client can select which version it wants.  There is no redundant
>>    output.
>> 
>>    We can deprecate old versions and eventually drop them.  This will
>>    break outmoded clients.  Breaking cleanly is easier than for 1.
>> 
>>    While 1 and 2 operate within the common rules for compatible
>>    evolution apply (section "Compatibility considerations" in
>>    docs/devel/qapi-code-gen.rst), 3 bypasses them.  Attractive when
>>    operating within the rules is just too awkward.  Not the case here.
>> 
>> This commit implements 1.  Libvirt developers prefer it.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qapi/introspect.json       | 21 +++++++++++++++++++--
>>  scripts/qapi/introspect.py | 18 ++++++++++++++----
>>  2 files changed, 33 insertions(+), 6 deletions(-)
>
> docs/devel/qapi-code-gen.rst still says:
>
>   The SchemaInfo for an enumeration type has meta-type "enum" and
>   variant member "values".  The values are listed in no particular
>   order; clients must search the entire enum when learning whether a
>   particular value is supported.
>
>   Example: the SchemaInfo for MyEnum from section `Enumeration types`_ ::
>
>       { "name": "MyEnum", "meta-type": "enum",
>         "values": [ "value1", "value2", "value3" ] }
>
> It probably needs an update.

It sure does.  Thanks!


