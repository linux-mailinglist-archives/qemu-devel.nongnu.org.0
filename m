Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A3D396623
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:59:20 +0200 (CEST)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlG3-00016P-Ma
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnlCr-0007sx-03
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnlCp-0000xI-6v
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622480158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zdxA5U8rynLv1E2NDIzgC162Dtv+h/1otkkR2S0qTDk=;
 b=J64oge8TnbqRUe2ig5EHZF9QyYBihelYa68jBu2D1w1Ovg66uooORRz2fy+IpfvwNbEbLI
 MfFcN97gVU8Gs/tGV4HnZohKxRzObCUJASFVDd5n+YJZ72TKNpLcNlJBTrkjvNNxo6rj25
 65HBKE8/x2A7viD0qdWmjh0likmRT0k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-uK-Efs2gOaudeVqhQB0xmA-1; Mon, 31 May 2021 12:55:54 -0400
X-MC-Unique: uK-Efs2gOaudeVqhQB0xmA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z16-20020aa7d4100000b029038feb83da57so824338edq.4
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 09:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zdxA5U8rynLv1E2NDIzgC162Dtv+h/1otkkR2S0qTDk=;
 b=EQvPKS4gvlRemmYMBLA4wvuuuoA6+2yj6FQzw0JNmlqoe6eiVk8LbeuFX+J+NwHFDe
 YilC/xqdWyukDMvAJsR+E3LXuxRykz7wpWZAoGkfO50Giw4nK6pabq6G7YmG9/XQ+GG9
 /bVTrI8PE1H1ThmbsDkhkTU9UrM5pjRZhxHMHXpJAwPVnfY28T8JRVpGygrga7NVPnHv
 3u9RMncdpIY2kT5FPyaGRRX73FsTGKGbAPYN7LAU/AwV+2F/i4aFb9kFv+hT0zG1i2sK
 QD5Y8vFVGmKPKUAs9XmVGKMu6rCRjt7JvWkr2HzXRV9r0zoRYMvZsNCTvTs6kvU4S7L1
 Q6Dg==
X-Gm-Message-State: AOAM532UHH/Pm/OJaW69O4uEliyVtLUgMNoYenWK2Pq3ey2ua4KkZBx8
 FxSsE17k48csW3jxdWxrWAmeWIemZS5cM+PKZfXxthBaBVGYqSQ8Exs2ZrHVJUPWtGm06ebkjd8
 uqmJBxfWLq7+NPao=
X-Received: by 2002:a17:906:1fc4:: with SMTP id
 e4mr24147975ejt.336.1622480153182; 
 Mon, 31 May 2021 09:55:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ8MdyGJMXwfvEEwgAkUMSEarwjUif5WPuQLgpcidkHWBUqo9xp261MyeCGifXGPmeFeTCcA==
X-Received: by 2002:a17:906:1fc4:: with SMTP id
 e4mr24147947ejt.336.1622480152989; 
 Mon, 31 May 2021 09:55:52 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id y1sm326362ejl.7.2021.05.31.09.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 09:55:52 -0700 (PDT)
Subject: Re: [PATCH v2 14/33] block/copy-before-write: bdrv_cbw_append():
 replace child at last
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-15-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <2dfef251-2158-cfec-3589-51b5ace9e516@redhat.com>
Date: Mon, 31 May 2021 18:55:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-15-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
> Refactor the function to replace child at last. Thus we don't need to
> revert it and code is simplified.
>
> block-copy state initilization being done before replacing the child

still *initialization

Max

> doesn't need any drained section.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/copy-before-write.c | 33 +++++++++++----------------------
>   1 file changed, 11 insertions(+), 22 deletions(-)


