Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B98D424390
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:58:48 +0200 (CEST)
Received: from localhost ([::1]:44242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAFj-0007qG-0D
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mYA95-0007Qk-Tm
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:51:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mYA90-0000qa-Co
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633539109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7bd07H+dcDMXRkOReOYLmI2lFDBv19Xtr9+wAQiRxw=;
 b=ILLHhnuWw6kT1wPdyYFDT9Kh1twFhGwsaii2obypv6NTBZBoVm2frJ2ctKBU7FFJfAcE29
 E8XHg39zB+mI4AwUx8doHHFZSjwafVZKE2zg/ivDCajd7ldGLjBye1xOjghbQEAigD9UoQ
 cYPgY1XJH5xmbzZbulJ2nnSAFYAx4ow=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-5X7mjZK1NNCoOxtdwv4wkg-1; Wed, 06 Oct 2021 12:51:48 -0400
X-MC-Unique: 5X7mjZK1NNCoOxtdwv4wkg-1
Received: by mail-wr1-f72.google.com with SMTP id
 m17-20020adffa11000000b00160c1ac74e9so2551382wrr.9
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 09:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=d7bd07H+dcDMXRkOReOYLmI2lFDBv19Xtr9+wAQiRxw=;
 b=ZtT8lU1Lvbww0jAsOuMxGaIivDScJ4H/X+eGQAHue4oyoghn89mmCBpzbF0ClNio6H
 O2ESySb8pqIAtYTlu6QtYwkPC6wIK9YLbZgOsf2cdATC/U6/KxdLkR1KywUhecFtzz3/
 7UmBPXEbiC2zmmXWDE9ICudy0esQIEgEOpP1nOCKxpRxR45tfvGnGWNuXakMX82dHnY5
 Fw2MBVsZtUczITkkc4RRo28Xsiy/fUhsTY1m78FfQh8bHjYb7C6fhpbUUwAIh/A7/VyR
 XNQal3jVXlciYsKZzkCU/nD5xuuYdKR9zuzbJ42rJiRugQoOJFkJn//sAJVu0JagPg+q
 W7tA==
X-Gm-Message-State: AOAM530DpOKIw8G5sUeYfCadck5a3Z8A0IGRis5pwGodnfQnzKRNAdLn
 WSm4/IDsJx8oUhu4VAajeHwkxc6ABCD7t1pgjB1tBLf1DHtsslt9gO6Eng1K73Q4UKSHJM091uv
 crPPc+JUSI5O0Ht4=
X-Received: by 2002:adf:8b5d:: with SMTP id v29mr28997787wra.175.1633539107341; 
 Wed, 06 Oct 2021 09:51:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf3cNOwS90KPYstkNym9J+divGvoJrBDNMWREcNrwbWDT/IhOWT5G8BOzpXv8Rgfcr4j5I3A==
X-Received: by 2002:adf:8b5d:: with SMTP id v29mr28997776wra.175.1633539107184; 
 Wed, 06 Oct 2021 09:51:47 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id x21sm6043934wmc.14.2021.10.06.09.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:51:46 -0700 (PDT)
Date: Wed, 6 Oct 2021 17:51:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 2/4] hw/scsi/scsi-disk: Use automatic AIO context lock
Message-ID: <YV3UIJFgdMrsiO/B@work-vm>
References: <20211005185807.4134557-1-philmd@redhat.com>
 <20211005185807.4134557-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005185807.4134557-3-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Use the automatic AIO context acquire/release in scsi_block_realize().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

I'll let the AIO people reply more thoroughly to this; but this patch is
the case I really like this mechanism for; removing the need for the
goto's and cleanup.

Dave

> ---
>  hw/scsi/scsi-disk.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index e8a547dbb7d..fa2d8543718 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -2605,7 +2605,6 @@ static int get_device_type(SCSIDiskState *s)
>  static void scsi_block_realize(SCSIDevice *dev, Error **errp)
>  {
>      SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
> -    AioContext *ctx;
>      int sg_version;
>      int rc;
>  
> @@ -2620,8 +2619,7 @@ static void scsi_block_realize(SCSIDevice *dev, Error **errp)
>                            "be removed in a future version");
>      }
>  
> -    ctx = blk_get_aio_context(s->qdev.conf.blk);
> -    aio_context_acquire(ctx);
> +    AIO_CONTEXT_ACQUIRE_GUARD(blk_get_aio_context(dev->conf.blk));
>  
>      /* check we are using a driver managing SG_IO (version 3 and after) */
>      rc = blk_ioctl(s->qdev.conf.blk, SG_GET_VERSION_NUM, &sg_version);
> @@ -2630,18 +2628,18 @@ static void scsi_block_realize(SCSIDevice *dev, Error **errp)
>          if (rc != -EPERM) {
>              error_append_hint(errp, "Is this a SCSI device?\n");
>          }
> -        goto out;
> +        return;
>      }
>      if (sg_version < 30000) {
>          error_setg(errp, "scsi generic interface too old");
> -        goto out;
> +        return;
>      }
>  
>      /* get device type from INQUIRY data */
>      rc = get_device_type(s);
>      if (rc < 0) {
>          error_setg(errp, "INQUIRY failed");
> -        goto out;
> +        return;
>      }
>  
>      /* Make a guess for the block size, we'll fix it when the guest sends.
> @@ -2661,9 +2659,6 @@ static void scsi_block_realize(SCSIDevice *dev, Error **errp)
>  
>      scsi_realize(&s->qdev, errp);
>      scsi_generic_read_device_inquiry(&s->qdev);
> -
> -out:
> -    aio_context_release(ctx);
>  }
>  
>  typedef struct SCSIBlockReq {
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


