Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731DF12993C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 18:18:40 +0100 (CET)
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijRLr-0006Re-1Q
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 12:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ijRL3-0005sj-5R
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 12:17:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ijRL0-0008KZ-Ka
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 12:17:47 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55295
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ijRL0-0008Fm-A3
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 12:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577121465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l212z3tXHsag5CJg9MFokrtZKuYXuxh1lfIGX7t+ZBM=;
 b=WHF8wjuQOFonudaZq2kiLDtOCNoNdj5kPxgO3y/6MYxx9xIzwIDRT/5nDAXUcRZzhfI/Rv
 Slyfs38FMOQGDBsFINnkdgCh9hI3xGVgzC/vozXrLw+mNhv+0MbEeeMhEWfw4SZxo3N70O
 L74nz3fsjapICEh/cOBfzgGSxbqBMo0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-YSp627A0M2SYVlnp3UwtJQ-1; Mon, 23 Dec 2019 12:17:43 -0500
Received: by mail-wr1-f70.google.com with SMTP id u18so8254749wrn.11
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 09:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l212z3tXHsag5CJg9MFokrtZKuYXuxh1lfIGX7t+ZBM=;
 b=BJgZ9iya5CHiJ7BXbBmFmU8/horqOMDyBEyNRFOrwTX8Ml79n4UR/5vpBUHBbvNkuA
 Zg73scJw065xwG/S5eE/KWC+4wiT5yGyotv5RArflduL3CmUGcIZOJOmVhK7LzJ9gXVc
 c8ftUWYq8hU0kGJ99P3uPsjtDcMRH4hlQA1GoNbKqZmYh/I7199RGSHJ4EEocZgbSJ1j
 SxK8Eq3KePg2tfi7AR8RjYBslabkZVll20b7g1uOX/uq3YSlIIROvUrDr9sRxNjJFZoK
 t/6b0DEtVfGj4LylLWwHYWB9A0BEY0wwtyFD+yXxq/wu7zq9nYpxjWTCr9KwkE1Q4/ln
 rJ/w==
X-Gm-Message-State: APjAAAXSnig7ZOEvjAcP35ivxcwWS8x+bdvfeVI0HJ+V3CBsvF+bUn4Y
 jbqXL+YAfICP6RBy5nXPaM2RiNKmGe7TBl+WJ88ZCCJdaABaAm+dWi/SLHvymQv9MTa+GzkC6YR
 /N1ZXStlC6gW2g4I=
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr98260wmg.16.1577121462723;
 Mon, 23 Dec 2019 09:17:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqywJ50touC3SgidkXqfdlFHERrVDwiPvQkN5zNj4rSeg2L3JZ3QiSmmQMelmGE2uOHWWtukjg==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr98242wmg.16.1577121462440;
 Mon, 23 Dec 2019 09:17:42 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id c4sm64362wml.7.2019.12.23.09.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2019 09:17:41 -0800 (PST)
Subject: Re: [PATCH 00/10] Fixes for DP8393X SONIC device emulation
To: Finn Thain <fthain@telegraphics.com.au>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <cover.1576286757.git.fthain@telegraphics.com.au>
 <CAL1e-=gwxSDa1NSevcCbjG1r5vg6A49Kg_FP2EL1jW+BMn7Ghw@mail.gmail.com>
 <alpine.LNX.2.21.1.1912150915460.8@nippy.intranet>
 <CAL1e-=hRs0EMz7ZTt+GXMfyHW8arq-h-m1Dzd3jz+vqP82+zjA@mail.gmail.com>
 <CAL1e-=iTBxqCsNCbGpONdewE4uTDG=OAV36fF_Cq9=i6KQhMaA@mail.gmail.com>
 <alpine.LNX.2.21.1.1912200912360.8@nippy.intranet>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <636043f1-bd84-f00d-55a5-7d58aab6cd57@redhat.com>
Date: Mon, 23 Dec 2019 18:17:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.21.1.1912200912360.8@nippy.intranet>
Content-Language: en-US
X-MC-Unique: YSp627A0M2SYVlnp3UwtJQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <laurent@vivier.eu>, Jason Wang <jasowang@redhat.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Finn,

On 12/20/19 5:24 AM, Finn Thain wrote:
> On Sun, 15 Dec 2019, Aleksandar Markovic wrote:
> 
>>
>> Herve,
>>
>> Is there any way for us to come up with an equivalent or at least
>> approximate scenario for Jazz machines?
>>
>> Regards,
>> Aleksandar
>>
> 
> That would be useful in general, but in this case I think it might be
> better to test NetBSD, since I have already tested Linux. (I had to fix
> some bugs in the Linux sonic driver.)
> 
> I tried to boot NetBSD/arc but failed. I got a blue screen when I typed
> "cd:boot" at the "Run A Program" prompt in the ARC menu.
> 
> $ ln -s NTPROM.RAW mipsel_bios.bin
> $ mips64el-softmmu/qemu-system-mips64el -M magnum -L .
> -drive if=scsi,unit=2,media=cdrom,format=raw,file=NetBSD-8.1-arc.iso
> -global ds1225y.filename=nvram -global ds1225y.size=8200
> qemu-system-mips64el: g364: invalid read at [0000000000102000]
> $
> 
> Any help would be appreciated.

Please open a new bug entry with this information at 
https://bugs.launchpad.net/qemu/+filebug

Thanks,

Phil.


