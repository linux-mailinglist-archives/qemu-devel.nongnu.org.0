Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91640492B66
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:38:16 +0100 (CET)
Received: from localhost ([::1]:56014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rUt-0004En-9e
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:38:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9rSU-0001Nj-7s
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:35:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9rRt-0005XH-DJ
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXuz9BCmDP2Pw8BsdI0SV3usLURuIvMRfiSl3JMt7SY=;
 b=jQ8+angYkAR0Cu2YiGDbaJ3N74ND2U7yNvGW5oxt4fc2G2Meubz6Ylyc3sl/YeRm8A9vSF
 6mWatoFm7Oec+bUJj53wfL8Y6suleH3PvqlcPMMPsvU5H0On23+VT8XkABY8UxEbJT3jRR
 Pfp/pB/NJ6Dp+rozk1bgWUcCbJj8vEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-_rqqAP0yPJGwFhXB36otNg-1; Tue, 18 Jan 2022 11:35:05 -0500
X-MC-Unique: _rqqAP0yPJGwFhXB36otNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A78C483DD36;
 Tue, 18 Jan 2022 16:26:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 224B21000051;
 Tue, 18 Jan 2022 16:26:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9A820113865F; Tue, 18 Jan 2022 17:26:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <87r19584xc.fsf@dusky.pond.sub.org>
 <CADO9X9TWscKRoJMTNQt+v84xCyc5SX8H71XcGchZ1dNF_WLQtw@mail.gmail.com>
Date: Tue, 18 Jan 2022 17:26:40 +0100
In-Reply-To: <CADO9X9TWscKRoJMTNQt+v84xCyc5SX8H71XcGchZ1dNF_WLQtw@mail.gmail.com>
 (Vladislav Yaroshchuk's message of "Tue, 18 Jan 2022 19:16:09 +0300")
Message-ID: <87fspl6mdb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 Markus Armbruster <armbru@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 qemu-devel <qemu-devel@nongnu.org>, Roman Bolshakov <roman@roolebo.dev>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:

> =D0=B2=D1=82, 18 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 18:01, Markus Ar=
mbruster <armbru@redhat.com>:
>
>> Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:
>>
>> > Create separate netdevs for each vmnet operating mode:
>> > - vmnet-host
>> > - vmnet-shared
>> > - vmnet-bridged
>> >
>> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>>
>> I acked v8 of the QAPI schema part.  You should add Acked-by and
>> Reviewed-by you receive in later revisions, unless you make changes that
>> invalidate them.  When in doubt, drop them.
>>
>>
> Oh ok, I'll do that next time.

Thanks :)

>> > diff --git a/qapi/net.json b/qapi/net.json
>> > index 7fab2e7cd8..b922e2e34f 100644
>> > --- a/qapi/net.json
>> > +++ b/qapi/net.json
>> > @@ -452,6 +452,120 @@
>> >      '*vhostdev':     'str',
>> >      '*queues':       'int' } }
>> >
>> > +##
>> > +# @NetdevVmnetHostOptions:
>> > +#
>> > +# vmnet (host mode) network backend.
>> > +#
>> > +# Allows the vmnet interface to communicate with other vmnet
>> > +# interfaces that are in host mode and also with the host.
>> > +#
>> > +# @start-address: The starting IPv4 address to use for the interface.
>> > +#                 Must be in the private IP range (RFC 1918). Must be
>> > +#                 specified along with @end-address and @subnet-mask.
>> > +#                 This address is used as the gateway address. The
>> > +#                 subsequent address up to and including end-address =
are
>> > +#                 placed in the DHCP pool.
>> > +#
>> > +# @end-address: The DHCP IPv4 range end address to use for the
>> > +#               interface. Must be in the private IP range (RFC 1918)=
.
>> > +#               Must be specified along with @start-address and
>> > +#               @subnet-mask.
>> > +#
>> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
>> > +#               be specified along with @start-address and @subnet-ma=
sk.
>> > +#
>> > +# @isolated: Enable isolation for this interface. Interface isolation
>> > +#            ensures that vmnet interface is not able to communicate
>> > +#            with any other vmnet interfaces. Only communication with
>> > +#            host is allowed. Available since macOS Big Sur 11.0.
>>
>> What happens when the host is too old?
>>
>>
> In this case netdev creation will fail with
> corresponding message (error_setg() used).

"Available" feels slightly misleading.  It's always available, it just
doesn't work unless the host OS is new enough.  Suggest something like
"Requires at least macOS Big Sur 11.0."

Same for the others.

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

[...]


