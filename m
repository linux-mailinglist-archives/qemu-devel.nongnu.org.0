Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF153CDF7F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:52:23 +0200 (CEST)
Received: from localhost ([::1]:54212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5VZ8-0006Z0-EN
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m5VXv-0005UF-Ew
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:51:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m5VXt-0006Sj-So
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626709865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aURnSvW7tUpg2fZDJYV2UtY/MNIqSLql1s392+QUjlw=;
 b=awuKK4N1Egt5FONawNJi99ljZpbakFrjXMwnvMJfsuhdsQ/wV79seVXrkTjKeTzFL+E9Mw
 aqlp1YxE+nB0O8KxJ3WoTpjrMkvx/v7K2VZUnv+x1gkpybPXGVrh5tut6xa7ckDfPwYaGN
 gp8Of8P/j5tA1o/i3hKKirO4Tet5J6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-H-n8fx3uNQWXX191XXrIfg-1; Mon, 19 Jul 2021 11:50:59 -0400
X-MC-Unique: H-n8fx3uNQWXX191XXrIfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D31A6195D560;
 Mon, 19 Jul 2021 15:50:57 +0000 (UTC)
Received: from localhost (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEECB60CA0;
 Mon, 19 Jul 2021 15:50:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
In-Reply-To: <YPFkJUgbE9ku0tI7@redhat.com>
Organization: Red Hat GmbH
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com>
 <87y2a8cda7.fsf@dusky.pond.sub.org>
 <0801e122-0e9c-e266-42e8-d5cddb16c237@linux.ibm.com>
 <87bl73df9y.fsf@dusky.pond.sub.org> <87y2a6bp5f.fsf@redhat.com>
 <YPFO/NPdyHjf1Cyu@redhat.com> <87pmvibkri.fsf@redhat.com>
 <YPFkJUgbE9ku0tI7@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 19 Jul 2021 17:50:52 +0200
Message-ID: <87czre9uar.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: thuth@redhat.com, ehabkost@redhat.com, Pierre Morel <pmorel@linux.ibm.com>,
 david@redhat.com, richard.henderson@linaro.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 16 2021, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, Jul 16, 2021 at 12:44:49PM +0200, Cornelia Huck wrote:
>> On Fri, Jul 16 2021, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote=
:
>>=20
>> > On Fri, Jul 16, 2021 at 11:10:04AM +0200, Cornelia Huck wrote:
>> >> On Thu, Jul 15 2021, Markus Armbruster <armbru@redhat.com> wrote:
>> >>=20
>> >> > Pierre Morel <pmorel@linux.ibm.com> writes:
>> >> >
>> >> >> On 7/15/21 8:16 AM, Markus Armbruster wrote:
>> >> >>> Pierre Morel <pmorel@linux.ibm.com> writes:
>> >> >>>=20
>> >> >>>> Drawers and Books are levels 4 and 3 of the S390 CPU
>> >> >>>> topology.
>> >> >>>> We allow the user to define these levels and we will
>> >> >>>> store the values inside the S390CcwMachineState.
>> >> >>>=20
>> >> >>> Double-checking: are these members specific to S390?
>> >> >>
>> >> >> Yes AFAIK
>> >> >
>> >> > Makes me wonder whether they should be conditional on TARGET_S390X.
>> >> >
>> >> > What happens when you specify them for another target?  Silently
>> >> > ignored, or error?
>> >>=20
>> >> I'm wondering whether we should include them in the base machine stat=
e
>> >> and treat them as we treat 'dies' (i.e. the standard parser errors ou=
t
>> >> if they are set, and only the s390x parser supports them.)
>> >
>> > To repeat what i just wrote in my reply to patch 1, I think we ought t=
o
>> > think  about a different approach to handling the usage constraints,
>> > which doesn't require full re-implementation of the smp_parse method
>> > each time.  There should be a way for each target to report topology
>> > constraints, such the the single smp_parse method can do the right
>> > thing, especially wrt error reporting for unsupported values.
>>=20
>> That would mean that all possible fields would need to go into common
>> code, right?
>
> Yes, that is an implication of what i'm suggesting.
>
>> I'm wondering whether there are more architecture/cpu specific values
>> lurking in the corner, it would get unwieldy if we need to go beyond the
>> existing fields and drawers/books.
>
> Is the book/drawer thing architecture specific, or is it machine
> type / CPU specific. ie do /all/ the s390x machine types / CPUS
> QEMU support the book/drawer concept, or only a subset.

Should not be by machine type, but might be by cpu model (e.g. older
hardware lacking the needed support for exposing this to the guest.) IBM
folks, please correct me if I'm wrong.

> If only a subset, then restricting it per target on QAPI doesn't
> fully solve the root problem, and we instead are better focusing
> on accurate runtime error reporting.

Nod. Runtime error reporting should also be more flexible.


