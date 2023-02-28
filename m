Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638916A5D1F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 17:29:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX2qA-0005Am-WD; Tue, 28 Feb 2023 11:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pX2q3-0005AG-5g
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:28:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pX2pz-0004LH-Kg
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:28:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677601702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Riw0pCo5HkFo/VqRHY5PSsvUlH9WhsCxjer/lOQ2jEI=;
 b=DTrUI/w64alv4eHmco1dACC8eX6QUBhVEUk0A3JRCUXfpAKKwTgApENWNIpr1KfcMBV/B4
 HFB7DzyANEK1/ITnJeOIYUVyAzVmlMYx8afhZvltX7G5TqN/1mT8KS4B86Ol2qGO9tyXhM
 BRJ4lhL7Nb2BEJzrmtwdQmRUrvia1Qs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-300-buF1jhR7PBGyZCIYy_3_hw-1; Tue, 28 Feb 2023 11:28:20 -0500
X-MC-Unique: buF1jhR7PBGyZCIYy_3_hw-1
Received: by mail-qv1-f70.google.com with SMTP id
 ge13-20020a05621427cd00b005739f5f9d7cso5244225qvb.22
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 08:28:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677601700;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Riw0pCo5HkFo/VqRHY5PSsvUlH9WhsCxjer/lOQ2jEI=;
 b=RHhb4gGew9KvO2h4UXeX6VVUnqlhkHTbML22quo0L/trnZ9F7pFkV/hR/sASfcSo9i
 +tHp4Jpld0MrLZJYl8thNE/O+W095lqIcAJlTvYKzhrkVBvcSKLmKK9nbx0NKQtHGXZ7
 5PTLdi9VAp67zTfjYfv/7gC+i40g+rg2FodWhpXtN948WWZ//iGNoxbEIfvHskb3FXha
 az2fqDpSDd31FbcOpiZ0f26LzhCamHDMH+nWmCE/HajFG9rxmKGEy/B+y51KMvfWzKx/
 xa72g1qMVxpvUdR4qbz9sd45vxuMEJ/Wo9PIQZ1XjSYazmCrBXxJfWczj9o2Bu1D4PHo
 Sf7A==
X-Gm-Message-State: AO0yUKWVy+LIP0AozijBCGhROeKBNeNTihUCh/TxPiWeK5YyPrAerJ2k
 88TOafKmvObuxBJ4w2lI7YmXTSTDV+IOc4yWUn4CTNfifVJijZych5uFPdjbyI+ywgud8PlOkiP
 VxZhK05F/lRSuIno=
X-Received: by 2002:a05:622a:50:b0:3b8:6c6e:4949 with SMTP id
 y16-20020a05622a005000b003b86c6e4949mr6764192qtw.4.1677601699969; 
 Tue, 28 Feb 2023 08:28:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+hPYs1CWoygF1ukFpmZlsrEJ5vsa7LPKpcw9jJdagBXR0B2vmLqDFxwOHU/3v7uBjypQtS2Q==
X-Received: by 2002:a05:622a:50:b0:3b8:6c6e:4949 with SMTP id
 y16-20020a05622a005000b003b86c6e4949mr6764152qtw.4.1677601699731; 
 Tue, 28 Feb 2023 08:28:19 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 t8-20020ac85888000000b003bb8c60cdf1sm6884249qta.78.2023.02.28.08.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 08:28:19 -0800 (PST)
Date: Tue, 28 Feb 2023 11:28:17 -0500
From: Peter Xu <peterx@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v6 0/4] memory: prevent dma-reentracy issues
Message-ID: <Y/4robsdEiewqv11@x1n>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230213021141.mmzdpzj6ekmml3bx@mozz.bu.edu>
 <d2df9600-0fcb-d457-727a-90cb18d4df48@redhat.com>
 <20230228160714.pzb4tl2poz4beaav@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230228160714.pzb4tl2poz4beaav@mozz.bu.edu>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Tue, Feb 28, 2023 at 11:07:14AM -0500, Alexander Bulekov wrote:
> On 230216 1214, Thomas Huth wrote:
> > On 13/02/2023 03.11, Alexander Bulekov wrote:
> > > ping
> > 
> > I think it would be really good to finally get these dma-reentrancy issues
> > fixed! Who's supposed to pick up these patches? Paolo? David? Peter?
> 
> Ping

Sorry to not have replied here - I talked to Paolo and I think Paolo has a
plan to review it.

Let's wait for another 2-3 days, perhaps?  Otherwise from what I can tell
this series already received enough R-b/A-bs from major maintainers, this
should be mergeable material going via any tree (for memory, it was always
Paolo who sends the PR before).

Thanks,

-- 
Peter Xu


