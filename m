Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64CC6074ED
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:19:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olp81-0005aG-BC
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:19:50 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloX0-0002ik-9R
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oloWk-00018V-Sx
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oloWj-00086l-BG
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666345275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tnyF06QSYZDYFQcAMt2EoCOKDh9Ezhx8aWqcenWAlts=;
 b=GUYz/o437HzCwYHCp97CtMNkHpHHvdf34lQF+dsrliPkPoHhNJCxo3ng7mOye2ra5EVPTr
 +kKJWXKPcIW4mlj5arW2j5hFNF2CGDA7zuGzeUhOOsaJ/Q6NhtMzaKdpIcbXyKXLUciXJa
 UJ/KYfOkBaxTGNxXqvkw3rk6PzmwB6M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-3FGA5yS9Nvm9-naxw_QUsA-1; Fri, 21 Oct 2022 05:41:07 -0400
X-MC-Unique: 3FGA5yS9Nvm9-naxw_QUsA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF596185A7AE;
 Fri, 21 Oct 2022 09:41:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A437540F156;
 Fri, 21 Oct 2022 09:41:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F84E21E675B; Fri, 21 Oct 2022 11:41:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,  qemu-devel@nongnu.org,  Paul Durrant
 <paul@xen.org>,  Thomas Huth <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Ber?=
 =?utf-8?Q?rang=C3=A9?=
 <berrange@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>,  Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>,  Eric Blake
 <eblake@redhat.com>,  xen-devel@lists.xenproject.org,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,  Stefano Brivio
 <sbrivio@redhat.com>
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
References: <20221020162558.123284-1-lvivier@redhat.com>
 <20221020162558.123284-18-lvivier@redhat.com>
 <87pmel4th4.fsf@pond.sub.org>
 <52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
 <87lep935hn.fsf@pond.sub.org>
 <30b445bb-a268-d2c9-209f-3b2390746749@redhat.com>
Date: Fri, 21 Oct 2022 11:41:05 +0200
In-Reply-To: <30b445bb-a268-d2c9-209f-3b2390746749@redhat.com> (Laurent
 Vivier's message of "Fri, 21 Oct 2022 11:36:24 +0200")
Message-ID: <87bkq5345q.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> writes:

> On 10/21/22 11:12, Markus Armbruster wrote:
>> Cc: Stefano Brivio
>> 
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>>> On 10/21/22 07:48, Markus Armbruster wrote:
>>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>>
>>>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>>>>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
>>>>
>>>> Use cases?
>>>
>>> This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.
>> 
>> Let's add something like this to the commit message:
>> 
>>      This lets libvirt notice when the connection is lost somehow, and
>>      restart the peer (such as passt).
>> 
>> Who's working on the libvirt part?
>> 
>>> I have also a patch to add a "reconnect=seconds" option, but I didn't want to add it to this series.
>> 
>> It's okay to mention future work in commit messages, but not required.
>> 
>>>> Could similar event signalling be useful for other kinds of netdev
>>>> backends?
>>>
>>> I was wondering, but it becomes more complicated to be generic.
>> 
>> Making something complicated and generic where a simpler special
>> solution would do is the worst.
>> 
>> Not quite as bad (but still plenty bad) is making a few special
>> solutions first, then replace them all with a generic solution.
>> 
>> I believe we should have a good, hard think on possible applications of
>> a generic solution now.
>> 
>> There is no need to hold back this series for that.
>> 
>> If we conclude a generic solution is called for, we better replace this
>> special solution before it becomes ABI.  Either by replacing it before
>> we release it, or by keeping it unstable until we replace it.
>> 
>
> I sent the v14 few minutes before this email.
>
> Jason, perhaps we can remove PATCH 17 from the series and only merge PATCH 1 to 16?
>
> I will resend PATCH 17 in a new series with the reconnect option patch once this series is 
> merged.

Certainly works for me.  Thanks for your patience!


