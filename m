Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B366FC840
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:55:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwNo4-0003pI-DQ; Tue, 09 May 2023 09:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pwNnj-0003o3-H8
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:54:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pwNne-0006kB-9H
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683640466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ieu2W0LwZkdFvunvBHXBDrEVo8kXje6p4DL7flvT/Po=;
 b=HWczVyCjJW1/Qntw+kk2Ijd6Cyi+7ak5Fu/WPGCYAJuTWWB5jwvqoFjhU+mTwiSEkdPHuv
 IWCKOwAOPu+pWdZEyfxPVG3w877CDRJD5OS/Bu+1riqvD31ii1bOXymqBGrb92NSbhfJZC
 ZWbMSrpN1XBrqwSoQPehXOAp2DWySas=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-eAiqd-76NmOis8mk4AhFAw-1; Tue, 09 May 2023 09:54:12 -0400
X-MC-Unique: eAiqd-76NmOis8mk4AhFAw-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6439df6c10eso991512b3a.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 06:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683640451; x=1686232451;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ieu2W0LwZkdFvunvBHXBDrEVo8kXje6p4DL7flvT/Po=;
 b=CoEu+hB+K/Fins0SL8F24K4lH1pNiQQtbkhLsbb8zsQ5LdlVfWL0wqsZ6cfSM7dBui
 yyhfxf1GBgDOIQhVnnBNGaW19LqwytdjNzezrCtMXZRiTlpnD5v/T7NM9o7+dn/2Afdm
 yOm5ioCYHHnQsCKSdz9KRWIV/dbMCJPMW0i7RuNQMDKMK8aLFI0bRfr4nYYnuFdxtWGL
 /pO3RD5tbuL2miRcZpP0O3bBIGdpCP9V1ICnij0jDN9K7S34vNb9mAedqhl+/JzPV9qn
 eIqjT2ZUEkSuzyClAjUw5W0xY9rFOpi4n0WhqlC4W7nmPpIbRTfUkff3By6iqkFkYI1u
 ukwQ==
X-Gm-Message-State: AC+VfDwD/DZcpuidkwR+ikQkOFVDtia/hlLTTbtD6gnBZuUMoP9qcerz
 zEn1NR8Uhune9dnPvTvLf5FYRNh2bzBlMnvmxz6OsgHQauTlrtiXY5RFTV1RzUYmCjoLsfXLhB3
 vYiVCKqwBlXADhN8=
X-Received: by 2002:a05:6a00:1f17:b0:646:78fe:f889 with SMTP id
 be23-20020a056a001f1700b0064678fef889mr5263746pfb.2.1683640451659; 
 Tue, 09 May 2023 06:54:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4nFc3CeIP7yedy2xB1Hbj6iCxcGy/TPJcBqdYZktCwHNYLIJzgF2kRl/wNKACUV82WCqG10g==
X-Received: by 2002:a05:6a00:1f17:b0:646:78fe:f889 with SMTP id
 be23-20020a056a001f1700b0064678fef889mr5263701pfb.2.1683640451231; 
 Tue, 09 May 2023 06:54:11 -0700 (PDT)
Received: from x1n ([64.114.255.114]) by smtp.gmail.com with ESMTPSA id
 x11-20020a056a00270b00b00636c4bd7c8bsm1789913pfv.43.2023.05.09.06.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 06:54:10 -0700 (PDT)
Date: Tue, 9 May 2023 06:54:09 -0700
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, maz@kernel.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v3 4/4] kvm: Enable dirty ring for arm64
Message-ID: <ZFpQgbiyOq2Eu82I@x1n>
References: <20230509022122.20888-1-gshan@redhat.com>
 <20230509022122.20888-5-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509022122.20888-5-gshan@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, May 09, 2023 at 12:21:22PM +1000, Gavin Shan wrote:
> arm64 has different capability from x86 to enable the dirty ring, which
> is KVM_CAP_DIRTY_LOG_RING_ACQ_REL. Besides, arm64 also needs the backup
> bitmap extension (KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP) when 'kvm-arm-gicv3'
> or 'arm-its-kvm' device is enabled. Here the extension is always enabled
> and the unnecessary overhead to do the last stage of dirty log synchronization
> when those two devices aren't used is introduced, but the overhead should
> be very small and acceptable. The benefit is cover future cases where those
> two devices are used without modifying the code.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


