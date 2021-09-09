Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF7F404709
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:29:14 +0200 (CEST)
Received: from localhost ([::1]:60414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFQo-00033H-Qy
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mOFPq-0002FP-4E
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mOFPo-0004jq-7R
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631176091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7A8/bSlo3ZkBGsfKv/t1oKuAZoLR86R7JFB38qRH4e0=;
 b=StqxgE6SXkM8lAS4FFx78Yvr3eRieTJoz2Q+JHtUTJlTSrfSqcXuPjMNbWaIPpOc4IqHgg
 lcNVdztzFDefWbMzwd5Dli20kSXZMDv435ns8HfvAXefMjGsR/cmEJBH3pFo2XiG/G586/
 e3vi1eFbgi6wZNblgd0HtNl40LLusOY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-statzQYAPXayia8oj78qJQ-1; Thu, 09 Sep 2021 04:28:10 -0400
X-MC-Unique: statzQYAPXayia8oj78qJQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 y10-20020a056402270a00b003c8adc4d40cso589747edd.15
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 01:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7A8/bSlo3ZkBGsfKv/t1oKuAZoLR86R7JFB38qRH4e0=;
 b=QhU18QvaROjymUmjPb4MmYpEdeUnD2XbubJnz1WcACDMNxQGeg1g3GUNVE+NFy00CS
 SaKm11ZY5lIjnfeOU17+WcDg/baaEKC27tS87P5/2VGCXCWVT7LSUJrOlgA28UEqqEGj
 4Y7QdCkQnp7CVQisHV2JhydyMqhOqH8gJNMvrqAIcxrg94/XL2yS7oU2PAS/4qLITWJ9
 ds6oPUN9ScavXrnD5aQNc3NoOxcfEN2f3FZFEbhZGMRj6ScIInaUn5AvE6e8BsYyGI+4
 E5h/sp0ZQ1LRTPULFlu+9a2C63APcrok7ofI9QlTwSLLox3CKW/FFFleHB3/0vGOW3+a
 0CCg==
X-Gm-Message-State: AOAM531vPcJ8rMSNx6WgklAGdqaFIWluUwczS1IqNxJm3fcZWOP3qsvO
 3lNbiQrDDjB1B7aIWBPpw/Hr3IXyYcjMA2tHUxpimyEbFZcFiLXfwp/S1FOYbe8h2x0EdZ2lzmk
 +K5CxlukOz3CHWHg=
X-Received: by 2002:a05:6402:34c5:: with SMTP id
 w5mr1884507edc.67.1631176088922; 
 Thu, 09 Sep 2021 01:28:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz07HQdON38NCOYPxWKo/+Gg22XteuLzAKQAbd1YlBWlGIGbc1HVKvFBwG3E061O2/mjngGwQ==
X-Received: by 2002:a05:6402:34c5:: with SMTP id
 w5mr1884486edc.67.1631176088737; 
 Thu, 09 Sep 2021 01:28:08 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id jx21sm542534ejc.27.2021.09.09.01.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 01:28:08 -0700 (PDT)
Date: Thu, 9 Sep 2021 10:28:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v1 2/4] virtio: increase virtuqueue size for virtio-scsi
 and virtio-blk
Message-ID: <20210909082805.et2rf7gwfczqj64q@steredhat>
References: <20200129140702.5411-1-dplotnikov@virtuozzo.com>
 <20200129140702.5411-3-dplotnikov@virtuozzo.com>
 <20200130145840.GH180311@stefanha-x1.localdomain>
 <92f392e9-eb05-5c85-4d50-208110720a22@virtuozzo.com>
 <20200205111905.GE58062@stefanha-x1.localdomain>
 <683b80a8-0d40-7f14-e3f4-628d2b38037f@virtuozzo.com>
 <20210908131716.e6de722iibgn3y7y@steredhat>
 <20210908132203.vajs22vocelhlwwt@steredhat>
 <3b35a660-c577-42b6-d977-7b43c29452a6@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <3b35a660-c577-42b6-d977-7b43c29452a6@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org, mreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 06:20:49PM +0300, Denis Plotnikov wrote:
>
>On 08.09.2021 16:22, Stefano Garzarella wrote:
>>Message bounced, I use new Denis's email address.
>>
>>On Wed, Sep 08, 2021 at 03:17:16PM +0200, Stefano Garzarella wrote:
>>>Hi Denis,
>>>I just found this discussion since we still have the following 
>>>line in hw/core/machine.c:
>>>   { "vhost-blk-device", "seg_max_adjust", "off"}
>>>
>>>IIUC it was a typo, and I think we should fix it since in the 
>>>future we can have `vhost-blk-device`.
>>>
>>>So, I think we have 2 options:
>>>1. remove that line since for now is useless
>>>2. replace with "vhost-scsi"
>>>
>>>I'm not sure which is the best, what do you suggest?
>>>
>>>Thanks,
>>>Stefano
>
>Hi Stefano
>
>I prefer to just remove the line without replacing. This will keep 
>things exactly like it is now.
>
>Replacing with "vhost-scsi" will affect seg_max (limit to 126) on 
>newly created VMs with machine types using "hw_compat_4_2" and older.
>
>Now, because of the typo (error), their seg-max is queue-size 
>dependent. I'm not sure, if replacing the line may cause any problems, 
>for example on migration: source (queue-size 256, seg max 254) -> 
>destination (queue-size 256, seg max 126). But it will definitely 
>introduce two different behaviors for VMs with "hw_compat_4_2" and 
>older. So, I'd choose the lesser of two evils and keep the things like 
>it's now.
>

Yep, make sense. It was the same concern I had.

Do you want to send a patch to remove it with this explanation?

Thanks for the clarification,
Stefano


