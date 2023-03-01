Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07856A76ED
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 23:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXV86-0006R3-7j; Wed, 01 Mar 2023 17:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1pXV83-0006Qf-1V
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:40:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1pXV81-00075i-BQ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677710452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hBUXu0tv9PuOGvZD//11PIC6zXWO9tnoUhYlO+LKZJI=;
 b=WL+kFNQj3Cr/f/ZJrJdyXLXKPH1ipGiON7AK4y5grzOlp+JklFuwpQgCyt4qjjencRXMon
 GwAqELwxJ4AaPby3o2lPipDe8mRGHG5evJY7cgAPPAhtH+WqDhkkpvr+otnCm99kDnQTmk
 L5P837I420pbBgGOro5hH8hyGftRlDY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-kfGBpcsfNpeniGB4yPrTJg-1; Wed, 01 Mar 2023 17:40:49 -0500
X-MC-Unique: kfGBpcsfNpeniGB4yPrTJg-1
Received: by mail-ed1-f72.google.com with SMTP id
 h15-20020a056402280f00b004bf9e193c23so1071038ede.11
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 14:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hBUXu0tv9PuOGvZD//11PIC6zXWO9tnoUhYlO+LKZJI=;
 b=at/vBKqaIIkd2Qz0MZuce9nSgiQCufXm5+bVsZg9TWDQBNSjYJ7rGu5m3WUqceAQ+b
 fRYHi0EkPoJrDzyP2Ri/OmmD2S87ipzwpRO60gJsdJk3ynQxtUzEKs1dsAmTmpwKaAc7
 fKEp4NUZvn25YHA9uiMN85V3UCswtX1yKeU8bzh8hbMzQFQ+deDYqHy37X3E6ednxqGW
 QZN2GPNUdnw/PCCNlHpNOnzQMb2yjmukhfk6o0uiXtK2AGlaI/53sz1XUnS74oQDrFOU
 LQZTvz0SnTxR4npKA/nAOsRX7FeURoy/WwW/OGOmqXL3OXJ4jB/aQKOlEDW5nOe6VZ48
 Sb/g==
X-Gm-Message-State: AO0yUKWsJtR+TlvGHRhHwQVftZGgCYuUpyEvUj9UpkXezxJt7jLA/z5E
 TQik1ZrCg4kIOFZk/y4UxvAZxWKbrgGWuP7+V0RPED5crVSWaraKnwVS3RX05HZcEDwkAdbsu9H
 +dHjnWGz9qoxpaac=
X-Received: by 2002:a17:906:3c05:b0:8aa:f2f2:7543 with SMTP id
 h5-20020a1709063c0500b008aaf2f27543mr8505723ejg.29.1677710446324; 
 Wed, 01 Mar 2023 14:40:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8xo4yDOE7xlCIY0A2WDD24AvD1oRoyXXJOoIFtrHputxN+g5d9lOhjmp0eXkjLxQ7cS53PFQ==
X-Received: by 2002:a17:906:3c05:b0:8aa:f2f2:7543 with SMTP id
 h5-20020a1709063c0500b008aaf2f27543mr8505675ejg.29.1677710445431; 
 Wed, 01 Mar 2023 14:40:45 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
 by smtp.gmail.com with ESMTPSA id
 gr16-20020a170906e2d000b008eb5b085075sm6226662ejb.122.2023.03.01.14.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 14:40:44 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 66ECF9760BF; Wed,  1 Mar 2023 23:40:44 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko
 <andrew@daynix.com>, jasowang@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, mprivozn@redhat.com, yan@daynix.com
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
In-Reply-To: <Y/9prSBDTQoL7yn5@redhat.com>
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com> <Y/NCQhGmqIadlw0y@redhat.com>
 <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
 <Y/5CQ5md6huqNsx4@redhat.com> <877cw1ipgg.fsf@toke.dk>
 <Y/5QHonZyB+7vzEN@redhat.com> <87ttz5h1mj.fsf@toke.dk>
 <Y/8bQjj8VZ/7qal1@redhat.com> <871qm8h69w.fsf@toke.dk>
 <Y/9prSBDTQoL7yn5@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 01 Mar 2023 23:40:44 +0100
Message-ID: <87k000f637.fsf@toke.dk>
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

> On Wed, Mar 01, 2023 at 03:53:47PM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Tue, Feb 28, 2023 at 11:21:56PM +0100, Toke H=C3=B8iland-J=C3=B8rge=
nsen wrote:
>> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >>=20
>> >> > On Tue, Feb 28, 2023 at 08:01:51PM +0100, Toke H=C3=B8iland-J=C3=B8=
rgensen wrote:
>> >> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >> >>=20
>> >> >> Just to interject a note on this here: the skeleton code is mostly=
 a
>> >> >> convenience feature used to embed BPF programs into the calling bi=
nary.
>> >> >> It is perfectly possible to just have the BPF object file itself r=
eside
>> >> >> directly in the file system and just use the regular libbpf APIs t=
o load
>> >> >> it. Some things get a bit more cumbersome (mostly setting values of
>> >> >> global variables, if the BPF program uses those).
>> >> >>=20
>> >> >> So the JSON example above could just be a regular compiled-from-cl=
ang
>> >> >> BPF object file, and the management program can load that, inspect=
 its
>> >> >> contents using the libbpf APIs and pass the file descriptors on to=
 Qemu.
>> >> >> It's even possible to embed version information into this so that =
Qemu
>> >> >> can check if it understands the format and bail out if it doesn't =
- just
>> >> >> stick a version field in the configuration map as the first entry =
:)
>> >> >
>> >> > If all you have is the BPF object file is it possible to interrogate
>> >> > it to get a list of all the maps, and get FDs associated for them ?
>> >> > I had a look at the libbpf API and wasn't sure about that, it seemed
>> >> > like you had to know the required maps upfront ?  If it is possible
>> >> > to auto-discover everything you need, soley from the BPF object file
>> >> > as input, then just dealing with that in isolation would feel simpl=
er.
>> >>=20
>> >> It is. You load the object file, and bpf_object__for_each_map() lets =
you
>> >> discover which maps it contains, with the different bpf_map__*() APIs
>> >> telling you the properties of that map (and you can modify them too
>> >> before loading the object if needed).
>> >>=20
>> >> The only thing that's not in the object file is any initial data you
>> >> want to put into the map(s). But except for read-only maps that can be
>> >> added by userspace after loading the maps, so you could just let Qemu=
 do
>> >> that...
>> >>=20
>> >> > It occurrs to me that exposing the BPF program as data rather than
>> >> > via binary will make more practical to integrate this into KubeVirt=
's
>> >> > architecture. In their deployment setup both QEMU and libvirt are
>> >> > running unprivileged inside a container. For any advanced nmetworki=
ng
>> >> > a completely separate component creates the TAP device and passes it
>> >> > into the container running QEMU. I don't think that the separate
>> >> > precisely matched helper binary would be something they can use, but
>> >> > it might be possible to expose a data file providing the BPF program
>> >> > blob and describing its maps.
>> >>=20
>> >> Well, "a data file providing the BPF program blob and describing its
>> >> maps" is basically what a BPF .o file is. It just happens to be encod=
ed
>> >> in ELF format :)
>> >>=20
>> >> You can embed it into some other data structure and have libbpf load =
it
>> >> from a blob in memory as well as from the filesystem, though; that is
>> >> basically what the skeleton file does (notice the big character string
>> >> at the end, that's just the original .o file contents).
>> >
>> > Ok, in that case I'm really wondering why any of this helper program
>> > stuff was proposed. I recall the rationale was that it was impossible
>> > for an external program to load the BPF object on behalf of QEMU,
>> > because it would not know how todo that without QEMU specific
>> > knowledge.
>>=20
>> I'm not sure either. Was there some bits that initially needed to be set
>> before the program was loaded (read-only maps or something)? Also,
>> upstream does encourage the use of skeletons for embedding into
>> applications, so it's not an unreasonable thing to start with if you
>> don't have the kind of deployment constraints that Qemu does in this
>> case.
>>=20
>> > It looks like we can simply expose the BPF object blob to mgmt apps
>> > directly and get rid of this helper program entirely.
>>=20
>> I believe so, yes. You'd still need to be sure that the BPF object file
>> itself comes from a trusted place, but hopefully it should be enough to
>> load it from a known filesystem path? (Sorry if this is a stupid
>> question, I only have a fuzzy idea of how all the pieces fit together
>> here).
>
> It could be from a well known location on the filesystem, but might
> be better to make it possible to query it from QMP, which is mostly
> safe *provided* you've not yet started guest CPUs running. It could
> be queried at startup and then cached for future use.

Right, I don't have a strong opinion about the exact mechanism, just
wanted to convey a general "loading an untrusted BPF program is bad"
kind of vibe ;)

-Toke


