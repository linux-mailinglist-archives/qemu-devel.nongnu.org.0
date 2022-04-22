Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4AE50ACAF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:14:30 +0200 (CEST)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhgwN-0006PO-QF
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhgvP-0005jH-CE
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhgvL-0002AS-2R
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650586400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JfUtC+huXvB+ctoh2cLQnrfQDElLCrre8Fy7ZiMq31Y=;
 b=ghJOsOsASC9nOAnmpZvruwkQmvzJ32lTCUQldh6HS4MivlYK8FS6/lBp+ti43k4ozlWuGJ
 V6pvttFPekfgSYGcHwrbGdIWfr1sNoTT/SGZbZgDL76JQX7p4e/NHqPIsNmIsUgKBv+bKM
 jflpQowkz+D6B+uY4upSFrLJ86Z2Pw0=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-Gq99chKJNjqR6EnK4BOYkw-1; Thu, 21 Apr 2022 20:13:19 -0400
X-MC-Unique: Gq99chKJNjqR6EnK4BOYkw-1
Received: by mail-io1-f72.google.com with SMTP id
 x13-20020a0566022c4d00b0065491fa5614so4346754iov.9
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JfUtC+huXvB+ctoh2cLQnrfQDElLCrre8Fy7ZiMq31Y=;
 b=RH27kYbcLPIl9kC4XHmFXoGCrSvxCiYuUNdHQDazCwOwcFVu3YTX9Rs9mGMReASSf/
 VpoCaR8lUcM81wzjii0TCV8BB8YGcNNOs7bVWkrldDW8rgm5NepS1v4iqGoExfPpiza9
 FGJLysjkz9J1luSMErd9DAzSBqUcvBQ/n7tnSYQdhW0OOmiSgTCaiwNp9k3mzwJJEzGC
 qd192LXK51rrfX03lQXYT6ktfz+U6YeBEQP4wtuJTI5Zt6eSsP/yorqgZSqxm2PbD5MH
 tgv0ugrmnQy0XZDvgTGpPLSGclJITKkQUhPZ7Dm9MQGz2dlsM4O2wOcF6JZ3kENxlXUb
 RA7g==
X-Gm-Message-State: AOAM530CNNVv92dyi6KO85v+/IbRiJN7rTvim/Gut5kmh/C+zBbDxZC6
 KXmDiVr2U5blUG6+GEB9bgXgYwz8sSDcARhjWvfimMf9LEbjxaMeZOcLKu0+fxHa3XP2KGiKZbJ
 Fk7ESQY4cBtStuJo=
X-Received: by 2002:a05:6638:25b:b0:328:858d:9ac1 with SMTP id
 w27-20020a056638025b00b00328858d9ac1mr990433jaq.198.1650586398218; 
 Thu, 21 Apr 2022 17:13:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/bcDXNwI5wC4AkX4PLhbjMnYWyAmzrB8K/0DyE90Fh7+m49srzfpK3MnZO18u6xn8y3KLcw==
X-Received: by 2002:a05:6638:25b:b0:328:858d:9ac1 with SMTP id
 w27-20020a056638025b00b00328858d9ac1mr990419jaq.198.1650586397676; 
 Thu, 21 Apr 2022 17:13:17 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a923301000000b002cae7560bfesm295405ilf.62.2022.04.21.17.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 17:13:17 -0700 (PDT)
Date: Thu, 21 Apr 2022 20:13:15 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Message-ID: <YmHzG4/pAqD9MLE1@xz-m1.local>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
 <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
 <c5a0a8e8-b000-9efa-b334-93637724f49d@intel.com>
 <d04f5de3-9e66-9bdb-b268-b7b64c8489bd@redhat.com>
 <BN9PR11MB5276C1513B8DD829CC87EE898C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEt9J6Jcy7+EmgFm-JTTqd82ONt_aOYRsxnTke2ZNSaA7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACGkMEt9J6Jcy7+EmgFm-JTTqd82ONt_aOYRsxnTke2ZNSaA7A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 04:36:36PM +0800, Jason Wang wrote:
> > If not, do we want to apply this version scheme only when it
> > reaches the production quality or also in the experimental phase?
> 
> Yes. E.g if we think scalable mode is mature, we can enable 3.0.

Sorry to come back to the discussion late..

I'd say unless someone (or some organization) strongly ask for a stable
interface for scalable mode (better with some developer looking after it
along with the organization), until then we start with versioning.

Otherwise I hope we can be free to break the interface assuming things are
still evolving, just like the spec.

Thanks,

-- 
Peter Xu


