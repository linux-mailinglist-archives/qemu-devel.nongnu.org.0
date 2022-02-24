Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D9A4C2B94
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:21:26 +0100 (CET)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nND7d-0005nG-Lf
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:21:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNCvH-0007rj-7K
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:08:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNCvE-0001vo-5g
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645704515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbNMwA3/StI+Oj8Bm83lHAs8hWwciCCCx1K1wWiW4Vk=;
 b=P1hTj3qLGYP/OA1MuSIiNouoMcvftDpJhg1WUpWffQCNgqyheksKGYm0eDzZsaKXj0zmQ7
 q6MD2cH5t1yOU6apzHVBt1vVYNKtjPsQTCAmk36m1SKTA3lJQFR/IR+w3jXm1bBJqXqkyk
 cTbqqaeRZnT82nyAKE5kKHSNvK8kJnc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-VwBk-xl7PEGrDA8D7WKCdQ-1; Thu, 24 Feb 2022 07:08:34 -0500
X-MC-Unique: VwBk-xl7PEGrDA8D7WKCdQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 m11-20020a056402430b00b00410678d119eso629754edc.21
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FbNMwA3/StI+Oj8Bm83lHAs8hWwciCCCx1K1wWiW4Vk=;
 b=KDrJRWCt/S3rjkDMcwlswBO+L1vZ6wRQyWqH59asVoX1ErGY2zMo3vWd3TytSIlibI
 Etk5LCGY8zpYUHW8vx6Cb2kb8Rucg+G0SPnVakoismedL8IAWeYb4PkwiP1YNG4De/Ea
 VL2Zql/fyxFdCSVZZmPriI7Pves0Lqy2FsqPDiFwTOFFe2um+mo0C5j7/spCKBUYO6vP
 lJLSJAyttktLNM4I3IaiAFoGTBs4UIQD8ts1RMgGAqTarfpy7mcF+2doAtyPAKVg73h/
 KhKRxmeMbJsJ8LkNXnwpZkoUYmlPkD/BE6XlNgd1x+fGsqMoP1tdsckOvBOBwYb438Zl
 1iJQ==
X-Gm-Message-State: AOAM532sjRbaH1mftecF2P6tm2UNLTmdTS43GWD+s9KKALW3f8t4a7kf
 4lKPqoZLu/1UAb24ecnrDvrajMqv84mEzBMgSNr//bVmbqqNNQsb3hTTtTe2DZA6DsMhfHIWb1r
 v71uqneQSFWv0KnI=
X-Received: by 2002:a17:906:e94c:b0:6b7:80c:8984 with SMTP id
 jw12-20020a170906e94c00b006b7080c8984mr2042825ejb.90.1645704512836; 
 Thu, 24 Feb 2022 04:08:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFM1KW22XXqsktN69cDIVxtJsxIk9TZvz0llWacs/qirjFTUNq3JgX3v6SyWnq2AXOs0xvVg==
X-Received: by 2002:a17:906:e94c:b0:6b7:80c:8984 with SMTP id
 jw12-20020a170906e94c00b006b7080c8984mr2042808ejb.90.1645704512692; 
 Thu, 24 Feb 2022 04:08:32 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id g11sm1263745ejo.110.2022.02.24.04.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:08:32 -0800 (PST)
Message-ID: <e8ef07ea-b179-136a-d48e-2ea9e29d16c9@redhat.com>
Date: Thu, 24 Feb 2022 13:08:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 07/18] block/reqlist: reqlist_find_conflict(): use
 ranges_overlap()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-8-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-8-vsementsov@virtuozzo.com>
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
> Let's reuse convenient helper.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/reqlist.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


