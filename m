Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879785EAC5B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:22:19 +0200 (CEST)
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqs4-0004kn-AN
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ocqeN-0001wF-9r
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:08:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ocqeL-0003LM-VJ
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664208485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VLJJEf/GWr2X8AahAn5+HBwYYLGJ1q4HVt0ZBbkPu+E=;
 b=I5E5yISWh2qwIm/RMbPGysMBJb0JhUxQY1S7DEd1sYJqYYM/We1LWbsqzwgYqJ4cmMlVtk
 zvdLgb8J9qTld4jpILHA2teZoIfcD6SUhXhlSpzzdbWwyn+CBUInSEUtSENlgbWIXFeCR0
 YT3/sGBooosHTIAUIeAKMWm+pFhYvyE=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-xHIpKHzfNvSsKtWW7vgXTQ-1; Mon, 26 Sep 2022 12:07:56 -0400
X-MC-Unique: xHIpKHzfNvSsKtWW7vgXTQ-1
Received: by mail-vs1-f72.google.com with SMTP id
 k12-20020a67ef4c000000b00398774a1c52so1271219vsr.18
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 09:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=VLJJEf/GWr2X8AahAn5+HBwYYLGJ1q4HVt0ZBbkPu+E=;
 b=qDdncM/1YDfnRCz5pbVKkM/7JyYf4ILP9W39Bn2NrhmqcbqoHC3PKUM4kJ38zYu7G6
 g4Jt45O+C+bww6S8eIarB03qLw0LO84CDx2pZ1ZgHCkUxaCDiKgt3KD0xZK0gP6WmsZn
 RIPmzXAU5sqwYXKXM2NPnoKcBDyOm3CXLwuKzV5jGBxJP1S5x4UaZOM5Txd2BZ9I2lgq
 RCVzkV8YZll9L5kb8jVLC8jhDNh+vFw8Ti1kdnSIvkUmC/iG5H0BAukdWALuA3AGehX/
 PyD0ust/NSP8u+i+3aTp4A6SjWiswel/vuC7PjZ8+LwB0rSPRyGCPBnvQWjulJT9myB4
 WZ3Q==
X-Gm-Message-State: ACrzQf0gf0CMVs+trKgM2jqpRtEnxLcWFl7H0CkZ1PdapHsXv9zX5tVG
 +RQxj2H0zTLAafxDmA5k/qa8fflwNeQv+0CMJSQ94rOOuju8X14AJz7sn0zqDGh/zEMu3A0NgY8
 VNrwo7vcylb8sOT2z0P8cjJgsBlCMTRI=
X-Received: by 2002:a1f:2c93:0:b0:3a3:4904:aa91 with SMTP id
 s141-20020a1f2c93000000b003a34904aa91mr8953251vks.33.1664208475563; 
 Mon, 26 Sep 2022 09:07:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5z1A5prTKD04iEe/OVf87SHPwIAwDp4Vnjs4CgmkIklwFk2wdrmH1Sf2p51C005g7WoYYPEwebaMbYhkgEXCE=
X-Received: by 2002:a1f:2c93:0:b0:3a3:4904:aa91 with SMTP id
 s141-20020a1f2c93000000b003a34904aa91mr8953221vks.33.1664208475249; Mon, 26
 Sep 2022 09:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220922152847.3670513-1-Jason@zx2c4.com>
 <CAHmME9oOSwx5hJBap-rbgxJrXZ7vfpPnzCymKfDt69RsNrBJyw@mail.gmail.com>
In-Reply-To: <CAHmME9oOSwx5hJBap-rbgxJrXZ7vfpPnzCymKfDt69RsNrBJyw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 26 Sep 2022 18:07:43 +0200
Message-ID: <CABgObfbBMVnn29uwQETFUSCKQybzzHKRsL6EEq=-sK663dwxew@mail.gmail.com>
Subject: Re: [PATCH] x86: re-initialize RNG seed when selecting kernel
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 26, 2022 at 3:45 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Thu, Sep 22, 2022 at 5:28 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > We don't want it to be possible to re-read the RNG seed after ingesting
> > it, because this ruins forward secrecy. Currently, however, the setup
> > data section can just be re-read. Since the kernel is always read after
> > the setup data, use the selection of the kernel as a trigger to
> > re-initialize the RNG seed, just like we do on reboot, to preserve
> > forward secrecy.
> >
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> > Paolo- this applies on top of the 4 you merged this morning. -Jason
>
> Just bumping this, in hopes that this can go out with the same PULL
> for the other 4 you merged last week.

Thanks, queued but I have a question.

If I understand correctly, this protects against rereading the seed while the
OS is running. If so, does that mean that the device tree-based seed
initialization does not have forward secrecy at all?

Paolo


