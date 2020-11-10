Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A28A2ACAE3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 03:08:03 +0100 (CET)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcJ4j-0003jh-RP
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 21:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1kcJ2a-0003Fl-Q4
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 21:05:48 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:33294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1kcJ2Y-0004YK-Tg
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 21:05:48 -0500
Received: by mail-oo1-xc44.google.com with SMTP id f8so2220856oou.0
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 18:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IV1+dzDmKfWuDTE2Fa+9lksipHbrFo8+23DtZ9fotBI=;
 b=iDfkNy15r8saf1a5t0N88Bfvf58iIt5m2fOs1s9F6kShtWw2EV2jL+qxE2AbaaCm/C
 ZcymHUGTWBZyVyidwAzlZ85Re0ylTFM4IPkOVBp6yu//DWEYIIOg+ln9Q0Fa7SpabaIV
 sPHApY/fxCYYSM4vlKkfqfb99FTg2diUJvjQiq7Px1Mhoge4YZbeAmp16dQgmdTWJuPH
 mt8lsLhPj05DZ3Yn9WbJ4JyDRta+2I2unDOt62ajGYRVVTYgmFEG0m4qD/QjdVvDOlpN
 yj08KcZkHFFxw4tBCYl0myzpz8QMmX7RwlzdJLbb3gwlKxWUin4lvorxduEMu8q4V/NT
 7JzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IV1+dzDmKfWuDTE2Fa+9lksipHbrFo8+23DtZ9fotBI=;
 b=K/Ct8akH10LSi5y0xHSWy2+X39BA/EIi9z+8ztaoUeYJXsEVMVEg1G0U9OPpCUX/LV
 h4AKwM52EZNz/qFGGmGx8BzWiNOfsGwUsPVA80gp8JKktOCz+dCllcJrRwE+kUxFWY7D
 fixxWicBB5s/6xyLRzRY39BL6zPf/mgpxYd4OVjUCvihtjSmTL0hF9q7qs5BD1MQMLDB
 OmJK2l4p3YwksiVoHmJ4vMBSLYTTxqDRhhPkpZ52lGZC9ZGIDtoRtFgBBYFwOyjhWylT
 mbnu3V/VSYJnW2dVDiHwj4JGcV3coQluN+m5NGxa2s6ERKxpjgUIkKP1XUZDXSpFAbtm
 SBvw==
X-Gm-Message-State: AOAM533jTCV+2gyFzesRqkfCJtVfg4xQVJRORmKLpWRC4GFuJOMdiNEJ
 /cPuWjswzJoPF1geqUS7wW4dHTxPYUbGaqhyv0c=
X-Google-Smtp-Source: ABdhPJy0GDAuQFyFcNSKFbZZmIDifDi7+zdu9IqvieeaYXh6HSnOvmy8wnoQVHUTUcFCIJOEgnc7Tm+3VO3pKDqq9rI=
X-Received: by 2002:a4a:821a:: with SMTP id d26mr11923259oog.90.1604973944901; 
 Mon, 09 Nov 2020 18:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20201109174355.1069147-1-stefanha@redhat.com>
In-Reply-To: <20201109174355.1069147-1-stefanha@redhat.com>
From: Raphael Norwitz <raphael.s.norwitz@gmail.com>
Date: Mon, 9 Nov 2020 21:05:34 -0500
Message-ID: <CAFubqFvs9VVrrS3Js4X2aB4iERTwrG5LeMDW-5GppFsoeD+9kg@mail.gmail.com>
Subject: Re: [PATCH for-5.2] vhost-user: fix VHOST_USER_ADD/REM_MEM_REG
 truncation
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=raphael.s.norwitz@gmail.com; helo=mail-oo1-xc44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 9, 2020 at 12:59 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> QEMU currently truncates the mmap_offset field when sending
> VHOST_USER_ADD_MEM_REG and VHOST_USER_REM_MEM_REG messages. The struct
> layout looks like this:
>
>   typedef struct VhostUserMemoryRegion {
>       uint64_t guest_phys_addr;
>       uint64_t memory_size;
>       uint64_t userspace_addr;
>       uint64_t mmap_offset;
>   } VhostUserMemoryRegion;
>
>   typedef struct VhostUserMemRegMsg {
>       uint32_t padding;
>       /* WARNING: there is a 32-bit hole here! */
>       VhostUserMemoryRegion region;
>   } VhostUserMemRegMsg;
>
> The payload size is calculated as follows when sending the message in
> hw/virtio/vhost-user.c:
>
>   msg->hdr.size = sizeof(msg->payload.mem_reg.padding) +
>       sizeof(VhostUserMemoryRegion);
>
> This calculation produces an incorrect result of only 36 bytes.
> sizeof(VhostUserMemRegMsg) is actually 40 bytes.
>
> The consequence of this is that the final field, mmap_offset, is
> truncated. This breaks x86_64 TCG guests on s390 hosts. Other guest/host
> combinations may get lucky if either of the following holds:
> 1. The guest memory layout does not need mmap_offset != 0.
> 2. The host is little-endian and mmap_offset <= 0xffffffff so the
>    truncation has no effect.
>
> Fix this by extending the existing 32-bit padding field to 64-bit. Now
> the padding reflects the actual compiler padding. This can be verified
> using pahole(1).
>
> Also document the layout properly in the vhost-user specification.  The
> vhost-user spec did not document the exact layout. It would be
> impossible to implement the spec without looking at the QEMU source
> code.
>
> Existing vhost-user frontends and device backends continue to work after
> this fix has been applied. The only change in the wire protocol is that
> QEMU now sets hdr.size to 40 instead of 36. If a vhost-user
> implementation has a hardcoded size check for 36 bytes, then it will
> fail with new QEMUs. Both QEMU and DPDK/SPDK don't check the exact
> payload size, so they continue to work.
>
> Fixes: f1aeb14b0809e313c74244d838645ed25e85ea63 ("Transmit vhost-user memory regions individually")
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/interop/vhost-user.rst           | 21 +++++++++++++++++++--
>  contrib/libvhost-user/libvhost-user.h |  2 +-
>  hw/virtio/vhost-user.c                |  5 ++---
>  3 files changed, 22 insertions(+), 6 deletions(-)
>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

