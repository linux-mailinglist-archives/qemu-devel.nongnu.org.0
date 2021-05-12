Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F1537B666
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 08:57:52 +0200 (CEST)
Received: from localhost ([::1]:44392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgioZ-0004Zm-O2
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 02:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgina-0003pk-Gg
 for qemu-devel@nongnu.org; Wed, 12 May 2021 02:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lginY-00056b-UL
 for qemu-devel@nongnu.org; Wed, 12 May 2021 02:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620802608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1io1mdfevpVvPsDWP+8T4HSm7S2VJTUhLmsnrrDs60=;
 b=OgDBFQ1uyMKYSqFY+FXsjZKG32UI5JrozswDZq2tccF6h2S6Fvw40BdGMDPLiaPIdaYh4d
 kK5Up0M+iwLthdXR0S6+VJeMg7Zq0vNDp9BeD30/e15Wgq30dOcefiaHGFyzgPcUOGEvix
 Y5wiK1BthW/rrtwpvCs7GvWaHv7Xw04=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-Mt6aMiLGNzeh7qxFUw6hWg-1; Wed, 12 May 2021 02:56:43 -0400
X-MC-Unique: Mt6aMiLGNzeh7qxFUw6hWg-1
Received: by mail-ej1-f70.google.com with SMTP id
 i23-20020a17090685d7b02903d089ab83fcso36554ejy.19
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 23:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D1io1mdfevpVvPsDWP+8T4HSm7S2VJTUhLmsnrrDs60=;
 b=MGP6dQkpnQf+bgJiyGC+5uYtNkGBUwpZQImLtKL96st77eciQh4gUIcvQklb/JeNlg
 jT8F1NXq098RiwY9PcFdejcxif4JyUua9K2V3UR3t5vLqgJSH6EeEe2m2MiyzrWCHoSf
 LF5Ctoq3Zc3byTsrXoAlxADPdd+wbguSAwTj4UhTrSpgLuwq1U3tCeFJKoTjJ7irZXr0
 0wap47V67NhUUl7sscvnTTeyutCNJRtJe2H16H1d8q5ziBixMsCA6uOJlZX27X23lHKm
 ua9kGsZu4VzaO7Zd5DsZh0h2sXQ7Pc2LDp8NY7CLzlOn3DFtbhy8LtRZ5MtItbSROq/W
 hFFA==
X-Gm-Message-State: AOAM533uW3vsgBjzVwVGQwAob3fteMB+xwyj+uhwVLCgGqrA31oItIOK
 kVGEu0qW3cYSHTG/THaQS4NFWzAPHhHw0Fkwc8iZwKYcxz/lPf7kAQcfhHQsZmSySCe/OYd0u8v
 Pw2g02XcllQqLC9g=
X-Received: by 2002:a05:6402:1214:: with SMTP id
 c20mr40828381edw.191.1620802602725; 
 Tue, 11 May 2021 23:56:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7Gmu/RxOYmemreeNdgmjQJgXuyebCv3fdJtAOWBgtsLcZc0xeKStItk4D8K7e5IaMLIoNoA==
X-Received: by 2002:a05:6402:1214:: with SMTP id
 c20mr40828365edw.191.1620802602571; 
 Tue, 11 May 2021 23:56:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id n11sm14268897ejg.43.2021.05.11.23.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 23:56:41 -0700 (PDT)
Subject: Re: [PATCH v3 06/33] util/async: aio_co_schedule(): support
 reschedule in same ctx
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-7-vsementsov@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <32f2b6f0-2c31-942d-cbe2-81eda2a43fc0@redhat.com>
Date: Wed, 12 May 2021 08:56:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-7-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru,
 Stefan Hajnoczi <stefanha@redhat.com>, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/04/21 10:08, Vladimir Sementsov-Ogievskiy wrote:
> With the following patch we want to call wake coroutine from thread.
> And it doesn't work with aio_co_wake:
> Assume we have no iothreads.
> Assume we have a coroutine A, which waits in the yield point for
> external aio_co_wake(), and no progress can be done until it happen.
> Main thread is in blocking aio_poll() (for example, in blk_read()).
>
> Now, in a separate thread we do aio_co_wake(). It calls  aio_co_enter(),
> which goes through last "else" branch and do aio_context_acquire(ctx).

I don't understand.  Why doesn't aio_co_enter go through the ctx != 
qemu_get_current_aio_context() branch and just do aio_co_schedule?  That 
was at least the idea behind aio_co_wake and aio_co_enter.

Paolo


