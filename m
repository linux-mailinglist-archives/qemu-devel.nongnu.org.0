Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77983E2987
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:26:53 +0200 (CEST)
Received: from localhost ([::1]:50034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBy04-0000MZ-Pa
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mBxyw-0007mE-HU
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mBxyt-0004lz-Op
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628249138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r1FRfMQkaTG1FiiexRPWOz2jh3DfQUQ8F0J6dCe7jo8=;
 b=YPCosXxo8P9h91vqraDcVFNGrnifnWCqXs2xC7IyqJEI6yY8Hstxa0yqhPXF+KO1LTXVtN
 5BnwDpkEBx5pbSlH5kq0pyB5V6OX29iyFJPKkqsjkGk7Tt8D2YZipaJ3WgMFVfEO/Mdk/d
 FBzh3STX3nmpxmHZO+C8JynUyoWFJgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-w6j8wqFzOmuQdQfs4ERyTw-1; Fri, 06 Aug 2021 07:25:37 -0400
X-MC-Unique: w6j8wqFzOmuQdQfs4ERyTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4369087D55D;
 Fri,  6 Aug 2021 11:25:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEA7E5D6B1;
 Fri,  6 Aug 2021 11:25:35 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 03/12] s390x/tcg: convert real to absolute address
 for RRBE, SSKE and ISKE
In-Reply-To: <efd67ce2-aaff-9887-c318-f184290f2d0a@redhat.com>
Organization: Red Hat GmbH
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-4-david@redhat.com>
 <33c1f057-fd79-d15f-e8d5-2d261fbd1255@redhat.com>
 <c5a589ad-f3ee-b0fe-1bcd-318989e3a23a@redhat.com>
 <2806b81b-4e80-6f85-5f0a-ce78bb6ee3c0@redhat.com>
 <efd67ce2-aaff-9887-c318-f184290f2d0a@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 06 Aug 2021 13:25:33 +0200
Message-ID: <8735rmzufm.fsf@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 06 2021, David Hildenbrand <david@redhat.com> wrote:

> On 06.08.21 09:11, Thomas Huth wrote:
>> On 06/08/2021 08.52, David Hildenbrand wrote:
>>>>
>>>> According to the PoP:
>>>>
>>>> "When the enhanced-DAT facility 1 is not installed, or
>>>>  =C2=A0=C2=A0 when the facility is installed but the multiple-block
>>>>  =C2=A0=C2=A0 control is zero, general register R 2 contains a real
>>>>  =C2=A0=C2=A0 address. When the enhanced-DAT facility 1 is
>>>>  =C2=A0=C2=A0 installed and the multiple-block control is one, gen-
>>>>  =C2=A0=C2=A0 eral register R 2 contains an absolute address."
>>>>
>>>> Don't we have to take that into consideration here, too?
>>>
>>> We don't support EDAT1 a.k.a. huge pages yet. If we ever do, we have to
>>> further extend this code.
>>=20
>> Ok, then maybe add a comment or assert() to make sure that we don't forg=
et?
>
> Well, we'll need modifications and extensions all over the place to=20
> support EDAT1, so I'm not sure this will really help ... we'll have to=20
> carefully scan the PoP either way.

Something like
/* always real address, as long as we don't implement EDAT1 */
would still be useful, I think.


