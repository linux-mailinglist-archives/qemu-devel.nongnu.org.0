Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3063B2A2802
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 11:16:19 +0100 (CET)
Received: from localhost ([::1]:53054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZWss-0001WT-6R
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 05:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kZWd2-0007DT-Ht
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:59:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kZWd0-00023J-1S
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604311192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7N+8h+oqreD6FW464wyeo6wUQ4uuZC1MRyd4fCUbIA=;
 b=eQTt31OXxOQiEEsB0fZQQi62W+XvsQNBfHrlVp0oy1Yc5+0jnHlDz1CFhiMn2ysSxAyBWa
 Nl23fapFbsRawmMwx23CcpwsuayfUODkF7l6DmqSZZ6wO2W3tpdhbsfa2neItCbixkC7nh
 9qgPygXrxay6LzynlnS7EdGd9hLytiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-7a4T4Y2bNoe_DTATvUrt-w-1; Mon, 02 Nov 2020 04:59:51 -0500
X-MC-Unique: 7a4T4Y2bNoe_DTATvUrt-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15E211891E90;
 Mon,  2 Nov 2020 09:59:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C69485D9DD;
 Mon,  2 Nov 2020 09:59:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4EBAF1132BD6; Mon,  2 Nov 2020 10:59:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 00/11] sockets: Attempt to drain the abstract socket swamp
References: <20201029133833.3450220-1-armbru@redhat.com>
 <CAJ+F1CLW=zfWq3apgrKear2v42LYarSMQKw07BHadM-rYjcmoA@mail.gmail.com>
 <87pn50vxa0.fsf@dusky.pond.sub.org>
 <20201030102049.GI99222@redhat.com>
 <87zh40no5a.fsf@dusky.pond.sub.org>
 <20201102091804.GC134709@redhat.com>
Date: Mon, 02 Nov 2020 10:59:43 +0100
In-Reply-To: <20201102091804.GC134709@redhat.com> ("Daniel P. =?utf-8?Q?Be?=
 =?utf-8?Q?rrang=C3=A9=22's?=
 message of "Mon, 2 Nov 2020 09:18:04 +0000")
Message-ID: <875z6om640.fsf@dusky.pond.sub.org>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 QEMU <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Nov 02, 2020 at 09:44:49AM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Fri, Oct 30, 2020 at 11:11:19AM +0100, Markus Armbruster wrote:
>> >> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>> >>=20
>> >> > Hi Markus,
>> >> >
>> >> > On Thu, Oct 29, 2020 at 5:43 PM Markus Armbruster <armbru@redhat.co=
m> wrote:
[...]
>> >> >> Regardless, I *will* make time for ripping the feature out if we
>> >> >> decide to do that.  Quick & easy way to avoid reviewing this serie=
s
>> >> >> *hint* *hint*.
>> >> >>
>> >> >
>> >> > well, fwiw, I would also take that approach too, to the risk of ups=
etting
>> >> > the users.
>> >>=20
>> >> Reverting the feature requires rough consensus and a patch.
>> >>=20
>> >> I can provide a patch, but let's give everybody a chance to object
>> >> first.
>>=20
>> Daniel, do you object, yes or no?
>
> Yes, I object to removing the feature as it is clearly useful.

Thanks.  I sent v2 of my fixes.  Can you take care of getting them
merged, hopefully in time for 5.2?


