Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61944D2BB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:52:40 +0100 (CET)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4sx-000285-QZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:52:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml4rf-0000SH-3F
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:51:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml4rb-0000hy-KF
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636617074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RvYm/suclu5pbruiskiFZG7pIwINSbA+jbYSAl+g7cY=;
 b=NnUCI4bxSrbokXJ/BCa/zqTPxf+o8+3tpHS0ewSJUyzL3dqbFo5p/efL6CjQDIaxcN0thP
 bHXtyQpttOgIMbE43SLAljdinzGc2kB3Uk6DNS1YLdd2SDlCH+ZgweWj0i49rKbDbMfRHf
 XVMn67RjcoQ2m6AjqPgbKItxA27g7xc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-vQ9mVN3fPjWnAJE5F0aknQ-1; Thu, 11 Nov 2021 02:51:13 -0500
X-MC-Unique: vQ9mVN3fPjWnAJE5F0aknQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 g81-20020a1c9d54000000b003330e488323so1571097wme.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 23:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RvYm/suclu5pbruiskiFZG7pIwINSbA+jbYSAl+g7cY=;
 b=bkM9AHw4Z4ctoYZHvb3Ecmf7le9xxib0nSxHkMtj2PGVaOp+CT6eBDExN4SU1YseOS
 /n5pisFcT/cOZpaS3sQRvn6jRbq6l9pss/DNcFY7aeI+Yx0Q8f26VwhGPWwM9NsT3ZzO
 BJu06Fv7qnn6upwpWTuN9+vYFJ+ssQ5e/sGYZI2fmy+MSknvyscm0VPBgILIQUzkDbla
 ql7IqbtrleumrqYKiWnt+M2tLbL48EZx/S1zHEWepbEtvy1XicHjesglElxvJV7Ja8rT
 1e7HIpcfhF6E6kehit8EM9nmMG2rClUfYgFf5MuOjNudOQJXetGKw0lj6SJ3LeKnusIe
 aEzQ==
X-Gm-Message-State: AOAM530jCYht0X67kwSS7XEu/a2zWhjj6claTgU1oRfXYsemvRbuoEhY
 g8zIXh+bdf3Q5iA9O9SFJt6Aa7NDF2rBIL4AJrJOiR2PRRJModH8eAgxFfhxFeTp8Wx4GgcDezP
 n5dq3y1F7saukj0I=
X-Received: by 2002:a05:6000:1a86:: with SMTP id
 f6mr6602270wry.230.1636617072319; 
 Wed, 10 Nov 2021 23:51:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtj2H5DYLXxpg8lLIbgTtazdQ2c/X70ytG5lgpaOQoXNdPG4jWK7o1pWpRtThSVMIqTo6Gag==
X-Received: by 2002:a05:6000:1a86:: with SMTP id
 f6mr6602226wry.230.1636617071943; 
 Wed, 10 Nov 2021 23:51:11 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p19sm2147603wmq.4.2021.11.10.23.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 23:51:11 -0800 (PST)
Message-ID: <79d3326b-e6ac-86e1-2baa-466666e30af9@redhat.com>
Date: Thu, 11 Nov 2021 08:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] virtio: use virtio accessor to access packed event
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20211111063854.29060-1-jasowang@redhat.com>
 <20211111063854.29060-2-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211111063854.29060-2-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: eperezma@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 07:38, Jason Wang wrote:
> We used to access packed descriptor event and off_wrap via
> address_space_{write|read}_cached(). When we hit the cache, memcpy()
> is used which is not atomic which may lead a wrong value to be read or
> wrote.
> 
> This patch fixes this by switching to use
> virito_{stw|lduw}_phys_cached() to make sure the access is atomic.
> 
> Fixes: 683f7665679c1 ("virtio: event suppression support for packed ring")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/virtio/virtio.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

No cover so asking here, what about vring_packed_desc_read()?


