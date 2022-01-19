Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD17493CC9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 16:17:49 +0100 (CET)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nACia-0002en-9a
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 10:17:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nACPG-0002rf-J2
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:57:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nACPD-0005Q7-FB
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642604264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dCxAr29pcIlZHwwdU/BBBUAH40iW7kxSUXnZgIJnv5g=;
 b=CkS8RTeQQ56p9InpOIRJaoae9VEtYx92M+bI+WR7XyN+UNWoaNVMSdYT87X1lsnc9eRtJw
 8Lci9Lb3HUGUmaFTQoETKA/BttZovJajHv+Fqx1q7DHRMGxTMudDbsesN8yOpd/V0IcO+E
 Q2eQ74yNpIjrS84j09NiEpA/NHHzaiA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-ltMGZ6LfPCadA3LfR8wNfg-1; Wed, 19 Jan 2022 09:57:41 -0500
X-MC-Unique: ltMGZ6LfPCadA3LfR8wNfg-1
Received: by mail-wm1-f72.google.com with SMTP id
 p7-20020a05600c1d8700b0034a0c77dad6so1893314wms.7
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 06:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dCxAr29pcIlZHwwdU/BBBUAH40iW7kxSUXnZgIJnv5g=;
 b=xqMiFWe9Dl8I/73rE1MChJ5Y61PhXmFxvl+t4hB12h521pO9QUlzqM3vRK1C/4HG86
 0+9Jg5sU8kvELc4XDz/l7Z6J/rg6KfYBl19OuNwaYi+Rkw8VspP7FhQlDbUz3zFFht9W
 DjhtFDYCI6qCCUB55k7+sO/lCAXiGo3HvlCJ45+2cpUF2SpOAvdCnow6UfHuLV/dFdfY
 S+emEXtnQILbQAQReMHp5H7mp4HS3MNTZ1EswQvPZLmujRuElOgSqt9WIS3GJBZQhrQT
 HeGu5dydv//XXOrl2EHHoLeHxQzf1NO/FbYKZZr2wK++E1yipABulJ4SY4dcHkxRDShR
 YK5A==
X-Gm-Message-State: AOAM5329CtiltAXSHA79ABvjBRmtZbOIH1q7ORhBq9Xgea7y7UqQ9l/i
 EBPU3Hic7h4BoIwsJqOW/tH8FiWeea+IKggfzlZr6o4JVYktv0zj8fyCdwJIthpvwYjQWGooxcM
 xG7KnFNBjZePiN1s=
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr24547649wrj.118.1642604260708; 
 Wed, 19 Jan 2022 06:57:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuB8AJmYhMOsQwjPD+9IpPzXQJB9pkzSmeX6ltCA8DTXGEom+6hTsirhg2XxpYBjSjXagwOg==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr24547631wrj.118.1642604260469; 
 Wed, 19 Jan 2022 06:57:40 -0800 (PST)
Received: from steredhat (host-95-238-125-214.retail.telecomitalia.it.
 [95.238.125.214])
 by smtp.gmail.com with ESMTPSA id g17sm7621923wmq.9.2022.01.19.06.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 06:57:39 -0800 (PST)
Date: Wed, 19 Jan 2022 15:57:35 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH V2 for-6.2 0/2] fixes for bdrv_co_block_status
Message-ID: <20220119145735.qkuxqnnfqws7xbme@steredhat>
References: <20220113144426.4036493-1-pl@kamp.de>
 <CAOi1vP9r3_aWPdvxWxcivC57f74G418=7esi6xd5ydBeOENmQQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOi1vP9r3_aWPdvxWxcivC57f74G418=7esi6xd5ydBeOENmQQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu block <qemu-block@nongnu.org>, Peter Lieven <pl@kamp.de>,
 Christian Theune <ct@flyingcircus.io>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 11:58:40AM +0100, Ilya Dryomov wrote:
>On Thu, Jan 13, 2022 at 3:44 PM Peter Lieven <pl@kamp.de> wrote:
>>
>> V1->V2:
>>  Patch 1: Treat a hole just like an unallocated area. [Ilya]
>>  Patch 2: Apply workaround only for pre-Quincy librbd versions and
>>           ensure default striping and non child images. [Ilya]
>>
>> Peter Lieven (2):
>>   block/rbd: fix handling of holes in .bdrv_co_block_status
>>   block/rbd: workaround for ceph issue #53784
>>
>>  block/rbd.c | 52 +++++++++++++++++++++++++++++++++++++++++++++-------
>>  1 file changed, 45 insertions(+), 7 deletions(-)
>>
>> --
>> 2.25.1
>>
>>
>
>These patches have both "for-6.2" in the subject and
>Cc: qemu-stable@nongnu.org in the description, which is a little
>confusing.  Just want to clarify that they should go into master
>and be backported to 6.2.

Yeah, a bit confusing. These are for 7.0, so @Kevin can these patches go 
with your tree?

I'd just add the fixes tag also in the patch 2. With that:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano


