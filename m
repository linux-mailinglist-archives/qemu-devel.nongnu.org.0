Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602662C3D9C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 11:28:20 +0100 (CET)
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khs27-000298-GK
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 05:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khs1H-0001Jj-BK
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:27:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khs1F-0002A2-0v
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606300042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HMrxogfCrQ29Nar4bkLcQsNoXzRXjhVlOgkS+Ad05EE=;
 b=fYsNF3eC5Wu7YNm3sd674aZtDir1fJsNe7F2Kq0YT42Lz5UoUGve3oeq6TIoT/ygLYJAwQ
 fk8eXAvXUZVkYwm0WvMid3QRfwyh20dFfAAY4rty9NQeJukKv1JhfYsqS0YivW3ETm1OkH
 nsNA1hvEIX1mYT+yJsPJuz0YO1IwIcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-INjUzM7VMyqUIHLWQLEHYg-1; Wed, 25 Nov 2020 05:27:19 -0500
X-MC-Unique: INjUzM7VMyqUIHLWQLEHYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2AC71084431;
 Wed, 25 Nov 2020 10:27:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88CFD2BFE4;
 Wed, 25 Nov 2020 10:27:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 19161113864E; Wed, 25 Nov 2020 11:27:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 <874klk5gnc.fsf@dusky.pond.sub.org>
 <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
 <CAOEp5OdiFaCK=Ag8f9oNixhrkW4xoEJ2bXKU7ThXeF9VJXPqTw@mail.gmail.com>
 <CABcq3pGDAO7sB6jobcsiE8_7md1yZ7wGkkyxZefjXGc7-d6obw@mail.gmail.com>
 <87lfesv2zu.fsf@dusky.pond.sub.org>
 <CAOEp5OcAXn0dvvpaZSu3C0rnGPA_NTFKUxqMMKMJx2xzBQ8YiA@mail.gmail.com>
 <87blfnp20k.fsf@dusky.pond.sub.org>
 <87lferm4x5.fsf@dusky.pond.sub.org>
 <CAOEp5Oe18jtsgHVqwtm+-sqspD6KoJTOO9nNPmcWS++AVGjXKQ@mail.gmail.com>
 <87tutej3dc.fsf@dusky.pond.sub.org>
 <87blfmj2qx.fsf@dusky.pond.sub.org>
 <CAOEp5Ofozi59Ns3F72p-5VGgPBMdrym3dS8GCEiNg9Ovh0jK3A@mail.gmail.com>
 <87y2iqg3m3.fsf@dusky.pond.sub.org>
 <CAOEp5OdzKNOBkXQDePKLe90jpYqYyNyis1gqsJ0dCSB2YC29Dw@mail.gmail.com>
Date: Wed, 25 Nov 2020 11:27:16 +0100
In-Reply-To: <CAOEp5OdzKNOBkXQDePKLe90jpYqYyNyis1gqsJ0dCSB2YC29Dw@mail.gmail.com>
 (Yuri Benditovich's message of "Wed, 25 Nov 2020 10:54:44 +0200")
Message-ID: <87sg8xafzv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnichenko <andrew@daynix.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yuri Benditovich <yuri.benditovich@daynix.com> writes:

> On Tue, Nov 24, 2020 at 5:46 PM Markus Armbruster <armbru@redhat.com> wrote:
[...]
>> The CLI accumulates -netdev in option group "netdev".  It has to, or
>> else -writeconfig doesn't work.
>>
>> Before commit 08712fcb85 "net: Track netdevs in NetClientState rather
>> than QemuOpt", netdev_add added to the option group, and netdev_del
>> removed from it, both for HMP and QMP.  Thus, every netdev had a
>> corresponding QemuOpts in this option group.
>>
>> Commit 08712fcb85 dropped this for QMP netdev_add and both netdev_del.
>> Now a netdev has a corresponding QemuOpts only when it was created with
>> CLI or HMP.  Two issues:
>>
>> * QMP netdev_add loses its "no duplicate ID" check.
>>
>>   My change to net_init_client1() fixes this.
>>
>> * Both netdev_add can leave QemuOpts behind, breaking HMP netdev_add.
>>
>>   My change to qmp_netdev_del() fixes this.
>>
>> Questions?
>>
> No questions, looking forward for the final patch
> Thanks

Posted:

    Subject: [PATCH 0/1] net: Fix handling of id in netdev_add and netdev_del
    Message-Id: <20201125100220.50251-1-armbru@redhat.com>

Thanks for your help, guys, I appreciate it!


