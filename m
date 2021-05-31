Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA1395B00
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 14:58:38 +0200 (CEST)
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnhV7-0005Uy-BI
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 08:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnhTS-0004h2-Q3
 for qemu-devel@nongnu.org; Mon, 31 May 2021 08:56:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnhTQ-0003gh-H7
 for qemu-devel@nongnu.org; Mon, 31 May 2021 08:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622465811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=czyKUYX+CQIhaZQhfbawxW9AqfvtrEo3SwLagSOVNiM=;
 b=KYqLGwMXXeJxzwIKdns3ddu+5nui9QeG++E/SH5NkQ58wyLM1LMIaT+Nbwd/FlyPshEDyY
 d9G8h5t7J2/TZmAvJJ1j+tbKjWA0lGjL/k85VkK/mmGKTKDyVwCbzL7znhQPTuljUVE2s3
 x+MGqJFbg86er3R/jD511WR5IfstDTo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-CPCPlfTUPr6sU5_NRSny3w-1; Mon, 31 May 2021 08:56:50 -0400
X-MC-Unique: CPCPlfTUPr6sU5_NRSny3w-1
Received: by mail-ed1-f69.google.com with SMTP id
 cn20-20020a0564020cb4b029038d0b0e183fso6197980edb.22
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 05:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=czyKUYX+CQIhaZQhfbawxW9AqfvtrEo3SwLagSOVNiM=;
 b=C21Wc80gkAULmTQTOzCqUZ3gELuzwcFed2gUkxc4ddAoyBO0yCGJqtT5IxdGV5vwf+
 O34cX5h2ROhYp0HPBJ6/huLvMvcRb7IPPKe/iZ+TxBxqcSvIGp0oEaVHc6pE6p66JRrt
 cB517NR4QCQ0mA/kM0QzFWUZbdaJxiXiovs/LCnCaGhvhC5k4sknbhc7K7WWiETsaCY4
 nz4N2DyCKwkR3yEyRGa0o/Ui9R5gitbs3L4ADKZ2n1X3T0S47cJEU62WCq1w1P7dF+en
 Shxq16OhQZBXqIqlc+TgQlpBiZy+K+oR+7JyNbCUPIh00PL94bdzdpOHuqsCCFc5tDGB
 JOEg==
X-Gm-Message-State: AOAM530lD5tjgz3e4e/5APwtSGCcrz6pwzoJIv08hUcrQL2j44E6Abzc
 RSSaDU/iHlscXWKA1Yxt/+MBbcz6Jfwuf3OpfnnTgcyjySvPV/qy507LWDxLMcYdQ01su96dKN8
 na2jvyq4Tnx8wL2o=
X-Received: by 2002:a17:906:1404:: with SMTP id
 p4mr20960880ejc.107.1622465809030; 
 Mon, 31 May 2021 05:56:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJYYcMjbyWfjCD1/iOoBDmeGeUam+8pi+3IzLXJgPp1f+LdEqUbmSCXjz2s40iDWy00sERDQ==
X-Received: by 2002:a17:906:1404:: with SMTP id
 p4mr20960862ejc.107.1622465808846; 
 Mon, 31 May 2021 05:56:48 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 v21sm557469edt.48.2021.05.31.05.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 05:56:48 -0700 (PDT)
Subject: Re: [PATCH v2 02/33] block: comment graph-modifying function not
 updating permissions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-3-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8c6d6ad4-1909-2d6e-8c61-9d31999d1965@redhat.com>
Date: Mon, 31 May 2021 14:56:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-3-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block.c | 7 +++++++
>   1 file changed, 7 insertions(+)


Reviewed-by: Max Reitz <mreitz@redhat.com>


