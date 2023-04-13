Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB416E14A6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 20:55:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn24e-0006In-Li; Thu, 13 Apr 2023 14:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pn24c-0006IM-Ff
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 14:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pn24a-00051o-NG
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 14:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681412011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JXyUljF9bgLZTg6YyNxbqPTonPHpSLO/af2Ao2SDtWM=;
 b=McxCVRyyWvxSgxloUDB24x5u8yYZGjY/E8dSueHVh+gfHX2tmCVE4WorhgvjuOnnhDwU5A
 vkBhUCXEPedkrdmn6t4kkMQy0cqzI7aTi/OoluJVZ/e+Dqimtvw+fA6Co7gqCHRs0w/C3a
 /mlMGoq4fm9cJiq4ZrzMAfGkyviypVs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-2xVLVg-NN5i73RKHngaNLQ-1; Thu, 13 Apr 2023 14:53:30 -0400
X-MC-Unique: 2xVLVg-NN5i73RKHngaNLQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-74a25fcda05so92602885a.1
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 11:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681412009; x=1684004009;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXyUljF9bgLZTg6YyNxbqPTonPHpSLO/af2Ao2SDtWM=;
 b=HBL3Hij6Zczmw82lYzIV8SS2XPxABCpI1HgAoPDZ/ZdrRwrv8FIaS6mJIrCd225Chy
 CkiOaVlElO/hVK6EHnnYSZOnFenPB5CUS/JZqLiZ11WyVAxttM9GCTnqZkcrdAY2LI0K
 5Ed/MDTETd+UVn5L8HbluZEAs2V3uroaCAnKhkL1V851E/CodqXgiWB4yE1ydFBYZP7c
 Y5QLSpeLZXi+0CVB+PAWtKFlqOpMW7QPbtF6MjpblZ7WNqhpiofMCsqZ7E7fWlReeQBk
 m2biH4P3JweWmlpnhKKB/zgwaY56QAuHnk0ogLTtkLHeCxkFwdctKb58pTG2JDWuyra7
 5FTg==
X-Gm-Message-State: AAQBX9fKLUBHzVVVs53cOSz4+VtdUycO67sDVq9sMr3TiiMweccucEXt
 0CxW2Q3+aSKt9mCgYLVoC9YVskx3qrrnf1Q88+WwubbNqO0G5b5XUG+d5UQq+lTD3n6pLUwqtRm
 chDCT6pX9SWnkmfc=
X-Received: by 2002:a05:6214:3016:b0:5ad:cd4b:3765 with SMTP id
 ke22-20020a056214301600b005adcd4b3765mr4992250qvb.1.1681412009633; 
 Thu, 13 Apr 2023 11:53:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350bRGhiqwM1LTNbtLjTV9l6oafJap5wDYKm1tCg0e1UBgfo2TALRoMsLv12YSY4obXQX4FnW3A==
X-Received: by 2002:a05:6214:3016:b0:5ad:cd4b:3765 with SMTP id
 ke22-20020a056214301600b005adcd4b3765mr4992231qvb.1.1681412009394; 
 Thu, 13 Apr 2023 11:53:29 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 m14-20020ad44d4e000000b005dd8b9345edsm606177qvm.133.2023.04.13.11.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 11:53:28 -0700 (PDT)
Date: Thu, 13 Apr 2023 14:53:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, david@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org
Subject: Re: [PATCH v3] memory: Optimize replay of guest mapping
Message-ID: <ZDhPp9MKLkll3dxl@x1n>
References: <20230413110019.48922-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230413110019.48922-1-zhenzhong.duan@intel.com>
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

On Thu, Apr 13, 2023 at 07:00:19PM +0800, Zhenzhong Duan wrote:
> On x86, there are two notifiers registered due to vtd-ir memory
> region splitting the entire address space. During replay of the
> address space for each notifier, the whole address space is
> scanned which is unnecessary. We only need to scan the space
> belong to notifier monitored space.
> 
> While on x86 IOMMU memory region spans over entire address space,
> but on some other platforms(e.g. arm mps3-an547), IOMMU memory
> region is only a window in the whole address space. user could
> register a notifier with arbitrary scope beyond IOMMU memory
> region. Though in current implementation replay is only triggered
> by VFIO and dirty page sync with notifiers derived from memory
> region section, but this isn't guaranteed in the future.
> 
> So, we replay the intersection part of IOMMU memory region and
> IOMMU notifier in memory_region_iommu_replay().
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


