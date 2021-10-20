Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D11434722
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:41:43 +0200 (CEST)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md7AM-0003Vu-AN
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md78Y-0001tD-Ad
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:39:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md78W-0004rt-HH
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634719187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lpm+4pWlKCfEUWvvss3eKoSvoULIRcyP2c6+gZkVRJA=;
 b=ADt+Lx2gE8Yzfs9l+64TAlkJpzEP/DVY4KMmishy2jH8z1L23pyUgoa8+tO7WxhI4p3oel
 3rRrM5nMKhMyPq6zQsPAtxbvQ+V50i5RHi1m1DEQGY/QTy6J4dcI0vpAdSAEH7qBBa+fP0
 fzF996EUQRyH+CJX5cYHgmNGCY0SNhs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-OOp3YuacOzqtJcHrmPkbFQ-1; Wed, 20 Oct 2021 04:39:46 -0400
X-MC-Unique: OOp3YuacOzqtJcHrmPkbFQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 l10-20020a056402230a00b003db6977b694so20259096eda.23
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 01:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lpm+4pWlKCfEUWvvss3eKoSvoULIRcyP2c6+gZkVRJA=;
 b=wxSsuIXNlreOMxv9i0h3NCzjxVt8sy2IgWOS6xQml7rlgdwRxmYWPdaZMzz9n7qPzA
 VMzEH6MnFsPdQ9BsFngZGmS9QCndaLqX8rga9Xx3lKhLKdlHA1Ag9+yNbZPi3wP3QEO7
 X3Myxb6zLqn6zvq0t9R5QJlryEGJbkOW1s/k1JQVhyqu2jFGDMYKk+UT+OfOXnLj5aB8
 7fDdiynILNVuM+d5DHfnrkGQ65BkOV+DXIZYi2UPrp24NZeGSqfCOrihUF2RAaZWTF0T
 8kTYFrOPdpYCLLdll1elQ7sz39V1BpvbGkyfXyXI5RdRjzhL6+hERFIzSAKtDSMNOJ/h
 ar3Q==
X-Gm-Message-State: AOAM533r8G2qd20/F1IK8lSWYS6HFnYg5yZLWwiBssXv2fpV7QY21ES/
 9qMtO9Hk9jAn3pMvC4GkERXsfd4Kj3zLpl8XFlDIQz504tmhdYtgrv12qA8EBtHzFj3FLRwrvDa
 dT9qow29clqX84QY=
X-Received: by 2002:a05:6402:4256:: with SMTP id
 g22mr60133171edb.399.1634719185413; 
 Wed, 20 Oct 2021 01:39:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9DurjBMeajGDIjgDcvxz/A+NGe3iGswNd/IiMm7YNHN+sSybZsRrLEtGK73L66+qlcaN2RQ==
X-Received: by 2002:a05:6402:4256:: with SMTP id
 g22mr60133158edb.399.1634719185262; 
 Wed, 20 Oct 2021 01:39:45 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id l23sm683179ejn.15.2021.10.20.01.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 01:39:44 -0700 (PDT)
Date: Wed, 20 Oct 2021 04:39:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 0/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Message-ID: <20211020043845-mutt-send-email-mst@kernel.org>
References: <20211007135750.1277213-1-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20211007135750.1277213-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 07:27:47PM +0530, Ani Sinha wrote:
> changelist:
> v3: removed "nodefaults" from the command line and rebased the patchset.
> v2: incorporated some of the feedbacks from Igor.
> v1 : initial RFC patch.

This seems to break on s390 hosts for people. Likely an
endian-ness bug somewhere. Dropped for now - care tracking that down
and fixing so I can pick up the test again?

Thanks!

> This patchset adds a unit test to exercize acpi hotplug support for multifunction
> bridges on q35 machines. This support was added with the commit:
> 
> d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
> 
> Ani Sinha (3):
>   tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT
>     table blob
>   tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges
>     for q35
>   tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge
>     test
> 
>  tests/data/acpi/q35/DSDT.multi-bridge | Bin 0 -> 8583 bytes
>  tests/qtest/bios-tables-test.c        |  18 ++++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
> 
> -- 
> 2.25.1


