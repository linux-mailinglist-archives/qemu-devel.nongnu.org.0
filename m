Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A19C42C089
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:48:33 +0200 (CEST)
Received: from localhost ([::1]:38180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1madgO-00086p-8m
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1madf4-0006Rr-UC
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:47:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1madf1-0000XT-UO
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634129226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wp+/d0F+qzlGdrrSoGXSKcXwbRm7uRB50CWJ1pV00sA=;
 b=QTfNvJnvYCHpzqE66sRusuz1zu12vlFMJtnztwxJHUwYBkzKknvA73NKrPHeLAR6PxCJTg
 2fxmvvWIR5fhtgBlTzAE95BoM6uDoBfkrPptCOyftCexUSTcji9m2zSfP/5ina8dZ921fx
 r/UCLKppOJOSg2SEdosYUbsOHpEX+W0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-RWNnF3yTPaKjNKzaMqWlOQ-1; Wed, 13 Oct 2021 08:47:05 -0400
X-MC-Unique: RWNnF3yTPaKjNKzaMqWlOQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso1895239wrb.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wp+/d0F+qzlGdrrSoGXSKcXwbRm7uRB50CWJ1pV00sA=;
 b=jrnVvOC6DIEBznfBPPBY4pxGEiZUYHM7qz623jpNJtxQSoy5/w5jGf4h49jSzmwZrq
 STcUzxE8QvX2e/xFjDsvaonME0+0LiTjjWQbCmPiFmcUtFeSjnHZx3oFvBTOtmFG8wWK
 fcw9sd08zbGPaoIe77Mpk6KwGqAhDYksDO8ZJzR52X6cw1TKs1UwIJnuLoTdqUe6SdcS
 pg/bZjxl7n5/E2ij0umv63bul4hRIIeID3CMP5WmuzxGQ8Qz24eDnv1fmbrSu7BpfmA/
 bFH4b8Rt0gahpWe3HzmpwmXFdjhdfE5saXcoFtYSn727F3BYgY3sI8xDHc0ZCH7qtip0
 rlbQ==
X-Gm-Message-State: AOAM531jLPtHS7HOhKp4kjSvs6wzGuf3fJAADclo+UrFlGx94SQbFT22
 uDjdUz5g1dWVAp6b1A3HniheoN2IQQWEeYhkBHBDo3oHkdzC2o8tcxqmmh5g0Wn9Qoc6AUxEtrN
 PhMIjGyY0sF4Nat0=
X-Received: by 2002:a7b:c258:: with SMTP id b24mr12306410wmj.160.1634129224184; 
 Wed, 13 Oct 2021 05:47:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3bu0Nu2sTQ0+QNSDdqXyjCUIauFl76JolUN+8aoRczJi/YTb07iDFPZNwrmi/5HPNNvtB6A==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr12306384wmj.160.1634129223978; 
 Wed, 13 Oct 2021 05:47:03 -0700 (PDT)
Received: from redhat.com ([2.55.30.112])
 by smtp.gmail.com with ESMTPSA id b190sm5299164wmd.25.2021.10.13.05.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:47:03 -0700 (PDT)
Date: Wed, 13 Oct 2021 08:46:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] virtio: write back F_VERSION_1 before validate
Message-ID: <20211013084640-mutt-send-email-mst@kernel.org>
References: <20211011053921.1198936-1-pasic@linux.ibm.com>
 <20211013060923-mutt-send-email-mst@kernel.org>
 <96561e29-e0d6-9a4d-3657-999bad59914e@de.ibm.com>
 <20211013081836-mutt-send-email-mst@kernel.org>
 <20211013144408.2812d9bd.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211013144408.2812d9bd.pasic@linux.ibm.com>
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
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, stefanha@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 02:44:08PM +0200, Halil Pasic wrote:
> On Wed, 13 Oct 2021 08:24:53 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > > > OK this looks good! How about a QEMU patch to make it spec compliant on
> > > > BE?  
> > > 
> > > Who is going to do that? Halil? you? Conny?  
> > 
> > Halil said he'll do it... Right, Halil?
> 
> I can do it but not right away. Maybe in a couple of weeks. I have some
> other bugs to hunt down, before proceeding to this. If somebody else
> wants to do it, I'm fine with that as well.
> 
> Regards,
> Halil

Couple of weeks is ok I think.

-- 
MST


