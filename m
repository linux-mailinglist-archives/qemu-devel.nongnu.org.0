Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2269368ED5D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 11:54:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPi4I-0008Fy-N3; Wed, 08 Feb 2023 05:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pPi4G-0008FJ-3R
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 05:52:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pPi4E-0000w4-CV
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 05:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675853564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkzZ0TT/F5sByPrMOK1dB7pvu36Y39BOzZ9cFAiGN2M=;
 b=HzOndxeBDp+3tN0Sf/52iG0rPredBrxgeuNLzYaekLff4CQvPdQ2DCRL0xvIjYOHyjzbmM
 Kq585KGLPiBxgvn0giD9rUDEMtxfLRDL6wg78n5efp1Nn7nYSkC+6sDU4d+Ni3Rp97VQim
 C41bGkPs1SXYZKfY0FKb4OGEXBnDUow=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-7XNoxqNxP_u3e3MZRhvdwQ-1; Wed, 08 Feb 2023 05:52:42 -0500
X-MC-Unique: 7XNoxqNxP_u3e3MZRhvdwQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 ud13-20020a170907c60d00b0088d773d11d6so12962074ejc.17
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 02:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkzZ0TT/F5sByPrMOK1dB7pvu36Y39BOzZ9cFAiGN2M=;
 b=U3eUjzLY3/koRfa1bRr2K4swoMfmr8Ijn9j4qeOHmwgjz+GXXkpQchOkUljuM+jMvt
 DZR05BR9iX9lnARGiQphSWn7AWLHeT4+Ttn4cpqugu8ElLypait/wglr6CH1MfJzy+w0
 Fpf5aMVb48+rFOPciKuug1/T1/4bLafdj1H/+YhIdAzpPSeoG1EdZg3fDRW/1pJPRoUY
 OLhUkn5+NN0pbF9WnrhuSs3fVRnot5hsvBEUAasxALXZm8az6x4cgGKV/0TTMNS0aRaW
 qAdqhy5HTu5vTSg+DcgaJ5+bHGYvtvBScnf4QJLhbTrl/YL9D/8y7bSywotRIy4siHSo
 6Ouw==
X-Gm-Message-State: AO0yUKVUsJKPRowTs1YVnlwDAWE9Q/Egp5Kvj0Z+gp+29LMy++7yJKUn
 GBV3k23Un9MXyxKTHRJnx0eJg20ill/eU4lyYxOKnqwGqdzPuj4EE3lmbhduhumFhV5osUvAc1c
 kzTbjJNhz+cy9JUg=
X-Received: by 2002:a17:906:db0b:b0:8ae:80d5:7385 with SMTP id
 xj11-20020a170906db0b00b008ae80d57385mr1523600ejb.10.1675853560406; 
 Wed, 08 Feb 2023 02:52:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+6Fnf44iw8yXhbI2uXX9co83pJOF0TH4B8naojnyKB4/Rxo85W6qOARAMdiLb5R1onFi5HAg==
X-Received: by 2002:a17:906:db0b:b0:8ae:80d5:7385 with SMTP id
 xj11-20020a170906db0b00b008ae80d57385mr1523583ejb.10.1675853560162; 
 Wed, 08 Feb 2023 02:52:40 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 fp3-20020a1709069e0300b008aea5e0938esm414680ejc.183.2023.02.08.02.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 02:52:39 -0800 (PST)
Date: Wed, 8 Feb 2023 11:52:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 11/12] tests/qtest: bios-tables-test: Skip if missing
 configs
Message-ID: <20230208115238.3083843f@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230207094103-mutt-send-email-mst@kernel.org>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-12-farosas@suse.de>
 <218e02c0-efed-1461-e9d5-6bee0a5ecbbc@redhat.com>
 <20230207094103-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Feb 2023 09:42:45 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Feb 07, 2023 at 03:35:56PM +0100, Thomas Huth wrote:
> > On 06/02/2023 16.04, Fabiano Rosas wrote:  
> > > If we build with --without-default-devices, CONFIG_HPET and
> > > CONFIG_PARALLEL are set to N, which makes the respective devices go
> > > missing from acpi tables.
> > > 
> > > Signed-off-by: Fabiano Rosas <farosas@suse.de>
> > > ---
> > > I currently don't see a way of allowing the tests to pass in the
> > > absence of these two configs. As far as I understand, we would need to
> > > have one set of expected table files (tests/data/acpi) for each
> > > combination of machine vs. possible CONFIG that can be toggled.  
> > 
> > I think you're right ... maintaining tables for each combination does not
> > scale. Disabling the test in that case is likely the best we can do here
> > right now.
> >   
> > > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > > index a930706a43..2829eda2c9 100644
> > > --- a/tests/qtest/meson.build
> > > +++ b/tests/qtest/meson.build
> > > @@ -78,7 +78,9 @@ qtests_i386 = \
> > >      config_all_devices.has_key('CONFIG_Q35') and                                             \
> > >      config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
> > >      slirp.found() ? ['virtio-net-failover'] : []) +                                          \
> > > -  (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
> > > +  (unpack_edk2_blobs and                                                                    \
> > > +   config_all_devices.has_key('CONFIG_HPET') and                                            \
> > > +   config_all_devices.has_key('CONFIG_PARALLEL') ? ['bios-tables-test'] : []) +             \
> > >     qtests_pci +                                                                              \
> > >     qtests_cxl +                                                                              \
> > >     ['fdc-test',  
> > 
> > Reviewed-by: Thomas Huth <thuth@redhat.com>  
> 
> 
> One thing we could do is move this code to an SSDT by itself.  Then
> there's two variants of e.g. HPET SSDT: with and without CONFIG_HPET.
> Needs ACPI work though. Igor what do you think? Worth it?

I'd go with just disabling test in this case.

having dedicated ACPI tables for each permutation config changes
might cause doesn't look to me as sustainable.



