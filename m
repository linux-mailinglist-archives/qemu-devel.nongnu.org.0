Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F614DDD50
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:53:07 +0100 (CET)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEuY-00078x-90
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:53:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVEf5-0003XV-E0
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVEf2-0008AR-Bf
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647617823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aa65jjyrKQehHbjmNaaFEOO5yf9i/IBXPQZM9f7qtaw=;
 b=DuOajV7vnGO0FSDSQm+7FluHaXwwOjw+kf+HmjX10KJK73rMlLONAyaPbQQXR853srWTam
 DfQQV1P7mwLGwam/wMN0u+s34U766GqJ+NWBEODDiwsNwEwUkomJqBkncX3k6/YENrD3LT
 tn89arYtaVGve/DQdM39psHBDuAHgTs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-zB87FG8BMlKZMtWNmhLUwA-1; Fri, 18 Mar 2022 11:37:02 -0400
X-MC-Unique: zB87FG8BMlKZMtWNmhLUwA-1
Received: by mail-ej1-f70.google.com with SMTP id
 gv17-20020a1709072bd100b006dfcc7f7962so243904ejc.5
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 08:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aa65jjyrKQehHbjmNaaFEOO5yf9i/IBXPQZM9f7qtaw=;
 b=4BqU5JWB5S+OeGDKr/jZhxMfgYZpaI2nfcEfzINWU3TUjy6fff5fvAHJzIgDmYH5+K
 e8o3PZadDqzJhHoYYFl0dTj8GIS40E5fUcVQxXB4/URPljWdt0VI20iQ6y/XxxfBeNyQ
 art+AhLJZ5TAO5ifi/CJnjeBnqZ+qF3CB/Ou7iIQk2H6xxPI1/Ny4jBKknIhkSxWZ4Is
 zIrs2IP4pZ2RwYHy4sTgqZWrubWl6U24e11KprTqVJSm8W4puKZ5OcFh2Bh+k8coSjvv
 exa0GIf4UvjHgknUb2QksEXWsOP0lWqMAtnbxN7vSsYc4krPQBNpoRyT32zHBeBzCoo2
 cWRg==
X-Gm-Message-State: AOAM533Sr5mZldWW6Do+WpmnyAeLsZdIB2L3i4bfKPW4uYCzL6YLMebW
 kdrGZsgj3A7muKGozVAwgwWxis7KK21L/l8bB3SVnEjR8XmyG3T5O9c7CQAvQ1ES/YsKtR0r2Ti
 zYpi8eZUk1eGIvAw=
X-Received: by 2002:a17:906:3fd4:b0:6db:143a:cf62 with SMTP id
 k20-20020a1709063fd400b006db143acf62mr9457282ejj.454.1647617821498; 
 Fri, 18 Mar 2022 08:37:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsqJwKpk4FeSLWrAdLfZeX/y4F6cUmJksulx3I6WZkL6yDS1tFFjVDDFnW/h6s1qbLFRjlbg==
X-Received: by 2002:a17:906:3fd4:b0:6db:143a:cf62 with SMTP id
 k20-20020a1709063fd400b006db143acf62mr9457254ejj.454.1647617821119; 
 Fri, 18 Mar 2022 08:37:01 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a056402015400b00418f9574a36sm2616659edu.73.2022.03.18.08.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 08:37:00 -0700 (PDT)
Message-ID: <445199d8-a9cb-051a-b81d-bebaa2b782d2@redhat.com>
Date: Fri, 18 Mar 2022 16:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20220317162638.41192-1-sgarzare@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220317162638.41192-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Peter Lieven <pl@kamp.de>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.22 17:26, Stefano Garzarella wrote:
> Commit d24f80234b ("block/rbd: increase dynamically the image size")
> added a workaround to support growing images (eg. qcow2), resizing
> the image before write operations that exceed the current size.
>
> We recently added support for write zeroes and without the
> workaround we can have problems with qcow2.
>
> So let's move the resize into qemu_rbd_start_co() and do it when
> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2020993
> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>   block/rbd.c | 26 ++++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


