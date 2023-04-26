Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ABC6EF645
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 16:21:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prg0T-0001VX-2c; Wed, 26 Apr 2023 10:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prg0R-0001VL-Qy
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 10:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prg0Q-00078H-8u
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 10:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682518822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LXaPFUqpbD0RkLxwdK76aRaEGq9SIJiSAGWE5uIugr0=;
 b=FfJKHgSOA7Opoq2TGpAagUcy37Mgdde4b/K+mLUyKbApny/LaOdDMLdD/21YdPDX1eL4xQ
 TGfuig3l+EfCC+47wzDUN3RQ/HchLigpCFvWietPiNOdNQ7VjLlk+aJnK9Tmq9BQ44NNy/
 suZ52mI8jRthWaxk2M73mT5C4Gi+FOw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-ZQWauRnbO-WiYksy4mSvSg-1; Wed, 26 Apr 2023 10:20:20 -0400
X-MC-Unique: ZQWauRnbO-WiYksy4mSvSg-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-5ef52d3474bso4862216d6.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 07:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682518820; x=1685110820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXaPFUqpbD0RkLxwdK76aRaEGq9SIJiSAGWE5uIugr0=;
 b=JbRZhmd2aUEdlGSVRBmvQXty7OAHP3+LJ87pQU9ZXdIk+nlLGUD8DIA9P1UflhNh74
 opjNupESXlK92I7ziCKwrTTbZM163ou7V1llLrlTrLAHxPEnX1eeaej3rWe/ZMsahhC4
 KaBLKEXq5Ecsp4kXvfR6n4QkQyZP/T7s7Dg85x6fibQy83hciL0jRIjPNY/rTdIFo1j1
 2x01Bmj3ntUvOXgR/QN+4HpI+sf73e6pNrW+2VvPhssbS32BXwAtdq7/OUunzPdmLbaV
 qq54Hp811RxFdpo5tDXHHdENugtxJu82GrIO1Gogl7MvT9x/60LFNurLaYUxqvSS9H3H
 5GRQ==
X-Gm-Message-State: AC+VfDx/msjoE28szDF9rcMFmuJjR1mjlxvY040s/fW+lQKkTmEYRnPB
 M57DLll6lT/trUzf3Y8YQvDZZKMwXRp0JMlNLgUyjUIjkFaMyHf11bKt1J1MUc6+szwwpv0En6z
 WYSRjaunNEvGVNXo=
X-Received: by 2002:a05:6214:508c:b0:5ed:c96e:ca4a with SMTP id
 kk12-20020a056214508c00b005edc96eca4amr9096140qvb.1.1682518820076; 
 Wed, 26 Apr 2023 07:20:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7vYkJFZcYvTOaH9KAa43YH62O3/P3m2V1GpzQ4f3lYyE3w4rRzqfvO6221OAKxwwJ8YrmehQ==
X-Received: by 2002:a05:6214:508c:b0:5ed:c96e:ca4a with SMTP id
 kk12-20020a056214508c00b005edc96eca4amr9096118qvb.1.1682518819856; 
 Wed, 26 Apr 2023 07:20:19 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 o14-20020a0ccb0e000000b005ef442226bbsm4860933qvk.8.2023.04.26.07.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:20:19 -0700 (PDT)
Date: Wed, 26 Apr 2023 10:20:18 -0400
From: Peter Xu <peterx@redhat.com>
To: Viktor Prutyanov <viktor@daynix.com>
Cc: mst@redhat.com, jasowang@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 qemu-devel@nongnu.org, yan@daynix.com, yuri.benditovich@daynix.com
Subject: Re: [RFC PATCH 3/4] memory: add interface for triggering IOMMU
 notify_flag_changed handler
Message-ID: <ZEkzIj017GA3OMMc@x1n>
References: <20230424112147.17083-1-viktor@daynix.com>
 <20230424112147.17083-4-viktor@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230424112147.17083-4-viktor@daynix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Apr 24, 2023 at 02:21:46PM +0300, Viktor Prutyanov wrote:
> +void memory_region_iommu_notify_flags_changed(MemoryRegion *mr)
> +{
> +    IOMMUMemoryRegion *iommu_mr;
> +
> +    if (mr->alias) {
> +        memory_region_iommu_notify_flags_changed(mr->alias);
> +        return;
> +    }
> +    iommu_mr = IOMMU_MEMORY_REGION(mr);
> +    memory_region_update_iommu_notify_flags(iommu_mr, NULL);

Do we still want to trap the error if the update failed?

The other question: whether vhost can simply use the existing register /
unregister calls for iommu notifiers, rather than modifying the flags on
its own?  I'd assume this happens very rare anyway.  Or is there other
concerns?

-- 
Peter Xu


