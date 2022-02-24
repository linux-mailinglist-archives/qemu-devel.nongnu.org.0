Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0484C2BAE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:28:35 +0100 (CET)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDEZ-00008g-0N
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:28:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDB6-0004Wd-4U
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:25:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDB4-0004xi-Jg
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645705498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GrCufoW3u6y92BoRbz1zC300njgVO78CTwfw7vYxRlw=;
 b=aoaQjuIvjd0Uu3m4Ns1pbW3gkRbqM6IiLuNR7VefV/CxmcO3BoltrluuEpBII+5knwn7vH
 K65PZ33d+AMhuHRJb4iBKB9HBI62xNvHg1+5u/24AqdZYXU9l/g0iRTGVlQPDPSRHmuZhX
 Yv8EiZYEcgoiu0GOzWf5JI0/kSqbKsg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-I97gWrILPfKLN_nqkNXw5A-1; Thu, 24 Feb 2022 07:24:56 -0500
X-MC-Unique: I97gWrILPfKLN_nqkNXw5A-1
Received: by mail-ej1-f69.google.com with SMTP id
 o22-20020a1709061d5600b006d1aa593787so1163809ejh.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:24:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GrCufoW3u6y92BoRbz1zC300njgVO78CTwfw7vYxRlw=;
 b=yQ32XJ1+aFXdtuVk9RkI32gsJmi8hAT1lTHUuuKcIhlx40Ybc0ca1Aar3xt1JbalcG
 NnH/oXZQ/p9I+omfVIOFXyiQtq2axtCp2TVCQIYnWuZU7nfLt3rfjsk+9D+6HNVefZuc
 G8PYjba3MlK23r4msq7Y+c++dEEXCvbP11AvmyeinSQLI24fQ+FEN5p0mWgcq6vnXYsH
 DkZTEPgZVJTcArfYW/vtHvy48a5yk3PofEBIFXHdXsseHPFbhXPxOXNEg0nFApBNsSfB
 sDBD9ppxPmNm9zsc5NK613j+tzXH7p3nYF5afuZqpsb73QZEZD1BUfnvKYZlZbX6E2iK
 IIMQ==
X-Gm-Message-State: AOAM532OU77Td22pbYUoUFg739NWLtKJzE2En86j8CYhb674wKMdsbLG
 neX50MeYZiKBvzQHWkyC2P8opW9m0TLOkbAzhAk9ouUsHgbEq9SUIpLmyyc1ZZG9KAEJQc8HlKp
 +xSVh4Q5Ut1hC/aQ=
X-Received: by 2002:a05:6402:4415:b0:410:d28b:1e14 with SMTP id
 y21-20020a056402441500b00410d28b1e14mr2037565eda.211.1645705495735; 
 Thu, 24 Feb 2022 04:24:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyP2z5xv/rYegcHl8UQj4OdzUFj8Qn3g/4JpqolaL9zixejgcfcXM/13OkzB+lCsHtXpEBwtw==
X-Received: by 2002:a05:6402:4415:b0:410:d28b:1e14 with SMTP id
 y21-20020a056402441500b00410d28b1e14mr2037546eda.211.1645705495574; 
 Thu, 24 Feb 2022 04:24:55 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id s11sm1271800edt.10.2022.02.24.04.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:24:55 -0800 (PST)
Message-ID: <a4eb98bd-1398-d553-16c8-fd5d0a95ed86@redhat.com>
Date: Thu, 24 Feb 2022 13:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 10/18] block/io: introduce block driver snapshot-access
 API
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-11-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-11-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
> Add new block driver handlers and corresponding generic wrappers.
> It will be used to allow copy-before-write filter to provide
> reach fleecing interface in further commit.
>
> In future this approach may be used to allow reading qcow2 interanal

(s/interanal/internal/)

> snaphots, for example to export them through NBD.

Ooh, that’s indeed quite nice.

Raises the question of how users are to select a specific snapshot in 
qcow2 file, but your next patch answers that question: The snapshot 
access driver is to receive a runtime option for this, and the API is to 
be extended to allow for selecting a specific snapshot.  Sounds good!

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block_int.h | 27 +++++++++++++++
>   block/io.c                | 69 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 96 insertions(+)

Yes, really nice.  Thanks.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


