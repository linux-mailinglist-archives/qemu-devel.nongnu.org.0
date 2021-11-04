Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67A7445986
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 19:20:24 +0100 (CET)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mihLb-0005Pu-AO
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 14:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mihJd-0004ZX-JY
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 14:18:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mihJZ-0007wk-AN
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 14:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636049895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mC+8pj4jHIlXT0cr8KWIxdly7y+g3jU6Cjj4tNfuG/U=;
 b=goxBy5tmzpm0+EZZnMCUq5OmR5uZFwPqo4+RzrPyMcE462umUXrdb6M38g3v1VbWrSwOX1
 m4y9z+xURhdKmaNEviM0Ei+bW2UtVwgRGfvzO730MgF6v3o20jv2TqP/7ICBoK5CR5rhnA
 wfnU5FzEmrnMurHLZJBPoG2hBkmAFko=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-9q_qMH-dPW2hRKMSHEXKDw-1; Thu, 04 Nov 2021 14:18:14 -0400
X-MC-Unique: 9q_qMH-dPW2hRKMSHEXKDw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso4706297wml.9
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 11:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mC+8pj4jHIlXT0cr8KWIxdly7y+g3jU6Cjj4tNfuG/U=;
 b=uzhEnlFrpRAOLhaB8Ye29naGXi/0IFfVnQA2jmsrw7IU+ffKqgXF6xtIwv14CWRU7+
 cn6nnIWPqaHl8mu3Nr32Vo1YGGJqR//O6kUnW0EpiBPNAFOGQZW5MaNkpkOBm+CKZfKV
 2gYL5mK5TQIQTF8wUPyEdd8xiujPLQwITOR1p3lQnLXeErZSyYnMCtw3RNYidobcnmTe
 Ixzt6sUrMG1q1FS9XIgBPHDwww3VMqQqathAyQQcgbB1cbrYr/Gc6WNkjW5egH29AvQ7
 d8tH/HTVsILxLZ3/k/9VmcEMZIVS6UKJSItZlP90bmGAsvOOP7q5vr2Um+dUlnPuheU9
 h3Og==
X-Gm-Message-State: AOAM530sDA9HupBwCM2rL4acn/5ZbwkIHlBZqrqxequYGcJngr/S2+J/
 ht7OeBNW/wbSgxBMigtRkyUM3U4/KOvGx6f3PT/ID3us/wdYxPPjuaa/1Q2YLPdJ7WhTs6XQ/jl
 yE+p2KscDVdDOk7Q=
X-Received: by 2002:a5d:508d:: with SMTP id a13mr23098219wrt.41.1636049893462; 
 Thu, 04 Nov 2021 11:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb0jD5dLGJe0YqRYZ1DJVVuS8eyJ7l+aVC5LTXCrX1ODq5RaaNEo12EHGhzFcg/uJC4DN0xw==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr23098178wrt.41.1636049893233; 
 Thu, 04 Nov 2021 11:18:13 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id q4sm5765337wrs.56.2021.11.04.11.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 11:18:12 -0700 (PDT)
Date: Thu, 4 Nov 2021 18:18:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/3] sev/i386: Allow launching with -kernel if no OVMF
 hashes table found
Message-ID: <YYQj4hIiYckbRrZ/@work-vm>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-2-dovmurik@linux.ibm.com>
 <YYKynfyEpwn3PRHW@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YYKynfyEpwn3PRHW@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Mon, Nov 01, 2021 at 10:21:34AM +0000, Dov Murik wrote:
> > Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
> > for measured linux boot", 2021-09-30) introduced measured direct boot
> > with -kernel, using an OVMF-designated hashes table which QEMU fills.
> > 
> > However, if OVMF doesn't designate such an area, QEMU would completely
> > abort the VM launch.  This breaks launching with -kernel using older
> > OVMF images which don't publish the SEV_HASH_TABLE_RV_GUID.
> > 
> > Instead, just warn the user that -kernel was supplied by OVMF doesn't
> > specify the GUID for the hashes table.  The following warning will be
> > displayed during VM launch:
> > 
> >     qemu-system-x86_64: warning: SEV: kernel specified but OVMF has no hash table guid
> > 
> > Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> > Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> > ---
> >  target/i386/sev.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/target/i386/sev.c b/target/i386/sev.c
> > index eede07f11d..682b8ccf6c 100644
> > --- a/target/i386/sev.c
> > +++ b/target/i386/sev.c
> > @@ -1204,7 +1204,7 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
> >      int aligned_len;
> >  
> >      if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
> > -        error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
> > +        warn_report("SEV: kernel specified but OVMF has no hash table guid");
> >          return false;
> 
> I'm pretty wary of doing this kind of thing.
> 
> If someone is using QEMU and they required to have the hashes populated
> for their use case, they now don't get a fatal error if something goes
> wrong with the process. This is bad as it hides a serious mistake.
> 
> If someone is using QEMU and they don't require to have the hashes
> populated and they knowingly use a firmware that doesn't support
> this, they'll now get a irrelevant warning every time they boot
> QEMU. This is bad because IME users will file bugs complaining
> about this bogus warning.
> 
> 
> If we genuinely need to support both uses cases, then we should have
> an explicit command line flag to request the desired behaviour.
> 
> This could be a -machine option to indicate that the hashes must
> be populated.
> 
>  - unset: try to populate hashes, *silently* ignore missing table
>           in ovmf
>  - set == on: try to populate hashes, report error on missing
>              table in ovmf
>   -set == off: never try to populate hashes, nor look for the
>                table in ovmf

Or as a property on the sev-guest object.

Dave

> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


