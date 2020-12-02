Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0835F2CBD2E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:44:09 +0100 (CET)
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkRUN-0001Fa-IZ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkRSH-0000j8-Jn
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:41:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkRSB-0003Xb-He
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606912906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjDwDUKl8b6kRs4Cy15lH/e/VD3pJc+qxtXjWaH09EA=;
 b=Zd9p2qbb4P6ArTjrVaCZLNSc1La5ixMxxqMnp5z1YoTZZ9QVr6X4cDnHAaqFd4JPiPNkMG
 fu3z9ntQ9AMYcIQzr64M+RRhHL5jnHUPxvPjWE2Tdh4mLac+Qbxg5NzH9PvktJ90QJR2bq
 mSEW9uO+U7NmCUAq+BtrhM+0D7NIb5c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-LKAZaUluPcWDJOW4tB0WoA-1; Wed, 02 Dec 2020 07:41:45 -0500
X-MC-Unique: LKAZaUluPcWDJOW4tB0WoA-1
Received: by mail-ej1-f69.google.com with SMTP id f21so2970505ejf.11
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 04:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BjDwDUKl8b6kRs4Cy15lH/e/VD3pJc+qxtXjWaH09EA=;
 b=s8HC6hB+gKmIC3gKCJ2Ib3ljBwjBupdbPMH5/kN6DysWsbhGZisKjS2C9jjjrk7U3q
 a28VWzjhYZO1ksJ/31Y10uEkr9TM0Z6BQeL71tNDDStuMmSmUeO3kOct5PA+HxLlLRYQ
 +m07eBdVujfEmQ3KeUKNH+WV+gP/+3lM0EEboft25fvNIO3K1zZSHlDVNNEf7rOOCf/f
 umktA4P80o/VaG1Lza/fBkF4OwGab76jshxuYdrRISwevseH+RTOiVDPBHuvEy92Nv8T
 OvwQGsCRMv9CDkpBjb6/ybEndTBS+5UByUhCCB82RCBUYlLKEBX//6cCnCrd7XpRzhdJ
 zFFw==
X-Gm-Message-State: AOAM531qDrGlfWUMSUm/iG+pZmVKDgAXujVJD3AC0hfeMrjaXwiwhNVV
 2x95pyPi/MNt8J8W2Av0szfG2tA0vUIoPeZkQjVe1flduZRQSnFhLCqknmsDU8wkeFO5j3qXK4U
 Rx11kdygNWd5fapU=
X-Received: by 2002:a50:eb97:: with SMTP id y23mr2343904edr.29.1606912904016; 
 Wed, 02 Dec 2020 04:41:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMaUktl1VVLZlsrZWFJvbbwmWihv99OUVsXwTo2MMBl/fDXj59A9EQpJ6Zr98l4jyocyJAQg==
X-Received: by 2002:a50:eb97:: with SMTP id y23mr2343876edr.29.1606912903796; 
 Wed, 02 Dec 2020 04:41:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p35sm1147003edd.58.2020.12.02.04.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 04:41:43 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
 <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
 <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201202102729.GA16765@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <d5c0a97a-c285-b026-7ddf-71a7163404f8@redhat.com>
Date: Wed, 2 Dec 2020 13:41:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202102729.GA16765@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/20 11:27, Kevin Wolf wrote:
>> Declaring read-only QOM properties is trivial.
> 
> Trivial sounds like it's something the computer should be doing.

Possibly, but not necessarily.  There's always a cost to automatic code 
generation.  If things are _too_ trivial and easy to get right, the cost 
of automatic code generation exceeds the cost of doing things by hand.

You pretty much proved that ucc->complete is hard enough to get right, 
that it benefits from code generation.  But I am a bit more conservative 
about extending that to the rest of QOM.

>> I'm just worried about having yet another incomplete transition.
> 
> Would you really feel at home in a QEMU without incomplete transitions?

One can always dream. :)

> But since you had already posted RFC patches a while ago to
> address this, I considered it solved.

Yup, I posted the non-RFC today.

> 1. This series (mostly for documentation and introspection)
> 
> 2. -object and HMP object_add (so that we get QAPI's validation, and to
>     make sure that forgetting to update the schema means that the new
>     options just doesn't work)
> 
> 3. Create a separate 'object' entity in QAPI, generate ucc->complete
>     implementations that call a create function in the C source code with
>     type-specific parameters (like QMP command handlers)

If we agree on all of these that's already a pretty good place to be in. 
The decreasing length of the replies to the thread suggests that we are.

I wouldn't mind an example of (3) that is hand-coded and may only work 
for one object type (even a simple one such as iothread), to show what 
the generated QAPI code would look like.  It's not a blocker as far as I 
am concerned, but it would be nice.

More important, Markus and John should agree with the plan before (1) is 
committed.  That may also require the aforementioned example, but it's 
up to them.

> What's still open: Should QAPI cover run-time properties, too? Should
> run-time properties even exist at all in the final state? What is the
> exact QAPI representation of everything? (The last one includes that I
> need to have a closer look at how QAPI can best be taught about
> inheritance.)

Run-time properties will exist but they will probably be cut down 
substantially, and most of them will be read-only (they already are as 
far as external code is concerned, i.e. they have a setter but qom-set 
always fails because it's called too late).

Paolo


