Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82BB561FCC
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 17:58:16 +0200 (CEST)
Received: from localhost ([::1]:42728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6wYY-0000LH-Hk
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 11:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o6wWA-0007CE-5Y
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:55:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o6wW8-0006sr-JV
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656604544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nRvPip85gUSbUJnsZ8cTFSvmkrYw0M7WomwTPU0jwws=;
 b=WR65fXWdsUBX4ka7r1QChpSVvvI2xGdYHxPeeE4pQ+08GYSpJDlyXG8mRcGRdWUYjnPX4Z
 AQ0KUV9K97JDncGzp0HjWZZkag37R6UYNTXoPhfUlCRe/EOzgS0YnwV7D4uAm0PyEz9edW
 jxf1khTEiyvlKkK27ry5BipcTkoRF9g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-zHtl7fHHORa_8sUJbxyC8g-1; Thu, 30 Jun 2022 11:55:40 -0400
X-MC-Unique: zHtl7fHHORa_8sUJbxyC8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F03D42919ECB;
 Thu, 30 Jun 2022 15:55:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2F702166B26;
 Thu, 30 Jun 2022 15:55:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] arm/kvm: enable MTE if available
In-Reply-To: <9dfbfd42-6a40-80d2-8d9d-f5849de0b726@redhat.com>
Organization: Red Hat GmbH
References: <20220512131146.78457-1-cohuck@redhat.com>
 <20220512131146.78457-2-cohuck@redhat.com>
 <a3d0a093-3d59-5882-c9c8-6619e5aeb3ab@redhat.com>
 <877d5jskmw.fsf@redhat.com>
 <9dfbfd42-6a40-80d2-8d9d-f5849de0b726@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 30 Jun 2022 17:55:38 +0200
Message-ID: <87o7ya2lj9.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 29 2022, Eric Auger <eauger@redhat.com> wrote:

> Hi Connie,
>
> On 6/14/22 10:40, Cornelia Huck wrote:
>> On Fri, Jun 10 2022, Eric Auger <eauger@redhat.com> wrote:
>> 
>>> Hi Connie,
>>> On 5/12/22 15:11, Cornelia Huck wrote:
>>>> We need to disable migration, as we do not yet have a way to migrate
>>>> the tags as well.
>>>
>>> This patch does much more than adding a migration blocker ;-) you may
>>> describe the new cpu option and how it works.
>> 
>> I admit this is a bit terse ;) The idea is to control mte at the cpu
>> level directly (and not indirectly via tag memory at the machine
>> level). I.e. the user gets whatever is available given the constraints
>> (host support etc.) if they don't specify anything, and they can
>> explicitly turn it off/on.
>
> Could the OnOffAuto property value be helpful?

I completely forgot that this exists; I hacked up something (still
untested), and it seems to be able to do what I want.

I'll post it after I've verified that it actually works :)

>> The big elefant in the room is how migration will end up
>> working... after reading the disscussions in
>> https://lore.kernel.org/all/CAJc+Z1FZxSYB_zJit4+0uTR-88VqQL+-01XNMSEfua-dXDy6Wg@mail.gmail.com/
>> I don't think it will be as "easy" as I thought, and we probably require
>> some further fiddling on the kernel side.
> Yes maybe the MTE migration process shall be documented and discussed
> separately on the ML? Is Haibu Xu's address bouncing?

Yes, that address is bouncing...

I've piggybacked onto a recent kvm discussion in
https://lore.kernel.org/all/875ykmcd8q.fsf@redhat.com/ -- I guess there
had not been any change for migration in the meantime, we need to find a
way to tie page data + metadata together.


