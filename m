Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E31A2CEBDE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 11:10:02 +0100 (CET)
Received: from localhost ([::1]:33376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl82L-00063z-AM
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 05:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1kl81b-0005eN-Gm
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 05:09:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1kl81Z-0006MQ-DT
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 05:09:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607076550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0sp7huNjj2fa1zyoemom8a8E6Ih/c6QaYJLh2UtPIg=;
 b=jATaeWvZvVibZkwTR4pZrZCqjNdJPxi7jBzxJIA3PmxNgeSZNlsOkki2vlmbyZ4t52mj6X
 1D4fel9Q7/NcpHKCgXU855HIbjsf9T10If+qOlijiP6IHCdDujbw+I8WaAWMlmEyDTvuQa
 5NbxTSZdet1Uz4PWSI+/w8ObmVsskVk=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-XBPi4lr3MOe-boZscBjP_g-1; Fri, 04 Dec 2020 05:09:08 -0500
X-MC-Unique: XBPi4lr3MOe-boZscBjP_g-1
Received: by mail-ot1-f71.google.com with SMTP id g22so2465235otg.20
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 02:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=CQvoJiXrHl72tscvyMJYDoBTDTDoABa63NcmejKYHG8=;
 b=dhN+l9QaBfvV0/JCwnI2e1moupllH0kcUsP3YbheYpogSfRcGzHPQ8xsJvaZd1VRqE
 OX+T7cd90TEDSQsPm13G9YlR4DpDG1ccPx4Z8Nw3lTUNT1bF8dlIByVuM5n/DnuA2Q83
 M6nmCP3QcXdZ+CknBTx3Nr42+G0lg2fbXgFxV4PikX5/IIfRfNXT5FuydFUjV83MW/RS
 sxLj93TdrnvV2a6cRn3p/G1DBzMKzTKoCtgPoqK/Rah3TcgOJ7FOC+liVjW9M8JmEQxs
 1+20lIE/w8FBz92/AXYESdIhwWhNjJ0aPezVYqzzbo07uVy206X2MxRn61ees6jmm2C2
 Mx9g==
X-Gm-Message-State: AOAM530KmLHqIZ1ZzD0Jk+bVPzEIhrdH/JqQzJfkcJlHdNRrtmjr8za9
 OnEaFh9DYZbEA37Ro5A41wlvNxnga/kl2O1vxkPr3xi/U3i0hEtOgHNH2LtYQ3DSq+Z0DsWVUM8
 bG+Q9eCn9dJUZiGs=
X-Received: by 2002:aca:1b13:: with SMTP id b19mr2618842oib.83.1607076547455; 
 Fri, 04 Dec 2020 02:09:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzZY89FnTZgDhfLYG3uwHwoiM4MWaqmJEd2ts/OjBjnLwGGeYTMlsnMj2A2+Z0t83jy2aeHg==
X-Received: by 2002:aca:1b13:: with SMTP id b19mr2618826oib.83.1607076547203; 
 Fri, 04 Dec 2020 02:09:07 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id e5sm523894otl.75.2020.12.04.02.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:09:06 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 6BD07182EEA; Fri,  4 Dec 2020 11:09:04 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [RFC PATCH v2 0/5] eBPF RSS support for virtio-net
In-Reply-To: <CAOEp5Oe0AzZ40RK9EjNx0d2RVbteq_cR8zVhQH+_8Wm9x_TQgA@mail.gmail.com>
References: <20201119111305.485202-1-andrew@daynix.com>
 <00e5b0a8-dfaa-2899-2501-cfe8249302ff@redhat.com> <87h7p4cmva.fsf@toke.dk>
 <CAOEp5Oe0AzZ40RK9EjNx0d2RVbteq_cR8zVhQH+_8Wm9x_TQgA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 04 Dec 2020 11:09:04 +0100
Message-ID: <87im9h9933.fsf@toke.dk>
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
Cc: qemu-devel@nongnu.org, Yan Vugenfirer <yan@daynix.com>,
 Jason Wang <jasowang@redhat.com>, Andrew Melnychenko <andrew@daynix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yuri Benditovich <yuri.benditovich@daynix.com> writes:

> On Wed, Dec 2, 2020 at 4:18 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@red=
hat.com>
> wrote:
>
>> Jason Wang <jasowang@redhat.com> writes:
>>
>> > On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:
>> >> This set of patches introduces the usage of eBPF for packet steering
>> >> and RSS hash calculation:
>> >> * RSS(Receive Side Scaling) is used to distribute network packets to
>> >> guest virtqueues by calculating packet hash
>> >> * Additionally adding support for the usage of RSS with vhost
>> >>
>> >> The eBPF works on kernels 5.8+
>> >> On earlier kerneld it fails to load and the RSS feature is reported
>> >> only without vhost and implemented in 'in-qemu' software.
>> >>
>> >> Implementation notes:
>> >> Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program.
>> >> Added libbpf dependency and eBPF support.
>> >> The eBPF program is part of the qemu and presented as an array
>> >> of BPF ELF file data.
>> >> The compilation of eBPF is not part of QEMU build and can be done
>> >> using provided Makefile.ebpf(need to adjust 'linuxhdrs').
>> >> Added changes to virtio-net and vhost, primary eBPF RSS is used.
>> >> 'in-qemu' RSS used in the case of hash population and as a fallback
>> option.
>> >> For vhost, the hash population feature is not reported to the guest.
>> >>
>> >> Please also see the documentation in PATCH 5/5.
>> >>
>> >> I am sending those patches as RFC to initiate the discussions and get
>> >> feedback on the following points:
>> >> * Fallback when eBPF is not supported by the kernel
>> >> * Live migration to the kernel that doesn't have eBPF support
>> >> * Integration with current QEMU build
>> >> * Additional usage for eBPF for packet filtering
>> >>
>> >> Known issues:
>> >> * hash population not supported by eBPF RSS: 'in-qemu' RSS used
>> >> as a fallback, also, hash population feature is not reported to guest=
s
>> >> with vhost.
>> >> * big-endian BPF support: for now, eBPF isn't supported on
>> >> big-endian systems. Can be added in future if required.
>> >> * huge .h file with eBPF binary. The size of .h file containing
>> >> eBPF binary is currently ~5K lines, because the binary is built with
>> debug information.
>> >> The binary without debug/BTF info can't be loaded by libbpf.
>> >> We're looking for possibilities to reduce the size of the .h files.
>> >
>> >
>> > Adding Toke for sharing more idea from eBPF side.
>> >
>> > We had some discussion on the eBPF issues:
>> >
>> > 1) Whether or not to use libbpf. Toke strongly suggest to use libbpf
>> > 2) Whether or not to use BTF. Toke confirmed that if we don't access a=
ny
>> > skb metadata, BTF is not strictly required for CO-RE. But it might sti=
ll
>> > useful for e.g debugging.
>> > 3) About the huge (5K lines, see patch #2 Toke). Toke confirmed that w=
e
>> > can strip debug symbols, but Yuri found some sections can't be strippe=
d,
>> > we can keep discussing here.
>>
>> I just tried simply running 'strip' on a sample trivial XDP program,
>> which brought its size down from ~5k to ~1k and preserved the BTF
>> information without me having to do anything.
>>
>
> With our eBPF code the numbers are slightly different:
> The code size without BTF: 7.5K (built without '-g')
> Built with '-g': 45K
> Stripped: 19K
> The difference between 7.5 and 19K still seems significant, especially wh=
en
> we do not use any kernel structures and do not need these BTF sections

That does seem like a lot of BTF information. Did you confirm (with
objdump) that it's the .BTF* sections that take up these extra 12k? Do
you have some really complicated data structures in the file or
something? Got a link to the source somewhere that isn't a web mailing
list archive? :)

In any case, while I do think it smells a little of premature
optimisation, you can of course strip the BTF information until you need
it. Having it around makes debugging easier (bpftool will expand your
map structures for you when dumping maps, and that sort of thing), but
it's not really essential if you don't need CO-RE.

> This is only reason to prefer non-libbpf option for this specific eBPF

You can still use libbpf without BTF. It's using BTF without libbpf that
tends to not work so well...

>> As a side note, though, instead of embedding the BPF program into a .h,
>> you could simply ship it as a .o and load it from the file system. We do
>> that with xdp-tools and install the bpf object files into /usr/$LIB/bpf/=
.
>>
>
> Yes, we've discussed this option and decided to go with embedding the BPF
> https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02157.html

Right, okay. I'll note, though, that if your concern is that the BPF
code should always match the rest of the code base, omitting the
compilation if there's no Clang present seems like it could lead to
problems :)

Also, if you do go the embedded-bytecode route, you may want to have a
look at the upstream 'skeleton' concept. It takes a BPF object file and
automatically generates a header file that gives you direct access to
maps, programs and global data in C. There are some examples in
selftests/bpf on how to use it, but you basically just run
'bpftool gen skeleton mybpf.o'.

-Toke


