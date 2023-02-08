Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DB568F0EC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:35:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlXV-0001IJ-S3; Wed, 08 Feb 2023 09:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPlXQ-0001I8-Ay
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:35:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPlXM-000457-AB
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675866902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TiFntKVXdskv6E1xVDUZABQZSkewHe6vlr6oyFA4wH8=;
 b=WC6s0vgYNfZPiXi2lIKvj3Y2X0i8HZLNx0kmRVTeF8TsTha9IN4uKG/bN8DZG3GQrdLPNE
 liJajoeya6mjtLuPP4W8E5QahbvwkupYC2If4Dll0VRrLXnJqqBCjUpiEf7tifgJodia2q
 5krfslwRZLnXYTQN9fL8x8xThxzI5f4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-SfnGqMfZOkGzbPY_Y0Az6A-1; Wed, 08 Feb 2023 09:35:00 -0500
X-MC-Unique: SfnGqMfZOkGzbPY_Y0Az6A-1
Received: by mail-ed1-f72.google.com with SMTP id
 w6-20020aa7d286000000b004aaa832ef36so6854253edq.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 06:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TiFntKVXdskv6E1xVDUZABQZSkewHe6vlr6oyFA4wH8=;
 b=JIySPWgBN6XMasBUjt8u9JvWcwEH/XT8K5Yk9NXU526uD/poyXaSVHBs8QVkiHzP/b
 qfSQPsUDiVXfzwUUiMh4xZH1rg+LTIVNcSsx53zv4D7ulbiD2ARf8JXJtyKDouKVV45x
 YsrCQxrlq3bT+sDH/u/5Klp/6rYIaG+nIWaM57aunVVC0AJBfcQ9Pg5ixyz9ujeFg1dV
 Dr63QKVtb0TDW6oGP6JAA6Y/pD3Lfjf9vhv67y7s/p0v2ocHntSEiAIH2tqG0CepZOJ6
 yY1emfBJjKDVKINYeCf7/bg9Mu/zCsHthH6HZdBYaks2swXxEGZG2D7azR4rpzsuB8EL
 qruw==
X-Gm-Message-State: AO0yUKWgHBicXZ3mEwR8U92GQMFuY2+SgChlC47ICuT9x2eTkfZj7WSn
 Rnly/l+ZDLo+c2slT4SwcznLNpttvXSBjpdtZzcVOtpFqSAfii/s/TEMGIfMVozvSNPNniu4lml
 D3h4XzRecUizj3Lc=
X-Received: by 2002:a17:906:d92:b0:88a:a09d:e673 with SMTP id
 m18-20020a1709060d9200b0088aa09de673mr7436064eji.31.1675866899447; 
 Wed, 08 Feb 2023 06:34:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+mx7K3IIldXMsWfZnKrT+SBH3O9krXAroH/8S4+ipNnni6UiaeEylxfWVQnZ+moaKA/voabQ==
X-Received: by 2002:a17:906:d92:b0:88a:a09d:e673 with SMTP id
 m18-20020a1709060d9200b0088aa09de673mr7436041eji.31.1675866899233; 
 Wed, 08 Feb 2023 06:34:59 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 v4-20020a170906564400b0088ee56fb24dsm8364068ejr.103.2023.02.08.06.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 06:34:58 -0800 (PST)
Date: Wed, 8 Feb 2023 09:34:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Hanna Czenczek <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Dave Gilbert <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: vhost-user (virtio-fs) migration: back end state
Message-ID: <20230208093358-mutt-send-email-mst@kernel.org>
References: <fb523956-7a8c-608b-6db1-961686b73e9c@redhat.com>
 <CAJSP0QWnq6av7j6x_n-C2mLSPMYBhMeEthr6ayPN-cmsEB3UnA@mail.gmail.com>
 <f26dd5ed-fa02-faeb-fadb-0dbfbe7792d3@redhat.com>
 <CAJSP0QWA5j8J_nsUWwh5a18XsoJxjtRutLQzXT6JT1LwLbxCCA@mail.gmail.com>
 <CAJSP0QWh-4cYfKK3ea4qwcaGrmXpS0npxvhzr0JG7rNUjfrB=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJSP0QWh-4cYfKK3ea4qwcaGrmXpS0npxvhzr0JG7rNUjfrB=A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Feb 08, 2023 at 09:32:05AM -0500, Stefan Hajnoczi wrote:
> On Tue, 7 Feb 2023 at 07:29, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > On Tue, 7 Feb 2023 at 04:08, Hanna Czenczek <hreitz@redhat.com> wrote:
> > > On 06.02.23 17:27, Stefan Hajnoczi wrote:
> > > > On Mon, 6 Feb 2023 at 07:36, Hanna Czenczek <hreitz@redhat.com> wrote:
> > > > Should we schedule a call with Jason, Michael, Juan, David, etc to
> > > > discuss further? That way there's less chance of spending weeks
> > > > working on something only to be asked to change the approach later.
> > >
> > > Sure, sounds good!  I’ve taken a look into what state we’ll need to
> > > migrate already, but I’ll take a more detailed look now so that it’s
> > > clear what our requirements are.
> 
> Hi Hanna,
> The next step is getting agreement on how the vhost-user device state
> interface will work. Do you want to draft the new vhost-user protocol
> messages and put together slides for discussion with Michael, Jason,
> Juan, and David in the next KVM call? That might be the best way to
> get agreement. Doing it via email is possible too but I guess it will
> take longer.

Let's get a proposal on list first please. If there's a disagreement
we can do a call too, but give everyone time to review.

> If you don't want to design the vhost-user protocol changes yourself
> then someone on this email thread can help with that.
> 
> Stefan


