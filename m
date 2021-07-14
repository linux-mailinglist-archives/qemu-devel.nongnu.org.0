Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8713C825A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:03:43 +0200 (CEST)
Received: from localhost ([::1]:44586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bjy-0006d6-Ex
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3bZ8-00040x-UA
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:52:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3bZ6-0006CX-BG
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626256347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=icg0gvPwRGJz9uuUXCiq7UXEwnGrtfXn8+lGykTSI4U=;
 b=ej58bkUl2qBiXz+iKOlN9KHQWrLoQBw6MlfFyhHGBtuKr7e57WVKk3l4BkoBv7CEYjlPKH
 mD1EMoii3rrfS+TCebc+rn6vLWLq6IFvY57JE+wIufNMJ0EYXw0uX9LHCh+yhQh7+A3BWX
 EP6Y5tSx9shad4Km/O9vj79MNakqHFI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-_stXVqrCNe-icP_MpYtyCA-1; Wed, 14 Jul 2021 05:52:26 -0400
X-MC-Unique: _stXVqrCNe-icP_MpYtyCA-1
Received: by mail-wr1-f72.google.com with SMTP id
 m9-20020a0560000089b02901362e1cd6a3so1202968wrx.13
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=icg0gvPwRGJz9uuUXCiq7UXEwnGrtfXn8+lGykTSI4U=;
 b=HTysobX+6ho+19EruZ+jYlDoc42nHTYtv/YVLlXFZHbA4LGq8LI3+R8wt+uAvh8urR
 tSIzzcgD4GcX4nsS5Xap69TPPc3/j5g3K9CN7YediHZZ66ml6Oxh2dNeXnFu3/hKXJJQ
 GrgIY/KlPF4ZoMVp1LLU4f1BD+MVmAwP7NPM9FUcgMJXMonJSbGorvmVcpdrMOMMHafc
 i5G20eczl8THVtrqPW4fgjn1Ae5sz1HR/xUeRMISekHNplonrNqgaSY3c4ET0i7gARXp
 bL7/eRXdrbK5MvN0/hMs5jSuOjpiwqzDyQXkdN4HUD5X/f1mL8UdK0n3i4vna1Tg78bt
 Fsag==
X-Gm-Message-State: AOAM532/N9pS7xgp15FlVRzVelPe5rbTdKIOuawBtjPZ88iLJWXrZ6Sp
 Wx+o/4GC2FJlZFQd6LBmK0G3NsIMFJG1PyGc3+tV2guu/ViO9UN8BjYs0aYbTh+S+dLsAXfU54s
 JMgA/sywlhcmkG8g=
X-Received: by 2002:a5d:6804:: with SMTP id w4mr11543885wru.417.1626256344946; 
 Wed, 14 Jul 2021 02:52:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGq1APKVeGWyFBIONIwgXSyQW6dds1jdrV4WQGl+a002MKBsxUMjBsprzsDXyASkBfy5FbSA==
X-Received: by 2002:a5d:6804:: with SMTP id w4mr11543858wru.417.1626256344733; 
 Wed, 14 Jul 2021 02:52:24 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id a64sm1529978wme.8.2021.07.14.02.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:52:24 -0700 (PDT)
Date: Wed, 14 Jul 2021 10:52:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [RFC PATCH 0/6] Add AMD Secure Nested Paging (SEV-SNP) support
Message-ID: <YO6z1dJxuT5cNz6T@work-vm>
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <e68a9760-121f-72ee-f8ae-193b92bde403@linux.ibm.com>
 <80b92ee9-97d8-76f2-8859-06e61fe10f71@amd.com>
MIME-Version: 1.0
In-Reply-To: <80b92ee9-97d8-76f2-8859-06e61fe10f71@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Michael Roth <michael.roth@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, Dov Murik <dovmurik@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Brijesh Singh (brijesh.singh@amd.com) wrote:
> 
> 
> On 7/13/21 3:05 AM, Dov Murik wrote:>
> > Particularly confusing is the `policy` attribute which is only relevant
> > for SEV / SEV-ES, while there's a new `snp.policy` attribute for SNP...
> > Maybe the irrelevant attributes should not be added to the tree when not
> > in SNP.
> 
> The policy fields are also applicable to the SNP. The main difference are:
> 
> - in SEV/SEV-ES the policy is 32-bit compare to 64-bit value in SEV-SNP.
> However, for SEV-SNP spec uses lower 32-bit value and higher bits are marked
> reserved.
> 
> - the bit field meaning are different

Ah, I see that from the SNP ABI spec (section 4.3).

That's a bit subtle; in that at the moment we select SEV or SEV-ES based
on the existing guest policy flags; I think you're saying that SEV-SNP
is enabled by the user explicitly.

> Based on this, we can introduce a new filed 'snp-policy'.

Yes, people are bound to confuse them if they're not clearly separated;
although I guess whatever comes after SNP will probably share that
longer field?

Dave

> -Brijesh
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


