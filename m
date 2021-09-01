Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A4D3FD627
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:05:53 +0200 (CEST)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMBr-000062-LF
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLM8P-0004KL-Db
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLM8L-00005q-Uy
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630486932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjSnyv6DJ3inStop6n6aiBfuhWy3n3aOIJ0s9+9N0WI=;
 b=BOj8avbpE+6ICQOK6DE88JKod4v0YrpnA5T3kjWfix3zvpBRuJ+IyglRFqGj4JCum+3uH3
 xoMB6gK3Yp94WHXk2LWces/VZnq7d+P6HZ2mnnr0wOGm2lBuCOjDYV9fOTgKPE0fwAk8oq
 eGGh+BTPisxSBVSwCzRHxFNgceWF+l8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-IUIHWADjMhyaLHjcjbD9Ug-1; Wed, 01 Sep 2021 05:02:10 -0400
X-MC-Unique: IUIHWADjMhyaLHjcjbD9Ug-1
Received: by mail-wm1-f72.google.com with SMTP id
 p11-20020a05600c204b00b002f05aff1663so778005wmg.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 02:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vjSnyv6DJ3inStop6n6aiBfuhWy3n3aOIJ0s9+9N0WI=;
 b=suV4gvY/G6BGsggClyd9ajVxU3KjWUmbBY6fqUDOhUOo4AEgQqmTi0aS43SayS4xcJ
 0jg1u7fK758Uercqw4IgNepAvJ4mPMv1siU0zI6l5QUMBeyIFXFIxyvmwGxyvbg4O4GG
 Ojd8l7vYYQVnGWJRpwrFG34gXBHdplS7mCQc/AmSsRXt5DeXqjegJJ+NiYcr7r/qpBZ+
 EXgvsNxUtvRSfaU1zzfD3g9rXfR+OFMXt7392SRoLCWeSClf3vw5invYt5I2eI/D9ZG7
 VQ9QmzPgs8JwHK+fg/teS/t90j1G7ZRwkPcyHZarjWMjJpgvW82M/uU/9XRdN+4YYQ+o
 XibQ==
X-Gm-Message-State: AOAM53055lEvt9CNCYNd4Hya0kQfWUkt7AdZZ4WCZILK0hPKHjcqa8fl
 BmV8i31DzPL4fP/tP7nhQWUh9sP9Gesy5swI3bAIeiwnrMxeEQmz14kyQmHpuezLCLn6pB7nFrr
 +5La0m4eIWiZGMz8=
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr8664762wmf.84.1630486929277; 
 Wed, 01 Sep 2021 02:02:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJE663iu8CRKy2vdf5IZVYSMru/pBDh1aI+mxUU/H2Gr7ZvVJFHJUVlyvZCPsbmQkpv4hs9A==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr8664720wmf.84.1630486928901; 
 Wed, 01 Sep 2021 02:02:08 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d124sm4731093wmd.2.2021.09.01.02.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 02:02:08 -0700 (PDT)
Date: Wed, 1 Sep 2021 11:02:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v7 10/10] tests/data/acpi/virt: Update IORT files for ITS
Message-ID: <20210901110207.13b3e34d@redhat.com>
In-Reply-To: <CAFEAcA_XGk6vh_gZ9wn1Jgu6rf7Ka8TrHnd0WsbDAWgW=67JbQ@mail.gmail.com>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-11-shashi.mallela@linaro.org>
 <20210901100324.3ce458f6@redhat.com>
 <CAFEAcA_XGk6vh_gZ9wn1Jgu6rf7Ka8TrHnd0WsbDAWgW=67JbQ@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: "Michael S.
 Tsirkin" <mst@redhat.com>, Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sep 2021 09:06:41 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 1 Sept 2021 at 09:03, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > not directly related to the patch but while I was testing IORT testcase
> > (https://github.com/imammedo/qemu acpi-tests)
> > after rebase to 6.1, I get test failure due to change in MADT table vs
> > expected blobs made in 6.0 time and it does look like ABI change
> > (what is bad, it also happens to virt-6.0 machine type).
> > Can ARM folks check if we didn't break something?  
> 
> >  [02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt Distributor]
> >  [02Dh 0045   1]                       Length : 18
> >  [02Eh 0046   2]                     Reserved : 0000
> >  [030h 0048   4]        Local GIC Hardware ID : 00000000
> >  [034h 0052   8]                 Base Address : 0000000008000000
> >  [03Ch 0060   4]               Interrupt Base : 00000000
> > -[040h 0064   1]                      Version : 02
> > +[040h 0064   1]                      Version : 03  
> 
> This says the GIC changed from GICv2 to v3. What QEMU command line are
For the test case, I'm more interested in if the rest of numbers are correct for defaut virt machine type.

But in case of virt-6.0 we might have problem.

> you using here ?

-machine virt -accel kvm -accel tcg -nodefaults -nographic -drive if=pflash,format=raw,file=pc-bios/edk2-aarch64-code.fd,readonly=on -drive if=pflash,format=raw,file=pc-bios/edk2-arm-vars.fd,snapshot=on -cdrom tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2 -cpu host -machine virt-6.0
                                                                                  ^^^^^^^^

it's running on aarch64 host with kvm enabled to test IORT table.

> 
> -- PMM
> 


