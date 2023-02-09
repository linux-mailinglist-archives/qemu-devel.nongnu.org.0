Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA17D691307
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 23:17:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQFDI-0005j9-Te; Thu, 09 Feb 2023 17:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQFDG-0005ih-Q6
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:16:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQFDE-00065u-VN
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675980975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HtDbe8b75Q8ka8vEHIppckojJI/2OPg5oswJZe5VSzA=;
 b=WZadzWcpdxaZd08xAmQQ0vVVvMC066DpFCeAXw7Sr1UT+Mr44+6beK3wwcpX7R6Kc5592N
 RkuzULcjUluy7xaw/TCWvQkSNKwcO1QPALxDjh+7MLISYLg2WaME4C56jApRQzh5OEX5lH
 VP76TSAQczayZjt9pBaJWRoNJ+UMrjo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-mBLdyNTaNy6CUx1YXPysNQ-1; Thu, 09 Feb 2023 17:16:14 -0500
X-MC-Unique: mBLdyNTaNy6CUx1YXPysNQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 x7-20020a05620a098700b007242aa494ddso2144734qkx.19
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 14:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1675980974;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HtDbe8b75Q8ka8vEHIppckojJI/2OPg5oswJZe5VSzA=;
 b=J9+fTug4zYOcenDqAWErxXQMzA2zp1Hj3YNzpPfAMBtcfQp8acq1oGWiP34z4ij2Y/
 9IIP3kBld934Sf9LRGjC6VclZz72IoQzJF3VeI3ClbqXQjhgWsl8u72viy68xjnQ76bU
 pNv717bNBb5abJo8na0e2X9vFm5uHLaTpcHDbFPX5dqP+SAP5UyqAdhM1gWEsQKWClUG
 i1lcT77pZw+0TrJTZvS5nS9SmeVnRhVres7pXHMy/Ey+fo3P3IBmv+SuEUdeL++/HtNu
 4twOmAGuBB5lu4RRsNzk7vIP2X1g5InZC1f6fnHQ+cU4ryo5RmTrUmOoaTKdhtC0clP5
 l8IQ==
X-Gm-Message-State: AO0yUKVxCiSwINH9NiLh4cfvkfvxBr1W0etb9t3AGaKa5a8gw1XpKhIV
 cB41s1/WktCXdHgNqiw1/YbAGvdUtd+hjDDs6z1esecbtgSTfbKN3YEs7RxA7K4mveowO2OBb8t
 27Tb9+gHwrVr/H0A=
X-Received: by 2002:a05:622a:1044:b0:3b8:689c:a8aa with SMTP id
 f4-20020a05622a104400b003b8689ca8aamr27238327qte.1.1675980973832; 
 Thu, 09 Feb 2023 14:16:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/lpvDWpGCAgH4Hx5YJ/gxhDLnvjYrnKx/ulF5EZ2m/MGjomJ/02d2Afj67t39vasuISu1sVw==
X-Received: by 2002:a05:622a:1044:b0:3b8:689c:a8aa with SMTP id
 f4-20020a05622a104400b003b8689ca8aamr27238275qte.1.1675980973553; 
 Thu, 09 Feb 2023 14:16:13 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 f30-20020ac8015e000000b003b9bd163403sm2122073qtg.4.2023.02.09.14.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 14:16:12 -0800 (PST)
Date: Thu, 9 Feb 2023 17:16:11 -0500
From: Peter Xu <peterx@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 13/18] memory/iommu: Add IOMMU_ATTR_MAX_IOVA attribute
Message-ID: <Y+Vwq15r5VIhewac@x1n>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-14-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230126184948.10478-14-avihaih@nvidia.com>
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

On Thu, Jan 26, 2023 at 08:49:43PM +0200, Avihai Horon wrote:
> Add a new IOMMU attribute IOMMU_ATTR_MAX_IOVA which indicates the
> maximal IOVA that an IOMMU can use.
> 
> This attribute will be used by VFIO device dirty page tracking so it can
> track the entire IOVA space when needed (i.e. when vIOMMU is enabled).
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


