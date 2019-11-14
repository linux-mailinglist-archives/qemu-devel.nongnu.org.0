Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E6FC292
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 10:28:43 +0100 (CET)
Received: from localhost ([::1]:54742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVBQg-00082R-2X
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 04:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iVBPm-0007ML-Q3
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:27:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iVBPk-0003Jy-LK
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:27:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22334
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iVBPk-0003J0-EJ
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573723663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Kfx14/nUNhPDsQFQDLbpt0O0GW65Ew2Xj8W/+H6W0ns=;
 b=AKuDzoXhZGnt2JAUVtjOvO3+dkgH0xcGG9QuOrE4V8V3Yl712meJcq6MelJOM6DVo/ecsg
 0ve3eaBu3gYEGxjj3Mlj2/aq7mPwn4CtNkkdHDQuDAzonHv/SL9JKCwszUGKC8kuXrz85y
 MFdo8iz6g6lQrup0tw2aMS1rf77qBOw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-m1qA8cgZOEyGXR4vEIoPMw-1; Thu, 14 Nov 2019 04:27:40 -0500
Received: by mail-wm1-f70.google.com with SMTP id y133so3032918wmd.8
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 01:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y5rliqO3A/QAMTgd6ofL2G7nH/HVgrvev5M3yye/hOs=;
 b=kt0LaeB4dzuBdlyypeGyMUx26FlUtrDlMeTBoVFTKHkEa9ji+otkvvuwaH9XAPgLUD
 jCr7bhd7zG+U6KMg0iuLCYMKHiOGPbL52qU+R/KVQdLNR3bzx/1oNhKdHx0T18CH9cfT
 RAxYMAAYZu8U6TyQbDXWxuArzUlDq0ghkTS5YJ0he+znrQGK5DcZ8wfjua0vSizGP3Mj
 51j8pJsMMG5ZK9XZ971Fl7IFE8rFVoAMd78HO7cogPPwbvfjbhfO5fKNsm3k1WrhdXG8
 L/Qx2yQrANyfdZQfVgh4/TrxsyYUe04aj5K8f4imhTHjJtxjkFiAeWcyBFsYzzawelvn
 ZrFw==
X-Gm-Message-State: APjAAAVVRcRSocUHriPrRgd2ICzAL4qRU0EhlX/8YI48QdiBtNs3c6V9
 6uKAtq3cgAvbnk8bt/kxfdPjcN5fkzv0CgDlxjS6QvzqezIpOZO3IVK14+aJ4CRJiubu2B1gflq
 z/D9AjmwjhcFUZ6w=
X-Received: by 2002:a05:600c:cb:: with SMTP id u11mr6791815wmm.5.1573723659107; 
 Thu, 14 Nov 2019 01:27:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqz03JeHfiXKhaQRZHbIUP/9+IKlwzhGBPGFiptAnFVz8rU0C/49NBQV9Ey7rzqE4A8DJxXNiw==
X-Received: by 2002:a05:600c:cb:: with SMTP id u11mr6791793wmm.5.1573723658769; 
 Thu, 14 Nov 2019 01:27:38 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:a15b:f753:1ac4:56dc?
 ([2001:b07:6468:f312:a15b:f753:1ac4:56dc])
 by smtp.gmail.com with ESMTPSA id b66sm5730443wmh.39.2019.11.14.01.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2019 01:27:38 -0800 (PST)
Subject: Re: [PATCH 01/16] memory: do not look at current_machine->accel
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1573655945-14912-1-git-send-email-pbonzini@redhat.com>
 <1573655945-14912-2-git-send-email-pbonzini@redhat.com>
 <CAJ+F1CKaxddkwtE6GGQMxhrUxbFaw8EaokU=Q4VLQH6Y66DqVw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a69fbac4-aec4-da6a-b6db-39d27785406e@redhat.com>
Date: Thu, 14 Nov 2019 10:27:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKaxddkwtE6GGQMxhrUxbFaw8EaokU=Q4VLQH6Y66DqVw@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: m1qA8cgZOEyGXR4vEIoPMw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/11/19 09:56, Marc-Andr=C3=A9 Lureau wrote:
>> +                    qemu_printf(" %s", fvi->ac->name);
>=20
> There was a discussion on the original patch that this will have
> -accel appended.

This is not the class name, it's the name member of AccelClass.

Paolo


