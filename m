Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1F23F81CF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 06:54:48 +0200 (CEST)
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ7Pb-0006ws-5M
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 00:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJ7Oo-0006BW-3c
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 00:53:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJ7Ok-0001lG-Et
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 00:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629953631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YGzBiXUT41kJ+1TiK00zVzSDLm91BjBXmeUh/lSX51o=;
 b=iaKRupXgJBCLDTCq1ZhDDO+3DrxCb6WKsw9TeQvLsFj4QvWtZyT9basGF/oJL70y3mlifg
 oiNLSEQNBAYf+ynQkzwzQCfN8hsEevsD6NNw9PqRsqPmHhUSOL1S60DPN1+KN3BbuUa8Ts
 bWKyJDb3xzlj4EK/PHz/VSOSjsGvepE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-cXQuwu-pOvy-R6RGX-ZrrA-1; Thu, 26 Aug 2021 00:53:49 -0400
X-MC-Unique: cXQuwu-pOvy-R6RGX-ZrrA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 162AFDF8C2;
 Thu, 26 Aug 2021 04:53:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C51D86A8FA;
 Thu, 26 Aug 2021 04:53:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 57D1C11380A9; Thu, 26 Aug 2021 06:53:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Melnichenko <andrew@daynix.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
 <87y29dct4m.fsf@dusky.pond.sub.org>
 <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
 <877dgbpco1.fsf@dusky.pond.sub.org>
 <CABcq3pEiPCdYYmA2qCJaFYyDPS+mPe5Wa2oWMfGyqdxjhyaWdg@mail.gmail.com>
Date: Thu, 26 Aug 2021 06:53:45 +0200
In-Reply-To: <CABcq3pEiPCdYYmA2qCJaFYyDPS+mPe5Wa2oWMfGyqdxjhyaWdg@mail.gmail.com>
 (Andrew Melnichenko's message of "Wed, 25 Aug 2021 21:45:01 +0300")
Message-ID: <87pmu03ixy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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
> Yes, the stamp check was added.
> So the qemu emulator should return a suitable RSS BPF helper or nothing.
> Each qemu emulator may have a different helper that suits it.
> So, the idea is to ask for the helper from qemu.

Please answer the question below.

>
> On Tue, Aug 24, 2021 at 9:41 AM Markus Armbruster <armbru@redhat.com> wrote:
>
>> Andrew Melnichenko <andrew@daynix.com> writes:
>>
>> > Hi,
>> >
>> >> The helper may or may not be installed at the path compiled into QEMU.
>> >>
>> > Yes, so the helper will not be called - QEMU will try to initiate eBPF
>> RSS
>> > or use "in-qemu" RSS.
>>
>> My point is: the proposed command's mission is to help the management
>> application run the right helper.  However, its advice is *unreliable*.
>> It may point to the wrong helper, or to nothing at all.  The right
>> helper may still exist elsewhere.
>>
>> I suspect you're trying to address the problem at the wrong level.
>>
>> Similar versioning issues exist with other helpers.  We've been doing
>> fine without QEMU providing unreliable advice on where they might sit in
>> the file system.  What makes this one different?

This one.

>> >> What happens when you use the wrong helper?
>> >>
>> > UB - in most cases, eBPF program will work with wrong configurations.
>> > That's why the stamp was added.
>> >
>> > query-helper-paths checks the stamp only for RSS helper.
>>
>> I have no idea what you're talking about :)
>>
>> My best guess is that you're trying to tell me that attempting to work
>> with the wrong helper will fail cleanly due to some stamp check.  That
>> would be nice.
>>
>>


