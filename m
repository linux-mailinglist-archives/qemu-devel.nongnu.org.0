Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D926628E49
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:27:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouij6-0002kk-I0; Mon, 14 Nov 2022 18:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieW-0002B8-Im
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oue06-0003g5-LL
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 13:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668449765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gp4jsQfA/zNC2Ao7oJN9asdIHSAxsWIORbx0CGKFDRg=;
 b=Bq3NPR63KICp2vQVevDCMxXePFc5H8v/6F7dx+JqMFAAnXzvU1gvhyhWn9vRbbSqFRLqWU
 d2REswrvsocRL2DBgIZPLLadxkNxoJKMq5vZSch8iCfSdhcIgmTXT1lnpKJR8YbyR8MYIW
 XdTCCGbPrmmpUvKADHk8SQYC7n42x+I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-cMl2_XBmMLqSAbf8YKzLFQ-1; Mon, 14 Nov 2022 13:16:03 -0500
X-MC-Unique: cMl2_XBmMLqSAbf8YKzLFQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 e15-20020a056402190f00b00461b0576620so8586341edz.2
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 10:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gp4jsQfA/zNC2Ao7oJN9asdIHSAxsWIORbx0CGKFDRg=;
 b=MaJvD3oWHqk3AA+FXxLaOHneWjs99i8nLPdrutmae425iSK1lo9dedCFmJjErOFyEY
 voitnyg045YHabwVGAJV3C7VbTJYAKVVOQIugGOgz5ry4l7DcPg3I/to9SgYNQOWwFjL
 q3TM6gwO6An8XiszUaviG7hukZOoSH9+RgyIpJ/4uZU2Kj6PEFJ/N+jC1qkO9Riz9X09
 nhVryMP605W46JvaeAZEbY/GbyHQvdAxIu+VBV2IW3lw0whjGPhZgdJXB4L4diZ8TlOD
 wMDRnbo7WIe4SSQUU+11nVOsVfOqpH6ejMkmeWMIAYnmd4Z5BMw2wbS1wMRsJdh9n0+g
 lkOw==
X-Gm-Message-State: ANoB5plOAlHMYbAySiFTTTT3zDKbGPiN+UyjrJWT6YhGNN/Hf9ysiZ0X
 XgWWeiEhtzY2+boolV/2m5IN48WcNuxYS+jjmgQuv68JJnL/2E5DkemSkxwrl1MwKML0S+QwoKy
 y19sDNPNK8po24mY=
X-Received: by 2002:a05:6402:b50:b0:459:2b41:3922 with SMTP id
 bx16-20020a0564020b5000b004592b413922mr11847003edb.160.1668449762733; 
 Mon, 14 Nov 2022 10:16:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7iaZnQYzfc4V7ijcrtYCS/c/mCwNElIUNQvsnFYXE3F53+gr+iGo2jQRzCWSY8Pt9OLL+amA==
X-Received: by 2002:a05:6402:b50:b0:459:2b41:3922 with SMTP id
 bx16-20020a0564020b5000b004592b413922mr11846986edb.160.1668449762494; 
 Mon, 14 Nov 2022 10:16:02 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a170906784500b0078907275a44sm4487412ejm.42.2022.11.14.10.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 10:16:01 -0800 (PST)
Message-ID: <df162197-0da4-3fbe-42e3-3f4f05732487@redhat.com>
Date: Mon, 14 Nov 2022 19:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/13] qed: Don't yield in bdrv_qed_co_drain_begin()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-2-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-2-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08.11.22 13:37, Kevin Wolf wrote:
> We want to change .bdrv_co_drained_begin() back to be a non-coroutine
> callback, so in preparation, avoid yielding in its implementation.
>
> Because we increase bs->in_flight and bdrv_drained_begin() polls, the
> behaviour is unchanged.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block/qed.c | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


