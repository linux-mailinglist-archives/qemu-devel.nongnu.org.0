Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297242B81FB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:34:48 +0100 (CET)
Received: from localhost ([::1]:43576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQPv-0003Bh-7T
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfQJI-000522-Ab
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfQJG-00033z-2m
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605716873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i44V+xFgOvP9txMnqpXQtW1P88J3LrzUH1T6Oo2Ubt0=;
 b=EN50a0v3nmaWlAK8ud7KHZAvCDZEvWmqNXR2oJKYDA47eycyfMofYFcrvh30OJVbvIVJbf
 hcuq2t9OFX8LhVQ5JLCfRucLdds4FTyDyALLCeDS8pt3wqlPKOjBdp0jYl2/RlM1JvoH9F
 PWlClV1wtHXQ0c3XVMJlaSlNP0y/p94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-2zFKH99LM1CIPPP0DfHz-Q-1; Wed, 18 Nov 2020 11:27:51 -0500
X-MC-Unique: 2zFKH99LM1CIPPP0DfHz-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C689B1858EC1;
 Wed, 18 Nov 2020 16:27:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 839445D9CD;
 Wed, 18 Nov 2020 16:27:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0885A11358BA; Wed, 18 Nov 2020 17:27:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 0/4] vhost-user: avoid g_return_val_if() in
 get/set_config()
References: <20201118091644.199527-1-stefanha@redhat.com>
 <CAJ+F1CK3Ap38E8343j1keFoX4UEPXR7FgALf7LRvwMSpKywefQ@mail.gmail.com>
Date: Wed, 18 Nov 2020 17:27:44 +0100
In-Reply-To: <CAJ+F1CK3Ap38E8343j1keFoX4UEPXR7FgALf7LRvwMSpKywefQ@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 18 Nov 2020
 19:21:15 +0400")
Message-ID: <87ft56hbpb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Wed, Nov 18, 2020 at 1:17 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
>
>> Markus Armbruster pointed out that g_return_val_if() is meant for
>> programming
>> errors. It must not be used for input validation since it can be compile=
d
>> out.
>> Use explicit if statements instead.
>>
>> This patch series converts vhost-user device backends that use
>> g_return_val_if() in get/set_config().
>>
>> Stefan Hajnoczi (4):
>>   contrib/vhost-user-blk: avoid g_return_val_if() input validation
>>   contrib/vhost-user-gpu: avoid g_return_val_if() input validation
>>   contrib/vhost-user-input: avoid g_return_val_if() input validation
>>   block/export: avoid g_return_val_if() input validation
>>
>>
> The condition is the same for all the patches, checking the message confi=
g
> payload is large enough. Afaict, the value is set by the client, so it
> could be a runtime error, and thus explicit checking is required.
>
> Nevertheless, one nice thing about g_return* macros, is that it provides =
an
> error message when the condition fails, which helps. Could you replace it=
?
>
> (fwiw, I think g_return* macros are so convenient, I would simply make
> G_DISABLE_CHECKS forbidden and call it a day)

Nice or not, they are as inappropriate for input validation as assert()
is:

    If expr evaluates to FALSE, the current function should be
    considered to have undefined behaviour (a programmer error). The
    only correct solution to such an error is to change the module that
    is calling the current function, so that it avoids this incorrect
    call.


