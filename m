Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE2920A273
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:54:46 +0200 (CEST)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joUD7-0002DW-HY
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joTpS-0007GN-B0
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:30:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57134
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joTpP-00018x-Ps
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593099014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3u/eBHzw2HBMRyITnkxM3glrHpy+IKMkFeM1YG6FB4E=;
 b=FcONTyf47ho7Vwz24MrKfRTmCB7e7W37qefsicW3UmGfZLs4Ih7aQRTLxnsdf+l5CD+zV9
 OuKd0QSzu1CKGX+t7uepmOAUS+7OEQi+z5LzCZ5at7owW5LAjCLlRgMDtnIg03gdRNxRC0
 siarb5BRDan1yTddFE53o4VNDvNldiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-Zbqf6s4xMmaaOfNClhODiw-1; Thu, 25 Jun 2020 11:30:12 -0400
X-MC-Unique: Zbqf6s4xMmaaOfNClhODiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4197C1940922;
 Thu, 25 Jun 2020 15:30:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E75307C1EC;
 Thu, 25 Jun 2020 15:30:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 738B311384D4; Thu, 25 Jun 2020 17:30:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 02/46] error: Document Error API usage rules
References: <20200624164344.3778251-1-armbru@redhat.com>
 <20200624164344.3778251-3-armbru@redhat.com>
 <20200625171718.528f8584@bahia.lan>
Date: Thu, 25 Jun 2020 17:30:09 +0200
In-Reply-To: <20200625171718.528f8584@bahia.lan> (Greg Kurz's message of "Thu, 
 25 Jun 2020 17:17:18 +0200")
Message-ID: <87k0zvupry.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg Kurz <groug@kaod.org> writes:

> On Wed, 24 Jun 2020 18:43:00 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> This merely codifies existing practice, with one exception: the rule
>> advising against returning void, where existing practice is mixed.
>> 
>> When the Error API was created, we adopted the (unwritten) rule to
>> return void when the function returns no useful value on success,
>> unlike GError, which recommends to return true on success and false on
>> error then.
>> 
>> When a function returns a distinct error value, say false, a checked
>> call that passes the error up looks like
>> 
>>     if (!frobnicate(..., errp)) {
>>         handle the error...
>>     }
>> 
>> When it returns void, we need
>> 
>>     Error *err = NULL;
>> 
>>     frobnicate(..., &err);
>>     if (err) {
>>         handle the error...
>>         error_propagate(errp, err);
>>     }
>> 
>> Not only is this more verbose, it also creates an Error object even
>> when @errp is null, &error_abort or &error_fatal.
>> 
>> People got tired of the additional boilerplate, and started to ignore
>> the unwritten rule.  The result is confusion among developers about
>> the preferred usage.
>> 
>
> This confusion is reinforced by the fact that the standard pattern:
>
>     error_setg(errp, ...);
>     error_append_hint(errp, ...);
>
> doesn't work when errp is &error_fatal, which is a typical case of
> an invalid command line argument, where it is valuable to suggest
> something sensible to the user but error_setg() exits before we
> could do so.
>
> Fortunately, Vladimir's work will address that and eliminate the
> temptation to workaround the issue with more boilerplate :)

Yes, my work does not obviate Vladimir's at all.  It merely reduce the
number of auto-propagations, hopefully making his patches slightly less
scary.

>> The written rule will hopefully reduce the confusion.
>> 
>> The remainder of this series will update a substantial amount of code
>> to honor the rule.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!


