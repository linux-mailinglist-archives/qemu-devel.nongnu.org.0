Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE18361CD6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 11:34:56 +0200 (CEST)
Received: from localhost ([::1]:37050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXKsI-0001ng-RN
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 05:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXKr9-0001NA-LA
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 05:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXKr7-0006ed-8J
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 05:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618565619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ayltdvXSe9Yw8Snmf+9fJcnHOyz8Oo6uAwBh9xQIyJU=;
 b=Hn52bgh01B2AZbLS9HJHQRwIz/nanzl6VI4ARp0MJTL2qxXw4s8b4oyQB3uopxEbv5ndsZ
 uqchg9NUXSQ4xe1OAkD/v9Q8oHeQTNQdBFKTl8Qmo8yrVTiPb9Dr5y8kSECEXmrBIeiaxL
 zu9TSd6dSPts13dAVHmTKNoZ0yKayF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-KCchTiAaMcOCCgVy0aLFtQ-1; Fri, 16 Apr 2021 05:33:38 -0400
X-MC-Unique: KCchTiAaMcOCCgVy0aLFtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB6DE107ACE3;
 Fri, 16 Apr 2021 09:33:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B52D560C0F;
 Fri, 16 Apr 2021 09:33:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2887B113525D; Fri, 16 Apr 2021 11:33:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Li Zhang <zhlcindy@gmail.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
 <8735vu1ybo.fsf@dusky.pond.sub.org>
 <CAD8of+oJM6+5Q05WRrbj=dd0fmcR2C80YvWK4F=T1A_HK4nKBQ@mail.gmail.com>
Date: Fri, 16 Apr 2021 11:33:33 +0200
In-Reply-To: <CAD8of+oJM6+5Q05WRrbj=dd0fmcR2C80YvWK4F=T1A_HK4nKBQ@mail.gmail.com>
 (Li Zhang's message of "Tue, 13 Apr 2021 10:51:12 +0200")
Message-ID: <87a6py7evm.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lukasstraub2@web.de, alexandr.iarygin@profitbricks.com,
 qemu-devel@nongnu.org, Li Zhang <li.zhang@cloud.ionos.com>,
 pankaj.gupta@cloud.ionos.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhang <zhlcindy@gmail.com> writes:

> On Tue, Apr 13, 2021 at 8:41 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Li Zhang <zhlcindy@gmail.com> writes:
>>
>> > From: Li Zhang <li.zhang@cloud.ionos.com>
>> >
>> > For some scenarios, it needs to hot-add a monitor device.
>> > But QEMU doesn't support hotplug yet. It also works by adding
>> > a monitor with null backend by default and then change its
>> > backend to socket by QMP command "chardev-change".
>> >
>> > So this patch is to support monitor chardev hotswap with QMP.
>> >
>> > Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
>>
>> I think what what you're trying to say is that chardev-change does not
>> work when the character device changes is used by a QMP monitor.
>> Correct?
>>
> I mean that when the character device is a monitor device, it doesn't
> work with a QMP monitor.
> For example, I add 2 QMP monitors and change one of the monitor's
> backends from socket to a null device.
> It doesn't work because it needs the monitor device to support chardev-change.
>
>> If yes, how exactly does it misbehave?
> This command chardev-change needs specific device's change callback function.

Yes, but what happens if you try anyway?  I'm asking, because I'd like
the answer to be worked into the commit message.

>> Does it work with an HMP monitor?
> No, it doesn't work.


