Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717256A5F24
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:04:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5FG-0003Wq-SD; Tue, 28 Feb 2023 14:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1pX5Ee-0003Uu-Dm
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:02:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1pX5Ec-00018c-7t
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677610916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y5GNX+RwWIldwriUW2D0c4Jic8lHPvQCwlrNV/uQfOQ=;
 b=EASSJ5jzO0LKnJuZDJHIjB0RnWQ+MV2/h0qC37NIdtDw8k57z8thRiPnlLGv/+1dLTwRNt
 kckn6/MGXMKnQE1C5J1wiWx6AxvhOWLC7/JGmq/wOn0T8eJxAdy4WtlHjtOd6WlHqSGZHi
 0qiHyOiyOPiJoEzatHh0/7dYuOdFJ5Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-2gObbxl8PXikfCxEXuZs-g-1; Tue, 28 Feb 2023 14:01:54 -0500
X-MC-Unique: 2gObbxl8PXikfCxEXuZs-g-1
Received: by mail-ed1-f71.google.com with SMTP id
 da15-20020a056402176f00b004ace822b750so15410377edb.20
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y5GNX+RwWIldwriUW2D0c4Jic8lHPvQCwlrNV/uQfOQ=;
 b=rXClYWz4ohFS8C+0uAXwtlH2Ir77osjSLnX+Hj0r54N5EYsN8cPjfK9DWTMwmPfPLS
 6YXS++xjmGTAQZmy4PgFYkIkVU0pngDd8wEZ+JceRWY0WJ7QLF8XkezNXCeF1ZNxBArs
 n9QUy8vs14iaSgu/GfbJ/hhAAThM7iJBKHGLlMwqHtS15Qc05nj7rpTN7CIGX31i900k
 QxFSfHnvlVVhCA3EpeJjI8lgkFZqF9ucC6IK3pU0OE5tAFxI31P6arHfGSSmsKyq4Dtg
 dobhqfeXaU1R7x/SHQzwobvH8TLvP3AFhjdPO2JJakaP6eGt90TiS7qn86GMNlN/aMSh
 YDRw==
X-Gm-Message-State: AO0yUKVV1KMyxK6f4mv/90RhasLCmtrdooO9WAyTzNAiKxetyyuv8axK
 KoxZf1CQJqXDigil1ZDML9yStoUdpW50TP5StHkqP7zIctUSz6TQz0fsQkgFRtUEXOWAIvhOaEL
 USaMCwXEv4v4U4TA=
X-Received: by 2002:aa7:c7d4:0:b0:4af:51dc:da5e with SMTP id
 o20-20020aa7c7d4000000b004af51dcda5emr4006898eds.38.1677610913130; 
 Tue, 28 Feb 2023 11:01:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+yJLo3ps/sndpZ/GquXuZox8EUkEkGlA3g85q/o3OTTOV6O6qkIE9iiuClEDS1wMhIn31nOw==
X-Received: by 2002:aa7:c7d4:0:b0:4af:51dc:da5e with SMTP id
 o20-20020aa7c7d4000000b004af51dcda5emr4006862eds.38.1677610912680; 
 Tue, 28 Feb 2023 11:01:52 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id
 r28-20020a50d69c000000b004ac2a6c1c6bsm4670033edi.80.2023.02.28.11.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:01:51 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 552FB975EA5; Tue, 28 Feb 2023 20:01:51 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Yuri
 Benditovich <yuri.benditovich@daynix.com>
Cc: Andrew Melnychenko <andrew@daynix.com>, jasowang@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, mprivozn@redhat.com, yan@daynix.com
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
In-Reply-To: <Y/5CQ5md6huqNsx4@redhat.com>
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com> <Y/NCQhGmqIadlw0y@redhat.com>
 <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
 <Y/5CQ5md6huqNsx4@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 28 Feb 2023 20:01:51 +0100
Message-ID: <877cw1ipgg.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=toke@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 28, 2023 at 11:56:27AM +0200, Yuri Benditovich wrote:
>> On Mon, Feb 20, 2023 at 11:50=E2=80=AFAM Daniel P. Berrang=C3=A9 <berran=
ge@redhat.com>
>> wrote:
>>=20
>> > On Sun, Feb 19, 2023 at 06:20:58PM +0200, Andrew Melnychenko wrote:
>> > > Added a function to check the stamp in the helper.
>> > > eBPF helper should have a special symbol that generates during the b=
uild.
>> > > QEMU checks the helper and determines that it fits, so the helper
>> > > will produce proper output.
>> >
>> > I think this is quite limiting for in place upgrades.
>> >
>> > Consider this scenario
>> >
>> >  * Host has QEMU 8.1.0 installed
>> >  * VM is running QEMU 8.1.0
>> >  * QEMU 8.1.1 is released with a bug fix in the EBF program
>> >  * Host is upgraded to QEMU 8.1.1
>> >  * User attempts to hotplug a NIC to the running VM
>> >
>> > IIUC this last step is going to fail because we'll be loading
>> > the EBF program from 8.1.1 and so its hash is different from
>> > that expected by the QEMU 8.1.0 that the pre-existing VM is
>> > running.
>> >
>> >   Indeed we did not take in account the in-place upgrade.
>>=20
>>=20
>>=20
>> > If some changes to the EBF program are not going to be back
>> > compatible from the POV of the QEMU process, should we instead
>> > be versioning the EBF program. eg so new QEMU will ship both
>> > the old and new versions of the EBF program.
>>=20
>> This does not seem to be an elegant option: QEMU theoretically can inclu=
de
>> different eBPF programs but it hardly can interface with each one of the=
m.
>> The code of QEMU (access to eBPF maps etc) includes header files which e=
BPF
>> of the day is being built with them.
>>=20
>> I see 2 options to address this issue (of course there are more)
>> 1. Build and install qemu-rss-helper-<hash> executable. Libvirt will alw=
ays
>> have a correct name, so for the running instance it will use
>> qemu-rss-helper-<old-hash>, for the new instance it will use
>> qemu-rss-helper-<new-hash>
>
> We'll get an ever growing number of program variants we need to
> build & distribute with each new QEMU release.
>
>> 2. Build the helper executable and link it inside qemu as a blob. Libvirt
>> will always retrieve the executable to the temporary file name and use i=
t.
>> So the retrieved helper will always be compatible with QEMU. I'm not sure
>> what is the most portable way to do that.
>
> QEMU is considered an untrusted process, so there's no way we're going
> to ask it to give us an ELF binary and then execute that in privileged
> context.
>
>> Does one of these seem suitable?
>
> Neither feels very appealing to me.
>
> I've been trying to understand the eBPF code we're dealing with in a
> little more detail.
>
> IIUC, QEMU, or rather the virtio-net  driver needs to receive one FD
> for the BPF program, and one or more FDs for the BPF maps that the
> program uses. Currently it uses 3 maps, so needs 3 map FDs on top of
> the program FD.
>
> The helper program that is proposed here calls ebpf_rss_load() to
> load the program and get back a struct which gives access to the
> 4 FDs, which are then sent to the mgmt app, which forwards them
> onto QEMU.
>
> The ebpf_rss_load() method is making use of various structs that
> are specific to the RSS program implementation, but does not seems
> to do anything especially interesting.  It calls into rss_bpf__open()
> which eventually gets around to calling rss_bpf__create_skeleton
> which is where the interesting stuff happens.
>
> This rss_bpf__create_skeleton() method is implemented in terms of
> totally generic libbpf APIs, and has the actual blob that is the
> BPF program.
>
> Looking at what this does, I feel it should be trivial for a mgmt
> app to implement equivalent logic to rss_bpf__create_skeleton in a
> generic manner, if we could just expose the program blob and the
> map names to the mgmt app. eg a simple json file
>
>   {
>      "maps": [
>         "tap_rss_map_configurations",
> 	"tap_rss_map_indirection_table",
> 	"tap_rss_map_toeplitz_key",
>      ],
>      "program": "....the big blob encoded in base64..."
>   }
>
> if we installed that file are /usr/share/qemu/bpf/net-rss.json
> then when a QEMU process is started, the mgmt app capture the
> data in this JSON file. It now has enough info to create the
> EBPF programs needed and pass the FDs over to QEMU. This would
> be robust against QEMU software upgrades, and not tied to the
> specific EBPF program imlp. We can add or remove maps / change
> their names etc any time, as the details in the JSON descriptor
> can be updated.  This avoids need for any special helper program
> to be provided by QEMU with the problems that is throwing up
> for us.

Just to interject a note on this here: the skeleton code is mostly a
convenience feature used to embed BPF programs into the calling binary.
It is perfectly possible to just have the BPF object file itself reside
directly in the file system and just use the regular libbpf APIs to load
it. Some things get a bit more cumbersome (mostly setting values of
global variables, if the BPF program uses those).

So the JSON example above could just be a regular compiled-from-clang
BPF object file, and the management program can load that, inspect its
contents using the libbpf APIs and pass the file descriptors on to Qemu.
It's even possible to embed version information into this so that Qemu
can check if it understands the format and bail out if it doesn't - just
stick a version field in the configuration map as the first entry :)

-Toke


