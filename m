Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308683CBE0F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 22:52:52 +0200 (CEST)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4UpG-0005bK-On
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 16:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m4UoC-0004dP-Pb
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 16:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m4Uo8-0007LS-3j
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 16:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626468698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Z/+DqYXKg7rgSnXWfWgFb8itnKEENxcSWDpIl8yWWU=;
 b=YBjXwSI+8o2J4L/jQ1WGKswxKMpDAQDlESbCZutXHvEymVLzQimiq5DTo8WimBcQ3B/bzE
 7zo98IhUMQH7HLZi6IZX6CVNApbxTGfVigxEFrgCQcmls+dgiLLhq298G7bxhK/A/6ROGg
 XGh6LTOJgl+5lEeHXCN5H4e6jRp3IPY=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-VdiX4OPkNOK_9T5iZS2m_Q-1; Fri, 16 Jul 2021 16:51:36 -0400
X-MC-Unique: VdiX4OPkNOK_9T5iZS2m_Q-1
Received: by mail-oi1-f197.google.com with SMTP id
 n84-20020acaef570000b029022053bcedd7so7062458oih.17
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 13:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Z/+DqYXKg7rgSnXWfWgFb8itnKEENxcSWDpIl8yWWU=;
 b=KzLOJ2cWGYlEoKhv46S/av8Nyd5UaiNoL3EcpkLja9GsgwHILsr5LYm0jOfzDN3hRn
 jOhhcfEC5zyE505ML9o8R1+9C3yPIdPKSB9MEhVdsfhbciSeLtZIl8j6KQJYbi/mDm4b
 ZaQ5Hwad7TEEq/Yy4uBylWIJoAVVGYQ+1F5/NRSYJY0uaEC3/BL/VL0bWNcE8x/rIZyN
 op4Io2W67S0uALEy3cJNgiyoSeV0ag04tZnWJ1EhWBVoevygScwctXoF/b8bKw6OeCKq
 zpXMUJyo1zFSHPZngXJF5MeUlPqHchNx3FgB014aFGVsdi73ig+7ORtAPPzFpcNzX3UV
 WL5g==
X-Gm-Message-State: AOAM533EwWIWbcnU8h63LY9/iFXa0Qbh1uBdbkts07jcviG54bEysYMk
 R2WZ95KnnCtjbjBZGJqnv5Hj6xRpDB8dFp2dJXg61suyK6877xPyU4Y6s4QcmCGAOV5Ow+Y1mXn
 BMbWOqV9F4FWSpY8=
X-Received: by 2002:a9d:638d:: with SMTP id w13mr9459997otk.224.1626468695809; 
 Fri, 16 Jul 2021 13:51:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtbp1sB+9vJUoXyTRM2fYl7C78MgbpIWqFalm1eDovCnXrpQmdq5u7wsPha6bUAntHe81dkw==
X-Received: by 2002:a9d:638d:: with SMTP id w13mr9459978otk.224.1626468695608; 
 Fri, 16 Jul 2021 13:51:35 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id y28sm2141885oti.80.2021.07.16.13.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 13:51:35 -0700 (PDT)
Date: Fri, 16 Jul 2021 14:51:33 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V5 17/25] vfio-pci: cpr part 2
Message-ID: <20210716145133.4aa3f341.alex.williamson@redhat.com>
In-Reply-To: <1625678434-240960-18-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-18-git-send-email-steven.sistare@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  7 Jul 2021 10:20:26 -0700
Steve Sistare <steven.sistare@oracle.com> wrote:

> Finish cpr for vfio-pci by preserving eventfd's and vector state.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hw/vfio/pci.c | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 0f5c542..07bd360 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
...
> @@ -3295,14 +3329,91 @@ static void vfio_merge_config(VFIOPCIDevice
*vdev)
>      g_free(phys_config);
>  }
>  
> +static int vfio_pci_pre_save(void *opaque)
> +{
> +    VFIOPCIDevice *vdev = opaque;
> +    PCIDevice *pdev = &vdev->pdev;
> +    int i;
> +
> +    if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
> +        error_report("%s: cpr does not support vfio-pci INTX",
> +                     vdev->vbasedev.name);
> +    }

You're not only not supporting INTx, but devices that support INTx, so
this only works on VFs.  Why?  Is this just out of scope or is there
something fundamentally difficult about it?

This makes me suspect there's a gap in INTx routing setup if it's more
than just another eventfd to store and setup.  If we hot-add a device
using INTx after cpr restart, are we going to find problems?  Thanks,

Alex


