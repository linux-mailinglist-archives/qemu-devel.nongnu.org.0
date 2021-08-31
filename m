Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97B43FCA76
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 17:02:29 +0200 (CEST)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL5HQ-0005As-Cq
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 11:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL5Fa-0003o0-TN
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 11:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL5FZ-0002uU-85
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 11:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630422032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFwGEA77dqXFe2x85zIZvkrKinMUoPFVzTAgYEIQpPE=;
 b=jBNBBavNwqYcX+ELWi7W0rphuabeWDxjJEvqU0pFJzP+UnslFiV77q/78/wsI0MIeFMylw
 RoDv6WB3zSIqLxR5w5G+3lbIKkxczPAU+bXDDXXKOfv0076QMKNTTPIRUV9m00tDVtVrL4
 ODRL23hHa/bKPk3UG+hiVNxazVHDVk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-yhT6XxVGNzOmlkz5qD2XMg-1; Tue, 31 Aug 2021 11:00:31 -0400
X-MC-Unique: yhT6XxVGNzOmlkz5qD2XMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AB181966340;
 Tue, 31 Aug 2021 15:00:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C90D6A05B;
 Tue, 31 Aug 2021 15:00:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A574711380A9; Tue, 31 Aug 2021 17:00:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
 <87y29dct4m.fsf@dusky.pond.sub.org>
 <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
 <877dgbpco1.fsf@dusky.pond.sub.org>
 <CAOEp5OcyvQ9Y2onyHuJnwjtWK+Tx9QxYXUePd1kJ=V9+H9wraw@mail.gmail.com>
 <87v93n8nu3.fsf@dusky.pond.sub.org>
 <CAOEp5Of0C4yUhwbgFmu4roiEmNXZ8qiNMUA3CCBE8Zwu=OWhtQ@mail.gmail.com>
 <87a6kz8i4g.fsf@dusky.pond.sub.org>
 <CAOEp5OfxM+YyZFMUxDrcOw6eKRhyhouJ3q+UnAx3x7sXhQQvHQ@mail.gmail.com>
Date: Tue, 31 Aug 2021 17:00:23 +0200
In-Reply-To: <CAOEp5OfxM+YyZFMUxDrcOw6eKRhyhouJ3q+UnAx3x7sXhQQvHQ@mail.gmail.com>
 (Yuri Benditovich's message of "Mon, 30 Aug 2021 19:56:03 +0300")
Message-ID: <87k0k1wtfc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Andrew Melnichenko <andrew@daynix.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yuri Benditovich <yuri.benditovich@daynix.com> writes:

> On Mon, Aug 30, 2021 at 11:14 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>>
>> > On Mon, Aug 30, 2021 at 9:10 AM Markus Armbruster <armbru@redhat.com> wrote:

[...]

>> >> So let's try again: if libvirt does use the wrong RSS helper, how does
>> >> the system behave?
>> >
>> > The receive-side scaling may work incorrectly, i.e. finally may move
>> > incoming packets to a virtqueue different than expected one.
>>
>> Then I'm confused about the purpose of "the stamp" mentioned below.  Can
>> you enlighten me?
>
> The stamp is a string (common for qemu executable and RSS helper
> executable during build) that qemu can later retrieve from the helper
> in run-time and ensure this helper is fully compatible with this build
> of qemu (in terms of eBPF operation). The helper is built with the
> same C headers (related to ebpf operation) as the qemu, the qemu is
> able to receive file descriptors created by the helper (of ebpf
> program and ebpf data structure's maps) from libvirt and deal with
> them as if it has created them.

Thanks.

I tried to apply your series to check a few of my assumptions, but I'm
getting conflicts.  Got something I could git-pull?

[...]


