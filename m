Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E64315239
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:59:23 +0100 (CET)
Received: from localhost ([::1]:49126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UU5-0003TB-QG
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9UQb-00010Z-N6
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9UQY-00070U-0K
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612882540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WSsdPlcWLs4B7/MYVeVITkDmFpb6BsySsmx2wFDfjIg=;
 b=GF/5NKgM0UjDFYNIWMgkcEApeW9x5x54f1RjtaPMuzoSz+FevPgl8wNPAIjtewMm/V3lPW
 kRaX9mC7bWWOeJaAxFIfOjhJ6v38C5qfNluMdTP6x8FXDpDiZqRuDR0VndJbvGKDX5HPW3
 fgqfRQzqaYqCBVypic8M/e2Hr3wB5kY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-NaEtBEYZPfyuXqXrLS1rJA-1; Tue, 09 Feb 2021 09:55:39 -0500
X-MC-Unique: NaEtBEYZPfyuXqXrLS1rJA-1
Received: by mail-wr1-f72.google.com with SMTP id e11so4547633wro.19
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 06:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WSsdPlcWLs4B7/MYVeVITkDmFpb6BsySsmx2wFDfjIg=;
 b=bqvzUZuf2FsyG74GIx2ac5SMN7lzrckjmEyYwaC9Ccc/JQoPJ8qKQ9M9lmY8JswlVC
 zCJ4DgO91C1c5k8LKCRutdg5nX5xVN1dI0tg+BLrVLlqKes2Jho42p8Q3H/uN06JBv6z
 Wzb1JRA834AcpWHoi7wKTMcNAg6zdmM2hsOIl2OSNl06EOQ5uqU3kBktf0QwjFo+hucc
 GmFPfbdDPfk5WJnckgTISNEgLwuTCrozg3F2k8TFxLVvEHmeCEFzJKvd0r5MieNH1eZ5
 u1ZnEKYxqEkC9XU9OMvMnasIZQ8VFNa8xLgn2AO26DzJ5I8u4RNbBKLhhvf6MEQiD6GQ
 Q7JA==
X-Gm-Message-State: AOAM530C9ojE5RZXkCAvEk6VMGA3ipbYSeJSxrQoVzh4eW8u8rIqx61I
 hN2+y3i4iRTrPamE0k/gjPo+FZUgqPY/rqlb0sVnI9VLOe52Yrc6CGgClLc6UCB/rA660yiPNPl
 ArXtYNbFZr9IFZ98=
X-Received: by 2002:adf:eb82:: with SMTP id t2mr13792139wrn.231.1612882538031; 
 Tue, 09 Feb 2021 06:55:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGiyD0i/pTC5CRicHdOTkBxICTMpZX9F+ZX+9eu4fC4Ozi+Yen5iR0i1cuW6uuuaqb68GylQ==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr13792098wrn.231.1612882537862; 
 Tue, 09 Feb 2021 06:55:37 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id x15sm19731236wro.66.2021.02.09.06.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 06:55:37 -0800 (PST)
Date: Tue, 9 Feb 2021 09:55:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Adrian Catangiu <acatan@amazon.com>
Subject: Re: [PATCH v5 2/2] drivers/virt: vmgenid: add vm generation id driver
Message-ID: <20210209095350-mutt-send-email-mst@kernel.org>
References: <1612200294-17561-1-git-send-email-acatan@amazon.com>
 <1612200294-17561-3-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
In-Reply-To: <1612200294-17561-3-git-send-email-acatan@amazon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason@zx2c4.com, areber@redhat.com, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, ghammer@redhat.com, vijaysun@ca.ibm.com,
 0x7f454c46@gmail.com, qemu-devel@nongnu.org, mhocko@kernel.org,
 dgunigun@redhat.com, avagin@gmail.com, pavel@ucw.cz, ptikhomirov@virtuozzo.com,
 linux-s390@vger.kernel.org, corbet@lwn.net, mpe@ellerman.id.au,
 rafael@kernel.org, ebiggers@kernel.org, borntraeger@de.ibm.com,
 sblbir@amazon.com, bonzini@gnu.org, arnd@arndb.de, jannh@google.com,
 raduweis@amazon.com, asmehra@redhat.com, graf@amazon.com, rppt@kernel.org,
 luto@kernel.org, gil@azul.com, oridgar@gmail.com, colmmacc@amazon.com,
 tytso@mit.edu, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, ebiederm@xmission.com, ovzxemul@gmail.com,
 w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +The ``vmgenid`` driver uses ACPI events to be notified by hardware
> +changes to the 128-bit Vm Gen Id UUID.

That's ok, problem is ACPI event processing is asynchronous.
What we need is thus to flush out ACPI events whenever userspace
does a read, otherwise the value it gets will be stale.

-- 
MST


