Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CDE6E7CB4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 16:32:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp8pm-0006xN-6e; Wed, 19 Apr 2023 10:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pp8pa-0006ww-A4
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 10:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pp8pY-00052f-Ma
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 10:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681914642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dqxieNDQIsdSjpib1Mh/2bZlo6iqykgLpteKVWbQzGk=;
 b=Sv5wa8xGGZs09b3NxQEYeZpwCQ2PV3SemfH30h6iOF1S8uajvp4d+KM8ZcvN8p4moDNua/
 Kc3jswYjD3wEvGoS4PONfgIjDuabM+v7CHYPyB/uJO8Wcm+696cTUY7krNJSrMQDRm3mDV
 MWTMOJkaV+7r5C8k4G8rfLH2I/fRpp4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-xrEdYpT8PsaSRuWecfw_IQ-1; Wed, 19 Apr 2023 10:30:41 -0400
X-MC-Unique: xrEdYpT8PsaSRuWecfw_IQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef4d54d84cso5227216d6.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 07:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681914641; x=1684506641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqxieNDQIsdSjpib1Mh/2bZlo6iqykgLpteKVWbQzGk=;
 b=Bb4JA0col0Pe8f+f3pvykpI13F7hEpPUkJM/UlqRH/TWEE5L2NojGAFIA1iJLe3WgQ
 AYpoqFfFTCM2AHjyX175dw+R/pTGHhq03f2CHGveUUOYEm9ht6dSVhJAAky8itAcsNtb
 Fozdu28/A9rmlguVB0AUGg2Bu+cw4QBqi18LumMJEQtB2w9h7YIWADM3yz3feFeFOBFW
 u0L10qDgvnaP1ghnyMdRoNoVr57uKQleDabPzZnYwpaW2EP8LDHlTbMWokVJLy2KQUBC
 3Um7ZkFX9/ea9l1ubc4JglXJCaogTpJReHFrqm3fAr1LM/HlEWbrxwwcAfcavUihmLQq
 KYaQ==
X-Gm-Message-State: AAQBX9dY0UT2fluX8WcVFuHIWrdOvlgE0N3cxqDne/JK3v+eZmTc7Q+L
 8t1cperIM7RZnRnNYMGvJfYPTctX2qxL6w+fKZJh0ciyUuapFjBZfAj4Z9hd25eB885U6tFkhPO
 IoP3Z3qyCN3Hyqms=
X-Received: by 2002:a05:6214:5298:b0:5df:55b5:b1a with SMTP id
 kj24-20020a056214529800b005df55b50b1amr27043830qvb.4.1681914640669; 
 Wed, 19 Apr 2023 07:30:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350apnbJNWda20zuKQxN8ppH9l8Us685dlH84vFwFOk9FETy6WVQS+GypjPz+NtIKA2Olz1rYhA==
X-Received: by 2002:a05:6214:5298:b0:5df:55b5:b1a with SMTP id
 kj24-20020a056214529800b005df55b50b1amr27043793qvb.4.1681914640215; 
 Wed, 19 Apr 2023 07:30:40 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 d1-20020a0cf6c1000000b005ef593385e3sm3655632qvo.1.2023.04.19.07.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:30:39 -0700 (PDT)
Date: Wed, 19 Apr 2023 10:30:38 -0400
From: Peter Xu <peterx@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, david@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, chao.p.peng@intel.com
Subject: Re: [PATCH v4] memory: Optimize replay of guest mapping
Message-ID: <ZD/7DhgmVwb9/T5+@x1n>
References: <20230419102940.185968-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230419102940.185968-1-zhenzhong.duan@intel.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Apr 19, 2023 at 06:29:40PM +0800, Zhenzhong Duan wrote:
> On x86, there are two notifiers registered due to vtd-ir memory
> region splitting the entire address space. During replay of the
> address space for each notifier, the whole address space is
> scanned which is unnecessary. We only need to scan the space
> belong to notifier monitored space.
> 
> While on x86 IOMMU memory region spans over entire address space,
> but on some other platforms(e.g. arm mps3-an547), IOMMU memory
> region is only a window in the entire address space. User could
> register a notifier with arbitrary scope beyond IOMMU memory
> region. Though in current implementation replay is only triggered
> by VFIO and dirty page sync with notifiers derived from memory
> region section, but this isn't guaranteed in the future.
> 
> So, we replay the intersection part of IOMMU memory region and
> notifier's scope in memory_region_iommu_replay(). Update doc
> comment to match this change.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


