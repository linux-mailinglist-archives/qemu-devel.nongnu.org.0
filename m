Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7413F30DFCB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:36:40 +0100 (CET)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7L8x-0002yQ-GI
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7L3e-0006Mf-PR
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:31:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7L3a-0003qE-IH
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612369866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w1C4/+uzPKSfDQhsoT0hUjLz5zraznqs1u0BxfyZ6U4=;
 b=dMH+LtUq8lIjJ3/85ojjwQ6R63Gb3tGQ5j8Yek1IbkKpuPSHSQHXgMAM5q1AKGpFshfEj8
 xV8c8/ZJeDpklY1PVE5eJP7s2ea6tWn82qPu1oVNYsYrk96oLzBwWnspzQjwd4XJ7sErSb
 eUdd40lqYkwBtg42VM9Uh2UWi+MHiHQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-nG7gRhPCOcK2cREjzExU0A-1; Wed, 03 Feb 2021 11:30:59 -0500
X-MC-Unique: nG7gRhPCOcK2cREjzExU0A-1
Received: by mail-ed1-f70.google.com with SMTP id ay16so132912edb.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w1C4/+uzPKSfDQhsoT0hUjLz5zraznqs1u0BxfyZ6U4=;
 b=Xn2toowOZ+2aUaP8EzcN+tjN33Mo41lEIf9oxakpCN20tBJLXH9qxzgc5BfHHWEMA6
 iam0hdHS3zVpy46zX3Hc3Pvogx9ghv6r+b1YubLBPWqxtGply6fboriG26NO/hXgb59z
 /rPs7J8XD5LvyG5OwWcbsyWnk9OjyzfBAF4ksEsd/COw9TDnBvzNI2FUkD3fhVA0Rc4m
 wpW8x0IDkJDLAgbEun3lXimgsw93OeyttS5kadUM/U0URKbQCH0YKtHLZwad5yAz4E4j
 S4jNOUdqjjjysyN41ApDpjZ47g2u+/fLw1EOddarYRGxJP3bEm/WjCC6xQISCZ2KjhBY
 A8DQ==
X-Gm-Message-State: AOAM533kqr6txJNIMt3MUUIuuAcf+YAahpyvpI+rL/QjWgnCIAdHlqLp
 AqiZUGQu/HSuc6qT+cg3d474R+QTWsyHYYOJV9S9cmZv0QbdP9ngEiYLRwm7bhAeiOA4sAc68rz
 wqpteSF55BDSTdyY=
X-Received: by 2002:a50:ef06:: with SMTP id m6mr3745287eds.216.1612369858495; 
 Wed, 03 Feb 2021 08:30:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWRqiIVF3hzP2TxwJt41AFnUapMW9TQor7CjelbcB/T1ARj8hw5waIBEsJ7yfm0y3mn+iWOg==
X-Received: by 2002:a50:ef06:: with SMTP id m6mr3745274eds.216.1612369858368; 
 Wed, 03 Feb 2021 08:30:58 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id jp6sm1237426ejb.17.2021.02.03.08.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:30:57 -0800 (PST)
Subject: Re: qemu broke booting of old RedHat floppies
To: John Snow <jsnow@redhat.com>, avocado-devel <avocado-devel@redhat.com>
References: <0bca1cd0-69c3-c07a-b4cf-015dcdbc6d61@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d71657c6-a819-b2df-3e4b-0a6d690fd0c2@redhat.com>
Date: Wed, 3 Feb 2021 17:30:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0bca1cd0-69c3-c07a-b4cf-015dcdbc6d61@msgid.tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing avocado-devel for test idea.

On 1/20/21 4:11 PM, Michael Tokarev wrote:
> As someone noticed on IRC, old (2.x) RedHat floppies does not boot
> in current qemu.  When qemu is booted from floppy image at
>  https://archive.org/details/RedHatLinuxBootDisk521998
> (download the "ISO image" link there, it really is an 1.44 floppy),
> seabios says Boot failed and that's it.
> 
> I run git bisect with it, knowing that qemu 2.1 works fine, and
> it pointed out to this commit which is oldish qemu-2.5+:
> 
> commit 4812fa27fa75bce89738a82a191755853dd88408
> Author: John Snow <jsnow@redhat.com>
> Date:   Fri Jan 22 15:51:05 2016 -0500
> 
>     fdc: change auto fallback drive for ISA FDC to 288
> 
>     The 2.88 drive is more suitable as a default because
>     it can still read 1.44 images correctly, but the reverse
>     is not true.
> 
>     Since there exist virtio-win drivers that are shipped on
>     2.88 floppy images, this patch will allow VMs booted without
>     a floppy disk inserted to later insert a 2.88MB floppy and
>     have that work.
> 
>     This patch has been tested with msdos, freedos, fedora,
>     windows 8 and windows 10 without issue: if problems do
>     arise for certain guests being unable to cope with 2.88MB
>     drives as the default, they are in the minority and can use
>     type=144 as needed (or insert a proper boot medium and omit
>     type=144/288 or use type=auto) to obtain different drive types.
> 
>     As icing, the default will remain auto/144 for any pre-2.6
>     machine types, hopefully minimizing the impact of this change
>     in legacy hw to basically zero.
> 
>     Reviewed-by: Eric Blake <eblake@redhat.com>
>     Signed-off-by: John Snow <jsnow@redhat.com>
>     Message-id: 1453495865-9649-13-git-send-email-jsnow@redhat.com
> 
> Now, I don't even know where to put that "type=144/288/auto" thing,
> I tried this:
> 
>  -drive
> file=RedHatLinuxBootDisk521998.disk1of1.img,if=floppy,format=raw,type=144
> 
> but it says that format=raw does not support "type=144" option.
> 
> And it's even more: I don't remember which size should be an 1.44Mb
> floppy :))
> The file size of that image is 1492992 bytes which does not look like it
> is of
> standard size, but I can't find which size it should be.
> 
> Thanks!
> 
> /mjt
> 


