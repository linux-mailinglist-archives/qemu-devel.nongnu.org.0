Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733C53717AB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:14:54 +0200 (CEST)
Received: from localhost ([::1]:34480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldaHd-000090-IK
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldaG9-0007fS-1V
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldaG7-0006bS-Gb
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620054798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUTNx+GsIgrAyG42d/hYWOCNsGoljgzTd0u91D1RDI8=;
 b=H8pOngXrfUphnVZGq1QwMIcP7oOzIJNhZ1eau/KBBnDphg8eiMhNfjCfYq7e70JDj0yZGg
 uz/teuhIzszLyw4liOGLoN8iUbTK8L4+DnlTmNGkjrwFiPGRG/Z8Vdmn3aUP5S4zpXDMgq
 lIqat+AwS78623bakBK0PVqAdrcF5jk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-XL46dqK2M6iQoHp99qkhsA-1; Mon, 03 May 2021 11:13:17 -0400
X-MC-Unique: XL46dqK2M6iQoHp99qkhsA-1
Received: by mail-ed1-f72.google.com with SMTP id
 i2-20020a0564020542b02903875c5e7a00so4702283edx.6
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 08:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hUTNx+GsIgrAyG42d/hYWOCNsGoljgzTd0u91D1RDI8=;
 b=pvaVgLbS4hZmiib5U0uz/ewQt/zFvrtopypnNqYh7GaN5Xei/3vUzkG6wgYQ3B3PCC
 LNhI8EGDADjQtf1BVvHcMHgVtkdS6poKzoJTN9A1e83oAVd2wmS1EWwSOzlJ2ErooYET
 XJGnWWATlCfa6SeOxm6SzQB5iolYoPajMSmH6j13dyciOtlNYjLNEKXI6zZdoiHGN1eU
 eWH8X92uAlrkxhIDYCGrFOfR3QB+2pS0uOyccz5OhY0qDW5lgFhUWoh+wNOJ2WwBukaW
 WBXQoxMxGDpPpZXnYKR49x2vQ8kehNLSNBz8ePSXgiiC5px4dGdJ7bBgpjn4qWv/qasI
 pj9g==
X-Gm-Message-State: AOAM530rKvyBh+E98muxLYLRzx9kk6M2y2r80++0tthRngWyftpIvHaO
 fCxhe2TvZVyOkpxTzIhR6yOKIh6QtUILA6sqjsgldNi1viQEuG1sb4SIoo3H3Nox6WGYj5jee+2
 +xKfnClZFRU7Kbuc=
X-Received: by 2002:a17:906:46d0:: with SMTP id
 k16mr17345806ejs.105.1620054795852; 
 Mon, 03 May 2021 08:13:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6i99FpwJBxklVx7VbhftcavyDVQ/2bDE/WjSUkPgXx9gZraUEpxpkHaOTdetqj6nLUnCTnQ==
X-Received: by 2002:a17:906:46d0:: with SMTP id
 k16mr17345786ejs.105.1620054795712; 
 Mon, 03 May 2021 08:13:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x9sm12520153edv.22.2021.05.03.08.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 08:13:15 -0700 (PDT)
Subject: Re: Let's remove some deprecated stuff
To: Alistair Francis <alistair23@gmail.com>, Thomas Huth <thuth@redhat.com>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <CAKmqyKPYu1Y5EaAvVgB9U4kCh4yBJG_75r6ivdvMuZDN6F3ZcQ@mail.gmail.com>
 <17b136e5-5811-27e2-224a-47795eb68bb5@redhat.com>
 <CAKmqyKOtnRvXZffxc_8zZUYQxwFFO9cEocU0cRkUs3PGJnCNVQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dad95862-e7e3-2416-6c62-c19d81dc3e3b@redhat.com>
Date: Mon, 3 May 2021 17:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOtnRvXZffxc_8zZUYQxwFFO9cEocU0cRkUs3PGJnCNVQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/21 09:12, Alistair Francis wrote:
>> deprecated.rst is mainly thought for the things that only have been marked
>> as deprecated, but not changed yet. Once it's done, the items normally get
>> moved to docs/system/removed-features.rst instead.
> Too easy, I'll move it there instead.

Can you move the description to docs/system/target-riscv.rst?  The 
switch from ``bios none`` to ``-bios default`` in 5.1 can be placed in a 
footnote if desirable, but the documentation of ``-bios`` is worth 
keeping in a more prominent place.

Paolo


