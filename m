Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F844C2B86
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:17:29 +0100 (CET)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nND3o-000781-4W
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:17:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNCoJ-0002Ee-9x
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNCo9-0000Dh-5v
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:01:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645704075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fS+9uWsw0YX4FS+J38h0HIy2rBSNJQzxqApZd0H/Ok0=;
 b=CYmncf3rd1+kwQJoPGc0r8nJYyOnXus5utsBVWWK+ua/i5MSkEaFr1ozvaBl29YkQl6pn6
 OdKHp/WAtG3zNYHPpv9pYvI+O7kZJg1ZQ6qK2rgwrHFjDCjEh+vsthnzP0e/iV8uxRfHNU
 a1MrhEnvqRbkZ1Vu29VGO8Lm6JTbUv4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-mGO7mIMIPPiMletiqbyEfA-1; Thu, 24 Feb 2022 07:01:14 -0500
X-MC-Unique: mGO7mIMIPPiMletiqbyEfA-1
Received: by mail-ed1-f70.google.com with SMTP id
 r9-20020a05640251c900b00412d54ea618so640534edd.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fS+9uWsw0YX4FS+J38h0HIy2rBSNJQzxqApZd0H/Ok0=;
 b=a/WL+yD5E06BE3es9eLleNzma/Wsfm0DFIsbzL3AAAYN/HuZJY2hmhwANTdRu5n2sq
 A6X6DF5ESvfTzyDrOdx4dW6Ckxel8p9cyhQQVGMG/Ao6FNAcB5L5iQ7X1Ljgdi9kR91f
 86+RhdoD6J9mzoS8lvzNQMOwwP0ebsqBD20gw/sRn5Zuay4zfXzbUp8YWodtBaomJDRS
 T8imki4XzQDxRiTIwlwqEo4IOpP8cIzYxD4IhsIPz4J3v/3U0XRozN3zD0a/30y/xcbu
 8dhLI1csZQWhSfA0cz3tAXighVLQBAC2V8oaJ7loggd1kV1rF5Mpv8wQQBFCbOg2l3X1
 coLQ==
X-Gm-Message-State: AOAM533AYpZVU9QygcK3VgJhQowjpKA/i1q9jBY9LEp/ajkG/jGlpS/K
 XOQ9EZW/ExGsaE73NJdxqeRmffnUn/CvNRauB9LqhYx/8KpLMHI4of5OcjeGFc6GT5Ytw2+My9F
 if93Lb5JSm7khhS4=
X-Received: by 2002:a17:906:c449:b0:6d0:ee61:6b2f with SMTP id
 ck9-20020a170906c44900b006d0ee616b2fmr1951530ejb.223.1645704072566; 
 Thu, 24 Feb 2022 04:01:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYpaqIbW4czWzF9W0YM0lUkSCpNZNpiv1CcP9H0EMzkhaVJ9KGRPucwglB7O1OyIwprgawVw==
X-Received: by 2002:a17:906:c449:b0:6d0:ee61:6b2f with SMTP id
 ck9-20020a170906c44900b006d0ee616b2fmr1951503ejb.223.1645704072313; 
 Thu, 24 Feb 2022 04:01:12 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id y27sm1292802ejd.19.2022.02.24.04.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:01:11 -0800 (PST)
Message-ID: <54fbe957-2624-2dc2-b51b-619483898526@redhat.com>
Date: Thu, 24 Feb 2022 13:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 03/18] block/block-copy: block_copy_state_new(): add
 bitmap parameter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-4-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-4-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> This will be used in the following commit to bring "incremental" mode
> to copy-before-write filter.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block-copy.h |  1 +
>   block/block-copy.c         | 14 +++++++++++++-
>   block/copy-before-write.c  |  2 +-
>   3 files changed, 15 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


