Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62146698B68
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 05:22:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSVmK-0000se-F5; Wed, 15 Feb 2023 23:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSVmH-0000sN-Jj
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 23:21:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSVmE-0006ka-Ta
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 23:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676521305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XIGHhk/c/IGbH8NnlBCGaj48hRQtG4WYz2TVMbhLHFM=;
 b=LfkcK5mjAC4efSTLsvZb8sEiwmXPJpMNM++hJsrsUTdMuVsaTA62jJn0wDCMdXmjCA5lY7
 1zLMIl8GoHXlB1XLeUPrTDdRVT/0jnTjtr7BXsH36NjtuA4kvADFJD8xVxz/8SCoNUG/LS
 2S9dkEjgw9pkJeGnHmihJorW/Mfk364=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-531-270NKnT_M3C0jS9GDhz6Ew-1; Wed, 15 Feb 2023 23:21:43 -0500
X-MC-Unique: 270NKnT_M3C0jS9GDhz6Ew-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-16dc25dcbedso561405fac.15
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 20:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XIGHhk/c/IGbH8NnlBCGaj48hRQtG4WYz2TVMbhLHFM=;
 b=DP7WWAY33bZNZay9jlgZvZ596P37xf9rpK4ykLu6IyRaprcNTKOTQNxMtQ7SJdPzAi
 ebotSnC4+kzp6cBeyEIaH1h8fjaJhECVvq4DLCZ+8Qo5s+AixEOyRp3SaWglbLd4zvME
 97MvWdBukxeAXm6YJEJE5pbdjoo7mUevl17rrGWV+irYYm8EFY9CA8xAY9uoopY5fjbC
 rh+VDO8Dxb7vTrK8SfBU1n7YFS59gFRlPjk0A2nXj5cx5qbPC8czlhi1WZTdahJ8gSyN
 geKggGxtU3PGfqlzhUoMCbwd2063S42B5zHNhSvr/lg0AP2CDjbizt/pSC7p3edKyrKw
 rT0w==
X-Gm-Message-State: AO0yUKXAroXXsGpMaBetJk83dRla4upGJCQ5iqTw+g5tt3NAspk2sA4o
 qP5zriGzOrXTxA1ZUUbGwMG/gKsn4cqemFsalvX7/L5dFQNZadJ2J4L5oc+oP06Hmv+iltjRsAj
 qJ86HCXREn4N4bArjPMp1u8hmXM05btQ=
X-Received: by 2002:a05:6871:84ca:b0:16a:2c1a:e416 with SMTP id
 sw10-20020a05687184ca00b0016a2c1ae416mr58316oab.35.1676521302904; 
 Wed, 15 Feb 2023 20:21:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+qpYFPn59b+dCLBtIoUOYefjw1bjAF7y1KGhV3+1JaWgTdtb+pZ4O65zBG7SKgg4VCbZi9miIQD4p4vNg7NIg=
X-Received: by 2002:a05:6871:84ca:b0:16a:2c1a:e416 with SMTP id
 sw10-20020a05687184ca00b0016a2c1ae416mr58309oab.35.1676521302664; Wed, 15 Feb
 2023 20:21:42 -0800 (PST)
MIME-Version: 1.0
References: <20230215065238.713041-1-zhenzhong.duan@intel.com>
 <Y+zwNWjAoeWKp23N@x1n>
In-Reply-To: <Y+zwNWjAoeWKp23N@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Feb 2023 12:21:31 +0800
Message-ID: <CACGkMEtfu+sWjg+c1K4MOgewHEZ1x-0V4RkhCNdaw21BJXJs-Q@mail.gmail.com>
Subject: Re: [PATCH v2] memory: Optimize replay of guest mapping
To: Peter Xu <peterx@redhat.com>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 mst@redhat.com, 
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, david@redhat.com, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Wed, Feb 15, 2023 at 10:46 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Feb 15, 2023 at 02:52:38PM +0800, Zhenzhong Duan wrote:
> > On x86, there are two notifiers registered due to vtd-ir memory region
> > splitting the whole address space. During replay of the address space
> > for each notifier, the whole address space is scanned which is
> > unnecessory.
> >
> > We only need to scan the space belong to notifier montiored space.
> >
> > Assert when notifier is used to monitor beyond iommu memory region's
> > address space.
> >
> > Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>
> Acked-by: Peter Xu <peterx@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> --
> Peter Xu
>


