Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D79443628C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 15:13:54 +0200 (CEST)
Received: from localhost ([::1]:53392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdXtJ-00077C-58
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 09:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mdXqZ-00056U-LI
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:11:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mdXqR-0007kT-6f
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634821852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0FARcLaS6If/MkSwO6cvZpcdybLvnZXR+q00qGN6Utk=;
 b=blK0Ss7gsJ9/cTV6a4bC/D/u1WXYxm/PzdmEjBCT2iWZHGKegnyPEreH0HlKfHxK2jcB0s
 Iynln50BzYOriOPMevslpR0Jcw+E98PHyp4PJ9YbqoWajhLe8h1Tn4pdboqZLvx7i5j8Cf
 1Zdzqv84IsDEIQg+7ugCFeS2QtR4byU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-rsUMf8s-MpGr6gmw4bQxhg-1; Thu, 21 Oct 2021 09:10:46 -0400
X-MC-Unique: rsUMf8s-MpGr6gmw4bQxhg-1
Received: by mail-ed1-f72.google.com with SMTP id
 e14-20020a056402088e00b003db6ebb9526so219059edy.22
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 06:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0FARcLaS6If/MkSwO6cvZpcdybLvnZXR+q00qGN6Utk=;
 b=YiwiPXYsCVJ6EjLRlHb/U6/PJD1sTGGhL+eL3mPn9XHCcz+qd53/VYc+XalPG18Sac
 TC8LEK3z5erhgsXNwl9ZOK57VVfwDP3WHRCtQ2ZBeKc0CDtCIrUxe0Zl6y/83zdX9jut
 nVcqGPgxQPUQJLb/MCG8XG6WBspHs6/vtFUjr+33tbATVTMOjOo+fRbVSN1o9da+8c33
 JDAARZDHqlLssjU8/4KHM/WHgdDjZ00Jj9jbGsaWvkxLD/1boluCH8hRM4f/XHb0ln25
 FHkt8HnDZvMj3Erpnf3wPh325v6HuUxUmKEvNxWh1hHNmUAcB6R2faNnHftlytVPnto+
 zhVg==
X-Gm-Message-State: AOAM532EHR8Jm+E33/W9awK7h5GhtzzGvpRmhN14cu0pWyapxmOg6dS+
 QSkQ/QALmoB/pMrDCLCqaywI0oiKijwi0ejxfgHvpQSwWaL+SqKHYtu0kO05JUWU2y3NX1xN4lH
 W4KsO38PD4xi4aSMkBCzbkhDapr7cl9JScVL3GMYwTGxsSHTB1PB/qZNfQ9etLPI=
X-Received: by 2002:a17:907:6e07:: with SMTP id
 sd7mr7263485ejc.392.1634821845764; 
 Thu, 21 Oct 2021 06:10:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsLtmNIZbNSEZUZkB3Gyaj0fQ5xDeZ9lsAZSob82TEgtrvapiAllq0MBieqUvI57DoDUoLfw==
X-Received: by 2002:a17:907:6e07:: with SMTP id
 sd7mr7263463ejc.392.1634821845497; 
 Thu, 21 Oct 2021 06:10:45 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-144.customers.d1-online.com.
 [80.187.97.144])
 by smtp.gmail.com with ESMTPSA id j21sm2727348edr.64.2021.10.21.06.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 06:10:44 -0700 (PDT)
Subject: Re: Looking for advise on debugging a non-boot kernel on
 qemu-system-sh4
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <541c421b-d4a0-be8c-7d5e-ec204c7dba9f@redhat.com>
Date: Thu, 21 Oct 2021 15:10:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/10/2021 11.49, John Paul Adrian Glaubitz wrote:
> Hello!
> 
> I'm regularly building debian-installer packages for Debian's unofficial ports
> which includes sh4 among others. The kernel package and therefore the installer
> package contains a kernel for the SH7751R machine which is emulated by QEMU when
> choosing the "r2d" type.
> 
> Unfortunately, I have not yet been able to boot a current kernel on qemu-system-sh4,
> the screen remains blank and there are no error messages. Booting an older 2.6 kernel
> works just fine.
> 
> I'm using qemu-system-sh4 as follows:
> 
> $ qemu-system-sh4 -M r2d -kernel vmlinuz-2.6.32-5-sh7751r -initrd initrd.gz -hda debian.img \
>    -append "root=/dev/sda1 console=tty0 noiotrap"
> 
> The old 2.6 kernel from [1] boots fine while the current 5.14.x kernel from [2] does
> not produce any output.
> 
> Can anyone enlighten me what I might be missing?

I can't say much about very recent kernels, but FWIW, it was still working 
fine with kernel 4.9 in 2018, see:

  https://www.qemu-advent-calendar.org/2018/#day-9

In case it's just the video driver that is not working anymore, try:

  -append "console=ttySC1" -serial null -serial stdio

... that should hopefully redirect the kernel output to the serial console 
on stdio of the host terminal (at least it does so with the advent calendar 
image that I mentioned above).

  HTH,
   Thomas


