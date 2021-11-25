Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5814345DE68
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 17:12:23 +0100 (CET)
Received: from localhost ([::1]:57072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqHME-0006fC-Eh
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 11:12:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqHKg-00054h-0R
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:10:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqHKY-0000fT-UX
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637856638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VcX3l23k1kFXQFuajm2luhVNfFiGLC1+oo8RNz5J2ao=;
 b=T1AC1Gvj0VxPk/novjvbt9sb0cj7+fEnqFf0TcgBWD4++3YPh+9uC1wfXtASvdRN/ESv+I
 gZHFDRU7tO14VOXZU/y2AZvoLh/yp0rSpWZJAndhclvw+wraO2YRF4kpbJxUehGu8PXarW
 jzZBCvrTIkSp28psuLL3rR4038iqI0M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-P4YxEsM8NP6xpGMWIrbFTQ-1; Thu, 25 Nov 2021 11:10:37 -0500
X-MC-Unique: P4YxEsM8NP6xpGMWIrbFTQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w4-20020aa7cb44000000b003e7c0f7cfffso5861733edt.2
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 08:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VcX3l23k1kFXQFuajm2luhVNfFiGLC1+oo8RNz5J2ao=;
 b=5G0S6PnoQCChDQeZIhE3ncWUGRvvbgipMb3H0nc/G0khX08CwGqszuEJ75j8elefwp
 5VJojaHVTisJ7eR/XwwqkDn2gUKwlNv0imDxs11bnhyAT5mQFfP8kjZKpagpHqdtybCq
 Tn46DL4zV6gv8Wqh+20Yii5u/RrxU22a3XyWXC4eqcTXQiUB92QOFQHu1xaKHCMtIMud
 uayyYIxUlm2tzKapagyT/PVRg0hCyrS52mXkPp2C73ErNNBwG51WjWMfriSqMw1c5hqL
 QRwg3gR0u/0Anz7+zxwPT7syZ2vB0MFUPbfVV6aBfUTFbS4s+VLJS2O3qoyInkGdhMM3
 t70w==
X-Gm-Message-State: AOAM531wKmKkR3/aeQf1LBY0xuUuE6pmvJZxem6yb8u3VY45q4JYj6jT
 UkMmv2/viRH5VqUfwAut2TAM0F8yElHA+Yk2qcVAqKuEIUC0/OaDZq4eNW5HciD78fEitBh7VgL
 Ylxr7UEGKvG8x8mQ=
X-Received: by 2002:a17:907:8a06:: with SMTP id
 sc6mr21364761ejc.530.1637856634806; 
 Thu, 25 Nov 2021 08:10:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDuAebk738R61Oua3KgkPjNC3WDA378zPNbur2jfHammncl3Z+3xxd5/znfwNh67IONXmc8w==
X-Received: by 2002:a17:907:8a06:: with SMTP id
 sc6mr21364739ejc.530.1637856634621; 
 Thu, 25 Nov 2021 08:10:34 -0800 (PST)
Received: from redhat.com ([176.12.197.47])
 by smtp.gmail.com with ESMTPSA id l26sm2139614eda.20.2021.11.25.08.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 08:10:34 -0800 (PST)
Date: Thu, 25 Nov 2021 11:10:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
Message-ID: <20211125110959-mutt-send-email-mst@kernel.org>
References: <20211125022046.10433-1-jasowang@redhat.com>
 <2250f7d7-09ca-3bfb-4d95-d0c20da7f47f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2250f7d7-09ca-3bfb-4d95-d0c20da7f47f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: mpe@ellerman.id.au, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 09:34:32AM +0100, Philippe Mathieu-Daudé wrote:
> On 11/25/21 03:20, Jason Wang wrote:
> > We only process the first in sg which may lead to the bitmap of the
> > pages belongs to following sgs were not cleared. This may result more
> > pages to be migrated. Fixing this by process all in sgs for
> > free_page_vq.
> > 
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/virtio/virtio-balloon.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> Typo "virtio" in subject.

Yes, it's an annoyingly common typo.  If using vim, I suggest:

ab virito virtio

in your vimrc.

-- 
MST


