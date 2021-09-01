Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E484F40008C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:27:52 +0200 (CEST)
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9EV-0001uL-VF
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8w2-0007Qi-Nq
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vw-0001QQ-NN
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uq5bGUEaycOS1pN3yPY9gSvsoPba3iKKVU8+kSRlJsA=;
 b=QhdkKyCrUgfbIFBjlOQJ0bFmPqR9bZDWgkCw8urRooUP2gX6MpJtHrEGnSGNWfWdrlrSEh
 U8K/aOGzK5Lcx3TxCcjw7NhW8r+1pijSjUHJlaSyI7C6Vh8vaTUjP+SWu80wVdZd6sW/oG
 UAfgFIXnyCkQ4auDL+LfYZ2P8q4zpY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-AbkQxQHsM-iDCo7kEbdqSg-1; Fri, 03 Sep 2021 09:08:37 -0400
X-MC-Unique: AbkQxQHsM-iDCo7kEbdqSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D96F6D5C3;
 Fri,  3 Sep 2021 13:08:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EC45380;
 Fri,  3 Sep 2021 13:08:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C30D71138606; Wed,  1 Sep 2021 09:16:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Melnichenko <andrew@daynix.com>
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
 <87k0k1wtfc.fsf@dusky.pond.sub.org>
 <CABcq3pEvHUB1K_+gkwP1NpOSxFYs563WSOmAOh4qvvGczCpytA@mail.gmail.com>
Date: Wed, 01 Sep 2021 09:16:19 +0200
In-Reply-To: <CABcq3pEvHUB1K_+gkwP1NpOSxFYs563WSOmAOh4qvvGczCpytA@mail.gmail.com>
 (Andrew Melnichenko's message of "Tue, 31 Aug 2021 22:37:44 +0300")
Message-ID: <87bl5cdav0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
>> Got something I could git-pull?
>>
> I can share some links for tests:
> https://github.com/daynix/qemu/tree/HelperEBPFv3 - qemu with helper
> https://github.com/daynix/libvirt/tree/RSS_RFC_v1 - libvirt with RSS

Thanks!

I get a few warnings.  I'm copying the ones from Clang:

../hw/net/virtio-net.c:1274:63: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
        ret = ebpf_rss_load_fds(&n->ebpf_rss, fds[0], fds[1], fds[2], fds[3]);
                                                              ^   ~
../hw/net/virtio-net.c:1257:5: note: array 'fds' declared here
    int fds[EBPF_RSS_MAX_FDS];
    ^
../hw/net/virtio-net.c:1274:71: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
        ret = ebpf_rss_load_fds(&n->ebpf_rss, fds[0], fds[1], fds[2], fds[3]);
                                                                      ^   ~
../hw/net/virtio-net.c:1257:5: note: array 'fds' declared here
    int fds[EBPF_RSS_MAX_FDS];
    ^

../ebpf/qemu-ebpf-rss-helper.c:30:6: warning: no previous prototype for function 'qemuHelperStamp_a59ff8818a819adc85c28504b7961bdf89f0d9c0' [-Wmissing-prototypes]
void QEMU_HELPER_STAMP(void) {}
     ^
./qemu-helper-stamp.h:1:27: note: expanded from macro 'QEMU_HELPER_STAMP'
#define QEMU_HELPER_STAMP qemuHelperStamp_a59ff8818a819adc85c28504b7961bdf89f0d9c0
                          ^
../ebpf/qemu-ebpf-rss-helper.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
void QEMU_HELPER_STAMP(void) {}
^
static 


