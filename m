Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BE96400B8
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:55:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zv2-0007le-R6; Fri, 02 Dec 2022 01:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0zuk-0007km-A7
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0zuf-0003mT-GL
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669963953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zctlqjf47uB0DaCl7aNgvqVGJY88i3NXBlGm89LSROM=;
 b=GANtz9dIA3J1E9sostHXvDAgCXTu7/NFV2KXB11pk7Sv4cZkn8QD/uucj/owoFB7SMnOAz
 OU1zBEQNsMGqomPdDIDknZwdAMvvKCId1UxqE7Y5K8rplAmz9rrbj+puh+ACiPFvKqKA8p
 0LmP5vuudUM5PCGTs3vlY2rDBi45O6g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-PAAeTauWO3eUKRBaOGDqfQ-1; Fri, 02 Dec 2022 01:52:32 -0500
X-MC-Unique: PAAeTauWO3eUKRBaOGDqfQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 193391C068F5
 for <qemu-devel@nongnu.org>; Fri,  2 Dec 2022 06:52:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFEEDC1908B;
 Fri,  2 Dec 2022 06:52:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 961C921E6921; Fri,  2 Dec 2022 07:52:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,
 kraxel@redhat.com,  dgilbert@redhat.com,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 3/9] ui: Drop disabled code for SPICE_CHANNEL_WEBDAV
References: <20221201061311.3619052-1-armbru@redhat.com>
 <20221201061311.3619052-4-armbru@redhat.com>
 <Y4hqiiNzcMVS0t0k@redhat.com> <87pmd3fgcu.fsf@pond.sub.org>
 <Y4i7kZCetDvFYnCp@redhat.com> <87wn7bdsze.fsf@pond.sub.org>
 <Y4jznyf1rk4KfYbA@redhat.com>
Date: Fri, 02 Dec 2022 07:52:28 +0100
In-Reply-To: <Y4jznyf1rk4KfYbA@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 1 Dec 2022 18:34:07 +0000")
Message-ID: <87v8muthzn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Dec 01, 2022 at 04:49:25PM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Thu, Dec 01, 2022 at 01:39:13PM +0100, Markus Armbruster wrote:

[...]

>> >> Would you like me to bump spice-server as well?  To which version?
>> >
>> > Yes, might as well, the spice-server versions are slightly different:
>> >
>> >      Debian 11: 0.14.3
>> >      RHEL-8: 0.14.3
>> >      FreeBSD (ports): 0.15.0
>> >      Fedora 35: 0.15.0
>> >      Ubuntu 20.04: 0.14.2
>> >      OpenSUSE Leap 15.3: 0.14.3
>> >=20=20
>> > I think we might as well pick  0.14.0 for both protocol and server.
>>=20
>> Makes sense, but it leads to another question.
>>=20
>> I found obvious version checks for spice-protocol, and dropped the
>> outmoded ones, namely
>>=20
>>     #if CHECK_SPICE_PROTOCOL_VERSION(0, 14, 0)
>>=20
>> For spice-server, I see a bunch of SPICE_INTERFACE_FOO_{MAJOR,MINOR} we
>> check, and which ones become outmoded is not obvious to me.  Help?
>
> Ignore all the interface ones. For the server, the check to look
> for is against SPICE_SERVER_VERSION
>
> chardev/spice.c:#if SPICE_SERVER_VERSION >=3D 0x000c06
> chardev/spice.c:#if SPICE_SERVER_VERSION < 0x000e02
> hw/display/qxl.c:#if SPICE_SERVER_VERSION >=3D 0x000c06 && SPICE_SERVER_V=
ERSION < 0x000e02
> hw/display/qxl.c:#if SPICE_SERVER_VERSION >=3D 0x000c06 /* release 0.12.6=
 */
> hw/display/qxl.c:#if SPICE_SERVER_VERSION >=3D 0x000e02 /* release 0.14.2=
 */
> hw/display/qxl.c:#if SPICE_SERVER_VERSION >=3D 0x000c06 /* release 0.12.6=
 */
> hw/display/qxl.h:#if SPICE_SERVER_VERSION >=3D 0x000c06 /* release 0.12.6=
 */
> include/ui/qemu-spice.h:#if !defined(SPICE_SERVER_VERSION) || (SPICE_SERV=
ER_VERSION < 0xc06)
> include/ui/qemu-spice.h:#if defined(SPICE_SERVER_VERSION) && (SPICE_SERVE=
R_VERSION >=3D 0x000f00)
> include/ui/spice-display.h:# if SPICE_SERVER_VERSION >=3D 0x000d01 /* rel=
ease 0.13.1 */
> ui/spice-display.c:#if SPICE_SERVER_VERSION >=3D 0x000e04 /* release 0.14=
.4 */
> ui/spice-display.c:#if SPICE_SERVER_VERSION >=3D 0x000e02 /* release 0.14=
.2 */
>
> A fair few of those will be obsolete

Got it, thanks!


