Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BBA3F5861
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 08:43:21 +0200 (CEST)
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIQ9T-0008PC-T5
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 02:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIQ87-0007im-24
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:41:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIQ84-0005vZ-Fl
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629787306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rahaFyUVYGoM6fJqQhnLLz/tDjqsX4OwHN0IfarHAr0=;
 b=HMMF6jSxK/cqWJjV9XMQsUze6U+KiynAkIuljFUxjnfwEYavUi0A79Th7XfN3qEmEVvKPO
 NSCQ+r9Jow52bWuBHF0+efKE1ZMtjDJIEMJjZt8PQtbmIdyJL4G1eIyiVlDHWqYkeItkvB
 wXN50UXvV5yKGbUB61nbno+WLs9+sBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-L9HwGp4sMyuxstSZZL9PEw-1; Tue, 24 Aug 2021 02:41:40 -0400
X-MC-Unique: L9HwGp4sMyuxstSZZL9PEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 962DD6409C;
 Tue, 24 Aug 2021 06:41:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE8CE5C1A3;
 Tue, 24 Aug 2021 06:41:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 70BB111380A9; Tue, 24 Aug 2021 08:41:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Melnichenko <andrew@daynix.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
 <87y29dct4m.fsf@dusky.pond.sub.org>
 <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
Date: Tue, 24 Aug 2021 08:41:34 +0200
In-Reply-To: <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
 (Andrew Melnichenko's message of "Tue, 10 Aug 2021 14:58:41 +0300")
Message-ID: <877dgbpco1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrew Melnichenko <andrew@daynix.com> writes:

> Hi,
>
>> The helper may or may not be installed at the path compiled into QEMU.
>>
> Yes, so the helper will not be called - QEMU will try to initiate eBPF RSS
> or use "in-qemu" RSS.

My point is: the proposed command's mission is to help the management
application run the right helper.  However, its advice is *unreliable*.
It may point to the wrong helper, or to nothing at all.  The right
helper may still exist elsewhere.

I suspect you're trying to address the problem at the wrong level.

Similar versioning issues exist with other helpers.  We've been doing
fine without QEMU providing unreliable advice on where they might sit in
the file system.  What makes this one different?

>> What happens when you use the wrong helper?
>>
> UB - in most cases, eBPF program will work with wrong configurations.
> That's why the stamp was added.
>
> query-helper-paths checks the stamp only for RSS helper.

I have no idea what you're talking about :)

My best guess is that you're trying to tell me that attempting to work
with the wrong helper will fail cleanly due to some stamp check.  That
would be nice.


