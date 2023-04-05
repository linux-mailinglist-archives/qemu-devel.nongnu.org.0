Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD4F6D76CA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 10:24:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjyR1-0000BM-JU; Wed, 05 Apr 2023 04:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pjyQz-0000Av-HN
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 04:24:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pjyQy-0003o5-1W
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 04:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680683039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MnNQNnbOxqBChnoeMpTOJaTE/OMthbXYBV6kxWZLWwA=;
 b=BfBmxQUA0SiUQizhi5/B6yj/TkFtfashkB0w4r8cwZ3Jy/UgaFOdeA9sI/ikZ0yNsgOmF2
 cCLzzHHCfeiLG0Iw9FvRxGBYdcKe+WEIk5sxTOs8OQ5CnYhVIlkEelH9twE8Cw5SU8uExD
 XCzE20HYaklASs5UD936wX0xluL+kTk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-vl17I1P8OPKpPKKXAi8JlA-1; Wed, 05 Apr 2023 04:23:58 -0400
X-MC-Unique: vl17I1P8OPKpPKKXAi8JlA-1
Received: by mail-qt1-f197.google.com with SMTP id
 h6-20020a05622a170600b003e22c6de617so23992782qtk.13
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 01:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680683037;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MnNQNnbOxqBChnoeMpTOJaTE/OMthbXYBV6kxWZLWwA=;
 b=Ej6gVQzdEbVrodhos9aoOVEgVrAh6KZA0Y5/4jdiKj5qI/ZCUcG8OlmIonvYNJmndS
 xw+Bjzo6Vl5wV2er8WOJQa2BZJe/o0EtIYr2bdOIr6xDbsA43LMVp4CKSa/3xkmzA5Gu
 3fDhdt04r1+plMZqN+44GhvkVEOcMb3LHPLo9o4+tLdMQezLrDu5FhPh6DPk1/u0Gzcu
 4ikqkXvh24DLwxvamKl5/nzyqI+fWfitTlUEywVYrU1KKBd4LglKWPYIy2hKmqHirMbt
 ISh23h7Y5MyEqIjaEQz9ha9fQp7mybg1mJsfkKDP0AJPdpWnHi5pfNVS/usC5cGmDuU3
 +oHw==
X-Gm-Message-State: AAQBX9d3Ps9/4gz4TJuO6zGqtIASMqyPd7BBqJXG9QnW9m0sNM1EDZnG
 WIZO+om57W8M74QLVqsGVS37o6szcH0HBKGfV2w6V9HEsHZEvoJkRhN+QjAtKs18Wpyvn1Hht50
 gBOPU7NF+K75eDvo=
X-Received: by 2002:a05:622a:24e:b0:3e4:e479:6f9f with SMTP id
 c14-20020a05622a024e00b003e4e4796f9fmr2865808qtx.24.1680683037565; 
 Wed, 05 Apr 2023 01:23:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZD5tTOHSkwREqS78cGI6mRtkcCvKDlDkV/IJkrM6JDNaRPUr/EFSVQzRWYqi8JJuJtYTp28Q==
X-Received: by 2002:a05:622a:24e:b0:3e4:e479:6f9f with SMTP id
 c14-20020a05622a024e00b003e4e4796f9fmr2865799qtx.24.1680683037331; 
 Wed, 05 Apr 2023 01:23:57 -0700 (PDT)
Received: from [192.168.149.90]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac84989000000b003e38f7e4562sm3804792qtq.69.2023.04.05.01.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 01:23:56 -0700 (PDT)
Message-ID: <63b7fa1e-c601-ddc8-2769-28db738177f4@redhat.com>
Date: Wed, 5 Apr 2023 10:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] aio-wait: avoid AioContext lock in aio_wait_bh_oneshot()
Content-Language: de-CH
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20230404153307.458883-1-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20230404153307.458883-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 04/04/2023 um 17:33 schrieb Stefan Hajnoczi:
> There is no need for the AioContext lock in aio_wait_bh_oneshot().
> It's easy to remove the lock from existing callers and then switch from
> AIO_WAIT_WHILE() to AIO_WAIT_WHILE_UNLOCKED() in aio_wait_bh_oneshot().
> 
> Document that the AioContext lock should not be held across
> aio_wait_bh_oneshot(). Holding a lock across aio_poll() can cause
> deadlock so we don't want callers to do that.
> 
> This is a step towards getting rid of the AioContext lock.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


