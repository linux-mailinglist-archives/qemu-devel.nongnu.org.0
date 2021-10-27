Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E2D43C241
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 07:32:12 +0200 (CEST)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfbXn-0000qI-QI
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 01:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfbVe-00074t-9k
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:29:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfbVc-00083N-Er
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:29:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635312595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LjowXWC6PO2mLOqrNtcc7gzN0FXny/h0Nw915NmJjKM=;
 b=YaJdDBI10SOWJUrlEDiHYEG5cCCXyNYP+lTS9kZiGsef1CF1ij3QvqikoSxO9iCWUuecWV
 DzUW0GZe4u3N88H9aaV0tM9WToKh79NGb55hrcimmGf/NnCQvRDcVQFH5rksEW4HOF26nj
 Z0TO3IKQpPaCc5FNyOTFiMPJkpgG51w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-14gPUzn5PJCS_iApdDpSGw-1; Wed, 27 Oct 2021 01:29:51 -0400
X-MC-Unique: 14gPUzn5PJCS_iApdDpSGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4CD8100C66B;
 Wed, 27 Oct 2021 05:29:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03C185DF21;
 Wed, 27 Oct 2021 05:29:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8DC3E11380A7; Wed, 27 Oct 2021 07:29:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
 <YXewOaSDEXJDYV+1@redhat.com> <87r1c83z5c.fsf@dusky.pond.sub.org>
 <YXgXGocQsFu/Cnzr@redhat.com> <87a6ivg6m9.fsf@dusky.pond.sub.org>
 <YXgdQ/y4XVTzB5Ru@redhat.com>
Date: Wed, 27 Oct 2021 07:29:37 +0200
In-Reply-To: <YXgdQ/y4XVTzB5Ru@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 26 Oct 2021 16:22:43 +0100")
Message-ID: <87r1c7c9xa.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 mdroth@linux.vnet.ibm.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Oct 26, 2021 at 05:15:10PM +0200, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Tue, Oct 26, 2021 at 11:37:19AM +0200, Markus Armbruster wrote:

[...]

>> >> Management applications are better off with a feature flag than with =
a
>> >> naming convention we sometimes ignore.
>> >
>> > We will sometimes ignore/forget the feature flag too though, so I'm
>> > not convinced there's much difference there.
>>=20
>> -compat unstable-input=3Dreject,unstable-output=3Dhide should help you s=
tay
>> on the straight & narrow :)
>
> That's from the pov of the mgmt app. I meant from the POV of QEMU
> maintainers forgetting to add "unstable" flag, just as they might
> forget to add a "x-" prefix.

Got it.

My point was that feature flag "unstable" is an unequivocal signal for
"this thing is unstable", while a name starting with "x-" isn't: there
are exceptions.

The converse is a wash: we can forget to mark something unstable no
matter how the mark works.


