Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62DF666A18
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 05:14:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFox8-0002rh-DG; Wed, 11 Jan 2023 23:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1pFox5-0002rN-Sb; Wed, 11 Jan 2023 23:12:31 -0500
Received: from mout-p-103.mailbox.org ([80.241.56.161])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1pFox2-0005wL-IX; Wed, 11 Jan 2023 23:12:31 -0500
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Nsrjc6HMHz9sSH;
 Thu, 12 Jan 2023 05:12:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1673496740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJOuYod46vn1fMS0dQ6o0bL4sh4UC2Vs6J9MaAbdc8k=;
 b=je7aF0ZUdoTDSMWr7Gq8dSoMPLh0qXDTt9qUgEGH8PzNfiFtnuM+zSlQJGRCIi6xbjG0KC
 36Dt6HHy4v3hHL0oq0QSzvWoLrQ4zn/LfyfGg8PlYgqfO9uD6CyKEK1PNVH/meeV5nrwh3
 3D2UDzL/kKwovg2pye4icS6015rOhJShFr8WObh3fmOetSRWpj0byoB8RWxsTQMtSY/E0S
 tz0t6zqBopOnX8AIDsI1ya3aHv4O/nNlj/Gjes3JWcx/tcMqCnhl6TeHkNybWr1bMraJY6
 V9xBPAfv6lr3NmeYcZg+hAK6Isqa8cloa2YjdtAnPcPCceZSHvUKZ+Yej85uZw==
X-Hashcash: 1:24:230112:jsnow@redhat.com::1fEwbFjbmiK76k1J:065Ca
X-Hashcash: 1:24:230112:qemu-devel@nongnu.org::KtImOQbVXX9r26+n:00000000000000000000000000000000000000004vfO
X-Hashcash: 1:24:230112:qemu-block@nongnu.org::hjsN9rbjS5K/KNgI:0000000000000000000000000000000000000001eyuB
X-Hashcash: 1:24:230112:thuth@redhat.com::na2PqWNxtQ4Oiyo2:0Lcbu
X-Hashcash: 1:24:230112:lvivier@redhat.com::MIERx4GXs2ZOeWCa:0000000000000000000000000000000000000000001KQUd
X-Hashcash: 1:24:230112:pbonzini@redhat.com::KZ2EKkTIUtelJcDR:000000000000000000000000000000000000000000YR1r
References: <20221010085229.2431276-1-lkujaw@mailbox.org>
 <CAFn=p-aHLW0kmOLUw6OJFYwY8a24bmb4grFYL3XE_ircmcTbJQ@mail.gmail.com>
From: Lev Kujawski <lkujaw@mailbox.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] hw/ide/core.c (cmd_read_native_max): Avoid limited
 device parameters
In-reply-to: <CAFn=p-aHLW0kmOLUw6OJFYwY8a24bmb4grFYL3XE_ircmcTbJQ@mail.gmail.com>
X-PGP-Key: https://meta.sr.ht/~lkujaw.pgp
X-PGP-Fingerprint: AC2ADB1BEE410BB0B791E393441828874091B824
Date: Thu, 12 Jan 2023 04:12:14 +0000
Message-ID: <877cxs2xy9.fsf@bromine.uucp>
MIME-Version: 1.0
Content-Type: text/plain
X-MBO-RS-META: ggtwiwfeaicgzerg5oc4n8m4j4n56uhf
X-MBO-RS-ID: 9bef00ed9050cae5d94
Received-SPF: pass client-ip=80.241.56.161; envelope-from=lkujaw@mailbox.org;
 helo=mout-p-103.mailbox.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


John Snow writes:

> On Mon, Oct 10, 2022 at 4:52 AM Lev Kujawski <lkujaw@mailbox.org> wrote:
>>
>> Always use the native CHS device parameters for the ATA commands READ
>> NATIVE MAX ADDRESS and READ NATIVE MAX ADDRESS EXT, not those limited
>> by the ATA command INITIALIZE_DEVICE_PARAMETERS (introduced in patch
>> 176e4961, hw/ide/core.c: Implement ATA INITIALIZE_DEVICE_PARAMETERS
>> command, 2022-07-07.)
>>
>> As stated by the ATA/ATAPI specification, "[t]he native maximum is the
>> highest address accepted by the device in the factory default
>> condition."  Therefore this patch substitutes the native values in
>> drive_heads and drive_sectors before calling ide_set_sector().
>>
>> One consequence of the prior behavior was that setting zero sectors
>> per track could lead to an FPE within ide_set_sector().  Thanks to
>> Alexander Bulekov for reporting this issue.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1243
>> Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>
>
> Does this need attention?
>
> --js
>

Hi John,

This patch needs to be merged to mitigate issue 1243, which is still
present within QEMU master as of aa96ab7c9d.

Thanks, Lev

