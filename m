Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254034A890D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:49:44 +0100 (CET)
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFfIl-0002xt-0A
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:49:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf7K-0008Nc-BA
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:37:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf7I-0001kL-7T
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643906271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDzhrkdZLrTzhh7eMnUROkAJ0/RZ+5qEHaiW1/ZFeo4=;
 b=ZIXVCtvZQgqtx4sKA02jOlBwwGsY5DzUnJsS+l7mjR5stbViez8aTpRDOmHbrBDn4JjQoO
 AAWFmv6tGGEIOeG7YW5+ydbWy8sabLTxC4SzsPMTTyS47dzU5VO+ZBmOrsZr8FiYBsQ01g
 VXMCKQ6sHIO4UqEbA5stTwwzDCUdYjU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37--a2jrMdLOU6pz2neONaEJg-1; Thu, 03 Feb 2022 11:37:50 -0500
X-MC-Unique: -a2jrMdLOU6pz2neONaEJg-1
Received: by mail-ed1-f71.google.com with SMTP id
 i22-20020a50fd16000000b00405039f2c59so1768287eds.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 08:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vDzhrkdZLrTzhh7eMnUROkAJ0/RZ+5qEHaiW1/ZFeo4=;
 b=gGw/977r61Trn0ECBmkyNSC+/HqIOIxqnne/Y66Y50bH9u2fljh79r08xOXJONNELD
 heI4Ql96pa2WOjDx26VCdIw3Jnl4iK57LPH51h1WvzGM9JBxvVqiNBg7ZJyqCD9nPKiL
 IVD9GUGEp6rrpUNi/YoQx52y4NykLECtYPWyvWVTxI76lsGEsdVVxiU37ur3+EvziIb8
 mQzW/rDwj6iPl+zFsgECsH2xShvKzSYu16ypOPDKE8Yf87CZJM0hWRY+yThK05JFMoqF
 2YGXyxrmhm4kEaehmWozSwLWleLAizhuHo3qWsT9ijPBYP8i6RHL4y8uvzi1hhgZTUK1
 07OA==
X-Gm-Message-State: AOAM533Aj+NrrwmCbsbveMF3faSDlgNnZswBXX/ixPhufFBaVy25zl+s
 jY8yzN1AM7QI8rzGBnu3O21EA0/ppWUpypW1D2dm4DbQDNMmwzvuXSY+6SPiXUEvR6P7DwRf+7W
 8o5E+YXinuGjPc6Y=
X-Received: by 2002:a17:906:d553:: with SMTP id
 cr19mr30533987ejc.65.1643906268216; 
 Thu, 03 Feb 2022 08:37:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3z8goZxl/8K0xw330qzguorgXzFFrwulGG/i7AljNrMhD67+mkba2n4E7gSoYpeM16ZTEuQ==
X-Received: by 2002:a17:906:d553:: with SMTP id
 cr19mr30533970ejc.65.1643906268008; 
 Thu, 03 Feb 2022 08:37:48 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id j15sm17166567ejb.9.2022.02.03.08.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 08:37:47 -0800 (PST)
Message-ID: <477a12a1-78ff-4239-413e-4ad473dc5835@redhat.com>
Date: Thu, 3 Feb 2022 17:37:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] block: Lock AioContext for drain_end in
 blockdev-reopen
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220203140534.36522-1-kwolf@redhat.com>
 <20220203140534.36522-2-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220203140534.36522-2-kwolf@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, qinwang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.02.22 15:05, Kevin Wolf wrote:
> bdrv_subtree_drained_end() requires the caller to hold the AioContext
> lock for the drained node. Not doing this for nodes outside of the main
> AioContext leads to crashes when AIO_WAIT_WHILE() needs to wait and
> tries to temporarily release the lock.
>
> Fixes: 3908b7a8994fa5ef7a89aa58cd5a02fc58141592
> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2046659
> Reported-by: Qing Wang <qinwang@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   blockdev.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


