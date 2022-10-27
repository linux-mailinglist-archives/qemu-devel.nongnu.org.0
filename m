Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB79660EFD8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:05:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onvyM-00062z-JR; Thu, 27 Oct 2022 02:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onvyG-0005fB-9O
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:02:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onvyE-00067B-IA
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666850545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5pTPM49/AK/UdLu+U0viZ+3u/ci/c97wfc/It+T7ABc=;
 b=FwQoeEQA7oyeXgBxMex+Viu0AdpRmBXWpjRCKGBqzh6yq381CYIbaK18Z5Uo/sFUKC4udj
 yqLi76AXTYnNM1qgNJ6qL3uomlTsUqRvMiP1qWXLAA5yuUIQHI3y1Uq4xYWy5UC2GmM9KJ
 Y9LO1ZO5WztzKmBk/Gofw5sLSw1M3OU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-nFxG4zOtMHGTLH2lYXydyg-1; Thu, 27 Oct 2022 02:02:22 -0400
X-MC-Unique: nFxG4zOtMHGTLH2lYXydyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E77C101A56D;
 Thu, 27 Oct 2022 06:02:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 605F12084854;
 Thu, 27 Oct 2022 06:02:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1B5F121E6921; Thu, 27 Oct 2022 08:02:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  arei.gonglei@huawei.com,  lvivier@redhat.com,
 amit@kernel.org,  mst@redhat.com,  pbonzini@redhat.com,
 berrange@redhat.com,  eduardo@habkost.net,  david@redhat.com
Subject: Re: [PATCH 3/4] qtest: Improve error messages when property can not
 be set right now
References: <20221012153801.2604340-1-armbru@redhat.com>
 <20221012153801.2604340-4-armbru@redhat.com>
 <e5dd172e-1b9f-3817-a87f-3ed52a0ce120@redhat.com>
 <87r0zc1fk9.fsf@pond.sub.org>
Date: Thu, 27 Oct 2022 08:02:10 +0200
In-Reply-To: <87r0zc1fk9.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 13 Oct 2022 07:02:46 +0200")
Message-ID: <87h6zpby8t.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> writes:

> Thomas Huth <thuth@redhat.com> writes:
>
>> On 12/10/2022 17.38, Markus Armbruster wrote:
>>> When you try to set qtest property "log" while the qtest object is
>>> active, the error message blames "insufficient permission":
>>> 
>>>      $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio -chardev socket,id=chrqt0,path=qtest.socket,server=on,wait=off -object qtest,id=qt0,chardev=chrqt0,log=/dev/null
>>>      QEMU 7.1.50 monitor - type 'help' for more information
>>>      (qemu) qom-set /objects/qt0 log qtest.log
>>>      Error: Insufficient permission to perform this operation
>>> 
>>> This implies it could work with "sufficient permission".  It can't.
>>> Change the error message to:
>>> 
>>>      Error: Property 'log' can not be set now
>>
>> Can it be set later? ... if not, that error message is almost as confusing 
>> as the original one. Maybe it's better to tell the users *when* they can set 
>> the property?
>
> The property cannot be set while the object is "active", i.e. global
> @qtest points to it.
>
> Right now, @qtest points to the object from completion with
> user_creatable_complete() to unparent.
>
> Completion fails when @qtest already points to another object, i.e. only
> one object can be complete at any time.
>
> Since Paolo took the trouble to code an unparent method, I assume
> unparent can happen.  I can't tell offhand when.
>
> Help!

Since users are unlikely to hit this error, the new message feels good
enough to me.  Happy to take rewordings, or to redo the patch so that it
preserves the old message while getting rid of QERR_PERMISSION_DENIED.


