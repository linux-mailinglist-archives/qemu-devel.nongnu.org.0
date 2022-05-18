Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A4452BFC6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:32:03 +0200 (CEST)
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMah-0004wE-2V
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nrMYK-0003H0-8I
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:29:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nrMYH-0005w7-82
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652891371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b/LM2p90xHnWmsNJj6VUZVWVMGMUr3RO/bedRD8vods=;
 b=fl0xEB2w27WQr2ieYQTN4LRXtwwWVL8/LLkgCL5K1VBAfojDnlh40qxTXxCSEOAkrqBH+K
 f0VpaiKuFgGG6U69XOwZ648tKiV+RmkrGvGBGoLzDBgIXqoU6wjY4tAGBu3Jk2fF8QgOdl
 TKpTSIFTrwFo+uLHUFrS7eW76aoRayg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-ojgUsF1gPGSqNdh-bslMIg-1; Wed, 18 May 2022 12:29:30 -0400
X-MC-Unique: ojgUsF1gPGSqNdh-bslMIg-1
Received: by mail-wm1-f71.google.com with SMTP id
 u3-20020a05600c210300b0039430c7665eso972750wml.2
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 09:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b/LM2p90xHnWmsNJj6VUZVWVMGMUr3RO/bedRD8vods=;
 b=dzv4djPcSmISsK2jXq60d18+qJUbt9ct4skschByCrhyWsNvD4wwC99HNYUdovF94y
 epkO8fKh1Z2tmEhpFgk6cEN93eidew4hqyHYEB42vH0Z+rSWZAYPYZKlPhEm/4uoJk88
 iV24ahtiyDbPk7NAXn+WgzafdsessslJUZqynUL0XzDqwmQoBzIfH4+qhSDWYWbEo2eB
 9/rRNQdow4gZgHJzhvCpJ+SlBFIu2pzqI5nYUVyun9nHgQFPbGPzdQOX7ISJN5Z/yh58
 22VYRB2thcMww/krio5EqiLZkSAN2eJZuWZr0JYawctQ6bV8O5bNDZmS/Khrere1pMZG
 txiA==
X-Gm-Message-State: AOAM530BccTsk/xVXG5Lpv9LopBIuXQnQBngDwScgDaNZBkHHOUh0D5A
 bmtnm4FHSSEWnIIrzEP1lfdjJwUms2xGJ+l1crOJJUBJHoU4iO94u3rVBolIHFFYJegIPOr0IWv
 KkKONmX5LWJT5FJs=
X-Received: by 2002:a05:6000:184a:b0:20d:bc00:61c6 with SMTP id
 c10-20020a056000184a00b0020dbc0061c6mr421808wri.281.1652891369182; 
 Wed, 18 May 2022 09:29:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1XDvGKB6mIIHZw+FjeIhkQOw3KIp1krtaLnDRyGp2PdgJg/bNAFK1LMUhP0a/EvC069BXRw==
X-Received: by 2002:a05:6000:184a:b0:20d:bc00:61c6 with SMTP id
 c10-20020a056000184a00b0020dbc0061c6mr421781wri.281.1652891368850; 
 Wed, 18 May 2022 09:29:28 -0700 (PDT)
Received: from redhat.com ([151.81.230.224]) by smtp.gmail.com with ESMTPSA id
 p11-20020a5d59ab000000b0020e615bab7bsm2340430wrr.7.2022.05.18.09.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 09:29:28 -0700 (PDT)
Date: Wed, 18 May 2022 12:29:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 ani@anisinha.ca, minyard@acm.org, stefanb@linux.vnet.ibm.com,
 marcandre.lureau@redhat.com
Subject: Re: [PATCH 28/35] acpi: pvpanic-isa: use
 AcpiDevAmlIfClass:build_dev_aml to provide device's AML
Message-ID: <20220518122602-mutt-send-email-mst@kernel.org>
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-29-imammedo@redhat.com>
 <20220516163547-mutt-send-email-mst@kernel.org>
 <20220517081351.vnx2xryjxason3dd@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517081351.vnx2xryjxason3dd@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 17, 2022 at 10:13:51AM +0200, Gerd Hoffmann wrote:
> That problem isn't new and we already have a bunch of aml_* stubs
> because of that.  I expect it'll work just fine, at worst we'll
> have to add a stub or two in case some calls are not covered yet.

Right but adding these stubs is a bother, we keep missing some.
If possible I'd like the solution to be cleaner than the status quo.
Is adding a wrapper instead of setting a method directly such
a big problem really?

-- 
MST


