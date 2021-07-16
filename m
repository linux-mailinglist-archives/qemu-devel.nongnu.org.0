Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DFB3CB644
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 12:46:34 +0200 (CEST)
Received: from localhost ([::1]:45052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4LMX-00036S-C0
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 06:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m4LL4-0002Ou-Qh
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 06:45:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m4LL2-0003qn-KZ
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 06:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626432299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzCnrE80KR6TeQMGqYr0KnWSO97qgSQV2o7ZPpzfbdQ=;
 b=Kr4e9CUddQ9y2mZhlqsFI+AoknaBA49DjDQfIw+b8l1BTlqPr2gdAt2Cw/8rtaCyQtLBlB
 uHfKe6ZCaJ0PWpUH4TK2w0sBakhZeHKXaxt7z6XCrZWp1dulLeh0D4RXfNN3oVRNT2oHa1
 JTqV47fMjvVc92TLaR6YM03ofn95OuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-0lIGMbGeNAKg1uz0DzRVGQ-1; Fri, 16 Jul 2021 06:44:57 -0400
X-MC-Unique: 0lIGMbGeNAKg1uz0DzRVGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A55D519200C5;
 Fri, 16 Jul 2021 10:44:56 +0000 (UTC)
Received: from localhost (ovpn-112-169.ams2.redhat.com [10.36.112.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F5B75D6AB;
 Fri, 16 Jul 2021 10:44:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
In-Reply-To: <YPFO/NPdyHjf1Cyu@redhat.com>
Organization: Red Hat GmbH
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com>
 <87y2a8cda7.fsf@dusky.pond.sub.org>
 <0801e122-0e9c-e266-42e8-d5cddb16c237@linux.ibm.com>
 <87bl73df9y.fsf@dusky.pond.sub.org> <87y2a6bp5f.fsf@redhat.com>
 <YPFO/NPdyHjf1Cyu@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 16 Jul 2021 12:44:49 +0200
Message-ID: <87pmvibkri.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

> On Fri, Jul 16, 2021 at 11:10:04AM +0200, Cornelia Huck wrote:
>> On Thu, Jul 15 2021, Markus Armbruster <armbru@redhat.com> wrote:
>>=20
>> > Pierre Morel <pmorel@linux.ibm.com> writes:
>> >
>> >> On 7/15/21 8:16 AM, Markus Armbruster wrote:
>> >>> Pierre Morel <pmorel@linux.ibm.com> writes:
>> >>>=20
>> >>>> Drawers and Books are levels 4 and 3 of the S390 CPU
>> >>>> topology.
>> >>>> We allow the user to define these levels and we will
>> >>>> store the values inside the S390CcwMachineState.
>> >>>=20
>> >>> Double-checking: are these members specific to S390?
>> >>
>> >> Yes AFAIK
>> >
>> > Makes me wonder whether they should be conditional on TARGET_S390X.
>> >
>> > What happens when you specify them for another target?  Silently
>> > ignored, or error?
>>=20
>> I'm wondering whether we should include them in the base machine state
>> and treat them as we treat 'dies' (i.e. the standard parser errors out
>> if they are set, and only the s390x parser supports them.)
>
> To repeat what i just wrote in my reply to patch 1, I think we ought to
> think  about a different approach to handling the usage constraints,
> which doesn't require full re-implementation of the smp_parse method
> each time.  There should be a way for each target to report topology
> constraints, such the the single smp_parse method can do the right
> thing, especially wrt error reporting for unsupported values.

That would mean that all possible fields would need to go into common
code, right?

I'm wondering whether there are more architecture/cpu specific values
lurking in the corner, it would get unwieldy if we need to go beyond the
existing fields and drawers/books.


