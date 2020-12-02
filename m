Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A42CBFCD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:35:11 +0100 (CET)
Received: from localhost ([::1]:56176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkTDq-0007AZ-Hj
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1kkSxy-0006qJ-Ef
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:18:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1kkSxu-0002lL-9P
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:18:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606918719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RqXQUUKDiP5bQDOC63yHvLlMMvJ5H32HJ4wJmJeb/Vs=;
 b=AC5dotHVS+YfgB9WGe48v2AifTqQNgLXe3vGEkhwE86VZPkAQpxBr1KUOxAQXAXmLSfYRz
 rMvs4VODXsWocygqNShgbYYDNJppxCQYuoZjPFPH7DA1zUa4CFqhkpu2RX4WxcS0t6BhFA
 rNfNn8ilOzq5Mf9Tz79ZYDJ/iK/hrWA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-8cKx5igDPxyGajMz_BSOTA-1; Wed, 02 Dec 2020 09:18:38 -0500
X-MC-Unique: 8cKx5igDPxyGajMz_BSOTA-1
Received: by mail-qv1-f70.google.com with SMTP id fb9so1283359qvb.21
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 06:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=gbU8eUQnSOmaDYyWbZXypf2ksfmBFOknLE0Fwy2HG38=;
 b=G51QpnRF5ns2ml+Ocx+EUnQlIO5GkJnH05YS2lHu/yfeDiyHFTJyjXqREWJuihlmPz
 EG/jVTDKBPlhCzSC1WAEJ2fMr6MBeHDU/RpZulPh8nBdgHom7jwfNb+bnk54iXL6xHFu
 DpCXDXCm8qmFoHRa7k2Hn+LjnuILAGp2K1IqEwJVDrMfOTUg8qnQNV5jDbxmEPu3SFeI
 jnK8rEkjyJmYXaYg/M63QnZnnGPQs9ImY9gu00DYLaVx3lxbVdHl6XbvmpxoyzVbE53u
 6g8Vt+fi2NU7QSaILHnwZB5ugHi/m77nVy3xghaXQ8AVk3ef4xMsMgQ7J1mObHxN48Qr
 gV5A==
X-Gm-Message-State: AOAM532jHCBwVBIlBLmkB48amfeq8Sdel6pzAQXLWUqIjV//di5o1O27
 hzVcKHU21T+AnR26QxJYZBSJ++fTxqNS7E0WNkPcUHumsPWwsMDix5MgoCPqZuMUCnd3e49gDhN
 guvnCVtVPhN5dmOE=
X-Received: by 2002:ac8:7a95:: with SMTP id x21mr2785822qtr.307.1606918717702; 
 Wed, 02 Dec 2020 06:18:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzklQYI9iSzEr8LqEgVwHQ6s6TiBGPBLJ4aHl8w4rTpie4nzZKCyqfMu64RA1IXwlhmD/DwVQ==
X-Received: by 2002:ac8:7a95:: with SMTP id x21mr2785744qtr.307.1606918716919; 
 Wed, 02 Dec 2020 06:18:36 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
 by smtp.gmail.com with ESMTPSA id a7sm1789393qth.41.2020.12.02.06.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 06:18:36 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 96E8C182EE9; Wed,  2 Dec 2020 15:18:33 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Jason Wang <jasowang@redhat.com>, Andrew Melnychenko
 <andrew@daynix.com>, mst@redhat.com
Subject: Re: [RFC PATCH v2 0/5] eBPF RSS support for virtio-net
In-Reply-To: <00e5b0a8-dfaa-2899-2501-cfe8249302ff@redhat.com>
References: <20201119111305.485202-1-andrew@daynix.com>
 <00e5b0a8-dfaa-2899-2501-cfe8249302ff@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 02 Dec 2020 15:18:33 +0100
Message-ID: <87h7p4cmva.fsf@toke.dk>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=toke@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=toke@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 02 Dec 2020 09:30:44 -0500
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason Wang <jasowang@redhat.com> writes:

> On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:
>> This set of patches introduces the usage of eBPF for packet steering
>> and RSS hash calculation:
>> * RSS(Receive Side Scaling) is used to distribute network packets to
>> guest virtqueues by calculating packet hash
>> * Additionally adding support for the usage of RSS with vhost
>>
>> The eBPF works on kernels 5.8+
>> On earlier kerneld it fails to load and the RSS feature is reported
>> only without vhost and implemented in 'in-qemu' software.
>>
>> Implementation notes:
>> Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program.
>> Added libbpf dependency and eBPF support.
>> The eBPF program is part of the qemu and presented as an array
>> of BPF ELF file data.
>> The compilation of eBPF is not part of QEMU build and can be done
>> using provided Makefile.ebpf(need to adjust 'linuxhdrs').
>> Added changes to virtio-net and vhost, primary eBPF RSS is used.
>> 'in-qemu' RSS used in the case of hash population and as a fallback opti=
on.
>> For vhost, the hash population feature is not reported to the guest.
>>
>> Please also see the documentation in PATCH 5/5.
>>
>> I am sending those patches as RFC to initiate the discussions and get
>> feedback on the following points:
>> * Fallback when eBPF is not supported by the kernel
>> * Live migration to the kernel that doesn't have eBPF support
>> * Integration with current QEMU build
>> * Additional usage for eBPF for packet filtering
>>
>> Known issues:
>> * hash population not supported by eBPF RSS: 'in-qemu' RSS used
>> as a fallback, also, hash population feature is not reported to guests
>> with vhost.
>> * big-endian BPF support: for now, eBPF isn't supported on
>> big-endian systems. Can be added in future if required.
>> * huge .h file with eBPF binary. The size of .h file containing
>> eBPF binary is currently ~5K lines, because the binary is built with deb=
ug information.
>> The binary without debug/BTF info can't be loaded by libbpf.
>> We're looking for possibilities to reduce the size of the .h files.
>
>
> Adding Toke for sharing more idea from eBPF side.
>
> We had some discussion on the eBPF issues:
>
> 1) Whether or not to use libbpf. Toke strongly suggest to use libbpf
> 2) Whether or not to use BTF. Toke confirmed that if we don't access any=
=20
> skb metadata, BTF is not strictly required for CO-RE. But it might still=
=20
> useful for e.g debugging.
> 3) About the huge (5K lines, see patch #2 Toke). Toke confirmed that we=
=20
> can strip debug symbols, but Yuri found some sections can't be stripped,=
=20
> we can keep discussing here.

I just tried simply running 'strip' on a sample trivial XDP program,
which brought its size down from ~5k to ~1k and preserved the BTF
information without me having to do anything.

As a side note, though, instead of embedding the BPF program into a .h,
you could simply ship it as a .o and load it from the file system. We do
that with xdp-tools and install the bpf object files into /usr/$LIB/bpf/.

-Toke


