Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1736B27FF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 15:57:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paHgy-0001kQ-OB; Thu, 09 Mar 2023 09:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paHgw-0001ju-Eb
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:56:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paHgu-0002Sx-N3
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678373783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjs/ig6bVVLKt7w6A4ZddyYLo1yjWQU0VRL8480VMiA=;
 b=PPojL3T/SHBlkpzoL/HPpKjM7lxRUh4xLAtwdJaCPJe/mFc1e9DpH0fdt5AaISg6tyEwC2
 MG6bLqxxsNTyAxWZzunZK0m0fg+Z0CKJhVJ+ie/lspMZNeNPvPP4dMfVG787KPKAFPIJIS
 NdKjbwGqMiRnSEgPz6PS9JXTS1mLEWs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-5EjjT8SHPUaPCN3JjUMJpg-1; Thu, 09 Mar 2023 09:56:19 -0500
X-MC-Unique: 5EjjT8SHPUaPCN3JjUMJpg-1
Received: by mail-qk1-f199.google.com with SMTP id
 pc36-20020a05620a842400b00742c715894bso1276496qkn.21
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 06:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678373779;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rjs/ig6bVVLKt7w6A4ZddyYLo1yjWQU0VRL8480VMiA=;
 b=kMKVlhplI1vUqjlI7hKZJEyEjfWzECAlF4cQNAJr8slz5uOXi7XKNfh0GllodOQBLF
 UhpYy/3WxYmUWdRZ+vc1WZiE+mZIIkKaoqstB2E+ilsvYTFyjQxM626JtJWrF1d9dtRK
 qzH9ayRkSKv1h1IMb7k4w87MK8H2Pwg3wu6Ouh6J1ms3RIUXFYaEL8ehUeEhWFR2G5Ww
 sCD3XIKBFjVTlwfcSuE4yRhNcq1gYXTJlzqx9Pnox+l4A5FzgPTV0+dNnSYQ5DUrjcnM
 sMN8dtEJscDQzVwLj5zb0lVQxtU3OGzawjNwDu4qSnRpdLg8AndqtcscKV1P6HG6dFS7
 VA8w==
X-Gm-Message-State: AO0yUKVhUizJsbayJqirqobb17YZYfWuJkp1sgFeNb11/xr0sllf5w/V
 yyIqXYiDCI7eXH8FTRmIlOclOYijTAWjsiTqptHAu45xggjF2mftme9XLWgrQ0AVHBKE+iEqyaP
 BXSqtxn6S4euu6NM=
X-Received: by 2002:a05:622a:1443:b0:3bf:cf77:a861 with SMTP id
 v3-20020a05622a144300b003bfcf77a861mr41967266qtx.4.1678373779020; 
 Thu, 09 Mar 2023 06:56:19 -0800 (PST)
X-Google-Smtp-Source: AK7set8W4jC3dDuSMzJxyyQOd6XxJDhNmb4SO0av/uIkVKtpwjud5CsFkNmYEqn8nj+BCZtHFjUfeA==
X-Received: by 2002:a05:622a:1443:b0:3bf:cf77:a861 with SMTP id
 v3-20020a05622a144300b003bfcf77a861mr41967240qtx.4.1678373778684; 
 Thu, 09 Mar 2023 06:56:18 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 do32-20020a05620a2b2000b0073b7568d998sm13496509qkb.2.2023.03.09.06.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:56:18 -0800 (PST)
Date: Thu, 9 Mar 2023 09:56:17 -0500
From: Peter Xu <peterx@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com
Subject: Re: [PATCH] intel-iommu: Set status bit after operation completed
Message-ID: <ZAnzkfM8QSth9bXc@x1n>
References: <20230309092319.29229-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309092319.29229-1-zhenzhong.duan@intel.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Hi, Zhenzhong,

On Thu, Mar 09, 2023 at 05:23:19PM +0800, Zhenzhong Duan wrote:
> According to SDM 11.4.4.2 Global Status Register:
> "This field is cleared by hardware when software sets the SRTP field in the
> Global Command register. This field is set by hardware when hardware
> completes the ‘Set Root Table Pointer’ operation using the value provided
> in the Root Table Address register"
> 
> Follow above spec to clear then set RTPS after finish all works, this way
> helps avoiding potential race with guest kernel. Though linux kernel is
> single threaded in writing GCMD_REG and checking GSTS_REG.
> 
> Same reasion for GSTS_REG.TES

Is this a real bug?  Or, when it'll make a difference to the guest?

Thanks,

-- 
Peter Xu


