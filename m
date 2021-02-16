Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54FC31CD1E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:47:47 +0100 (CET)
Received: from localhost ([::1]:45586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2Zn-0004l4-1m
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lC2XG-00045K-Pd
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lC2XE-0003CH-4z
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613490306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xe8AmdjG4EZELHV+YvwptWBw3nGBAdgOIerOk9LsvWo=;
 b=aAFBVWcp5ye04OYgnBsm15LbJ/vj+StBDicH0MM7gdZsQC2O3r6oxRttZu3aiUnOaQDAcJ
 8jSEqxZcIA3t6cQUUKlkeg0UTqSn9VOlBfJvb0XtVggMO0bHFjLiW3dnbY3Vep6rpiqOTM
 si/R45jIFHTxjIfPPCAK4zSCmzmi/dg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-EBOk5lEtO9CUN6D0OBV0vw-1; Tue, 16 Feb 2021 10:45:02 -0500
X-MC-Unique: EBOk5lEtO9CUN6D0OBV0vw-1
Received: by mail-wr1-f70.google.com with SMTP id e12so13679874wrw.14
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 07:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xe8AmdjG4EZELHV+YvwptWBw3nGBAdgOIerOk9LsvWo=;
 b=KyjZdHKfecRG7E/rAVQdBXgiMUiEcOZ5tGkeoF39ajXmwDJuyddM75/j7Oj7CiH8Xn
 Cu7KOURWXeC0AzDpifFQamIuIQP5LNZLjIXWUWVY3EoOXaj1pC4R7L5ELROjBalc9QQc
 GvCu7Ldg/m8m8VrMn308u8GuK1rprIq5gcfUYWU5DRdReBXws4OTfbANKf3uuoVfDydN
 2s9uT40AM+6sS/0re0rixWYohnqvA87p2fjhJP3IZqgjoNL17krWk/rwoGbBm9LYfchE
 sw/p6BKHGnHO7hKJ7dqPSpQIg2otRNo9oY6tq06hUXcxa9k2/X3W3ZHuRiqdi08btdTW
 q4MA==
X-Gm-Message-State: AOAM530OLh+7DrW562p3qh8hkrybTjkX9ddroMgWCGB3W0qeX243CGb2
 NWwyYQEL9ygEbkZv+MZjUPLoLkziqMVkFaLBViUzX02Lq1WsWTkMtI0HgmvR43m9Oj4chO2JVuU
 cdjjm3esf32vc5Mfq+rPZM/Pq+3V8/Ym36aC6fUQrph+2XGJ2MgkrMAtsOd32Avcy
X-Received: by 2002:a1c:730a:: with SMTP id d10mr3689057wmb.53.1613490300829; 
 Tue, 16 Feb 2021 07:45:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/FBenCH8R93bRpIoek5xo975NZVo6xiozGkV+Fm83KC0pnju1T0rjA9Jv2/n9hwtO3kuvlQ==
X-Received: by 2002:a1c:730a:: with SMTP id d10mr3689021wmb.53.1613490300199; 
 Tue, 16 Feb 2021 07:45:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b2sm25607323wrn.2.2021.02.16.07.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 07:44:59 -0800 (PST)
Subject: Re: [RFC PATCH 0/3] hw/pflash_cfi01: Reduce memory consumption when
 flash image is smaller than region
To: David Edmondson <dme@dme.org>, qemu-block@nongnu.org
References: <20210216142721.1985543-1-david.edmondson@oracle.com>
 <df4db595-c2db-4fa8-0a4b-1403117dcc76@redhat.com> <cunh7mcjaw3.fsf@dme.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fcff2ad0-0280-f78f-c563-5e18ec37f800@redhat.com>
Date: Tue, 16 Feb 2021 16:44:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cunh7mcjaw3.fsf@dme.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:22 PM, David Edmondson wrote:
> On Tuesday, 2021-02-16 at 16:03:05 +01, Philippe Mathieu-Daudé wrote:
> 
>> I am not a block expert, but I wonder if something like this could
>> be used:
>>
>> - create a raw (parent) block image of 64MiB
>>
>> - add a raw (child) block with your 768kB of VARS file
>>
>> - add a null-co (child) block of 63Mib + 256kiB
>>
>> - pass the parent block to the pflash device
> 
> I'm not clear how this would behave if there is a write to the device at
> (say) 1MiB.

Discarded.

> More philosophically, how should it behave?

null-co: reads return zeroes, writes are discarded.

> My expectation was that if the machine says that there is 64MiB of
> writable flash, we have to allow writes throughout the full 64MiB and
> (significantly) persist them to the backing block device.
> 
> Just because the backing block device started out 768KiB big doesn't
> mean that we should not write to the remaining extent if that's what the
> VM attempts.
> 
> Would the above approach achieve that? (It doesn't sound like it.)

Well this was a simple suggestion if you know your guest won't access
anything beside these 768KiB (IIRC AAVMF "consumes" the flash devices
and doesn't expose them to the guest via ACPI/other).

If you are into memory optimization, this is worth considering.
Else it doesn't make sense.

AAVMF is designed for virtual world. Is the virtual world interested in
doing firmware upgrade on the CODE flash? Unlikely, if you want to
upgrade AAVMF you'd do it on the host. Why not mount the CODE flash as
ROM? I suppose because AAVMF does CFI MMIO accesses to detect the flash,
but I wonder what is the point if this flash will be ever written...

Regards,

Phil.


