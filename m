Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17B3453804
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:46:10 +0100 (CET)
Received: from localhost ([::1]:52956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1az-0007vk-S3
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:46:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mn1QD-00028w-Nd
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:35:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mn1Q7-0005Nz-DL
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637080494;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zp/nuo7jRDAb7yzcRp75TUZ7On7EwFkY8g8XIlvpn4Y=;
 b=SbK6vtthyqefNEMWXOrI6kAevtRE+5MG+/0kFJJYA47BA0NYaxSzD9AgmGPVB4QQ3GDkmi
 UdHcoKVeoOD+aZYVvi8YLdMFIOGvnQDRnEMLBZmWv6Z9uucupoapiK2ohElbgB5Tmn8ysU
 /J5mLDCA1+jTjpYNJ+dJ9INEs9l6L5U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-2MVGeY_cPHuDCdiBspMWVg-1; Tue, 16 Nov 2021 11:34:53 -0500
X-MC-Unique: 2MVGeY_cPHuDCdiBspMWVg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so1714957wmr.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:34:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zp/nuo7jRDAb7yzcRp75TUZ7On7EwFkY8g8XIlvpn4Y=;
 b=BiWVOiSyjpWobkxOp5qwo3wqqpc/FMGV/XDMm98EXy4ii/q/gszZyahW58s+mZjv8J
 ZLNZteYUAf4v24RslbWW/+v5Dof32SqHotSi30Gg7/0MWLd0ZZQartPrR703Qg/44yt2
 zqP2dsc1CZgXPlk0WNDF43O/amX8d6ZkBZLMRSrzyv0RYoOQromdkLSfa0sLxx6s5XCr
 My7IPdH9mtHh2JH/DuboYobYp95qoaZDJMDH4POuC1tAjCXJRMdcZspsQfo5+ckDlS+S
 0FizINkaVqJmQ0EReoAlNbtTV5I79kLCF2iROIq5DQf+x0AFMt/Dd209AHr/7alc7k6X
 v0Jg==
X-Gm-Message-State: AOAM5323m8dSpo4BzFKiRNABI6R8oFoV+G6YHY3lcBkVVGgtEwkPWQUL
 7kC5OMrs5B4b0Ydpf0L6PpPT91bj8iBJMCL+hU8PVWFWbiqQRUAvBHAMIwyEjY6XTJOBF5myDF/
 IgUBXVIk1BCRBkks=
X-Received: by 2002:a05:6000:1889:: with SMTP id
 a9mr11501658wri.68.1637080492169; 
 Tue, 16 Nov 2021 08:34:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxB9/qnCpL4x96TJSbHA29zVIua4zFIshSPunOPMA7t3giez33uWxPlc04xP2aGFHeTuwzOsA==
X-Received: by 2002:a05:6000:1889:: with SMTP id
 a9mr11501633wri.68.1637080492037; 
 Tue, 16 Nov 2021 08:34:52 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id m22sm3413331wmq.38.2021.11.16.08.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:34:51 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v5 6/6] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
In-Reply-To: <YZPZq5sC8F1x+TXE@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 16 Nov 2021 16:17:47 +0000")
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-7-leobras@redhat.com>
 <87pmr0ulqx.fsf@secure.mitica> <YZPZq5sC8F1x+TXE@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 16 Nov 2021 17:34:50 +0100
Message-ID: <87czn0ukid.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

>>=20
>>     if (params->zerocopy &&
>>         (params->parameters.multifd_compression !=3D MULTIFD_COMPRESSION=
_NONE ||
>>          migrate_use_tls())) {
>>            error_setg(&err,
>>                      "Zerocopy only available for non-compressed non-TLS=
 multifd migration");
>>         return false;
>>     }
>>=20
>> You have to do the equivalent of multifd_compression and tls enablement,
>> to see that zerocopy is not enabled, of course.
>>=20
>> I would prefer to check for QIO_CHANNEL_FEATUR_WRITE_ZEROCPY there, but
>> I can't see a way of doing that without a qio.
>
> I don't think you need to check that feature flag.

Oh, I mean other thing.

When you set "zerocopy" capability, you don't know if the kernel support
it.  My understanding is that the only way to check if it supported is
here.

I agree with the rest of the arguments.

Later, Juan.


