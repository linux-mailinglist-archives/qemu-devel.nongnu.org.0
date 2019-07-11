Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF766660FB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 23:06:06 +0200 (CEST)
Received: from localhost ([::1]:45356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlgGS-0000dl-88
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 17:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44943)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <arndbergmann@gmail.com>) id 1hlgGG-0000Dx-PF
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 17:05:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <arndbergmann@gmail.com>) id 1hlgGF-0007yH-RJ
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 17:05:52 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39789)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <arndbergmann@gmail.com>)
 id 1hlgGF-0007x7-N7
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 17:05:51 -0400
Received: by mail-qk1-f194.google.com with SMTP id w190so4816183qkc.6
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 14:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gZPA0KywyzR7W2abtN9/k3BqkxHJcRax1qz2BAKmZPc=;
 b=GiOW0muUC0FaPGrvzBNLqnXjqI5G0CeU0RJN+7TzCGrtnAX+8fN4JwH4NcJhp/4oSZ
 9bHtZkdKN5aXK7vJ5mLrstSz1AB7OftS5K80018bzwBU8M9ixem+tVPp83fybLE5AFHk
 3N7z1wH1bqxYV0ohPCtfK9FWQHS6QnsUt813xv8bv/1kUa7+NShG/ZGREJ6YGeIUzeMo
 Kwj6aDpJkmx7a3znPdXUM+ttWkiEL3tN48rpDQEklKQnGmIwk9JTssSDr1YHlSnQyTuQ
 KTq9OURzPlgJmQvXUv1NNspUlPNhtj0wEfkIirqJ7CzOiVDTICTKRfJDvETkIkarh3Tj
 B85w==
X-Gm-Message-State: APjAAAVgZ3Y9kSFuR234nPNZ7dRbDVFQ3q6QKDscaRA1m085Z7XvEU2F
 DXdq05ZZlOUK88hBnfzXIbxHdFyd0rcHPCWvud4=
X-Google-Smtp-Source: APXvYqyEbRW90QVwQfSE2pO2lSXNsrMeyFWjmle7mbTkEjzw2PMyAz5xdsn4KLxqhgi+VrRQ0mfCJqavBWN218sVKKI=
X-Received: by 2002:a37:ad12:: with SMTP id f18mr3459618qkm.3.1562879149461;
 Thu, 11 Jul 2019 14:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190711173131.6347-1-laurent@vivier.eu>
In-Reply-To: <20190711173131.6347-1-laurent@vivier.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 11 Jul 2019 23:05:32 +0200
Message-ID: <CAK8P3a3-UaZ+RzYNZ25zFHs=1iZNrnaP_eAuHE0WAztztA4EGA@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.222.194
Subject: Re: [Qemu-devel] [PATCH v4] linux-user: fix to handle variably
 sized SIOCGSTAMP with new kernels
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Gerhard Stenzel <gerhard.stenzel@de.ibm.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org, Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 11, 2019 at 7:32 PM Laurent Vivier <laurent@vivier.eu> wrote:

>
> Notes:
>     v4: [lv] timeval64 and timespec64 are { long long , long }

>
> +STRUCT(timeval64, TYPE_LONGLONG, TYPE_LONG)
> +
> +STRUCT(timespec64, TYPE_LONGLONG, TYPE_LONG)
> +

This still doesn't look right, see my earlier comment about padding
on big-endian architectures.

Note that the in-kernel 'timespec64' is different from the uapi
'__kernel_timespec' exported by the kernel. I also still think you may
need to convert between SIOCGSTAMP_NEW and SIOCGSTAMP_OLD,
e.g. when emulating a 32-bit riscv process (which only use
SIOCGSTAMP_NEW) on a kernel that only understands
SIOCGSTAMP_OLD.

     Arnd

