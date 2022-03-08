Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5C84D1EBB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 18:21:17 +0100 (CET)
Received: from localhost ([::1]:51530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRdWO-00065U-B4
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 12:21:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRdUB-0005KZ-57
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:19:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRdU8-0000O0-C0
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646759935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rN6nkv13NukWqfjdoC86Dd80oV5E2SNqNa5MWtTv2P4=;
 b=YUelo13FfjtC1umsvkxjjJRE2apD2kjPWQ0JfVbl+LRWrLAdJpReLxT8MJ31gEZJxp0j+l
 NOJSLQX/AMwokCCnplaIgrDdcq09zjajMZUSBYyf9fQquOS5h5Fzgif6kSfrqEkolSrcYC
 gJKhSFMcGI7y9QQasrdEpr8VwOM10xA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-hQUGLlO8NpOTEXNTwsVpwQ-1; Tue, 08 Mar 2022 12:18:52 -0500
X-MC-Unique: hQUGLlO8NpOTEXNTwsVpwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so1369158wmj.5
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 09:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rN6nkv13NukWqfjdoC86Dd80oV5E2SNqNa5MWtTv2P4=;
 b=14xBmZGLaS0ebklJRraFGAdpFXSR7dzb1H7W0z+vnJnpkMdHHReTw2zrkvkDI6edyO
 T1wTEVeAvAwShhEUJOhXy2XrTAHyhTNuYkIpaWHYLP/ibcIXbta7Y6EJSBhESNAtKi8v
 AnokDlZRqmURM4BztclEme+su8QhUYMDXMxa/XH5WJB11xi6o96lDNOWnE8+FSzraRTr
 dSD7yxLg6kR6GPZ93jkm3xNWyPUq/ChvNpy3Tv21hpEKyjBqJHLnhOpUjfhI+77GWA7L
 AcspYvxrOUAvSXmYlfBBIwP37WG5sdxaXoOAW2KozJeiGqxlbCC6DPU/P6+kSak6j6kI
 SEFw==
X-Gm-Message-State: AOAM5307H2GPVGIg78zK8kr4Tzv+5D9zhh+6Kr+XVK5MbDS3iczaQ1g/
 Qcg+iY1DLeT1yQtEqcDVj4kYUjUTLoYh/5hDMgKXO1d7NGy1CwXX9bnuSYv4fA+70XNVLMkwyXo
 aRbDsrzoJLY37+uE=
X-Received: by 2002:a5d:6610:0:b0:1f1:e606:f097 with SMTP id
 n16-20020a5d6610000000b001f1e606f097mr11022943wru.134.1646759931140; 
 Tue, 08 Mar 2022 09:18:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw66KGw+KCK7WZbh3+tfnnzHny0crElnWD1e2OGKdXkSVIMmjq2L11eLl/fnoy8LBgSv6OQzg==
X-Received: by 2002:a5d:6610:0:b0:1f1:e606:f097 with SMTP id
 n16-20020a5d6610000000b001f1e606f097mr11022928wru.134.1646759930920; 
 Tue, 08 Mar 2022 09:18:50 -0800 (PST)
Received: from redhat.com ([2.55.24.184]) by smtp.gmail.com with ESMTPSA id
 bk19-20020a0560001d9300b001a65e479d20sm13701066wrb.83.2022.03.08.09.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 09:18:50 -0800 (PST)
Date: Tue, 8 Mar 2022 12:18:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [libvirt] [PATCH RESEND v2 0/4] re-introduce <acpi-hotplug-bridge>
Message-ID: <20220308121820-mutt-send-email-mst@kernel.org>
References: <20220308063955.2285902-1-ani@anisinha.ca>
 <399ca3a9-8b95-39af-8376-85f2edf00c7e@redhat.com>
 <f744a5f1-6dde-4b57-d52a-9b6104c5e510@redhat.com>
 <alpine.DEB.2.22.394.2203082212120.2312236@anisinha-lenovo>
 <20220308114638-mutt-send-email-mst@kernel.org>
 <CAARzgwwo6weTL8Q_2vbx9s2+r_LerEgDiWRLEJvgyC=YNVOVFw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwwo6weTL8Q_2vbx9s2+r_LerEgDiWRLEJvgyC=YNVOVFw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, imammedo@redhat.com, jusual@redhat.com,
 qemu list <qemu-devel@nongnu.org>, Laine Stump <laine@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 10:23:20PM +0530, Ani Sinha wrote:
> On Tue, Mar 8, 2022 at 10:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Mar 08, 2022 at 10:15:11PM +0530, Ani Sinha wrote:
> > >
> > >
> > > On Tue, 8 Mar 2022, Laine Stump wrote:
> > >
> > > > Aha! the domain of qemu-devel@nongnu.org was incorrect in the original send
> > > > (it was "nognu.org"), so none of this thread was making it to that list.
> > >
> > >
> > > Not to give any excuses but this happened because on Qemu side I never
> > > have to type this manually. My git config is set up so that
> > > the cc in send-email is filled up automatically using
> > > scripts/get_maintainer.pl. On libvirt side also the domain and mailing
> > > list is easy to remember. Its only when I have to manually type stuff that
> > > shit happens :-)
> >
> > Donnu about alpine, but with mutt you can easily set up
> > and alias and then it expands for you.
> 
> I use alpine to only reply/review patches. I use git send-email to
> actually send the patch. There I am not sure the best way to avoid
> manually typing in the mailing list address.

send-email supports aliases too.

-- 
MST


