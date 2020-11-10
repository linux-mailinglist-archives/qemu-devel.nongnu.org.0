Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69CD2ACB01
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 03:25:07 +0100 (CET)
Received: from localhost ([::1]:36836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcJLG-0000Fu-9j
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 21:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcJKA-0008Eo-KP
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 21:23:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcJK5-0006gd-T8
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 21:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604975032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ead+Il8QQsYVTr4Ixmzt9Rjr3HyBeheIeV2+sesR8TI=;
 b=fwwCgzrLDkLBY8tbH80qXig1g3WlcYjuWynMu6hIlzp9j8wv85U8bXvznjV4NlIxj5hHY4
 wCl85gDlMW1M12E4EN7h+J6NUrVkLLqrAHLCAbopkXDS8XVM6vHP1iiKSEg8XB3Q/SN9as
 phVcgwsxK+bhgWqA5EeImKWzXLeEkX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-_sO52uG1Mkm0wVo6hrCBKw-1; Mon, 09 Nov 2020 21:23:36 -0500
X-MC-Unique: _sO52uG1Mkm0wVo6hrCBKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2AC057204;
 Tue, 10 Nov 2020 02:23:34 +0000 (UTC)
Received: from [10.72.13.94] (ovpn-13-94.pek2.redhat.com [10.72.13.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C9505B4A9;
 Tue, 10 Nov 2020 02:23:26 +0000 (UTC)
Subject: Re: [RFC PATCH 0/6] eBPF RSS support for virtio-net
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20201102185115.7425-1-andrew@daynix.com>
 <0164a42f-4542-6f3e-bd71-3319dfaae190@redhat.com>
 <CAOEp5Oe3btwgPcOA6v=kK9s2to=x2Hg6Qw2iCFXOOWZs49s=-Q@mail.gmail.com>
 <caa38709-88f1-bd6d-3ff9-61e64c3aa51f@redhat.com>
 <20201104093155.GB565323@redhat.com>
 <cc53c09c-9b3c-63e1-6df3-b5fc949e626c@redhat.com>
 <20201105100109.GE630142@redhat.com> <20201105131938.GK630142@redhat.com>
 <CAOEp5Oe-Ct-ed5D3UjLZN=iP2W81ta=rTqMjiQ-8vVajag=GfA@mail.gmail.com>
 <16bfe468-b0f8-396a-08e9-8917423909e5@redhat.com>
 <CAOEp5Ofb7zK6A+zwbubVtitCrVTe_zLtZDYc0uExvgb+F_p9Zg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c865f892-c534-8f8d-624f-6aafcea26a1b@redhat.com>
Date: Tue, 10 Nov 2020 10:23:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOEp5Ofb7zK6A+zwbubVtitCrVTe_zLtZDYc0uExvgb+F_p9Zg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 20:23:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/9 下午9:33, Yuri Benditovich wrote:
>
>
> On Mon, Nov 9, 2020 at 4:14 AM Jason Wang <jasowang@redhat.com 
> <mailto:jasowang@redhat.com>> wrote:
>
>
>     On 2020/11/5 下午11:13, Yuri Benditovich wrote:
>     > First of all, thank you for all your feedbacks
>     >
>     > Please help me to summarize and let us understand better what we
>     do in v2:
>     > Major questions are:
>     > 1. Building eBPF from source during qemu build vs. regenerating
>     it on
>     > demand and keeping in the repository
>     > Solution 1a (~ as in v1): keep instructions or ELF in H file,
>     generate
>     > it out of qemu build. In general we'll need to have BE and LE
>     binaries.
>     > Solution 1b: build ELF or instructions during QEMU build if llvm +
>     > clang exist. Then we will have only one (BE or LE, depending on
>     > current QEMU build)
>     > We agree with any solution - I believe you know the requirements
>     better.
>
>
>     I think we can go with 1a. (See Danial's comment)
>
>
>     >
>     > 2. Use libbpf or not
>     > In general we do not see any advantage of using libbpf. It works
>     with
>     > object files (does ELF parsing at time of loading), but it does
>     not do
>     > any magic.
>     > Solution 2a. Switch to libbpf, generate object files (LE and BE)
>     from
>     > source, keep them inside QEMU (~8k each) or aside
>
>
>     Can we simply use dynamic linking here?
>
>
> Can you please explain, where exactly you suggest to use dynamic linking?


Yes. If I understand your 2a properly, you meant static linking of 
libbpf. So what I want to ask is the possibility of dynamic linking of 
libbpf here.


>
>     > Solution 2b. (as in v1) Use python script to parse object ->
>     > instructions (~2k each)
>     > We'd prefer not to use libbpf at the moment.
>     > If due to some unknown reason we'll find it useful in future, we
>     can
>     > switch to it, this does not create any incompatibility. Then
>     this will
>     > create a dependency on libbpf.so
>
>
>     I think we need to care about compatibility. E.g we need to enable
>     BTF
>     so I don't know how hard if we add BTF support in the current
>     design. It
>     would be probably OK it's not a lot of effort.
>
>
> As far as we understand BTF helps in BPF debugging and libbpf supports 
> it as is.
> Without libbpf we in v1 load the BPF instructions only.
> If you think the BTF is mandatory (BTW, why?) I think it is better to 
> switch to libbpf and keep the entire ELF in the qemu data.


It is used to make sure the BPF can do compile once run everywhere.

This is explained in detail in here: 
https://facebookmicrosites.github.io/bpf/blog/2020/02/19/bpf-portability-and-co-re.html.

Thanks


>
>
>     >
>     > 3. Keep instructions or ELF inside QEMU or as separate external file
>     > Solution 3a (~as in v1): Built-in array of instructions or ELF.
>     If we
>     > generate them out of QEMU build - keep 2 arrays or instructions
>     or ELF
>     > (BE and LE),
>     > Solution 3b: Install them as separate files (/usr/share/qemu).
>     > We'd prefer 3a:
>     >  Then there is a guarantee that the eBPF is built with exactly the
>     > same config structures as QEMU (qemu creates a mapping of its
>     > structures, eBPF uses them).
>     >  No need to take care on scenarios like 'file not found', 'file
>     is not
>     > suitable' etc
>
>
>     Yes, let's go 3a for upstream.
>
>
>     >
>     > 4. Is there some real request to have the eBPF for big-endian?
>     > If no, we can enable eBPF only for LE builds
>
>
>     We can go with LE first.
>
>     Thanks
>
>
>     >
>     > Jason, Daniel, Michael
>     > Can you please let us know what you think and why?
>     >
>     > On Thu, Nov 5, 2020 at 3:19 PM Daniel P. Berrangé
>     <berrange@redhat.com <mailto:berrange@redhat.com>
>     > <mailto:berrange@redhat.com <mailto:berrange@redhat.com>>> wrote:
>     >
>     >     On Thu, Nov 05, 2020 at 10:01:09AM +0000, Daniel P. Berrangé
>     wrote:
>     >     > On Thu, Nov 05, 2020 at 11:46:18AM +0800, Jason Wang wrote:
>     >     > >
>     >     > > On 2020/11/4 下午5:31, Daniel P. Berrangé wrote:
>     >     > > > On Wed, Nov 04, 2020 at 10:07:52AM +0800, Jason Wang
>     wrote:
>     >     > > > > On 2020/11/3 下午6:32, Yuri Benditovich wrote:
>     >     > > > > >
>     >     > > > > > On Tue, Nov 3, 2020 at 11:02 AM Jason Wang
>     >     <jasowang@redhat.com <mailto:jasowang@redhat.com>
>     <mailto:jasowang@redhat.com <mailto:jasowang@redhat.com>>
>     >     > > > > > <mailto:jasowang@redhat.com
>     <mailto:jasowang@redhat.com>
>     >     <mailto:jasowang@redhat.com <mailto:jasowang@redhat.com>>>>
>     wrote:
>     >     > > > > >
>     >     > > > > >
>     >     > > > > >      On 2020/11/3 上午2:51, Andrew Melnychenko wrote:
>     >     > > > > >      > Basic idea is to use eBPF to calculate and
>     steer
>     >     packets in TAP.
>     >     > > > > >      > RSS(Receive Side Scaling) is used to distribute
>     >     network packets
>     >     > > > > >      to guest virtqueues
>     >     > > > > >      > by calculating packet hash.
>     >     > > > > >      > eBPF RSS allows us to use RSS with vhost TAP.
>     >     > > > > >      >
>     >     > > > > >      > This set of patches introduces the usage of
>     eBPF
>     >     for packet steering
>     >     > > > > >      > and RSS hash calculation:
>     >     > > > > >      > * RSS(Receive Side Scaling) is used to
>     distribute
>     >     network packets to
>     >     > > > > >      > guest virtqueues by calculating packet hash
>     >     > > > > >      > * eBPF RSS suppose to be faster than already
>     >     existing 'software'
>     >     > > > > >      > implementation in QEMU
>     >     > > > > >      > * Additionally adding support for the usage of
>     >     RSS with vhost
>     >     > > > > >      >
>     >     > > > > >      > Supported kernels: 5.8+
>     >     > > > > >      >
>     >     > > > > >      > Implementation notes:
>     >     > > > > >      > Linux TAP TUNSETSTEERINGEBPF ioctl was used to
>     >     set the eBPF program.
>     >     > > > > >      > Added eBPF support to qemu directly through a
>     >     system call, see the
>     >     > > > > >      > bpf(2) for details.
>     >     > > > > >      > The eBPF program is part of the qemu and
>     >     presented as an array
>     >     > > > > >      of bpf
>     >     > > > > >      > instructions.
>     >     > > > > >      > The program can be recompiled by provided
>     >     Makefile.ebpf(need to
>     >     > > > > >      adjust
>     >     > > > > >      > 'linuxhdrs'),
>     >     > > > > >      > although it's not required to build QEMU with
>     >     eBPF support.
>     >     > > > > >      > Added changes to virtio-net and vhost, primary
>     >     eBPF RSS is used.
>     >     > > > > >      > 'Software' RSS used in the case of hash
>     >     population and as a
>     >     > > > > >      fallback option.
>     >     > > > > >      > For vhost, the hash population feature is not
>     >     reported to the guest.
>     >     > > > > >      >
>     >     > > > > >      > Please also see the documentation in PATCH 6/6.
>     >     > > > > >      >
>     >     > > > > >      > I am sending those patches as RFC to
>     initiate the
>     >     discussions
>     >     > > > > >      and get
>     >     > > > > >      > feedback on the following points:
>     >     > > > > >      > * Fallback when eBPF is not supported by
>     the kernel
>     >     > > > > >
>     >     > > > > >
>     >     > > > > >      Yes, and it could also a lacking of CAP_BPF.
>     >     > > > > >
>     >     > > > > >
>     >     > > > > >      > * Live migration to the kernel that doesn't
>     have
>     >     eBPF support
>     >     > > > > >
>     >     > > > > >
>     >     > > > > >      Is there anything that we needs special
>     treatment here?
>     >     > > > > >
>     >     > > > > > Possible case: rss=on, vhost=on, source system with
>     >     kernel 5.8
>     >     > > > > > (everything works) -> dest. system 5.6 (bpf does not
>     >     work), the adapter
>     >     > > > > > functions, but all the steering does not use
>     proper queues.
>     >     > > > >
>     >     > > > > Right, I think we need to disable vhost on dest.
>     >     > > > >
>     >     > > > >
>     >     > > > > >
>     >     > > > > >
>     >     > > > > >      > * Integration with current QEMU build
>     >     > > > > >
>     >     > > > > >
>     >     > > > > >      Yes, a question here:
>     >     > > > > >
>     >     > > > > >      1) Any reason for not using libbpf, e.g it
>     has been
>     >     shipped with some
>     >     > > > > >      distros
>     >     > > > > >
>     >     > > > > >
>     >     > > > > > We intentionally do not use libbpf, as it present only
>     >     on some distros.
>     >     > > > > > We can switch to libbpf, but this will disable bpf if
>     >     libbpf is not
>     >     > > > > > installed
>     >     > > > >
>     >     > > > > That's better I think.
>     >     > > > >
>     >     > > > >
>     >     > > > > >      2) It would be better if we can avoid shipping
>     >     bytecodes
>     >     > > > > >
>     >     > > > > >
>     >     > > > > >
>     >     > > > > > This creates new dependencies: llvm + clang + ...
>     >     > > > > > We would prefer byte code and ability to generate
>     it if
>     >     prerequisites
>     >     > > > > > are installed.
>     >     > > > >
>     >     > > > > It's probably ok if we treat the bytecode as a kind of
>     >     firmware.
>     >     > > > That is explicitly *not* OK for inclusion in Fedora. They
>     >     require that
>     >     > > > BPF is compiled from source, and rejected my
>     suggestion that
>     >     it could
>     >     > > > be considered a kind of firmware and thus have an
>     exception
>     >     from building
>     >     > > > from source.
>     >     > >
>     >     > >
>     >     > > Please refer what it was done in DPDK:
>     >     > >
>     >     > > http://git.dpdk.org/dpdk/tree/doc/guides/nics/tap.rst#n235
>     >     > >
>     >     > > I don't think what proposed here makes anything different.
>     >     >
>     >     > I'm not convinced that what DPDK does is acceptable to
>     Fedora either
>     >     > based on the responses I've received when asking about BPF
>     handling
>     >     > during build.  I wouldn't suprise me, however, if this was
>     simply
>     >     > missed by reviewers when accepting DPDK into Fedora,
>     because it is
>     >     > not entirely obvious unless you are looking closely.
>     >
>     >     FWIW, I'm pushing back against the idea that we have to
>     compile the
>     >     BPF code from master source, as I think it is reasonable to
>     have the
>     >     program embedded as a static array in the source code
>     similar to what
>     >     DPDK does.  It doesn't feel much different from other places
>     where
>     >     apps
>     >     use generated sources, and don't build them from the
>     original source
>     >     every time. eg "configure" is never re-generated from
>     >     "configure.ac <http://configure.ac> <http://configure.ac>"
>     >     by Fedora packagers, they just use the generated "configure"
>     script
>     >     as-is.
>     >
>     >     Regards,
>     >     Daniel
>     >     --
>     >     |: https://berrange.com     -o-
>     > https://www.flickr.com/photos/dberrange :|
>     >     |: https://libvirt.org        -o-
>     https://fstop138.berrange.com :|
>     >     |: https://entangle-photo.org   -o-
>     > https://www.instagram.com/dberrange :|
>     >
>


