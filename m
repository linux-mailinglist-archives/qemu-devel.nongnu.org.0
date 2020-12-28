Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A07B2E3700
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 13:12:44 +0100 (CET)
Received: from localhost ([::1]:51740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktrOE-00065S-TJ
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 07:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ktrMK-000557-7g
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 07:10:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ktrMH-0000Ji-Br
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 07:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609157439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f2qLjn2szjEJbyUsN17OtZQZWI6GfDY9C7+l7kZF27g=;
 b=JDKoY7NgNN7/CtBjyRwvpGPMgGHc+jiI5gKQtc52jybwsUbRKIXNrTmemDWkaXoS3ZArbe
 XfSdFyxDlCEVDjmWmOmfIxjWxtwcF8RHALI9A5aKWdI0QuszABHJ/Wf6A5HOJreyBorRDj
 X2Umsx+R0y8FuePFEBat5JmAA5xSve0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-FBQtM4diO0W8-NMS3w2MGw-1; Mon, 28 Dec 2020 07:10:37 -0500
X-MC-Unique: FBQtM4diO0W8-NMS3w2MGw-1
Received: by mail-wr1-f72.google.com with SMTP id g16so6375628wrv.1
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 04:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f2qLjn2szjEJbyUsN17OtZQZWI6GfDY9C7+l7kZF27g=;
 b=H+WcyrCuYVnvnhVYkQGBYQTrkrhAeVkjZeX7KhevxbwQy11j/BdC9Q252kSOzKLUKr
 nYCI24/tNjv8JBsANhkrlFzBEHhPHTPcBB4OH44zo0gly0x0zWD2T4zcWQ6I92U3OG1n
 3VJKyscB67kfQtowjAoMdDFtYsTcGLkIfNhCEz5QOuCcRnZsHAbd6m0FCkG0d895BZtE
 +SRhnfR/MZrVEhAeiin40ZcH2i3/ATBLLbUSw7l4t9jG3fdYGQkjDOFymv42akcoygol
 FjKqMxKLAHnuL6DvRnlSwko7CnBo3HU1n9NUNN1/YTI8LJ9RcDiC+fyLvl9k9UhdvCTk
 veLg==
X-Gm-Message-State: AOAM531oMH9tKFLpB3yl8Dy6W/5VEWJ+48AOwJJyK9KIf2Q7kvYaihYN
 Ssui0/8CfhbedOlWhua1CYv+deyBBlLKA/J9YM0zi/aE4ax56wdgSCTCeWEd03kp/0L9V75zF0W
 QW8uuW3k9wSu1+iI=
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr19579730wmb.15.1609157436712; 
 Mon, 28 Dec 2020 04:10:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuMoDKe6Ye1VZgHjhcxp03QVFGy8nWmR+GicU77lvIe2ykJGlWuebvtwFlDPusNeWlEM1OGw==
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr19579704wmb.15.1609157436523; 
 Mon, 28 Dec 2020 04:10:36 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id z22sm19067022wml.1.2020.12.28.04.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 04:10:34 -0800 (PST)
Date: Mon, 28 Dec 2020 07:10:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: g00517791 <gaojinhao@huawei.com>
Subject: Re: [PATCH v2 1/3] spapr_pci: Fix memory leak of vmstate_spapr_pci
Message-ID: <20201228071024-mutt-send-email-mst@kernel.org>
References: <20201228090053.346-1-gaojinhao@huawei.com>
 <20201228090053.346-2-gaojinhao@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201228090053.346-2-gaojinhao@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.178,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 28, 2020 at 05:00:51PM +0800, g00517791 wrote:
> From: Jinhao Gao <gaojinhao@huawei.com>
> 
> When VM migrate VMState of spapr_pci, the field(msi_devs) of spapr_pci
> having a flag of VMS_ALLOC need to allocate memory. If the src doesn't free
> memory of msi_devs in SaveStateEntry of spapr_pci after QEMUFile save
> VMState of spapr_pci, it may result in memory leak of msi_devs. We add the
> post_save func to free memory, which prevents memory leak.
> 
> Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/ppc/spapr_pci.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 76d7c91e9c..1b2b940606 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2173,6 +2173,16 @@ static int spapr_pci_pre_save(void *opaque)
>      return 0;
>  }
>  
> +static int spapr_pci_post_save(void *opaque)
> +{
> +    SpaprPhbState *sphb = opaque;
> +
> +    g_free(sphb->msi_devs);
> +    sphb->msi_devs = NULL;
> +    sphb->msi_devs_num = 0;
> +    return 0;
> +}
> +
>  static int spapr_pci_post_load(void *opaque, int version_id)
>  {
>      SpaprPhbState *sphb = opaque;
> @@ -2205,6 +2215,7 @@ static const VMStateDescription vmstate_spapr_pci = {
>      .version_id = 2,
>      .minimum_version_id = 2,
>      .pre_save = spapr_pci_pre_save,
> +    .post_save = spapr_pci_post_save,
>      .post_load = spapr_pci_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT64_EQUAL(buid, SpaprPhbState, NULL),
> -- 
> 2.23.0


