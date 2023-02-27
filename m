Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D38F6A444F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:24:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAy-0002Zc-Fw; Mon, 27 Feb 2023 09:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1pWeAv-0002JN-DX
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1pWeAt-0000Ol-Cb
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677506895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4uPib+1QSGLxgbqKmAZ4Y+jLTOjpTdXUWca6iYfQ6c=;
 b=bp9jHUZ040YKeBTidKC0SZQwn6PI+uoj+Dt35sscJl6pc+gt5EYeiC4BFgWT1reOrEw0aD
 pi8Qxzhg9p0R3zrqZ4y4NE836OSKTHK0mjs0yLxq23jbez2IFduJ4cv3Iu7NSA7rsV22L/
 pQuciM9FFya8yLw18SblbBsB6zeVe9k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-6KxF9EHZOLGrJJPF4lVYVg-1; Mon, 27 Feb 2023 09:06:46 -0500
X-MC-Unique: 6KxF9EHZOLGrJJPF4lVYVg-1
Received: by mail-ed1-f70.google.com with SMTP id
 cf11-20020a0564020b8b00b0049ec3a108beso8666411edb.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T4uPib+1QSGLxgbqKmAZ4Y+jLTOjpTdXUWca6iYfQ6c=;
 b=BR0T9KxPTDqKUoJTWFgGlM2pRm0E++kFL0Pw2QttyvKQyLKhhbyxsyiZPc3Wvh+lhP
 W7SDHbARdk3fKMcx5BstKtu3S5kOnvekqyGY6P2/Pg2JJtis8vCD2FqaYN0L9k4Wio+/
 gG8JIiIqPstGwKirY9JdvkFU+WrTNNITvXN3qIIcxrkJhUB1K438+sasTp6FP0T1EuKV
 nlNzh81DYWYraco+aRaMjNkEffTDWGehvuvE8JAuP0ij29wGRjKuTnACKFhY7iYyMbK6
 kShQwplKycozuWRvs18TCpFexewVmAKVvHOj7lHd/7GRC/GmnorrO+YhUiJ/8Kvx8WFV
 bABQ==
X-Gm-Message-State: AO0yUKWE8w5/W73aWUJ2sbyj4dxFABTGa1uwvqCV1d2PeOpdco7XiR1X
 nunF5aRCqn7y+JhWSSFppJq67tXUgUVKtEvGnpbQzBhhcbgBLqLNP7C2G0qNOb2Kwfgi7ZwWP9c
 /qw4Rk9QDliTc7ts=
X-Received: by 2002:a17:906:9f19:b0:879:ec1a:4ac with SMTP id
 fy25-20020a1709069f1900b00879ec1a04acmr43744195ejc.76.1677506804709; 
 Mon, 27 Feb 2023 06:06:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+RTFrnjJyu/wzumgzPAuisX11cNf6uNlUyhtpvx/aLPvk9GszKnk8Tmtldto6ryq64wgSF6Q==
X-Received: by 2002:a17:906:9f19:b0:879:ec1a:4ac with SMTP id
 fy25-20020a1709069f1900b00879ec1a04acmr43744149ejc.76.1677506804367; 
 Mon, 27 Feb 2023 06:06:44 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a170907918b00b008de10925a45sm3240971ejb.159.2023.02.27.06.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:06:43 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 4884A975C49; Mon, 27 Feb 2023 15:06:43 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Andrew Melnichenko <andrew@daynix.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?= <berrange@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org,
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 mprivozn@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
In-Reply-To: <CABcq3pF9M1=e21WwLTZSjcST1WZnJMHwYN_r_KrvPgv1OWUc9Q@mail.gmail.com>
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com> <Y/NCQhGmqIadlw0y@redhat.com>
 <CABcq3pF9M1=e21WwLTZSjcST1WZnJMHwYN_r_KrvPgv1OWUc9Q@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 27 Feb 2023 15:06:43 +0100
Message-ID: <87edqbjj7w.fsf@toke.dk>
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

Andrew Melnichenko <andrew@daynix.com> writes:

> Hi all,
>
> On Mon, Feb 20, 2023 at 11:50 AM Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
>>
>> On Sun, Feb 19, 2023 at 06:20:58PM +0200, Andrew Melnychenko wrote:
>> > Added a function to check the stamp in the helper.
>> > eBPF helper should have a special symbol that generates during the bui=
ld.
>> > QEMU checks the helper and determines that it fits, so the helper
>> > will produce proper output.
>>
>> I think this is quite limiting for in place upgrades.
>>
>> Consider this scenario
>>
>>  * Host has QEMU 8.1.0 installed
>>  * VM is running QEMU 8.1.0
>>  * QEMU 8.1.1 is released with a bug fix in the EBF program
>>  * Host is upgraded to QEMU 8.1.1
>>  * User attempts to hotplug a NIC to the running VM
>>
>> IIUC this last step is going to fail because we'll be loading
>> the EBF program from 8.1.1 and so its hash is different from
>> that expected by the QEMU 8.1.0 that the pre-existing VM is
>> running.
>>
>> If some changes to the EBF program are not going to be back
>> compatible from the POV of the QEMU process, should we instead
>> be versioning the EBF program. eg so new QEMU will ship both
>> the old and new versions of the EBF program.
>>
>
> I think it's too complicated to maintain backward compatibility with
> eBPF programs in "one package".
> As we can see, the eBPF skeleton may be changed not only by bugfix but
> with changes in libbpf(g.e. libbpf 1.0.1+).

Hmm, what change in libbpf 1.0.1 affects the skeleton format?

> This may lead to issues when with a newer environment you can't
> consistently recreate the "old" skeleton.

This should be detectable, though? As in, if you know that a new version
breaks compatibility you just bump the version number regardless of the
underlying application version?

-Toke


