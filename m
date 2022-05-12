Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906BB5256E1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 23:13:44 +0200 (CEST)
Received: from localhost ([::1]:41414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npG7z-0002QP-AA
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 17:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1npG6S-0000xg-Kp
 for qemu-devel@nongnu.org; Thu, 12 May 2022 17:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1npG6F-0008ED-Dl
 for qemu-devel@nongnu.org; Thu, 12 May 2022 17:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652389903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hig6egQqhVn2xc1lkLDZdMC/5/yoreUXgRQbz6p2SUc=;
 b=DQzrVWAv2Mfu/5Q2ZeQKIbcKN+JxgEazw5v3J3b2z8h0QVAhM4ZU721fGT0ctpCinY0zBD
 1tkAwJ6dTH+Fiijbix3vusxIJYA6NAe3kc9ijGEpWwkbcnOnbEsMgOh42kHmodX5sjN45d
 UY+aEbzhAcN8B9QAj8pNpKq6EHQYwXw=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-Ct0FSzDZNG-lX5hvXZUa0A-1; Thu, 12 May 2022 17:11:42 -0400
X-MC-Unique: Ct0FSzDZNG-lX5hvXZUa0A-1
Received: by mail-io1-f70.google.com with SMTP id
 o4-20020a0566022e0400b0065ab2047d69so3769021iow.7
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 14:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=hig6egQqhVn2xc1lkLDZdMC/5/yoreUXgRQbz6p2SUc=;
 b=h01z4gNkj6WpIHiS3SNf1nHXBwwC4hF+iVkRbizPb0VG37euQ2P7p3UVEGdAMHOC3/
 TBRtBIneYKlTCOzRj88jmiU4hGAdhesYGuLUyaMBWjVSkuX5Ji3ZcqaeLRiJOJrI9LFr
 VEebdYAk5ZDuroa/CdvhevAeYgpwo/FOT5xYyklfP82wZmT00rZrqzummO0uPfMnz4lW
 xZcr6kdhovqOjYWczDHfDBaF/HgdOQTyMcD2KD3UKT8IRiuakHyTFX3XFiKtCeeHgYVL
 LRXh7Dpk8u9TCbVrrT62ePgoYT3vxzYJ8trp2cxfP/WnP0fXhmfRx2SXM2YbT6xy0UHC
 Le3g==
X-Gm-Message-State: AOAM533MMBrW6PPeJhMRBSKWYhituT5oB8TceFkijNySvONr3VSxpKWY
 JbjE+3HJYN4wp8GtnYKjawIpKAOy5ez4JgQ5/07ZNVtbAPAemvLPEr5rrLm6zOqaWShcqVwSwA0
 T7ISjWnt7f+9k2Zg=
X-Received: by 2002:a5d:81c6:0:b0:657:bdca:866e with SMTP id
 t6-20020a5d81c6000000b00657bdca866emr906267iol.178.1652389901661; 
 Thu, 12 May 2022 14:11:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmeer3RZ4gQzOw66qte7WHZLS60/+cmifhQLjGO7GhUax5KH4WbcVl+JRvHW/4ASIRC82Tzg==
X-Received: by 2002:a5d:81c6:0:b0:657:bdca:866e with SMTP id
 t6-20020a5d81c6000000b00657bdca866emr906250iol.178.1652389901413; 
 Thu, 12 May 2022 14:11:41 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 s21-20020a02c515000000b0032b3a78179bsm166494jam.95.2022.05.12.14.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 14:11:40 -0700 (PDT)
Date: Thu, 12 May 2022 15:11:40 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org, "Michael S .
 Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 2/9] vfio: Fix compilation errors caused by VFIO
 migration v1 deprecation
Message-ID: <20220512151140.0de06d87.alex.williamson@redhat.com>
In-Reply-To: <20220512182532.GG1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-3-avihaih@nvidia.com>
 <20220512115710.413c7e34.alex.williamson@redhat.com>
 <20220512182532.GG1343366@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 May 2022 15:25:32 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, May 12, 2022 at 11:57:10AM -0600, Alex Williamson wrote:
> > > @@ -767,9 +767,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
> > >      case MIGRATION_STATUS_CANCELLED:
> > >      case MIGRATION_STATUS_FAILED:
> > >          bytes_transferred = 0;
> > > -        ret = vfio_migration_set_state(vbasedev,
> > > -                      ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
> > > -                      VFIO_DEVICE_STATE_RUNNING);
> > > +        ret = vfio_migration_set_state(
> > > +            vbasedev,
> > > +            ~(VFIO_DEVICE_STATE_V1_SAVING | VFIO_DEVICE_STATE_V1_RESUMING),
> > > +            VFIO_DEVICE_STATE_V1_RUNNING);  
> > 
> > Yikes!  Please follow the line wrapping used elsewhere.  There's no need
> > to put the first arg on a new line and subsequent wrapped lines should
> > be indented to match the previous line, or at least to avoid wrapping
> > itself.  Here we can use something like:  
> 
> This is generated by clang-format with one of the qmeu styles, it
> follows the documented guide:
> 
>  In case of function, there are several variants:
> 
>  - 4 spaces indent from the beginning
>  - align the secondary lines just after the opening parenthesis of the
>    first
> 
> clang-format selected the first option due to its optimization
> algorithm.
> 
> Knowing nothing about qmeu, I am confused??

Maybe someone needs to throw more AI models at clang-format so that it
considers the more readable option?  QEMU does a lot wrong with style
imo, and maybe it's technically compliant as written, but I think what
I proposed is also compliant, as well as more readable and more
consistent with the existing file.  Thanks,

Alex


