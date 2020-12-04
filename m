Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96582CEF1A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 14:58:38 +0100 (CET)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBbZ-0003OB-Tc
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 08:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1klBaW-0002V9-D0
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:57:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1klBaT-0003C2-FD
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607090248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LdJAWB+rVuXdhRhscMubIQ5FYd01J7YsHKObI5mVa0Y=;
 b=J0SW7kSE9aDF7O3sflNhy/ZpOhjGPJL5GGthcmMPOyTwD4ivgLgVehAT/CCa19HAypm/yy
 Ba6yCYSEq/BoQJJYHQ0huzXYxA4QeBjbk/oPHNEgL0/GswGtYa3hvJOwK/cS5WhoEV/Oqg
 y8JauQaMAtfyR/KCbbo48j1oXjc8ufQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-pNE2RvHWPzeG5D0_E4PwXw-1; Fri, 04 Dec 2020 08:57:25 -0500
X-MC-Unique: pNE2RvHWPzeG5D0_E4PwXw-1
Received: by mail-ej1-f69.google.com with SMTP id lw15so605361ejb.7
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 05:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=TjA+T+Ea5DH8rjW2EbLVwPIx7GUu/zXsULvBTMjMgaM=;
 b=gl3bXr1PqEV/WUIS2Uz1a8jd3bMq2yVvo70J3n6BB0Exaui5ulkOiFXT+gAQq1oTo8
 Y0Ypo8Gqye/kODmtpyIMTL8WwWINw7yO0bXgyt4kVEKe8chGjyFBU3Y20ydLVt33zxJW
 85b6B93RYc47GMLevfWYXVjJ2/ERPEFFOAd/mTcf27FH65xsOuA4NzKeukdwVhIfNtQn
 p+9LGpZdgp3rFc2S3Xyip1uknN/EcVbrQ35huDUg5z73p7dhFu0MRE5QjfRvz/LQ4Wk5
 CD32+MZLMqPQcMHtURKNk0CGLilMF7JbMkOCkBDCWpdy/MOCRLqOTsMPakK72Cf0//uD
 Jw5A==
X-Gm-Message-State: AOAM530GbRYORndC89Xc33j+KvdecZ0kpioVQIOygQdbcDckFvlHOxcp
 D6YvwNIFBxRatyh7MkFBA5wtVv4BSwZiR3VjzPQUYZlj9tpm7Dq8bhzyq6iTKOa/2K0kza7N0N1
 3zkjcAAcdKyIo1I8=
X-Received: by 2002:a17:907:d1f:: with SMTP id
 gn31mr7444500ejc.192.1607090244370; 
 Fri, 04 Dec 2020 05:57:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbefAQuLEt2dK3eVRpXdanIGZcc9Zo+iGBROpP/iWG/VP/I4V13mJjUEtRMSpfIs5/PhiAEQ==
X-Received: by 2002:a17:907:d1f:: with SMTP id
 gn31mr7444485ejc.192.1607090244118; 
 Fri, 04 Dec 2020 05:57:24 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id n17sm3131204ejh.49.2020.12.04.05.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 05:57:23 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id F3DCF182EEA; Fri,  4 Dec 2020 14:57:22 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [RFC PATCH v2 0/5] eBPF RSS support for virtio-net
In-Reply-To: <CAOEp5OcVPcTPFhqapEjAykhU2YzajmfmxG5MoU6Leg6Qw5TVbw@mail.gmail.com>
References: <20201119111305.485202-1-andrew@daynix.com>
 <00e5b0a8-dfaa-2899-2501-cfe8249302ff@redhat.com> <87h7p4cmva.fsf@toke.dk>
 <CAOEp5Oe0AzZ40RK9EjNx0d2RVbteq_cR8zVhQH+_8Wm9x_TQgA@mail.gmail.com>
 <87im9h9933.fsf@toke.dk>
 <CAOEp5OcVPcTPFhqapEjAykhU2YzajmfmxG5MoU6Leg6Qw5TVbw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 04 Dec 2020 14:57:22 +0100
Message-ID: <87v9dh7jy5.fsf@toke.dk>
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
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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

> On Fri, Dec 4, 2020 at 12:09 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@re=
dhat.com>
> wrote:
>
>> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>>
>> > On Wed, Dec 2, 2020 at 4:18 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
redhat.com>
>> > wrote:
>> >
>> >> Jason Wang <jasowang@redhat.com> writes:
>> >>
>> >> > On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:
>> >> >> This set of patches introduces the usage of eBPF for packet steeri=
ng
>> >> >> and RSS hash calculation:
>> >> >> * RSS(Receive Side Scaling) is used to distribute network packets =
to
>> >> >> guest virtqueues by calculating packet hash
>> >> >> * Additionally adding support for the usage of RSS with vhost
>> >> >>
>> >> >> The eBPF works on kernels 5.8+
>> >> >> On earlier kerneld it fails to load and the RSS feature is reporte=
d
>> >> >> only without vhost and implemented in 'in-qemu' software.
>> >> >>
>> >> >> Implementation notes:
>> >> >> Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF progra=
m.
>> >> >> Added libbpf dependency and eBPF support.
>> >> >> The eBPF program is part of the qemu and presented as an array
>> >> >> of BPF ELF file data.
>> >> >> The compilation of eBPF is not part of QEMU build and can be done
>> >> >> using provided Makefile.ebpf(need to adjust 'linuxhdrs').
>> >> >> Added changes to virtio-net and vhost, primary eBPF RSS is used.
>> >> >> 'in-qemu' RSS used in the case of hash population and as a fallbac=
k
>> >> option.
>> >> >> For vhost, the hash population feature is not reported to the gues=
t.
>> >> >>
>> >> >> Please also see the documentation in PATCH 5/5.
>> >> >>
>> >> >> I am sending those patches as RFC to initiate the discussions and =
get
>> >> >> feedback on the following points:
>> >> >> * Fallback when eBPF is not supported by the kernel
>> >> >> * Live migration to the kernel that doesn't have eBPF support
>> >> >> * Integration with current QEMU build
>> >> >> * Additional usage for eBPF for packet filtering
>> >> >>
>> >> >> Known issues:
>> >> >> * hash population not supported by eBPF RSS: 'in-qemu' RSS used
>> >> >> as a fallback, also, hash population feature is not reported to
>> guests
>> >> >> with vhost.
>> >> >> * big-endian BPF support: for now, eBPF isn't supported on
>> >> >> big-endian systems. Can be added in future if required.
>> >> >> * huge .h file with eBPF binary. The size of .h file containing
>> >> >> eBPF binary is currently ~5K lines, because the binary is built wi=
th
>> >> debug information.
>> >> >> The binary without debug/BTF info can't be loaded by libbpf.
>> >> >> We're looking for possibilities to reduce the size of the .h files=
.
>> >> >
>> >> >
>> >> > Adding Toke for sharing more idea from eBPF side.
>> >> >
>> >> > We had some discussion on the eBPF issues:
>> >> >
>> >> > 1) Whether or not to use libbpf. Toke strongly suggest to use libbp=
f
>> >> > 2) Whether or not to use BTF. Toke confirmed that if we don't acces=
s
>> any
>> >> > skb metadata, BTF is not strictly required for CO-RE. But it might
>> still
>> >> > useful for e.g debugging.
>> >> > 3) About the huge (5K lines, see patch #2 Toke). Toke confirmed tha=
t
>> we
>> >> > can strip debug symbols, but Yuri found some sections can't be
>> stripped,
>> >> > we can keep discussing here.
>> >>
>> >> I just tried simply running 'strip' on a sample trivial XDP program,
>> >> which brought its size down from ~5k to ~1k and preserved the BTF
>> >> information without me having to do anything.
>> >>
>> >
>> > With our eBPF code the numbers are slightly different:
>> > The code size without BTF: 7.5K (built without '-g')
>> > Built with '-g': 45K
>> > Stripped: 19K
>> > The difference between 7.5 and 19K still seems significant, especially
>> when
>> > we do not use any kernel structures and do not need these BTF sections
>>
>> That does seem like a lot of BTF information. Did you confirm (with
>> objdump) that it's the .BTF* sections that take up these extra 12k? Do
>> you have some really complicated data structures in the file or
>> something? Got a link to the source somewhere that isn't a web mailing
>> list archive? :)
>>
>>
> Looks like the extra size is related to BTF: there are 4 BTF sections tha=
t
> take 12.5K
>   [ 7] .BTF              PROGBITS        0000000000000000 00144c 00175d 0=
0
>      0   0  1
>   [ 8] .rel.BTF          REL             0000000000000000 002bb0 000040 1=
0
>     14   7  8
>   [ 9] .BTF.ext          PROGBITS        0000000000000000 002bf0 000cd0 0=
0
>      0   0  1
>   [10] .rel.BTF.ext      REL             0000000000000000 0038c0 000ca0 1=
0
>     14   9  8

Right, okay, that does not look completely outrageous with the amount of
code and type information you have in that file.

> All the sources are at:
> The branch without libbpf
> https://github.com/daynix/qemu/tree/eBPF_RFC
> The branch with libbpf
> https://github.com/daynix/qemu/tree/eBPF_RFCv2
>
> all the eBPF-related code is under qemu/ebpf directory.

Ah, cool, thanks!

>> In any case, while I do think it smells a little of premature
>> optimisation, you can of course strip the BTF information until you need
>> it. Having it around makes debugging easier (bpftool will expand your
>> map structures for you when dumping maps, and that sort of thing), but
>> it's not really essential if you don't need CO-RE.
>>
>> > This is only reason to prefer non-libbpf option for this specific eBPF
>>
>> You can still use libbpf without BTF. It's using BTF without libbpf that
>> tends to not work so well...
>>
>>
> If we build the eBPF without '-g' or strip the BTF information out of the
> object file the libbpf crashes right after issuing printout "libbpf: BTF =
is
> required, but is missing or corrupted".
> We did not investigate this too deeply but on the first glance it looks
> like the presence of maps automatically makes the libbpf to require BTF.

Ah, right. Well, you're using the BTF-based map definition syntax. So
yeah, that does require BTF: The __uint() and __type() macros really
expand to type definitions that are specifically crafted to be embedded
as BTF in the file.

You could use the old-style map definitions that don't use BTF[0], but
BTF is really where things are going in BPF-land so I think longer term
you'll probably end up needing it anyway. So going to this much trouble
just to save 10k on binary size seems to me like it's a decision you'll
end up regretting :)

[0] https://github.com/xdp-project/xdp-tutorial/blob/master/basic03-map-cou=
nter/xdp_prog_kern.c#L11

-Toke


