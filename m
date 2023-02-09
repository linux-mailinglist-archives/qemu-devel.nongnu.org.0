Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41D7690E41
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:20:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9eH-0002Sy-2t; Thu, 09 Feb 2023 11:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ9eF-0002Sp-8s
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:19:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ9eC-0002yx-VG
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675959584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uop4UFz5G91zIp8SKxOkuyFift67EtT/TzXPPlOOGCg=;
 b=Iw/Uu+ztJ0vfj1EbdGdIHG57yrDGqy6V3XVwcFue7kyfsLfztgweD/eysExVLa9YfPx4T5
 PZiSsk4HTNPrlaK/jWs1urKJVC73aGbxzN5S3h7WAwj6nTMIKXYJeqad9Z5w5d6SbdZZA/
 GniuCwJN41v89vObGx3sG4aT45iWnpo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-qybDieYGOuG-7U2oHyMhDg-1; Thu, 09 Feb 2023 11:19:43 -0500
X-MC-Unique: qybDieYGOuG-7U2oHyMhDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B2F33804510;
 Thu,  9 Feb 2023 16:19:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 388521415113;
 Thu,  9 Feb 2023 16:19:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1E66C21E6A1F; Thu,  9 Feb 2023 17:19:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Het Gala <het.gala@nutanix.com>,  qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com,  dgilbert@redhat.com,  pbonzini@redhat.com,
 berrange@redhat.com,  eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 1/6] migration: moved hmp_split_at_commma() helper
 func to qapi-util.c file
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-2-het.gala@nutanix.com>
 <87y1p73v6u.fsf@pond.sub.org> <87sfff597q.fsf@secure.mitica>
Date: Thu, 09 Feb 2023 17:19:41 +0100
In-Reply-To: <87sfff597q.fsf@secure.mitica> (Juan Quintela's message of "Thu, 
 09 Feb 2023 13:12:09 +0100")
Message-ID: <87fsbe3j6q.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> wrote:
>> Het Gala <het.gala@nutanix.com> writes:
>>
>>> renamed hmp_split_at_comma() --> str_split_at_comma()
>>> Shifted helper function to qapi-util.c file.
>>
>> Not an appropriate home.
>
> I don't have an opinion here.
>
>> If we have to split up a string in QAPI/QMP, we screwed up.  Let me
>> explain.
>>
>> In QAPI/QMP, data is not to be encoded in strings, it is to be
>> represented directly in JSON.  Thus, ["a", "b", "c"], *not* "a,b,c".
>
> In this case, we are already screwed up O:-)

A loooong time ago :)

> the uri value in migration has to be split.
> What this series does is creating a new way to express the command
> (something on the lines that you describe), but we still have to
> maintain the old way of doing it for some time, so we need this
> function.

And that's fine.  I just want it to stay out of qapi/, to avoid giving
people the idea that splitting string is something QAPI wants you to do.

>> When you find yourself parsing QAPI/QMP string values, you're dealing
>> with a case where we violated this interface design principle.  Happens,
>> but the proper home for code helping to deal with this is *not* qapi/.
>> Simply because QAPI is not about parsing strings.
>
> Ok, I drop my review-by.
>
> See why I was asking for reviews from QAPI libvirt folks for this code O:-)

Better late than never (I hope).

>>>                                              Give external linkage, as
>>> this function will be handy in coming commit for migration.
>>
>> It already has external linkage.
>>
>>> Minor correction:
>>> g_strsplit(str ?: "", ",", -1) --> g_strsplit(str ? str : "", ",", -1)
>>
>> This is not actually a correction :)
>>
>> Omitting the second operand of a conditional expression like x ?: y is
>> equivalent to x ? x : y, except it evaluates x only once.
>
> You are (way) more C layer than me.

Guilty as charged.

> Once told that, I think that what he wanted to do is making this c
> standard, no gcc standard.
>
> Once told that, I think that every C compiler worth its salt has this
> extension.

There are hundreds of uses in the tree.

>> https://gcc.gnu.org/onlinedocs/gcc/Conditionals.html
>>
>> Besides, please don't mix code motion with code changes.
>
> Agreed.
>
> Later, Juan.


