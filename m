Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134F63508D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 07:37:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxjNI-0002nb-1D; Wed, 23 Nov 2022 01:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxjNC-0002i2-7U
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 01:36:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxjN9-0007Er-Nx
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 01:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669185398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cy4fFxLpKi3Tohhi1+mr7Q9sN2oYgOwXDBcL8WaUc6w=;
 b=cYlPgWwgq0zgNigQd9+Uhx+8kq0P5BVAPUO20DDwBGjziEXnYdQ5kQBi+Ch+TBgxHBUABJ
 YH5vIXsKsgi3dzMqyVNAY8xbNt28BHRzUica11vjCasjsmSmKP1wV+NyU/xkZwJzcillas
 xpG+5RKGVWQrg9Snkdc8EnPCWrJ+BAA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-L64XB9vJMfaomISXZbwiug-1; Wed, 23 Nov 2022 01:36:36 -0500
X-MC-Unique: L64XB9vJMfaomISXZbwiug-1
Received: by mail-wm1-f72.google.com with SMTP id
 m14-20020a7bcb8e000000b003cfcff0057eso451334wmi.9
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 22:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cy4fFxLpKi3Tohhi1+mr7Q9sN2oYgOwXDBcL8WaUc6w=;
 b=l338YgvwXbUEqPzAKRKJvDUWIsjg2LdaV63DxB51QoFpIcz9GpkNGYOO0WKw8nz9Ne
 2N3upTFhIYy1jZoXmvYJzz8IBCW0wVzPgoaTSzfYBb2zxBUCaOqzFhjTB3MeD+CfOBrZ
 65UlivISmvPMm3D+b7m9OByaQaLz6JG/hSMwAE5k++hFLyujLN1lY65wOO9p8eRQ5JUJ
 lfa0Ht+EgK4tuImyxGbg/s07NL9rEM/6qL9k4UbQstztK5r01YMvr0DJZJIr3DdE2sN4
 9Kf8JfdJYmbdBNdkYzMrPHMCId04PwUMc3SyvKnCvLEJNa++D/Y9ZwAIRDmGYLscuQMz
 3qrw==
X-Gm-Message-State: ANoB5pmrTfFgxSnrWMMGDm50+nJoWwE5qNMv84wO8vAHOuh/qYdbARwE
 uE0zqyhMUxUGil7zUCZqCRbwcF8vKko+N8bW9kutxbajfFkKFeAB+T2RFiLhsLtHHWPIdTY9IBq
 UiVgxfI/q+CmjEG0=
X-Received: by 2002:adf:ee4d:0:b0:236:8ead:3da5 with SMTP id
 w13-20020adfee4d000000b002368ead3da5mr16245000wro.391.1669185394894; 
 Tue, 22 Nov 2022 22:36:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7wBeTlUBXxyxt0cVpKbfqI9KBuSiMRCJYIC9PgkuynpBAWAz1iTlPxdDzOSACu+gaIwBFTLA==
X-Received: by 2002:adf:ee4d:0:b0:236:8ead:3da5 with SMTP id
 w13-20020adfee4d000000b002368ead3da5mr16244986wro.391.1669185394694; 
 Tue, 22 Nov 2022 22:36:34 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 u12-20020adfdb8c000000b002367ad808a9sm15505083wri.30.2022.11.22.22.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 22:36:34 -0800 (PST)
Date: Wed, 23 Nov 2022 01:36:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com,
 stefanb@linux.vnet.ibm.com, cohuck@redhat.com, f4bug@amsat.org
Subject: Re: [PATCH v5 1/2] sysemu: tpm: Add a stub function for TPM_IS_CRB
Message-ID: <20221123013441-mutt-send-email-mst@kernel.org>
References: <20220506132510.1847942-1-eric.auger@redhat.com>
 <20220506132510.1847942-2-eric.auger@redhat.com>
 <96940f79-a6e0-d14f-5d74-abe280846f26@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96940f79-a6e0-d14f-5d74-abe280846f26@linux.ibm.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Fri, May 06, 2022 at 09:47:52AM -0400, Stefan Berger wrote:
> 
> 
> On 5/6/22 09:25, Eric Auger wrote:
> > In a subsequent patch, VFIO will need to recognize if
> > a memory region owner is a TPM CRB device. Hence VFIO
> > needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
> > let's add a stub function.
> > 
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Suggested-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>

... and now in 7.2 vdpa needs a dependency on tpm too, what a hack :(
And what exactly is it about TPM CRB that everyone needs to
know about it and skip it? The API does not tell ...

> > ---
> >   include/sysemu/tpm.h | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> > index 68b2206463c..fb40e30ff60 100644
> > --- a/include/sysemu/tpm.h
> > +++ b/include/sysemu/tpm.h
> > @@ -80,6 +80,12 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
> >   #define tpm_init()  (0)
> >   #define tpm_cleanup()
> > 
> > +/* needed for an alignment check in non-tpm code */
> > +static inline Object *TPM_IS_CRB(Object *obj)
> > +{
> > +     return NULL;
> > +}
> > +
> >   #endif /* CONFIG_TPM */
> > 
> >   #endif /* QEMU_TPM_H */
> 
> 


