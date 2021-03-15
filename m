Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6833C095
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:54:58 +0100 (CET)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpYV-00005M-I9
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLpUj-0005vM-78
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLpUg-0001MA-Qu
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615823458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jCD71secyuaisXXhuUrl29kmGBnh6rXYEaEbD17iCGc=;
 b=hZkas5itFwPjcpl+jsYvP5KfEzH1I6M7UFa7+wWYHVUlyb+9pZcy2vOw2Y8pnWxMO5rKYs
 0lTuCNofrMv95Ie1hRSMJYJCApexXy9DTqUV6d/T+Fl55W2NfK6G/ZFoV8WqGQrAdXxqPm
 JcnMYtCY8U7Ana6hqYuEL3fVcrZDI2Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-I0j6OrcmMA-gHnLL-vzHOQ-1; Mon, 15 Mar 2021 11:50:51 -0400
X-MC-Unique: I0j6OrcmMA-gHnLL-vzHOQ-1
Received: by mail-wm1-f72.google.com with SMTP id f9so8384388wml.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 08:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jCD71secyuaisXXhuUrl29kmGBnh6rXYEaEbD17iCGc=;
 b=jtiqCjWpUxUiS/GNgn5bc3MBG3g/2kvMWWpXZRT5Cms6kSyu0Xd2iOGmAfT2QGALcH
 idl2bzttV/QHDiiUnjoi3FlFrxY3XZ3DnctfOyUSGQ0nHPu9bg5L76VZ0amVUTs/pGhH
 lJYxJ8vKiCGJmJB/v3I57DkmBzgEJVA1YSdJZQ0Rc0CiVTdvFYkf4qABSzBVcqLhTZCK
 X/TY7k3LjbOe9M4nVW+kxMy2cwxzk6q12hzd3gJCFys54Mwf/2/ccd2NFk6F1p9owJxZ
 O36UFpRObZv9hoOmQC2MZPJq2WnDXXOz0yEvBktWHMBKFHVWWnVNVEbpKxmfbzK4p1DC
 UfyA==
X-Gm-Message-State: AOAM533xi8bh3u1y1ODrYOm6VtwBLjBmh3+sQtWfpayjXrpGSTOZxhQJ
 s1n2yVyxjLLOXlNKPn/uzL2wJKR5ZPbYMUvkVjhlkubCe2logM9eWhRtAM6hQXcjG1oymDEC+qN
 SoQPHx23uhYoxSYA=
X-Received: by 2002:a1c:1b43:: with SMTP id b64mr315993wmb.79.1615823450106;
 Mon, 15 Mar 2021 08:50:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVvTLLA6fDSVRnWE+nmmIeZOgsCuC9X0HfSUa2vsxWyZAuytG2/q5l3aTx/530/jkmNoqU0g==
X-Received: by 2002:a1c:1b43:: with SMTP id b64mr315951wmb.79.1615823449741;
 Mon, 15 Mar 2021 08:50:49 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i17sm18775286wrp.77.2021.03.15.08.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 08:50:49 -0700 (PDT)
Subject: Re: compile warning in i8259.c
To: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
 <75aed565-c9a6-6ee1-ab92-d2771df83ff0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d897bc68-a2c9-0826-76a6-93a9682ae4ad@redhat.com>
Date: Mon, 15 Mar 2021 16:50:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <75aed565-c9a6-6ee1-ab92-d2771df83ff0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 4:42 PM, Thomas Huth wrote:
> On 15/03/2021 16.14, Christian Borntraeger wrote:
>> For some time now I do see the following, when I compile x86-softmmu
>> on s390:
>>
>> FAILED: libcommon.fa.p/hw_intc_i8259.c.o
>> cc -Ilibcommon.fa.p -I. -I.. -Iqapi -Itrace -Iui -Iui/shader
>> -I/usr/include/capstone -I/usr/include/glib-2.0
>> -I/usr/lib64/glib-2.0/include -I/usr/include/libmount
>> -I/usr/include/blkid -I/usr/include/gio-unix-2.0
>> -I/usr/include/libusb-1.0 -I/usr/include/vte-2.91
>> -I/usr/include/pango-1.0 -I/usr/include/harfbuzz
>> -I/usr/include/freetype2 -I/usr/include/libpng16
>> -I/usr/include/fribidi -I/usr/include/libxml2 -I/usr/include/cairo
>> -I/usr/include/pixman-1 -I/usr/include/gtk-3.0
>> -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/atk-1.0
>> -I/usr/include/at-spi2-atk/2.0 -I/usr/include/dbus-1.0
>> -I/usr/lib64/dbus-1.0/include -I/usr/include/at-spi-2.0
>> -I/usr/include/virgl -I/usr/include/p11-kit-1 -I/usr/include/SDL2
>> -I/usr/include/cacard -I/usr/include/nss3 -I/usr/include/nspr4
>> -I/usr/include/slirp -fdiagnostics-color=auto -pipe -Wall
>> -Winvalid-pch -Werror -std=gnu99 -O2 -g -isystem
>> /home/cborntra/REPOS/qemu/linux-headers -isystem linux-headers -iquote
>> . -iquote /home/cborntra/REPOS/qemu -iquote
>> /home/cborntra/REPOS/qemu/include -iquote
>> /home/cborntra/REPOS/qemu/disas/libvixl -iquote
>> /home/cborntra/REPOS/qemu/tcg/s390 -iquote
>> /home/cborntra/REPOS/qemu/accel/tcg -pthread -U_FORTIFY_SOURCE
>> -D_FORTIFY_SOURCE=2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
>> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
>> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
>> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
>> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
>> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
>> -Wimplicit-fallthrough=2 -Wno-missing-include-dirs
>> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC
>> -DSTRUCT_IOVEC_DEFINED -D_REENTRANT -Wno-undef -D_DEFAULT_SOURCE
>> -D_XOPEN_SOURCE=600 -DNCURSES_WIDECHAR -MD -MQ
>> libcommon.fa.p/hw_intc_i8259.c.o -MF
>> libcommon.fa.p/hw_intc_i8259.c.o.d -o libcommon.fa.p/hw_intc_i8259.c.o
>> -c ../hw/intc/i8259.c
>> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
>> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in
>> this function [-Werror=maybe-uninitialized]
>>    203 |         irq = irq2 + 8;
>>        |         ~~~~^~~~~~~~~~
>> cc1: all warnings being treated as errors
>>
>> Due to other compile warnings I find this hard to bisect. Has anyone
>> seen this as well?
> 
> I've never seen this warnings so far... which compiler version is this?
> Looking at the code, it seems to be a false positive to me.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg599522.html

=)


