Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19226074BA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:12:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olp1E-0007N1-96
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:12:50 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo53-0002yq-IW
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olo4t-0001T8-9C
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olo4q-0002wM-Oy
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666343546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qreRhXMURe1cGQAjM1jaeJIUg5mfmfbyjf20udgeVoY=;
 b=b9lO1b1Uo/U+/rLIR2wy5YiN5sFRmORg64AV50oV+mJUM/8eBH+VBRCFS1UKtkUsz6ODxs
 oZ9PRIsfqbu/wypaf6FdC98O5ma+5qhuF0jszwT5HJPQX+A+8oO6rEgIWSMatllGO1xfkg
 LEQAUZ/6REXy/2Ox13X9ilen0MBIQAQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-qEtzvub4OaazuZhJHrPKIQ-1; Fri, 21 Oct 2022 05:12:22 -0400
X-MC-Unique: qEtzvub4OaazuZhJHrPKIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34F27101A52A;
 Fri, 21 Oct 2022 09:12:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D804A40E9783;
 Fri, 21 Oct 2022 09:12:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C5CC921E675B; Fri, 21 Oct 2022 11:12:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Paul Durrant <paul@xen.org>,  Thomas Huth
 <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Greg Kurz <groug@kaod.org>,  Stefano
 Stabellini <sstabellini@kernel.org>,  David Gibson
 <david@gibson.dropbear.id.au>,  Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org,  "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,  Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  Samuel Thibault
 <samuel.thibault@ens-lyon.org>,  Anthony Perard
 <anthony.perard@citrix.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
References: <20221020162558.123284-1-lvivier@redhat.com>
 <20221020162558.123284-18-lvivier@redhat.com>
 <87pmel4th4.fsf@pond.sub.org>
 <52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
Date: Fri, 21 Oct 2022 11:12:20 +0200
In-Reply-To: <52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com> (Laurent
 Vivier's message of "Fri, 21 Oct 2022 10:13:59 +0200")
Message-ID: <87lep935hn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Stefano Brivio

Laurent Vivier <lvivier@redhat.com> writes:

> On 10/21/22 07:48, Markus Armbruster wrote:
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
>>
>> Use cases?
>
> This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.

Let's add something like this to the commit message:

    This lets libvirt notice when the connection is lost somehow, and
    restart the peer (such as passt).

Who's working on the libvirt part?

> I have also a patch to add a "reconnect=seconds" option, but I didn't want to add it to this series.

It's okay to mention future work in commit messages, but not required.

>> Could similar event signalling be useful for other kinds of netdev
>> backends?
>
> I was wondering, but it becomes more complicated to be generic.

Making something complicated and generic where a simpler special
solution would do is the worst.

Not quite as bad (but still plenty bad) is making a few special
solutions first, then replace them all with a generic solution.

I believe we should have a good, hard think on possible applications of
a generic solution now.

There is no need to hold back this series for that.

If we conclude a generic solution is called for, we better replace this
special solution before it becomes ABI.  Either by replacing it before
we release it, or by keeping it unstable until we replace it.


