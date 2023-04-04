Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991506D6973
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:52:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjjsg-0001iR-LJ; Tue, 04 Apr 2023 12:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjjse-0001iF-RY
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:51:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjjsd-0006OR-75
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680627094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWiM6I6ozw62jgfryY18Jy0J7LjaT0zcb9eKRxEGfMU=;
 b=dFvYoOvxiH+WTttxUKk+jdlX+dGaE0c+4+8+K2Vg+iV/GJoVWrrBqpsQCv/qibEPF/TkCn
 6251Mzo65ommgAqa5Sr/qp45ZGEpgQ1syuY7pZMiOTpL0fGrDgCv1rjiVNWoLgjBaAplVW
 JO5UC7pN4/hxqi5OW0ONmv2Q9vou6Jo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-rxE9T4ddOueHcGwON9bQYw-1; Tue, 04 Apr 2023 12:51:25 -0400
X-MC-Unique: rxE9T4ddOueHcGwON9bQYw-1
Received: by mail-ed1-f70.google.com with SMTP id
 f15-20020a50a6cf000000b0050050d2326aso46516058edc.18
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 09:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680627084; x=1683219084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WWiM6I6ozw62jgfryY18Jy0J7LjaT0zcb9eKRxEGfMU=;
 b=NTLgHyPWZJVn5AZK77YTf2NHWXeyBzR7mixRbPul/st5XX1z3MElBoxa+D9cNA+pWA
 hvPPLn+9tbpdq1pr9kHKGOEfhNIWPhIuD0gRFOiWaAKqaVCIzF44mpcPcpyh2d22+N6O
 ZxfrhQvaw7hLrsq/IR5pSN0FPJ7ZlDdlRBtaiw29lcy5clGd295n5zsYmnyesaYvNl/S
 0PqZ2wM+SE4/+YVa6ZDBP4AiCpjgw/UH6fKKZMG3nuXrEFR72MPI8XvJvEY5eeAE4N87
 yz4tPI6aMhHsZx4E+/zEghlRAKcfbrr8IMbcI1nJjA5ohBg0pmEvH7fomFKTfWD2TjWv
 A1lA==
X-Gm-Message-State: AAQBX9dT9Xm0x/l9vrahxSj7UTMZCJ2cmRobF24cEn45cSroVyHQUZOK
 dA97W74sP2BIMui6HmAZinGDg4PMqT9teIBxA4BCqpJGLGJhxhL7ZP3YM9ozFcKaLiorT3yukzQ
 gJKRlJaYb7ZRZvTU=
X-Received: by 2002:a17:906:4f0c:b0:93b:46f7:a716 with SMTP id
 t12-20020a1709064f0c00b0093b46f7a716mr220784eju.50.1680627084247; 
 Tue, 04 Apr 2023 09:51:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350YWuIkcrBB5OJ9lUXVtOLOkrgsBDaXqnnQpT6MgXGxeNzFE4QSeirLHCbyLEVWclTXZEthNww==
X-Received: by 2002:a17:906:4f0c:b0:93b:46f7:a716 with SMTP id
 t12-20020a1709064f0c00b0093b46f7a716mr220756eju.50.1680627083989; 
 Tue, 04 Apr 2023 09:51:23 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 z8-20020a1709063ac800b00947ed087a2csm5053520ejd.154.2023.04.04.09.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 09:51:23 -0700 (PDT)
Message-ID: <fa8538dd-7a90-5c02-9afa-0aa24e2a06b3@redhat.com>
Date: Tue, 4 Apr 2023 18:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] aio-wait: avoid AioContext lock in aio_wait_bh_oneshot()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, eesposit@redhat.com
References: <20230404153307.458883-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230404153307.458883-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 4/4/23 17:33, Stefan Hajnoczi wrote:
> There is no need for the AioContext lock in aio_wait_bh_oneshot().
> It's easy to remove the lock from existing callers and then switch from
> AIO_WAIT_WHILE() to AIO_WAIT_WHILE_UNLOCKED() in aio_wait_bh_oneshot().
> 
> Document that the AioContext lock should not be held across
> aio_wait_bh_oneshot(). Holding a lock across aio_poll() can cause
> deadlock so we don't want callers to do that.
> 
> This is a step towards getting rid of the AioContext lock.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


