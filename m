Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B393EF613
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 01:22:55 +0200 (CEST)
Received: from localhost ([::1]:46670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG8Q1-0004aU-Tq
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 19:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mG8O6-0003sO-If
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 19:20:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mG8O1-0000Hp-Vp
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 19:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629242448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CEwhor+Z+8oa4WM8Oi5cJsChDqCNGSHq7j3GEIZe8Nw=;
 b=e5bpGzSmeNPu2I0XTwJrs3Of5N6n7i+vELppkPFacdtSHKBKeP7yB42KKmLb4Wi/8k2NA0
 u1IL2gSCeBfS3ZaFYBp3maGCAERe8KCq/u/GSNCkp50qDLsUm6yx6FGZCvr8O/D5fCF8zf
 qqSHTcmVfVpj2lZvrSutTzNScS7h/oE=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-sABHgOkDNkeFFytc7E3fxQ-1; Tue, 17 Aug 2021 19:20:45 -0400
X-MC-Unique: sABHgOkDNkeFFytc7E3fxQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 v21-20020a63d5550000b029023c8042ce63so165814pgi.8
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 16:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CEwhor+Z+8oa4WM8Oi5cJsChDqCNGSHq7j3GEIZe8Nw=;
 b=JdLR/XMoMQW00pTgsazXiYLpHDyGbv5eL/VMcdhBJ4FwxOKc1fLuPFylpn6OHUeHxu
 RMEXFZFdXaR2P0GvTu222Zc3H6NTLKEzjiFjp4nhNcfYw9zWy9YT8e5ZC8s25tEIpG2s
 EVzSK4XyG3qpRuElDd7Zbz4V7KxpdhqwOpEK57+OUkOdI6DplCSYL3TH/G3bjWnVg2oc
 VihQGRZNC5X5BlouwAYpodWUQtT9gmOPJF16F5WX16esbbjaMRORQjYIYV9H0A+xO7DK
 01tJzrfXVnLIaMkWD3bP6m9rF/ZnCXTCCW+q93Uk9Y0jE5YNrcFLiEFAnVkYpVzpBteM
 qDng==
X-Gm-Message-State: AOAM53032j/eJwvwDhoMx30M7jokHn2+6xhIKmKVT6gKbUdmiksksBXE
 7Lh3fJtnMaLbpz/O+0EPNHK6rrgObJqF2W0DL+sipKs/VL7nzaAo/+S/oTlQwFZ/ZfE2kcxy6Zv
 97kSz6P6pBiLwWYxJceBMGzdIIGNou6M=
X-Received: by 2002:a63:5fcc:: with SMTP id t195mr5711414pgb.146.1629242444189; 
 Tue, 17 Aug 2021 16:20:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTwNjlO02zRXcWFcI9eLHyW5ECSSGVrU7Ymey0gNtRDmaWq9MUtZjMO0REfPSw5PQYLTxrmLK3CwPE9pyeFMI=
X-Received: by 2002:a63:5fcc:: with SMTP id t195mr5711389pgb.146.1629242443919; 
 Tue, 17 Aug 2021 16:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
In-Reply-To: <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 18 Aug 2021 01:20:31 +0200
Message-ID: <CABgObfYz8=+u1nsiSiLbOo7t7uSyQzro+crRsK4fANS1_TZR9Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <Ashish.Kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Habkost, Eduardo" <ehabkost@redhat.com>, kvm <kvm@vger.kernel.org>,
 "S. Tsirkin, Michael" <mst@redhat.com>,
 Steve Rutherford <srutherford@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
 David Gilbert <dgilbert@redhat.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 10:51 PM Tobin Feldman-Fitzthum
<tobin@linux.ibm.com> wrote:
> This is essentially what we do in our prototype, although we have an
> even simpler approach. We have a 1:1 mapping that maps an address to
> itself with the cbit set. During Migration QEMU asks the migration
> handler to import/export encrypted pages and provides the GPA for said
> page. Since the migration handler only exports/imports encrypted pages,
> we can have the cbit set for every page in our mapping. We can still use
> OVMF functions with these mappings because they are on encrypted pages.
> The MH does need to use a few shared pages (to communicate with QEMU,
> for instance), so we have another mapping without the cbit that is at a
> large offset.
>
> I think this is basically equivalent to what you suggest. As you point
> out above, this approach does require that any page that will be
> exported/imported by the MH is mapped in the guest. Is this a bad
> assumption?

It should work well enough in the common case; and with SNP it looks
like it is a necessary assumption anyway. *shrug*

It would be a bit ugly because QEMU has to constantly convert
ram_addr_t's to guest physical addresses and back. But that's not a
performance problem.

The only important bit is that the encryption status bitmap be indexed
by ram_addr_t. This lets QEMU detect the problem of a ram_addr_t that
is marked encrypted but is not currently mapped, and abort migration.

> The Migration Handler in OVMF is not a contiguous region of memory. The
> MH uses OVMF helper functions that are allocated in various regions of
> runtime memory. I guess I can see how separating the memory of the MH
> and the guest OS could be positive. On the other hand, since the MH is
> in OVMF, it is fundamentally designed to coexist with the guest OS.

IIRC runtime services are not SMP-safe, so the migration helper cannot
coexist with the guest OS without extra care. I checked quickly and
CryptoPkg/Library/BaseCryptLib/SysCall/RuntimeMemAllocation.c does not
use any lock, so it would be bad if both OS-invoked runtime services
and the MH invoked the CryptoPkg malloc at the same time.

Paolo


