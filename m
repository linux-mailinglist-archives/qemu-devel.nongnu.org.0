Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16360697EB3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:47:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJ3P-0001Ip-Sd; Wed, 15 Feb 2023 09:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pSJ37-0001HS-SQ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:46:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pSJ35-0000uq-8s
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676472378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mLtH8cz/P/gG4rI0G3MBvBo27JNf8WN8CwuBWAX4e0w=;
 b=aMOKCyxEAF3EnFq4beO1g108yMIufDFki7NDsfuRjCv2HVanp5xHc0i6Rxr2EASfsbEHGF
 ZKGu8vXY2qjVpuC2Qm4VPfGzpvkdJFNS8kGk1NrVfp5JZ0PxfvmBy2qOZIAoc7zUOFhdXE
 J9B7AwhPCtNVHvxMFERNrRvQBcGaHDY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-sc1lf7ifMJauceKVABUh9w-1; Wed, 15 Feb 2023 09:46:16 -0500
X-MC-Unique: sc1lf7ifMJauceKVABUh9w-1
Received: by mail-qv1-f70.google.com with SMTP id
 dz7-20020ad45887000000b0056e9274a7e1so8579326qvb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 06:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLtH8cz/P/gG4rI0G3MBvBo27JNf8WN8CwuBWAX4e0w=;
 b=d8XToGjr4oasQAPNRBAik6iSlzC1shTV8DqI2P8KYACeSB6tjj5yU0BzQYih7+8IoG
 0pasym/uBUszM57Jh+wndAka2JeOfASRMb+IBEeLuog6lJnmN5zAKBhF4mD5s9Jm/k/l
 hYl5HWgoVZsoFsy4YfTRp1QW+SiqJdqx56Ohzhq+pJR9hW1gcXJFENmxD4g/2eQkVsN8
 BGPOgQWSCmlSjJm3z301Pd6qvXLN6KwugHPDaUK3OD7l/jVwXo8QNU6SJfUJ455QUZRh
 46PFYPLyBisBYZVBViFGLN/drb1fydxNQhejj0MvoF1pus0o2zZTSo1Fks8OH260bKeh
 6uGw==
X-Gm-Message-State: AO0yUKU4cKlvERL04XhwCgXRYGltJdH8V11/Oe9oqnwMr83xcFwbCO3c
 aVJjTD0wjRanjg/brA0j7KagJBsLTf01wWQw1Xm+cCurpo5bhITuF+kEKCA48U8fc5JmGooyRI+
 OcsOTxZNo09oHiMA=
X-Received: by 2002:a0c:cc09:0:b0:56e:99ea:966c with SMTP id
 r9-20020a0ccc09000000b0056e99ea966cmr3505368qvk.4.1676472376020; 
 Wed, 15 Feb 2023 06:46:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/winVTNts1UrvCkChar7jxNj4RwoI7i1IxK9O7YnLWhAAFuhwsScvie0WwpqdEQfMz169PFQ==
X-Received: by 2002:a0c:cc09:0:b0:56e:99ea:966c with SMTP id
 r9-20020a0ccc09000000b0056e99ea966cmr3505336qvk.4.1676472375735; 
 Wed, 15 Feb 2023 06:46:15 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 t66-20020a374645000000b007203bbbbb31sm14103195qka.47.2023.02.15.06.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 06:46:14 -0800 (PST)
Date: Wed, 15 Feb 2023 09:46:13 -0500
From: Peter Xu <peterx@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, david@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH v2] memory: Optimize replay of guest mapping
Message-ID: <Y+zwNWjAoeWKp23N@x1n>
References: <20230215065238.713041-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215065238.713041-1-zhenzhong.duan@intel.com>
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

On Wed, Feb 15, 2023 at 02:52:38PM +0800, Zhenzhong Duan wrote:
> On x86, there are two notifiers registered due to vtd-ir memory region
> splitting the whole address space. During replay of the address space
> for each notifier, the whole address space is scanned which is
> unnecessory.
> 
> We only need to scan the space belong to notifier montiored space.
> 
> Assert when notifier is used to monitor beyond iommu memory region's
> address space.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


