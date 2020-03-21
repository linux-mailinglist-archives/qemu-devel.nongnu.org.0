Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F294218E34E
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Mar 2020 18:24:38 +0100 (CET)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFhrR-00046o-RR
	for lists+qemu-devel@lfdr.de; Sat, 21 Mar 2020 13:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55118)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1jFhqX-0003eW-Nr
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 13:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1jFhqW-0007VM-F4
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 13:23:41 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35692)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1jFhqW-0007ST-9E
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 13:23:40 -0400
Received: by mail-wm1-x342.google.com with SMTP id m3so9878782wmi.0
 for <qemu-devel@nongnu.org>; Sat, 21 Mar 2020 10:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4COvmHZnbLJIekYtKN//zI3GQIWRlJTgF/3iVATa9o4=;
 b=syD250269ipnDb9Af8aMa+7K7VG2IjY55vuJ3LZ0eoc8vlzL1tBK5105Wk+2DmAgBu
 gSE2KUGaEDYxP3FloW0ISUOWKyhJsBfUxV11g3rhgX0gCTCr2u4b7YfiszfZIZ764oCD
 Lgkq7m0SSUZ/qmkxzkY5Tsq6WMUPlS35q4KZcIWNcaWnJJ2xMhlEsMesEpQRhMUjUVPC
 P3PJp4PytTDbl6hbYdDZAS31q2SnekVuln0/LcCucBuuLxqAG7rFtwxp+ZOFe8CUtD7w
 5WsUtkaS3oyLeqR3dh09CGXKZpfDQYQpHbuYbxk7e5Ae4sazCjDjsACANgjNQZx+3C9H
 5eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4COvmHZnbLJIekYtKN//zI3GQIWRlJTgF/3iVATa9o4=;
 b=YA6q+3r5OdBF+PimdaFZNF18ieeCWcTnVYMDzyyaMS36ez048+U1eBdoY4s76RtA6y
 oYuMsQYiE2paJ0vJAWuhW4l4LXwuplAcphHwpNiBzpTVF7XFSNscUoahRc7Mvhzc8+C5
 ccUTF7gixZ74l+kksEbQE6kRUz4iCFcW0GSTCzBV8lKhUARGBspro9ojYt0/ndncsOOm
 4ofMw4uvdwbLVr94mzMLHDKqKBtLKlq0WIkYJtCqlffKmA+U9MZ5Gm5M8w8zRsfUWWZc
 U6u0H9cWyI4gn0j8OwgL6/0e1yd7gANjmm28VE0hA3Lx2hwWQ9yhStnW9h/EUatInuyC
 JW3Q==
X-Gm-Message-State: ANhLgQ3nbZbdNKdRCr2VaTO80vMCSYPVK+UK7pwT04o02E3sj7xCk8h+
 P/chDAtL5EMGeOBbX8mQrAM=
X-Google-Smtp-Source: ADFU+vtILGLnq38TeTdJ5fViDfDoZcU8Z/eU0geLVAu/b5xZXVF1dgq7xXgnBDGBRjKWyy2d1ZvLmw==
X-Received: by 2002:a1c:1d4d:: with SMTP id d74mr16899166wmd.123.1584811418707; 
 Sat, 21 Mar 2020 10:23:38 -0700 (PDT)
Received: from [192.168.86.37] ([37.142.144.12])
 by smtp.gmail.com with ESMTPSA id s8sm9847902wrv.97.2020.03.21.10.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 10:23:38 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/rdma: avoid suspicious strncpy() use
To: Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20200316160702.478964-1-stefanha@redhat.com>
 <20200316160702.478964-3-stefanha@redhat.com>
 <CAMPkWoMFD+-zbt1Xb-0M-MQWJ_QonQxUkJWBRoLUdJzfC49VfA@mail.gmail.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <1600942b-181d-2102-d3b0-6892a882d47a@gmail.com>
Date: Sat, 21 Mar 2020 19:25:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAMPkWoMFD+-zbt1Xb-0M-MQWJ_QonQxUkJWBRoLUdJzfC49VfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 3/20/20 1:55 PM, Yuval Shaia wrote:
>
>
> On Mon, 16 Mar 2020 at 18:07, Stefan Hajnoczi <stefanha@redhat.com 
> <mailto:stefanha@redhat.com>> wrote:
>
>     gcc (GCC) 9.2.1 20190827 (Red Hat 9.2.1-1) with sanitizers enabled
>     reports the following error:
>
>       CC      x86_64-softmmu/hw/rdma/vmw/pvrdma_dev_ring.o
>     In file included from /usr/include/string.h:495,
>                      from include/qemu/osdep.h:101,
>                      from hw/rdma/vmw/pvrdma_dev_ring.c:16:
>     In function ‘strncpy’,
>         inlined from ‘pvrdma_ring_init’ at
>     hw/rdma/vmw/pvrdma_dev_ring.c:33:5:
>     /usr/include/bits/string_fortified.h:106:10: error:
>     ‘__builtin_strncpy’ specified bound 32 equals destination size
>     [-Werror=stringop-truncation]
>       106 |   return __builtin___strncpy_chk (__dest, __src, __len,
>     __bos (__dest));
>           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>     Use pstrcpy() instead of strncpy().  It is guaranteed to NUL-terminate
>     strings.
>
>     Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com
>     <mailto:stefanha@redhat.com>>
>     ---
>      hw/rdma/vmw/pvrdma_dev_ring.c | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c
>     b/hw/rdma/vmw/pvrdma_dev_ring.c
>     index d7bc7f5ccc..74b8fa834c 100644
>     --- a/hw/rdma/vmw/pvrdma_dev_ring.c
>     +++ b/hw/rdma/vmw/pvrdma_dev_ring.c
>     @@ -14,6 +14,7 @@
>       */
>
>      #include "qemu/osdep.h"
>     +#include "qemu/cutils.h"
>      #include "hw/pci/pci.h"
>      #include "cpu.h"
>
>     @@ -30,8 +31,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const
>     char *name, PCIDevice *dev,
>          int i;
>          int rc = 0;
>
>     -    strncpy(ring->name, name, MAX_RING_NAME_SZ);
>     -    ring->name[MAX_RING_NAME_SZ - 1] = 0;
>     +    pstrcpy(ring->name, MAX_RING_NAME_SZ, name);
>          ring->dev = dev;
>          ring->ring_state = ring_state;
>          ring->max_elems = max_elems;
>     -- 
>     2.24.1
>
>
> Thanks,
>
> Reviewed-by: Yuval Shaia <yuval.shaia.ml.gmail.com 
> <http://yuval.shaia.ml.gmail.com>>

I'll add this patch to the pvrdma queue.

Thanks,
Marcel


