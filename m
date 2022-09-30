Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD35F0F58
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 17:55:08 +0200 (CEST)
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeILz-0006ln-0d
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 11:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oeIIF-0002T9-BQ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oeIIA-0003uh-TH
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664553069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CR9r1q9nD/5VdTRRCi3JT/53IeJUpaCvkBZs5qh41lQ=;
 b=NyNHyeNRNw4TJgKQkR+Pt362bKW7nawJHC4iylH/kqO8zBotkt2Q2UJvpnlAttoBFETbSM
 NY9GNSHMt8IZ+Raq/9+S9TciPBu/5QoxFxsuVl2ju6SwO8WI1GHZQYpQttenVw9SdeH0Rk
 rSLn7hhZvgWsEe3DmAQBNIg2niQZFjc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-6fzcbX1vP3-fWWge42_juw-1; Fri, 30 Sep 2022 11:51:06 -0400
X-MC-Unique: 6fzcbX1vP3-fWWge42_juw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w20-20020a05640234d400b00450f24c8ca6so3835303edc.13
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 08:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=CR9r1q9nD/5VdTRRCi3JT/53IeJUpaCvkBZs5qh41lQ=;
 b=j7VRRA1aW57VTVyWZ/tDrcINjSZYAyl4DoPQuPAA+C86hyOzQAx7M4Rg/nwuWHfU2o
 MAqe1thEJHCtFjJXwGLnOECUGremki+aOPkwL4z7fXjpDrnd5+y2sTLvhQClsPfBHipN
 K25w1GHwt7M3Nc3xBXZq8TIotEMQzcVt2jJlZhMmXLIA3/Jh+RVsN9Pl0w5AjHBd30iO
 Aai4FX1iAZYsQwHI5xD5EfMHQIpS6QuaEQ1BwvC/5YmW1hq4kSwBGuJBKEagY+t+fpyg
 +JMErMsh4nMWvll+NXHA3CDnrIBervDf4vnVzVv97VdCLBlOCYuHSzg2kOCsndxQcEsn
 Gp5Q==
X-Gm-Message-State: ACrzQf2Uj/QjnQ0JT82w5cDZtxSQHc8Q0gwPBz9VKZ4sZa4I7eyXJC12
 1PxXkdRVkknvHisNTY8nxYtn7Gw7LGVYNAWfp+m6aWu8rtUGThjsH8zHSicfarELVm4qu7LQBev
 8xftRbqXLsuDwjIc=
X-Received: by 2002:a17:907:2cd3:b0:77c:3e23:7bec with SMTP id
 hg19-20020a1709072cd300b0077c3e237becmr7060626ejc.380.1664553065226; 
 Fri, 30 Sep 2022 08:51:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5RlR01J8JhNmEoDhdIPF+xbGxO4apYGA30QfKHbz+0DBe6m4f3g7ij5c2ZQdixVMp8Sklh5g==
X-Received: by 2002:a17:907:2cd3:b0:77c:3e23:7bec with SMTP id
 hg19-20020a1709072cd300b0077c3e237becmr7060601ejc.380.1664553064964; 
 Fri, 30 Sep 2022 08:51:04 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742e:6800:d12a:e12c:77cf:7dd6])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0077d37a5d401sm1378829ejt.33.2022.09.30.08.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 08:51:04 -0700 (PDT)
Date: Fri, 30 Sep 2022 11:51:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 for-7.2 0/2] pci *_by_mask() coverity fix
Message-ID: <20220930115049-mutt-send-email-mst@kernel.org>
References: <20220818135421.2515257-1-peter.maydell@linaro.org>
 <CAFEAcA_JtLJg0qfm5_rpb1K9oN7taVTTT_W+a2Uvywo5tLw5Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_JtLJg0qfm5_rpb1K9oN7taVTTT_W+a2Uvywo5tLw5Gw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will merge early next week.

On Thu, Sep 29, 2022 at 05:29:58PM +0100, Peter Maydell wrote:
> Ping! This series has been reviewed.
> 
> I can take it via target-arm.next if you'd prefer.
> 
> thanks
> -- PMM
> 
> On Thu, 18 Aug 2022 at 14:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > This patchset fixes a Coverity nit relating to the
> > pci_set_*_by_mask() helper functions, where we might shift off the
> > end of a variable if the caller passes in a bogus mask argument.
> > Patch 2 is the coverity fix (adding an assert() to help Coverity
> > out a bit and to catch potential future actual bugs). Patch 1
> > removes the _get_ versions of the functions, because they've been
> > in the tree for a decade and never had any callers at any point
> > in those 10 years :-)
> >
> > This is only de-confusing Coverity, so this is definitely
> > 7.2 material at this point.
> >
> > All patches already have a reviewed-by tag; only change
> > v1->v2 is removing a couple of unnecessary mask operations
> > in patch 2.
> >
> > thanks
> > -- PMM
> >
> > Peter Maydell (2):
> >   pci: Remove unused pci_get_*_by_mask() functions
> >   pci: Sanity check mask argument to pci_set_*_by_mask()
> >
> >  include/hw/pci/pci.h | 48 +++++++++++++++-----------------------------
> >  1 file changed, 16 insertions(+), 32 deletions(-)


