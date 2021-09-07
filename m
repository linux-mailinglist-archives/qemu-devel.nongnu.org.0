Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D2C402815
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:54:14 +0200 (CEST)
Received: from localhost ([::1]:49858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZg4-00056v-Ln
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNZf7-0003xf-2a
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:53:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNZf3-00082h-PQ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631015588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDMFQmF9abA7FH3kW22IoOdwgo0kVH6NuYbQllxE+Qk=;
 b=J3Kr/9dYA54AOJsYsuKLAqnVE5724IMOeZHKTYNaDz2zt97qFvG4WbPNrfIQSBj2AaLUXI
 mvINAJ/f8yLMZYTEs1QIB77rhuiZe2MIfEUdOw80jdASZDZyzG1QshlSv2cFkxztlR+8DI
 UCGGlg6Nd9PusBFTflMtcI01/n+DszE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-I_kV_R8_MWaQ4jbpG6U1qg-1; Tue, 07 Sep 2021 07:52:58 -0400
X-MC-Unique: I_kV_R8_MWaQ4jbpG6U1qg-1
Received: by mail-wr1-f70.google.com with SMTP id
 n1-20020a5d4c41000000b00159305d19baso2031734wrt.11
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 04:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=bDMFQmF9abA7FH3kW22IoOdwgo0kVH6NuYbQllxE+Qk=;
 b=GkaT50+6O4SDoNc/F+Nslpl1qpQdHA0WS1muheNjCnpG33ghZ7zv4FBeKulEKtTtPB
 JEdNopOoF2I4wpR2rEBSMJFPSqD14DCpQxnY3BcfThQ+ILC6Ziq3t4DPuG6qoivLei1Q
 OvcVgvQ6kIMhNiUXOHw9+5AGPT9+sTaZaJJV2J+0VGxMze2Hx/Nmav0whArlSBwsbHHI
 /mSG8qHUWxtVEj4M4bd05731sipu/FdwO33QaYg3zhURf6CIC48fi3h8BUkIU0eFNqKV
 WphDwwj6fFruTce1j2lEOcMq8QMo4zH7osf62LqkI97b4gSxX3U5rmehVnjsWebwyRzX
 iXQA==
X-Gm-Message-State: AOAM532e39OEp5fdpxrNMp/1h3UTRLahMka1IYDzY3f9d9cWY+QJytV5
 d0jg5v0N2U0qyiu41eGpEPD8jRxPGCGCxBK+P+owR5KZlxPRNOnQjETSV4mU1jwbtNiWmrepLdL
 ZczX6kmAZ1B/7P5k=
X-Received: by 2002:a1c:7515:: with SMTP id o21mr3545416wmc.150.1631015576863; 
 Tue, 07 Sep 2021 04:52:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHxe4yH6ilYBJA3hJkKY2poll1mO2ckp+SxguAMhtTrGcUJkvFGJmhevvElBczEpLytn66rA==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr3545390wmc.150.1631015576666; 
 Tue, 07 Sep 2021 04:52:56 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id f25sm479560wml.38.2021.09.07.04.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 04:52:56 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:52:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 12/12] i386/sev: update query-sev QAPI format to
 handle SEV-SNP
Message-ID: <YTdSlg5NymDQex5T@work-vm>
References: <20210826222627.3556-1-michael.roth@amd.com>
 <20210826222627.3556-13-michael.roth@amd.com>
 <87tuj4qt71.fsf@dusky.pond.sub.org> <YTJGzrnqO9vzUqNq@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTJGzrnqO9vzUqNq@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Michael Roth <michael.roth@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Sep 01, 2021 at 04:14:10PM +0200, Markus Armbruster wrote:
> > Michael Roth <michael.roth@amd.com> writes:
> > 
> > > Most of the current 'query-sev' command is relevant to both legacy
> > > SEV/SEV-ES guests and SEV-SNP guests, with 2 exceptions:
> > >
> > >   - 'policy' is a 64-bit field for SEV-SNP, not 32-bit, and
> > >     the meaning of the bit positions has changed
> > >   - 'handle' is not relevant to SEV-SNP
> > >
> > > To address this, this patch adds a new 'sev-type' field that can be
> > > used as a discriminator to select between SEV and SEV-SNP-specific
> > > fields/formats without breaking compatibility for existing management
> > > tools (so long as management tools that add support for launching
> > > SEV-SNP guest update their handling of query-sev appropriately).
> > 
> > Technically a compatibility break: query-sev can now return an object
> > that whose member @policy has different meaning, and also lacks @handle.
> > 
> > Matrix:
> > 
> >                             Old mgmt app    New mgmt app
> >     Old QEMU, SEV/SEV-ES       good            good(1)
> >     New QEMU, SEV/SEV-ES       good(2)         good
> >     New QEMU, SEV-SNP           bad(3)         good
> > 
> > Notes:
> > 
> > (1) As long as the management application can cope with absent member
> > @sev-type.
> > 
> > (2) As long as the management application ignores unknown member
> > @sev-type.
> > 
> > (3) Management application may choke on missing member @handle, or
> > worse, misinterpret member @policy.  Can only happen when something
> > other than the management application created the SEV-SNP guest (or the
> > user somehow made the management application create one even though it
> > doesn't know how, say with CLI option passthrough, but that's always
> > fragile, and I wouldn't worry about it here).
> > 
> > I think (1) and (2) are reasonable.  (3) is an issue for management
> > applications that support attaching to existing guests.  Thoughts?
> 
> IIUC you can only reach scenario (3) if you have created a guest
> using '-object sev-snp-guest', which is a new feature introduced
> in patch 2.
> 
> IOW, scenario (3)  old mgmt app + new QEMU + sev-snp guest does
> not exist as a combination. Thus the (bad) field is actually (n/a)
> 
> So I believe this proposed change is acceptable in all scenarios
> with existing deployed usage, as well as all newly introduced
> scenarios.

I wonder if it's worth going firther and renaming 'policy' in the 
SNP world to 'snppolicy' just to reduce the risk of accidentally
specifying the wrong one.

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


