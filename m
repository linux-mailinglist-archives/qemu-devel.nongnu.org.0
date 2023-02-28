Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB16A625D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:23:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX8Mh-0004Lj-SL; Tue, 28 Feb 2023 17:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1pX8MO-0004FC-Dd
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:22:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1pX8MK-0001Kn-Dc
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677622927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IYWoWSqPQXy+oRny3Ijwv6UQYmPNRXwj2Gm6Um+zMI=;
 b=dSnyI2x7N0oTz5ANid6MEdA+sjzKOfuF9r5CU/cHMRHbG5Kh+19R8QhtiIFxb2rgcuXewF
 2BmacHoXicjkeiBBb9/eIOGmL3VDakAfBbZy1xm60hCTHGAnqAvbx0s67A2dhnWZDF6Jpk
 lVT63gRZK+14MlCzMUSpKdX0mynV11w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-QQ2IYU_ZP5myRpYBbabVig-1; Tue, 28 Feb 2023 17:21:59 -0500
X-MC-Unique: QQ2IYU_ZP5myRpYBbabVig-1
Received: by mail-ed1-f70.google.com with SMTP id
 q13-20020a5085cd000000b004af50de0bcfso16230221edh.15
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 14:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/IYWoWSqPQXy+oRny3Ijwv6UQYmPNRXwj2Gm6Um+zMI=;
 b=FvofNUbAwK3oo+8n2zI3xCtdsCoLoOnnBcCyFe/weCHX0SYLBOMiK96g6DkgNw/Fsh
 U/vmsHIahqQUXEYcEJtxn00QW28fWPwKsk9mXUGtYeKZPtzC+8uHARgbqaaXgAygEC8e
 lLFaXb/4Rd4mYdusd166BsawRLT5kAsjEsl/lCa4kM7wla/QDAee4c79q0wa7147ge1V
 5psrA7mG4FhiYPqQ32PHJlwEZzosSPTAQRtagK/Jf+640p0LchizIw5RcHDb/CyBfZ7G
 2/FEXvIBvEcwmRaYr5FGEOGYlQWynk7y55aCdYY71XR5/ryNwbFloP/fDx8w3XnjKm6Y
 3rSA==
X-Gm-Message-State: AO0yUKVzZX5V08hJuayKdxwET1ygiTyM9vqSYK8uGSnLmFmtlQBIKF+C
 JTC+LXEvSiznzWkXwQEKh8DK2fksHws2KyoLXnj8EnNI5XpK33JErgoo9eagOoNRL/dj6Srb+kY
 2o92LWPOoPGasTuU=
X-Received: by 2002:a17:906:6601:b0:88a:724:244c with SMTP id
 b1-20020a170906660100b0088a0724244cmr4166163ejp.71.1677622918594; 
 Tue, 28 Feb 2023 14:21:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8rB8/w7uCfTQ1nNysdHX6b9xVu36b6f1cIP5SGRwXsG72fnuQ+h4S81YnuLzFml5KYrhGKxw==
X-Received: by 2002:a17:906:6601:b0:88a:724:244c with SMTP id
 b1-20020a170906660100b0088a0724244cmr4166135ejp.71.1677622918241; 
 Tue, 28 Feb 2023 14:21:58 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id
 cw18-20020a170906c79200b008e22978b98bsm5062549ejb.61.2023.02.28.14.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:21:57 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id AA3AF975EDD; Tue, 28 Feb 2023 23:21:56 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko
 <andrew@daynix.com>, jasowang@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, mprivozn@redhat.com, yan@daynix.com
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
In-Reply-To: <Y/5QHonZyB+7vzEN@redhat.com>
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com> <Y/NCQhGmqIadlw0y@redhat.com>
 <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
 <Y/5CQ5md6huqNsx4@redhat.com> <877cw1ipgg.fsf@toke.dk>
 <Y/5QHonZyB+7vzEN@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 28 Feb 2023 23:21:56 +0100
Message-ID: <87ttz5h1mj.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=toke@redhat.com;
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

> On Tue, Feb 28, 2023 at 08:01:51PM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> Just to interject a note on this here: the skeleton code is mostly a
>> convenience feature used to embed BPF programs into the calling binary.
>> It is perfectly possible to just have the BPF object file itself reside
>> directly in the file system and just use the regular libbpf APIs to load
>> it. Some things get a bit more cumbersome (mostly setting values of
>> global variables, if the BPF program uses those).
>>=20
>> So the JSON example above could just be a regular compiled-from-clang
>> BPF object file, and the management program can load that, inspect its
>> contents using the libbpf APIs and pass the file descriptors on to Qemu.
>> It's even possible to embed version information into this so that Qemu
>> can check if it understands the format and bail out if it doesn't - just
>> stick a version field in the configuration map as the first entry :)
>
> If all you have is the BPF object file is it possible to interrogate
> it to get a list of all the maps, and get FDs associated for them ?
> I had a look at the libbpf API and wasn't sure about that, it seemed
> like you had to know the required maps upfront ?  If it is possible
> to auto-discover everything you need, soley from the BPF object file
> as input, then just dealing with that in isolation would feel simpler.

It is. You load the object file, and bpf_object__for_each_map() lets you
discover which maps it contains, with the different bpf_map__*() APIs
telling you the properties of that map (and you can modify them too
before loading the object if needed).

The only thing that's not in the object file is any initial data you
want to put into the map(s). But except for read-only maps that can be
added by userspace after loading the maps, so you could just let Qemu do
that...

> It occurrs to me that exposing the BPF program as data rather than
> via binary will make more practical to integrate this into KubeVirt's
> architecture. In their deployment setup both QEMU and libvirt are
> running unprivileged inside a container. For any advanced nmetworking
> a completely separate component creates the TAP device and passes it
> into the container running QEMU. I don't think that the separate
> precisely matched helper binary would be something they can use, but
> it might be possible to expose a data file providing the BPF program
> blob and describing its maps.

Well, "a data file providing the BPF program blob and describing its
maps" is basically what a BPF .o file is. It just happens to be encoded
in ELF format :)

You can embed it into some other data structure and have libbpf load it
from a blob in memory as well as from the filesystem, though; that is
basically what the skeleton file does (notice the big character string
at the end, that's just the original .o file contents).

-Toke


