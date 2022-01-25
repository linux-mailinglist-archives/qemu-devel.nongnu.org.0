Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0A249B991
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:04:48 +0100 (CET)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCPFO-0000yl-Ji
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:04:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nCOie-0007S3-8m
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:30:59 -0500
Received: from outbound5h.eu.mailhop.org ([18.156.94.234]:65182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nCOiY-0005Sy-OS
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:30:55 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1643128199; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=S8dP32IVhG1i2ymJvdftLPczrNWYr0K3RAzFyi8DNXxg9/0tSilXDRE875zCKAALq2Gz6RO01OKid
 H2ozIGbCqTZ29cetyvz37ShmIJZnjKeTXGhpTdinlXaVlOhqRg5OTQVbJpyLwmbiTrOdaOpHz2XZFY
 gvveFZPGOl8ggzvxgfMPCQxYh39qrrN1Lt+rEIuVIZriwe3mSbBYpFekzjqqd8g+A2lQf4CGHybgUT
 CzNdhpqkCZhgisXPaXZzEYWO1GQaaRpv7RxzY7Ffc8OWpDhGwVdz9xyrgmmYbC54UKbUl5YMyplXIB
 ktfTLnQKKLXNzuhsVSD3QvZLB1zFWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:dkim-signature:dkim-signature:from;
 bh=a01f0+VJf+LjdLDEAkibqoJgaaHjbh9ayzNpQeFhhaA=;
 b=UddUR9WxceapuY6HFUX74lSxefURtUbphQASL0btDN2yBhCXHNJ1rvDg4P6EqLq5hG1HS9T0dMxG2
 ONqQUNugQ7WLYQAezjpZ1BetsiKg24/7gAqgfOCb1wAEEY3dl/LugCDnX8DbUI6vi9bvdmgf7HUnvz
 EAdu1QFwx+1y+PRyxj8dLhqo/9akAupsMv58Dzz/DgCIT7XUzFiW8BPmX6YH6d7N7KxMkZWMzOe/4D
 NstJZRucDdq3PHfUigrjgz6RoXA8/d+wyMrX5SJ5y3M9CXI3mUEKpr8qIY5sqlMsA6iHj9/6X2VwBQ
 tTkHy/uTrYT7d+T7842vfcS0KMOMdXA==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=a01f0+VJf+LjdLDEAkibqoJgaaHjbh9ayzNpQeFhhaA=;
 b=r36ghsxyh1SAZ1r/8dYGR5uwZ2bDf+CJv9N7G7GE0X1FrYF7IVERmxbmYgNWr+WpIDSN6v5l/bKHV
 qRW+vgQCWG3HefuP1goZUmE/2yakzEYfPo8P5G/F8k/SA8UiBNhA2r4t8dxH260BAYyoPo+xkmLC83
 moM6LN3jTg+iursE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=a01f0+VJf+LjdLDEAkibqoJgaaHjbh9ayzNpQeFhhaA=;
 b=X+6MM/cSNXmueDwdoo+XoFO53j307uPIZpXmrfp2EpauoG7uUhPQrRYpaKHJwQowe1RWByn81eGUQ
 qllB8VY3SoiPFkSogrCzJ28ub+XY4z/0232hQ9W0YsCJddcFauFG9Q1zVFR0QqTZ0rvh/UIFYpwhDP
 VfaGL8QjUjAWTOL4uzmXy7pgxuxTAogiZ2Paq5a9bnTA5kPNPNpcndjxH9zmWu9WOvYoHOG2+PqT7l
 DIDCpoTWZPug1MIhCqYsrQpvkErWd9xXzwrMApSN92THyK8QSG7QpX+aimDUWoZrPyedasS2Pr6A0P
 eRLBSldDgbFiz0XwaKgIbS/h3c3534g==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 07ed2bdc-7dfc-11ec-a079-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound2.eu.mailhop.org (Halon) with ESMTPSA
 id 07ed2bdc-7dfc-11ec-a079-973b52397bcb;
 Tue, 25 Jan 2022 16:29:57 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
 by mail.duncanthrax.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1nCOhf-006Nh9-BI; Tue, 25 Jan 2022 18:29:55 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/3] hw/display/artist: rewrite vram access mode handling
References: <20220121221619.1069447-1-svens@stackframe.org>
 <20220121221619.1069447-4-svens@stackframe.org>
 <20220125082552.uupa7yyqdnpxgopw@sirius.home.kraxel.org>
Date: Tue, 25 Jan 2022 17:29:53 +0100
In-Reply-To: <20220125082552.uupa7yyqdnpxgopw@sirius.home.kraxel.org> (Gerd
 Hoffmann's message of "Tue, 25 Jan 2022 09:25:52 +0100")
Message-ID: <87tudr6any.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=18.156.94.234; envelope-from=svens@stackframe.org;
 helo=outbound5h.eu.mailhop.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
Cc: Helge Deller <deller@gmx.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

>   Hi,
>
>> +static void artist_vram_write4(ARTISTState *s, struct vram_buffer *buf,
>> +                               uint32_t offset, uint32_t data)
>
>> +static int get_vram_offset(ARTISTState *s, struct vram_buffer *buf,
>> +                           int pos, int posy)
>
>> +    case 0x13a0:
>> +        artist_vram_write4(s, buf, get_vram_offset(s, buf, pos >> 2, posy),
>> +                           data);
>
> That is asking for trouble.
>
> You should pass around offsets not pointers.  An offset can trivially be
> checked whenever it is within the valid range (i.e. smaller than vram
> size), or it can be masked to strip off high bits when accessing virtual
> vram.  You need that for robustness and security reasons (i.e. make sure
> the guest can't write to host memory by tricking your get_vram_offset
> calculations).

I'm not sure i understand the problem. get_vram_offset() returns an
offset, which is passed to artist_vram_write4() which itself doesn't
do anything on the buffer. artist_rop8() in the end accesses the buffer,
and that function checks whether it's < buf->size. Can you elaborate
a bit more? Maybe it's just so obvious that i don't see it.

Thanks,
Sven

