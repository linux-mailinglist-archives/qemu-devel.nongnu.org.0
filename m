Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B747D83C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:21:46 +0100 (CET)
Received: from localhost ([::1]:34534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n087M-0008Eo-Ok
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:21:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n085r-0007Rb-8J
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:20:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n085k-0005R9-Vu
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 15:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640204403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYwjiqgSnlABI0tNjrOz8jpkmwjIDQDwGoDuTC0DZpQ=;
 b=iQkzr5D+v+P8rauuAHtRy6wNhdb6TP82O50B6lqO+J8DXhCvpR9C/iw871Vs0Js8BkekWB
 7Q0mwUbXxhWqJU22SaN7GSXb2uZecuHsFsf4SSnDwqrc0J6Jec4QJoChhwzAhLulQT+t/2
 MT1+2GG4mOvNEmckHL+JCqLz9c5SRBE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-381dM7-WOumVJrtQCqw2xA-1; Wed, 22 Dec 2021 15:20:02 -0500
X-MC-Unique: 381dM7-WOumVJrtQCqw2xA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v190-20020a1cacc7000000b003456d598510so3520629wme.6
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 12:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KYwjiqgSnlABI0tNjrOz8jpkmwjIDQDwGoDuTC0DZpQ=;
 b=gjVRVGagCSM7JInBnECAtyePHtWAevJikrwgZJX+Tm5JOqwhHqfS2sVnv9MSLeIkft
 6TIKKyNa/ACeM5UPw2JDPvQHjGpY3elraocliiBeVSY3TYNFKCNBSuCR62CwBK8e0uc1
 eHn9aWyvTpdYNbVyyPb/dL2zw4zBvqezo87GYEkIaPWaTZt9Qkv6gi/H2uRWu30stWNC
 sboO7LGC7j7jnNql0naRDqpa2tp6lYlg6mIR/nyc0wEuYRRZo1tR+aMZL5TQ/qQuQlN6
 KK9CyIhE8gjyexCJbNMg9AIb+vpb466k1zC9i7hzypDijajQrEQDXSckxmgEiCXj3vuv
 60UA==
X-Gm-Message-State: AOAM533uvXzZj5c+oHU0dcVgmM3jXyoSukNn4xNDK6W9+C07MVhr78ru
 Gk7FHo+sJxW77jlal2L24cMJ2y+hINMT0hKnayuvgismLj0Q21OKE56Jm7afM6Uv2ko1tnFJmRm
 1FV+pvr9d29j9gFo=
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr1953563wmi.90.1640204400929;
 Wed, 22 Dec 2021 12:20:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWjUMf6OdDd+WbkONN6sG3rkB8eD71F3bNQ56CG1s+5WRr2CNiA+CwemVtcs7SWy18lj7UIw==
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr1953548wmi.90.1640204400747;
 Wed, 22 Dec 2021 12:20:00 -0800 (PST)
Received: from redhat.com ([2.55.1.37])
 by smtp.gmail.com with ESMTPSA id t8sm3583806wmq.32.2021.12.22.12.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 12:20:00 -0800 (PST)
Date: Wed, 22 Dec 2021 15:19:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] acpi: validate hotplug selector on access
Message-ID: <20211222151922-mutt-send-email-mst@kernel.org>
References: <20211221144852.589983-1-mst@redhat.com>
 <ad22de10-a52c-ff34-0790-3be8e7d62630@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ad22de10-a52c-ff34-0790-3be8e7d62630@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 08:19:41PM +0100, Philippe Mathieu-Daudé wrote:
> +Mauro & Alex
> 
> On 12/21/21 15:48, Michael S. Tsirkin wrote:
> > When bus is looked up on a pci write, we didn't
> > validate that the lookup succeeded.
> > Fuzzers thus can trigger QEMU crash by dereferencing the NULL
> > bus pointer.
> > 
> > Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
> > Cc: "Igor Mammedov" <imammedo@redhat.com>
> > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> It seems this problem is important enough to get a CVE assigned.

Guest root can crash guest.
I don't see why we would assign a CVE.

> Mauro, please update us when you get the CVE number.
> Michael, please amend the CVE number before committing the fix.
> 
> FWIW Paolo asked every fuzzed bug reproducer to be committed
> as qtest, see tests/qtest/fuzz*c. Alex has a way to generate
> reproducer in plain C.
> 
> Regards,
> 
> Phil.


