Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86883940DA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 12:26:07 +0200 (CEST)
Received: from localhost ([::1]:35812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmZgs-0006CX-D6
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 06:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lmZez-0005On-UY
 for qemu-devel@nongnu.org; Fri, 28 May 2021 06:24:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lmZex-00081j-4K
 for qemu-devel@nongnu.org; Fri, 28 May 2021 06:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622197445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WFK8bxb2c1xaksGeBT9MLuXlAgba6VvCCt3EPnA4AiQ=;
 b=AffEjtq+2BFhDYpYXXj4GTLFkCIdU9JmKmQkf/ssD3Lh9rPtHyZXsc+8ELFDALCNN4qTGJ
 nRs2gTjO9iiuZSRndZwNA4Wmsry6poeTv5zNp125qkX6X2bSiB3LkKBM0fuoj+JYIp6iFa
 GAT7U8oFeqy2JWfQFk+Ihkv3nVAFiLw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-OkGZi6SXNz-nCe3Ogq0hzw-1; Fri, 28 May 2021 06:24:04 -0400
X-MC-Unique: OkGZi6SXNz-nCe3Ogq0hzw-1
Received: by mail-ed1-f72.google.com with SMTP id
 da10-20020a056402176ab029038f0fea1f51so1898253edb.13
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 03:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WFK8bxb2c1xaksGeBT9MLuXlAgba6VvCCt3EPnA4AiQ=;
 b=eGIj85xRlXo8T+5N7ECaYN1oYJlSbwl4atjkergIvG2KhVaaP1qxIBFhPqXtgV5HzK
 ldL5siHEt3B0AgNMV3aSSMNGQxe9UzlicAM/Ax3HU+onoK6Mz3zabfbyxORILJrOeRGo
 HotaBeHVjpb3K0AZgM5gJo+BgyjdGJWIa1F8C6x6GFAzCmt8ndq9ocPoqIhzgfk2kxrd
 VHvr6DwkLHQLHg5EWiCvRMLEpKtLX9n/qLi9DDjvoIzb2Vb3/g1dkZOSngNvkJURCHm2
 CW9e8tasAAH880pTVasyHkhdEcu8t073krxYVq8+AfSalCJXp8EG22ji1DJFO0oMcw1Z
 nfFA==
X-Gm-Message-State: AOAM530Q7RwkKvTLFHt3PIlMCNbdyxgqlGqKt2csLncZG19OeM/7z5iw
 Yxe0knYEG21nnVp29lgLTinhHWKT47RIZL17lSdLMFD6U/NUqmg9cDm6ooNjjQiWnk2MwDyCWpt
 97ME5KEyI4Ok5VHRyhCLkdt5pSLeZYs4DrPysQEpu7b1Hx3Nay6RDRH4Qajjgh5P/GPc=
X-Received: by 2002:a17:907:d0c:: with SMTP id
 gn12mr6175598ejc.149.1622197442788; 
 Fri, 28 May 2021 03:24:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWOYv83SZKY06qFSaRZdBrX6vOFG1dRiVynAHvTTyhvnEeBPfbJ60cgsMaSvbFwJy/YKFmtg==
X-Received: by 2002:a17:907:d0c:: with SMTP id
 gn12mr6175575ejc.149.1622197442478; 
 Fri, 28 May 2021 03:24:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id d5sm2476156edt.49.2021.05.28.03.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 03:24:01 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] block-copy: protect BlockCopyState .method fields
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-8-eesposit@redhat.com>
 <404e2891-9c03-bc7d-2c69-a572422d7804@virtuozzo.com>
 <4403ee17-0c12-c545-7f64-683bb9057b91@redhat.com>
 <c4ba5232-79cf-6534-d76a-ac5eaebe098f@virtuozzo.com>
 <db0d5d2c-2e7c-ec33-b9df-52977fc3179c@redhat.com>
 <47ae4243-5a4b-e3a5-44fb-48c689f8bc77@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <867d0357-1032-f56d-dbed-bd646ce8ec00@redhat.com>
Date: Fri, 28 May 2021 12:24:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <47ae4243-5a4b-e3a5-44fb-48c689f8bc77@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/05/21 19:18, Vladimir Sementsov-Ogievskiy wrote:
> 
> It's actually the original idea of block_copy_do_copy() function: do 
> only simple copy, don't interact with the state. It's a kind of wrapper 
> on top of bdrv_co<io functions>.
> 
> So, actually updating s->use_copy_range here was a bad idea.

It's still more complicated, because you need to add some kind of

	method = s->method;
	ret = block_copy_do_copy(..., method);
	if (ret < 0 && method <= COPY_RANGE_SMALL) {
	    method = COPY_RANGE_READ_WRITE;
	    ret = block_copy_do_copy(..., method);
         }
	lock();
         if (method == s->method) {
             /* compute new method */
         }

which makes it more complicated than this patch IMO.  But yeah at least 
it's a viable alternative to the atomics.

Paolo


