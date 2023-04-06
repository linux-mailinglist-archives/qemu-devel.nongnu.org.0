Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC3B6D9C08
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:19:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRMj-0003Yu-4t; Thu, 06 Apr 2023 11:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pkRMg-0003Yd-4q
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:17:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pkRMc-0003ns-96
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680794244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wK+luXm6zOtRMvSJ+ka0ItZDNGPBd4wZWMVxrebQxzI=;
 b=JZJA/0zRWltQf2Q9kKZJOvncGkykJfohzxtt34iD5rGFipzuJsJ84ipdQioIFJnoX23JML
 53qICXtMKhLTRXEAW4v6oBdGqcknm9aKMfbIqfXPNGMjpwrrlHvWtdx5S6u2v5ijpttZHL
 E/CoDwupOejjqDxxM0ZTn8uO8+SdFQ8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-jrg4FQu2PYe2B-27Znow8A-1; Thu, 06 Apr 2023 11:17:15 -0400
X-MC-Unique: jrg4FQu2PYe2B-27Znow8A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F30529ABA1E;
 Thu,  6 Apr 2023 15:17:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59968492C3E;
 Thu,  6 Apr 2023 15:17:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6994321E6926; Thu,  6 Apr 2023 17:17:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  marcandre.lureau@redhat.com,
 qemu-devel@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PULL v2 05/25] error: add global &error_warn destination
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
 <20230313114648.426607-6-marcandre.lureau@redhat.com>
 <CAFEAcA9zNpzj_VU3ysWaa24tTqaBDcB9o1+0HhO0R7hhVOdgdA@mail.gmail.com>
 <CAFEAcA9_GP8HqtYgG4mice_ACd8eqFLF6qrMYRz_5oe_HSM=-g@mail.gmail.com>
 <8520898b-14e8-33a8-c34f-e98fecbedcb3@linux.ibm.com>
Date: Thu, 06 Apr 2023 17:17:13 +0200
In-Reply-To: <8520898b-14e8-33a8-c34f-e98fecbedcb3@linux.ibm.com> (Stefan
 Berger's message of "Thu, 6 Apr 2023 10:13:31 -0400")
Message-ID: <87edoxm45i.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Stefan Berger <stefanb@linux.ibm.com> writes:

> On 4/6/23 09:17, Peter Maydell wrote:
>> On Thu, 6 Apr 2023 at 14:16, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>>>
>>> On Mon, 13 Mar 2023 at 11:47, <marcandre.lureau@redhat.com> wrote:
>>>>
>>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>>
>>>> This can help debugging issues or develop, when error handling is
>>>> introduced.
>>>>
>>>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>>>> Message-Id: <20230221124802.4103554-6-marcandre.lureau@redhat.com>
>>>
>>> Hi; Coverity points out that this introduces a use-after-free
>>> (CID 1507493):
>>
>> ...and also CID 1508179 (same issue, just one warning about the
>> callsite in error_setv() and one about the callsite in
>> error_propagate()).
>>
>> thanks
>> -- PMM
>>=20
>
> I'll be out starting tomorrow. I don't see Marc-Andr=C3=A9 online.

I'll also be out starting tomorrow, until April 17.

The patch went in without my review, because I was unable to review it
in time.

As Coverity points out, it broke a design invariant.  Red "rethink this"
flag.  Can't do until I'm back.  Can't review the Stefan's proposed fix
either, because that one needs just as much thinking.

I suggest to treat &error_warn exactly like NULL for the release.

[...]


