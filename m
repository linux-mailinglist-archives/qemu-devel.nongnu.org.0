Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E54F822E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 16:52:46 +0200 (CEST)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncTV7-0001BM-4X
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 10:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncTSs-0000MK-0B
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 10:50:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncTSk-0005M8-27
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 10:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649343016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MB4Rq5YVngwFr4VkSHwf8nnZdqoRquE6LHT3q8gXcM8=;
 b=WUWLzhhRd5+2TskWVlezmdtEvTX9NCRU7NQ4NUkNMyvucxiS9lqD9ud2UmD5FGwTAiEBWy
 +IocTv9DvvREM34WhgZNSGes//8vOmxWiSiTZZKfkItf2O9RyhLsq8dN0DKqnrUqKjgvBC
 jpu+rdMxOD6szSBRjAhfC9wUzJ8kAxQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-RwzazWHpNc2_yWIRAe-WdA-1; Thu, 07 Apr 2022 10:50:15 -0400
X-MC-Unique: RwzazWHpNc2_yWIRAe-WdA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j18-20020adfa552000000b002060a011303so1343643wrb.14
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 07:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MB4Rq5YVngwFr4VkSHwf8nnZdqoRquE6LHT3q8gXcM8=;
 b=PogCKIZXD9rBf0t3Lu1tuOX7xKoh/ykAs9an7O1qcFNUq0t7DpXkm/gKwV4n9ZnqRr
 vuU2e1PH4CquHSnz6MEfa3nZtcj32fyq75FR99pkFIs4iTJTJVR4o9qeep+uQ6GAzLGu
 4rf1znGwIBtRAVNZ0KLrsp7+VfiV71/d6o3PfS3S8q9XtSH3lmjXl3UTzwZsNbvhkNWF
 ukW8S7U+8McRFhjhY3rH0xQS1nx84j5jox8Pm6nQno0AOrLly6xTuU4ER3oUXP5/qyFI
 aax2dz3ywtLzeIF6MgHMeglbVXOhLjgbBs3xwbw1p/ItjemPuFk7KIJJjhfFNeHxd40k
 mb9A==
X-Gm-Message-State: AOAM533gquHBiFDQHWT9DrwKNalhU/7LNyCT94tR9PJzeyR6n1Cp+MwU
 yHL4jY8llSFcTgxHfBf6u31sQUWuSZPvuyXpv4DAXgYXOHOaIwlaS/OlJIteHOq+7Nen3MacudT
 3qRb8p6vgC/hYq6Y=
X-Received: by 2002:a5d:4207:0:b0:206:1593:3e8b with SMTP id
 n7-20020a5d4207000000b0020615933e8bmr11464759wrq.153.1649343014174; 
 Thu, 07 Apr 2022 07:50:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymEskpFnZ6LWZb+/Wwlu9qeNEamaMqkYwcZ6GUNZHFWbnAUyezi8DmcHThIjxmdKTtfG4b+g==
X-Received: by 2002:a5d:4207:0:b0:206:1593:3e8b with SMTP id
 n7-20020a5d4207000000b0020615933e8bmr11464740wrq.153.1649343013880; 
 Thu, 07 Apr 2022 07:50:13 -0700 (PDT)
Received: from redhat.com ([2.52.30.120]) by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b0038e9c60f0e7sm319798wme.28.2022.04.07.07.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 07:50:12 -0700 (PDT)
Date: Thu, 7 Apr 2022 10:50:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-7.0] virtio-iommu: use-after-free fix
Message-ID: <20220407104905-mutt-send-email-mst@kernel.org>
References: <20220407095047.50371-1-mst@redhat.com>
 <CAFEAcA8upf6nA8dUPeAyY_Q-F_oscqZonPGCKT2OUZORcX4FuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8upf6nA8dUPeAyY_Q-F_oscqZonPGCKT2OUZORcX4FuQ@mail.gmail.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org,
 Wentao Liang <Wentao_Liang_g@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 07, 2022 at 11:03:16AM +0100, Peter Maydell wrote:
> On Thu, 7 Apr 2022 at 10:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Wentao Liang <Wentao_Liang_g@163.com>
> >
> > A potential Use-after-free was reported in virtio_iommu_handle_command
> > when using virtio-iommu:
> >
> > > I find a potential Use-after-free in QEMU 6.2.0, which is in
> > > virtio_iommu_handle_command() (./hw/virtio/virtio-iommu.c).
> 
> So, this isn't a regression. Do you think it's critically necessary
> it goes in 7.0, or is it in the category "put it into 7.0 if we
> need an rc4 for some other reason anyway" ?
> 
> (I have a feeling we'll need an rc4, but we'll see.)
> 
> thanks
> -- PMM

I am concerned it can be used to trigger a CVE but I could not
find a way. So I would say if there's an rc4 pls include it
but if not then we can pick it up in stable.

-- 
MST


