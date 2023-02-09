Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8728691324
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 23:19:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQFFq-0006d7-Qm; Thu, 09 Feb 2023 17:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQFFo-0006cv-6P
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:18:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQFFm-0006Nh-RY
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675981134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vmeenTb8qAgKXuWlLRy1gOuoBM8SegN6R3C6m5/+Nu8=;
 b=Nj6NW+YC18CPhungvz+BJAOJ7aJG/H1GY0WjD5utDEj1ttYqX8Gk565fH872WcB7S20lWd
 1tsFE8PoKKsUaIrsbncQVqAPmhkfWGFTAS/WDkawpriv2ZdT2Kd9ifcMk2Fb2GXFDxmB2e
 iNnfuV/uHFx06zz0SvCunS3HjK4qZl4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-vPN9nrIuMpmuTG9B2u_anQ-1; Thu, 09 Feb 2023 17:18:53 -0500
X-MC-Unique: vPN9nrIuMpmuTG9B2u_anQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 x14-20020a05620a14ae00b0072f7f0f356bso2178729qkj.1
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 14:18:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vmeenTb8qAgKXuWlLRy1gOuoBM8SegN6R3C6m5/+Nu8=;
 b=cJHH4h/BslsKBQW5TfunP8ZsV8mRiXP+UgCkHJC7ZkRQKRPVpUHenVs1ukpIMvflOl
 V0gDNa+5Cra1XmpCZwFQ66cdNzhovvjeZHCRZ+tzf2oJ2vbQ5nn5mciCO/gK89W2Ih5U
 TPSvhgyuRKe3V1IUXaWSPy6RzpmU8eyLBAM4rFmj2zcqdR3Gt8DMxDDolqgfge84cvyo
 adlIKMmaB9lCXp25bH9VHArZYb85eyMK2wDLBY7jmiHIrDglYyunV2gZ8rHtRVYmsKuH
 9G3l5Bs9Qq8H95/3C6QWHcivtv3ZdbBpabRxV9R/l4bESCiwVBUiGmkUM3QSc0alKPt3
 iZRg==
X-Gm-Message-State: AO0yUKXh8FA8340cUJzjvgTjZGLxx3yX6UMe9Sg2FBk+WXYJlg/fuiHo
 UNsszPse/smD0C/zrqRFIWfP6kkdjuilB25HRp4K2F3K+OdbuVtxaMMU4tX0qZLi6LiDr0tpdf1
 KNS52X0hrjOuzEC2laxTY
X-Received: by 2002:ac8:4e8d:0:b0:3ba:1ace:8bae with SMTP id
 13-20020ac84e8d000000b003ba1ace8baemr23175422qtp.0.1675981132337; 
 Thu, 09 Feb 2023 14:18:52 -0800 (PST)
X-Google-Smtp-Source: AK7set/jkMpzNWOGmm7dRU1qp1StAiJ1ti33nZiRdVh32P9yGmZcULOX6pa7iovvllhHZ07glShZwg==
X-Received: by 2002:ac8:4e8d:0:b0:3ba:1ace:8bae with SMTP id
 13-20020ac84e8d000000b003ba1ace8baemr23175399qtp.0.1675981131994; 
 Thu, 09 Feb 2023 14:18:51 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 74-20020a37044d000000b007343fceee5fsm2279506qke.8.2023.02.09.14.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 14:18:51 -0800 (PST)
Date: Thu, 9 Feb 2023 17:18:49 -0500
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
Subject: Re: [PATCH 14/18] intel-iommu: Implement get_attr() method
Message-ID: <Y+VxSZEFqBOaqlDR@x1n>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-15-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230126184948.10478-15-avihaih@nvidia.com>
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

On Thu, Jan 26, 2023 at 08:49:44PM +0200, Avihai Horon wrote:
> Implement get_attr() method and use the address width property to report
> the IOMMU_ATTR_MAX_IOVA attribute.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


