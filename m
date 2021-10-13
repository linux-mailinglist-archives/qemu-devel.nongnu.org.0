Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C63A42C0B9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:57:04 +0200 (CEST)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1madod-000242-BO
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1madmq-0000GB-Vh
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1madmp-0007L1-Gb
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634129710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bua+UvhRZx/vtJpW/R79wAmjzbaBOR2FatQ2gYmLKAk=;
 b=imCDhWuWI5hr9wxKRNm+RZyDWnJUNKV39xwKQtw3TkcLGfdCvLzMrnapy3qlT/MV0lN9Yo
 GgkZNr7ehYSNFnKhhWxJ6MthVECACrBxnnuYBMn1i7mTJAuQS8x8m5ZhQYvDXohyqkh67p
 juX97odvt37mrfN0/KE6gNs1Fgz+Z8g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-aD4sUuMVMhig1rP2btRE9A-1; Wed, 13 Oct 2021 08:55:09 -0400
X-MC-Unique: aD4sUuMVMhig1rP2btRE9A-1
Received: by mail-wr1-f70.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so1869487wrc.22
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bua+UvhRZx/vtJpW/R79wAmjzbaBOR2FatQ2gYmLKAk=;
 b=sMRW1CHfyiYZlOvua5HT1Lv2Ilh+nahYHD775Lo2xDEEw9DhyY+Y5yP500yNpSKgJk
 M19tvMLg0nNvdpzoqzKB1kmIPdqJw0clxX+0Hi0tLRXEdHyhlyJwAq6wKVVxcsXWQ/s8
 v+b6xha3gwDWvnYxKa2zMTSkBnu0yee+ActZfScs1HZZDXPNWOTizO5p0Vouj9WGbWoi
 R090zOlcGrGCUGzDSCXXdD8C+hkt5MAWXVaiJzkUXhgRXI28JFomB8o3afXt9yxTfSio
 ut5NQ8NpBuEwWzZSqqoInD7Px2+S7proVL1dysIMAZcKp2YGhADczjaGImyahi1a4SpA
 mpbQ==
X-Gm-Message-State: AOAM531EyRfGfpS2NTi8+t4Q75KmIJcavWNaRgECPxNE+99WNoj0KE4t
 sLljSzL3giR2bOoegQjoQIYas9dWlD/RF6y0ctm/qU5GLC2leobYOa5zjqZgcXnoBJIhHEl8NE2
 I0oGdREcLJor0lV0=
X-Received: by 2002:a1c:22d7:: with SMTP id
 i206mr13001199wmi.122.1634129708117; 
 Wed, 13 Oct 2021 05:55:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUlSBIGEPmkknnlsQTkGPbs0LAOHhsvCUmorYQR19foafC7W/ikoT3XdyrV6wuhDzoeZLiZw==
X-Received: by 2002:a1c:22d7:: with SMTP id
 i206mr13001158wmi.122.1634129707894; 
 Wed, 13 Oct 2021 05:55:07 -0700 (PDT)
Received: from redhat.com ([2.55.30.112])
 by smtp.gmail.com with ESMTPSA id g12sm5445986wme.3.2021.10.13.05.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:55:07 -0700 (PDT)
Date: Wed, 13 Oct 2021 08:55:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 1/1] virtio: write back F_VERSION_1 before validate
Message-ID: <20211013085423-mutt-send-email-mst@kernel.org>
References: <20211011053921.1198936-1-pasic@linux.ibm.com>
 <20211013060923-mutt-send-email-mst@kernel.org>
 <96561e29-e0d6-9a4d-3657-999bad59914e@de.ibm.com>
 <20211013081836-mutt-send-email-mst@kernel.org>
 <87zgrdulwp.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87zgrdulwp.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Xie Yongji <xieyongji@bytedance.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, stefanha@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 02:52:38PM +0200, Cornelia Huck wrote:
> On Wed, Oct 13 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, Oct 13, 2021 at 01:23:50PM +0200, Christian Borntraeger wrote:
> >> Can we get this kernel patch queued for 5.15 and stable without waiting for the QEMU patch
> >> as we have a regression with 4.14?
> >
> > Probably. Still trying to decide between this and plain revert for 5.15
> > and back. Maybe both?
> 
> Probably better queue this one, in case we have some undiscovered
> problems with the config space access in virtio-net?

So both then. I think you are right. Pushed out to -next. Will do a pull
towards end of the week.

-- 
MST


