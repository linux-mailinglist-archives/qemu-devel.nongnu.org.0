Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06E3E4483
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 13:16:42 +0200 (CEST)
Received: from localhost ([::1]:51986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD3Gq-0002db-33
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 07:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mD3Fy-0001rF-7k
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 07:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mD3Fv-00007Y-66
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 07:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628507741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rRStzrcrO9K9L9WcJA4dyzfqVjAoj/mp75P4Zbh5EWo=;
 b=SMS+Xr+nrrqS3OBeYf7Z3tvWfDb9BddqutFqoPvNHY5O6ecECkJH1F8i7zmiggmRZPSZRN
 ymtoFrG7pilSdXUtcufjdHZCCgtsTT5/V7UkZoQLBuMfvltfRsBcxULeAVRiqYJY+EWdE2
 xFLJA5iwHCqyQ4x0SXVPr9hXDCRdqpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-T4k3Wz5COkSoVFlyHJRn-g-1; Mon, 09 Aug 2021 07:15:38 -0400
X-MC-Unique: T4k3Wz5COkSoVFlyHJRn-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F41B192CC44;
 Mon,  9 Aug 2021 11:15:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4269869321;
 Mon,  9 Aug 2021 11:15:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, Jared Rossi
 <jrossi@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] s390x: improve subchannel error handling (vfio)
In-Reply-To: <409ce925-d040-68a6-2d50-f144a1807f2a@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210705163952.736020-1-cohuck@redhat.com>
 <e2032c05-ec0b-d653-959f-dcc045da2036@linux.ibm.com>
 <e8426672-bd10-de2d-7dc9-1a46a52f3dea@linux.ibm.com>
 <5ba5fc45-1e61-f774-0340-06961dbfc611@linux.ibm.com>
 <409ce925-d040-68a6-2d50-f144a1807f2a@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 09 Aug 2021 13:15:34 +0200
Message-ID: <87czqmyill.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, mkawano@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04 2021, Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> On 8/4/21 8:30 PM, Jared Rossi wrote:
>> I've exercised the error paths and it appears to all work correctly.
>>=20
>> On 7/19/21 11:09 AM, Jared Rossi wrote:
>>> I will take a look and see if I can exercise the error paths.
>>>
>>> Regards,
>>>
>>> Jared Rossi
>
> Thanks Jared!  So, with that I'd suggest a
>
> Tested-by: Jared Rossi <jrossi@linux.ibm.com>

I took the liberty to include that.

>
> and as I said earlier the code LGTM -- so for the series:
>
> Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

Thanks to you both!

>
>>>
>>> On 7/19/21 10:16 AM, Matthew Rosato wrote:
>>>> On 7/5/21 12:39 PM, Cornelia Huck wrote:
>>>>> This is a followup on the first version (which I had sent out in May,
>>>>> and which kind of fell through the cracks.) While the first patch
>>>>> is mostly unchanged, I added a second patch to address some possible
>>>>> problems with the generated unit exceptions; non-vfio subchannels
>>>>> are not affected by this.
>>>>>
>>>>> As before, this works on the good path, and I have not managed to
>>>>> actually get my system to exercise the error path :(
>>>>
>>>> Sorry for the silence, was out of office for a bit and Eric is=20
>>>> unavailable -- Anyway the code LGTM and matches what I see in the=20
>>>> POPs, I'd be willing to ACK but I'd feel better if we could exercise=
=20
>>>> the error paths before merging.
>>>>
>>>> @Jared/@Mike, you've both had eyes on this area of code recently,=20
>>>> would one of you be willing to take a crack at a tested-by (non-zero=
=20
>>>> CCs on HSCH/CSCH + also drive the sch_gen_unit_exception path)?
>>>>
>>>>>
>>>>> v1->v2:
>>>>> - add comments regarding -ENODEV/-EACCES handling
>>>>> - add second patch
>>>>>
>>>>> Cornelia Huck (2):
>>>>> =C2=A0=C2=A0 vfio-ccw: forward halt/clear errors
>>>>> =C2=A0=C2=A0 css: fix actl handling for unit exceptions
>>>>>
>>>>> =C2=A0 hw/s390x/css.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 38 ++++++++++++++++++++++++++++++++++----
>>>>> =C2=A0 hw/vfio/ccw.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 ++--
>>>>> =C2=A0 include/hw/s390x/css.h |=C2=A0 3 ++-
>>>>> =C2=A0 3 files changed, 38 insertions(+), 7 deletions(-)
>>>>>
>>>>

Queued to s390-next.


