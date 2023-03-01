Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96C06A6ED9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:54:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNq7-0003mT-J0; Wed, 01 Mar 2023 09:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1pXNq5-0003m2-NI
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:53:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1pXNq3-00007v-UE
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677682431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cb5gfCSv0jh4UqVatWYU3Dg6Pb3JIHv8n1e8fo2cMbg=;
 b=CisvjVfOcVy/dETtGp/Rr6IpJhrGZ5O+p1SJpL/OOzNR8Zmt109vAG6E0DRPwEGqgKnka5
 9Yswy3GtzSh6Iex0HHtegK0e3UYWAzFi/G4SVy3UHMygnHFD7wuJrj4FG5DT6GBfzHP+W8
 o1um7dSdQmmWkCZqrpJ0oeRFDQ8sjd4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-Pua4nVayO6qm9aE8-0RChw-1; Wed, 01 Mar 2023 09:53:49 -0500
X-MC-Unique: Pua4nVayO6qm9aE8-0RChw-1
Received: by mail-ed1-f71.google.com with SMTP id
 da15-20020a056402176f00b004ace822b750so19662806edb.20
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 06:53:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cb5gfCSv0jh4UqVatWYU3Dg6Pb3JIHv8n1e8fo2cMbg=;
 b=WOtysDRgm/3yzxaEbvC9bTvUFOV9nKH2RnP3bUaHhSyrcHFVZfEdTSovlcrq9eUQXo
 Vza0lpHDAnRlPcyNXsZS8hyvLVq0x34xMZozE2vWQnfEBkLKUg+cmAWQaRTxgxoHgDSe
 qbHiRN4OzeIUSQFn7TUEXj2Ml3N3DzM/yMkRbF2Zbs2ZuJqLPlNU3YzPlzmvBi4SOOX6
 48guV53UK/k4METFYB8rG+am1GBbH6lIZM+xMoIYbsWyULZSQ/zq3rcZZPdiOVn4rHqk
 qU1SI+KyLYSGgRcexlVXXpfsq555NKGcAaByyFr4+S8+PtU6vdMJrgvJyUmMOsHDBOFt
 chzw==
X-Gm-Message-State: AO0yUKX4hXBzVlZzSNEfufSy5rb5XTxnQB4bVQamfQbLnBcYmA02hkpU
 CFvhAjx24y4hQB7EOnTFwEi8CgpbmzuRTg/EYulKGFUzQR8gITSubuyYRXXhjn5d2jZkS118KZw
 OEUonbcc9mTkCUws=
X-Received: by 2002:a05:6402:383:b0:4be:3b3e:c226 with SMTP id
 o3-20020a056402038300b004be3b3ec226mr863393edv.7.1677682428736; 
 Wed, 01 Mar 2023 06:53:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+kUyb9hblYpC/5Vrh6mokc2rUVofaEZC6pZktxCGKgJsA4om4nO8BiNfph3+/qhUGHHOkxnw==
X-Received: by 2002:a05:6402:383:b0:4be:3b3e:c226 with SMTP id
 o3-20020a056402038300b004be3b3ec226mr863360edv.7.1677682428361; 
 Wed, 01 Mar 2023 06:53:48 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b008eddbd46d7esm5879151ejc.31.2023.03.01.06.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:53:47 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 2DC2797603E; Wed,  1 Mar 2023 15:53:47 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko
 <andrew@daynix.com>, jasowang@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, mprivozn@redhat.com, yan@daynix.com
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
In-Reply-To: <Y/8bQjj8VZ/7qal1@redhat.com>
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com> <Y/NCQhGmqIadlw0y@redhat.com>
 <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
 <Y/5CQ5md6huqNsx4@redhat.com> <877cw1ipgg.fsf@toke.dk>
 <Y/5QHonZyB+7vzEN@redhat.com> <87ttz5h1mj.fsf@toke.dk>
 <Y/8bQjj8VZ/7qal1@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 01 Mar 2023 15:53:47 +0100
Message-ID: <871qm8h69w.fsf@toke.dk>
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

> On Tue, Feb 28, 2023 at 11:21:56PM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Tue, Feb 28, 2023 at 08:01:51PM +0100, Toke H=C3=B8iland-J=C3=B8rge=
nsen wrote:
>> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >>=20
>> >> Just to interject a note on this here: the skeleton code is mostly a
>> >> convenience feature used to embed BPF programs into the calling binar=
y.
>> >> It is perfectly possible to just have the BPF object file itself resi=
de
>> >> directly in the file system and just use the regular libbpf APIs to l=
oad
>> >> it. Some things get a bit more cumbersome (mostly setting values of
>> >> global variables, if the BPF program uses those).
>> >>=20
>> >> So the JSON example above could just be a regular compiled-from-clang
>> >> BPF object file, and the management program can load that, inspect its
>> >> contents using the libbpf APIs and pass the file descriptors on to Qe=
mu.
>> >> It's even possible to embed version information into this so that Qemu
>> >> can check if it understands the format and bail out if it doesn't - j=
ust
>> >> stick a version field in the configuration map as the first entry :)
>> >
>> > If all you have is the BPF object file is it possible to interrogate
>> > it to get a list of all the maps, and get FDs associated for them ?
>> > I had a look at the libbpf API and wasn't sure about that, it seemed
>> > like you had to know the required maps upfront ?  If it is possible
>> > to auto-discover everything you need, soley from the BPF object file
>> > as input, then just dealing with that in isolation would feel simpler.
>>=20
>> It is. You load the object file, and bpf_object__for_each_map() lets you
>> discover which maps it contains, with the different bpf_map__*() APIs
>> telling you the properties of that map (and you can modify them too
>> before loading the object if needed).
>>=20
>> The only thing that's not in the object file is any initial data you
>> want to put into the map(s). But except for read-only maps that can be
>> added by userspace after loading the maps, so you could just let Qemu do
>> that...
>>=20
>> > It occurrs to me that exposing the BPF program as data rather than
>> > via binary will make more practical to integrate this into KubeVirt's
>> > architecture. In their deployment setup both QEMU and libvirt are
>> > running unprivileged inside a container. For any advanced nmetworking
>> > a completely separate component creates the TAP device and passes it
>> > into the container running QEMU. I don't think that the separate
>> > precisely matched helper binary would be something they can use, but
>> > it might be possible to expose a data file providing the BPF program
>> > blob and describing its maps.
>>=20
>> Well, "a data file providing the BPF program blob and describing its
>> maps" is basically what a BPF .o file is. It just happens to be encoded
>> in ELF format :)
>>=20
>> You can embed it into some other data structure and have libbpf load it
>> from a blob in memory as well as from the filesystem, though; that is
>> basically what the skeleton file does (notice the big character string
>> at the end, that's just the original .o file contents).
>
> Ok, in that case I'm really wondering why any of this helper program
> stuff was proposed. I recall the rationale was that it was impossible
> for an external program to load the BPF object on behalf of QEMU,
> because it would not know how todo that without QEMU specific
> knowledge.

I'm not sure either. Was there some bits that initially needed to be set
before the program was loaded (read-only maps or something)? Also,
upstream does encourage the use of skeletons for embedding into
applications, so it's not an unreasonable thing to start with if you
don't have the kind of deployment constraints that Qemu does in this
case.

> It looks like we can simply expose the BPF object blob to mgmt apps
> directly and get rid of this helper program entirely.

I believe so, yes. You'd still need to be sure that the BPF object file
itself comes from a trusted place, but hopefully it should be enough to
load it from a known filesystem path? (Sorry if this is a stupid
question, I only have a fuzzy idea of how all the pieces fit together
here).

-Toke


