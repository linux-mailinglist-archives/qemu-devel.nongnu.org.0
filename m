Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A886A5FD412
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 07:09:10 +0200 (CEST)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiqSz-00052B-HU
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 01:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiqMy-0007Li-HY
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiqMv-0007dN-6R
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665637372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=55Mj82tGjHqcecYV+2PeHLFko62Rkglrk9d6koTtsOk=;
 b=UX4G8kfGK0Ce7NFBsq3VGg/oSaIUqmzGw6r/iWh2HrhpUbQ/oidxoexDqAj+ADEeDUUK0/
 fAmFEYfyAMoK5AlfqQ5SXGGtJBqvEp6T+FE4SUCUCvY+wTjmrE75VTMDP/4/8vcaExGk4F
 ZEj7abzPC0vFwHsh+33YB7MRleq2tbQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-bcuYlQOCOP2XQ6hPW_IMhA-1; Thu, 13 Oct 2022 01:02:49 -0400
X-MC-Unique: bcuYlQOCOP2XQ6hPW_IMhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B658D101A5BB;
 Thu, 13 Oct 2022 05:02:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F22840398B1;
 Thu, 13 Oct 2022 05:02:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 46C5E21E691D; Thu, 13 Oct 2022 07:02:46 +0200 (CEST)
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
Date: Thu, 13 Oct 2022 07:02:46 +0200
In-Reply-To: <e5dd172e-1b9f-3817-a87f-3ed52a0ce120@redhat.com> (Thomas Huth's
 message of "Wed, 12 Oct 2022 20:05:32 +0200")
Message-ID: <87r0zc1fk9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 12/10/2022 17.38, Markus Armbruster wrote:
>> When you try to set qtest property "log" while the qtest object is
>> active, the error message blames "insufficient permission":
>> 
>>      $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio -chardev socket,id=chrqt0,path=qtest.socket,server=on,wait=off -object qtest,id=qt0,chardev=chrqt0,log=/dev/null
>>      QEMU 7.1.50 monitor - type 'help' for more information
>>      (qemu) qom-set /objects/qt0 log qtest.log
>>      Error: Insufficient permission to perform this operation
>> 
>> This implies it could work with "sufficient permission".  It can't.
>> Change the error message to:
>> 
>>      Error: Property 'log' can not be set now
>
> Can it be set later? ... if not, that error message is almost as confusing 
> as the original one. Maybe it's better to tell the users *when* they can set 
> the property?

The property cannot be set while the object is "active", i.e. global
@qtest points to it.

Right now, @qtest points to the object from completion with
user_creatable_complete() to unparent.

Completion fails when @qtest already points to another object, i.e. only
one object can be complete at any time.

Since Paolo took the trouble to code an unparent method, I assume
unparent can happen.  I can't tell offhand when.

Help!


