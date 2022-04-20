Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4020D509114
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:07:10 +0200 (CEST)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGbW-0006ej-2p
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhG2p-0007BD-Hx
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhG2o-0005VM-0R
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650483077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PusxrFTcwRuptEwC3TNHdawycxmvN8Mn9UdKmlINyQI=;
 b=aHLUC0T2QVayceMQa1Ex9dZU6zueTSo/ELkzr7tWCu5rcG1VOGK1Rr2GbacreMLJ/lAyn8
 PGaZaIE8BUchl1wTu/fksDK0Nz0udrM2HIrRhD6Zb47sjqQu9vySO6cvKF3vyhOiU0HlYa
 NB8j5lan4WDLBZDbHGEzei0rxT/tZa8=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-GoqpYaEqOn6NmQ-7cHlLhQ-1; Wed, 20 Apr 2022 15:31:15 -0400
X-MC-Unique: GoqpYaEqOn6NmQ-7cHlLhQ-1
Received: by mail-io1-f72.google.com with SMTP id
 k20-20020a5e9314000000b00649d55ffa67so1830793iom.20
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PusxrFTcwRuptEwC3TNHdawycxmvN8Mn9UdKmlINyQI=;
 b=5BJfl8oxEGhbL4G4VtXR6PTGIP7MDB2Ljngv+/Im11X8sA9I4m8fUFcJ/ufcPOOJhF
 PPdNJeYI6ZRXDElLdAZqNLVb4y7NKeDLND2kNlpElKS64KC4EZwA8jtJeQx/J1ETm0Dy
 jrH+E1ZVgw7DJAcLFrTm9sKK+XpdrYy0kp+1FMNGjbBxfHUwXN6tkfAHVAG9S2qqqAi1
 Re6j9J/ghcbSY6M0zfN7iK9cm4y4P2m3Xiski539JM9B3hx4D+x+ar5/RPjIBgzUwjoY
 736XSS6FGpyhTfqEDERTsXe1075SlG3cQd+CCVlvGG6OVtq1RmIED17zUYgQBWKmdq9s
 sVxA==
X-Gm-Message-State: AOAM532CwAGYUWlmNocwMwtd3eqkTZSg4xLuUgAquBPXOWycMmDpt56m
 AMZmECUHLkel7uL2SZuKRS8gChBtcY/KPmAtjfDRSCoQKEB5dRvfSGLbjQdEM4v1WMtoPFZmLMO
 Y22lHFXFFT9BmXvc=
X-Received: by 2002:a02:2acf:0:b0:328:75cd:8558 with SMTP id
 w198-20020a022acf000000b0032875cd8558mr8733366jaw.162.1650483074135; 
 Wed, 20 Apr 2022 12:31:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEF6ygWXt5QCg2lYIwWhOYx0e0GqPQdMH0G2ucI3vFRDdzio5/VTUJYNym02r6B43FfVAPQA==
X-Received: by 2002:a02:2acf:0:b0:328:75cd:8558 with SMTP id
 w198-20020a022acf000000b0032875cd8558mr8733351jaw.162.1650483073613; 
 Wed, 20 Apr 2022 12:31:13 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a056e021bc300b002cc507aacddsm2743413ilv.66.2022.04.20.12.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:31:13 -0700 (PDT)
Date: Wed, 20 Apr 2022 15:31:12 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 08/19] migration: Add postcopy-preempt capability
Message-ID: <YmBfgO3P32Cy8m1p@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-9-peterx@redhat.com>
 <Yl/lsONHuNRiD+Ox@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/lsONHuNRiD+Ox@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 11:51:28AM +0100, Daniel P. Berrangé wrote:
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index 18e2610e88..3523f23386 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -463,6 +463,12 @@
> >  #                       procedure starts. The VM RAM is saved with running VM.
> >  #                       (since 6.0)
> >  #
> > +# @postcopy-preempt: If enabled, the migration process will allow postcopy
> > +#                    requests to preempt precopy stream, so postcopy requests
> > +#                    will be handled faster.  This is a performance feature and
> > +#                    should not affect the correctness of postcopy migration.
> > +#                    (since 7.0)
> 
> Now 7.1

Fixed.

> 
>   Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks,

-- 
Peter Xu


