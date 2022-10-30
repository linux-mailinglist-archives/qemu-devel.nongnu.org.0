Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DB0612B9F
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 17:32:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opBCx-0001jN-Ew; Sun, 30 Oct 2022 12:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opBCu-0001if-48
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 12:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opBCr-00032T-Q9
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 12:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667147440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XiSgRn3OF3vBbLkXmrF8qjKf9TlcfaSBGLDjFGgcnaE=;
 b=SgmVACnPAXQpMnl32iJdQzTe+aLpbXSf8fw+JnoC9WU/+LK9DtCT5uf4UR3jbCdq9RbyCS
 QnjNYfaFkXac1qvpYKHdI/XZDPZ3UagxSu5bKbONvrCawSOD1XzgDaFIo8qdGa0AS5eVxg
 rmccvhK4CH52ieSUd6+gZczLppx/qR0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412-Ye5GDTeqPoG-Y8dv-duWnw-1; Sun, 30 Oct 2022 12:30:39 -0400
X-MC-Unique: Ye5GDTeqPoG-Y8dv-duWnw-1
Received: by mail-wr1-f71.google.com with SMTP id
 c18-20020adfa312000000b002364fabf2ceso2221720wrb.2
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 09:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XiSgRn3OF3vBbLkXmrF8qjKf9TlcfaSBGLDjFGgcnaE=;
 b=bduKsto4u1XsKCpDtcfAz4NISYP6mAoJO43KvsbIbx0Glo5qzYwFSIDrKEN2CpzalJ
 XUbamRan2rz4q8QKTXXked6YesUMicbUiNp/Fppqwqar+vjbCmPPRbxQAs7pezN8xAO1
 t0Dp78BzZu9ps7JoVhU758x05Ti2hp2GMehPeFUKKdUyOTFzKc8y8Bj2RvPYDoNWPs7i
 TEpuLOWy6zKq1y3jFpPISgDw82xocqBDbFTc7AgP1yY/NXp4+HSANwdu6QNKcNlPylLC
 L1ICpu74cYOpFsDju2lo6SA5q3K3Dkfk+owBQiM3xhYeN2SYlwTTH9o8NXNSLDneUFVg
 za/g==
X-Gm-Message-State: ACrzQf3P4IID+42tR7TMMYm4I8mzqDlcStHWkuI7VCHN9YPGW+XJmQR4
 Hn/pOzyMik0drWbZ0AgsxveEGWTDCbM91VKhmvP0LTiOpyswXxYdCoXBSmqQXU9libI7nqQZA4J
 pUSBLyc3/yaLGCRc=
X-Received: by 2002:a5d:4804:0:b0:236:94d4:5472 with SMTP id
 l4-20020a5d4804000000b0023694d45472mr5440543wrq.286.1667147438525; 
 Sun, 30 Oct 2022 09:30:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7MUXbVQVSxvvIW35nVi+pBQtIT5eCevpeIA5+PIGYZpvsbvNgiitGDINEAasTUoUvoW+YKjQ==
X-Received: by 2002:a5d:4804:0:b0:236:94d4:5472 with SMTP id
 l4-20020a5d4804000000b0023694d45472mr5440527wrq.286.1667147438174; 
 Sun, 30 Oct 2022 09:30:38 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 y9-20020adffa49000000b002345cb2723esm4552789wrr.17.2022.10.30.09.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 09:30:37 -0700 (PDT)
Date: Sun, 30 Oct 2022 12:30:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: B <shentey@gmail.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 3/3] hw/i386/acpi-build: Resolve north rather than
 south bridges
Message-ID: <20221030123026-mutt-send-email-mst@kernel.org>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
 <CAARzgwyMiEQUc=DEd5iJb=hgsoMn8tQaNeOnzKAG8qaxWhdRYw@mail.gmail.com>
 <8EA83461-41EC-40E1-AD22-C4107216870B@gmail.com>
 <CAARzgwyRJbQuUFBOSsnm_PHLWoOBcKYX8WucKk7_VeQ=Xan0kg@mail.gmail.com>
 <20221029043803-mutt-send-email-mst@kernel.org>
 <fe7a1bbb-9993-4eee-6543-5e7e8391b6c@anisinha.ca>
 <20221030121158-mutt-send-email-mst@kernel.org>
 <1ef31b1-edac-cda8-4560-f633c63a9244@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ef31b1-edac-cda8-4560-f633c63a9244@anisinha.ca>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Oct 30, 2022 at 09:48:08PM +0530, Ani Sinha wrote:
> 
> 
> On Sun, 30 Oct 2022, Michael S. Tsirkin wrote:
> 
> > On Sun, Oct 30, 2022 at 09:15:44PM +0530, Ani Sinha wrote:
> > >
> > >
> > > On Sat, 29 Oct 2022, Michael S. Tsirkin wrote:
> > >
> > > > On Fri, Oct 28, 2022 at 10:18:43PM +0530, Ani Sinha wrote:
> > > > > On Fri, Oct 28, 2022 at 9:45 PM B <shentey@gmail.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > Am 28. Oktober 2022 10:58:07 UTC schrieb Ani Sinha <ani@anisinha.ca>:
> > > > > > >On Fri, Oct 28, 2022 at 4:05 PM Bernhard Beschow <shentey@gmail.com> wrote:
> > > > > > >>
> > > > > > >> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
> > > > > > >> AML generation has been moved into the south bridges and since the
> > > > > > >> machines define themselves primarily through their north bridges, let's
> > > > > > >> switch to resolving the north bridges for AML generation instead. This
> > > > > > >> also allows for easier experimentation with different south bridges in
> > > > > > >> the "pc" machine, e.g. with PIIX4 and VT82xx.
> > > > > > >
> > > > > > >Unfortunately this patch does not apply on the latest master. Also the
> > > > > > >code seems to be off. Can you rebase and rework the patch?
> > > > > >
> > > > > > I've rebased onto Igor's series to avoid merge conflicts,
> > > > >
> > > > > Ok I will let Igor deal with this then since I have not followed his patchset.
> > > >
> > > > should you want to review this, it's all in my tree right now.
> > >
> > > I tried your "next" branch from
> > > git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git
> > >
> > > and it does not apply there either.
> >
> >
> > commit 87bbbe87c259414864a02e8385a0c8becd269ea5
> > It is already applied there.
> 
> Hmm, I am not seeing it :
> 
> ani@ani-ubuntu:~/workspace/qemu-mst$ git show
> 87bbbe87c259414864a02e8385a0c8becd269ea5
> fatal: bad object 87bbbe87c259414864a02e8385a0c8becd269ea5
> ani@ani-ubuntu:~/workspace/qemu-mst$ git branch -vv
>   master 7457fe9541 [origin/master] Update version for v1.7.0-rc2 release
> * next   e336a0d550 [origin/next] ack! hw/ide/piix: Ignore writes of hardwired PCI command register bits

oh right. pushed now.


