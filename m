Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279A25C5A5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 17:47:24 +0200 (CEST)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDrSN-0005rK-6b
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 11:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDrQW-0004HU-V2
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:45:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDrQV-0003Ls-B9
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599147926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlkQkQV5Bmt3rogBBcHZwP/tAEvL/02bIZ56QshPrE4=;
 b=he5NE8owyygvg4Zu7qU1Ca+badFF5PP1voC4xfdLVoFqrCy/rzPZspswM3gbeXhElX8XcB
 gQgy61wNrthFXcI0lhyGnHBjnF0aK8Ic6+A4hC8cRHFm006xG7O1yyeV8eouPZ/K/ys73P
 IeuLOHz7s+EuN6992YSnggO3z9BHrv8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-wO6PeEeRNZWGC1LVVFy9KA-1; Thu, 03 Sep 2020 11:45:24 -0400
X-MC-Unique: wO6PeEeRNZWGC1LVVFy9KA-1
Received: by mail-wm1-f71.google.com with SMTP id w3so1125599wmg.4
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 08:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GlkQkQV5Bmt3rogBBcHZwP/tAEvL/02bIZ56QshPrE4=;
 b=JGR70PfZDXJPpWYxzitDqX4+n7rE+UY/n8i8OkgGscxoOLATq93YjTkajtFJsVjxKp
 qWFvF54SYQmA9pArzBgngdGV/WY37MqYi7Gq4iqf6mt4LWp6DJ1dUqhWhE0Pqb54+UKh
 y5zpKBLxC9fa6ShP2Ip5Qdydn6xxfAuYHUMBiPORnmHkj7H8rI5k+ldJsbGIukl+UHbn
 pkxuwUZ5r3u5AiByb7ydZQJ4GFNKhp4CYX7g88NmjeQfho34fod4IN6q0d4ncJKq/Sd1
 8jYXuHY/kiI476bgtvgpomSgJ4RLKdG0+GYfFbonq40yCBQ6tFZ8PeudSG21YnuS6ziK
 bPXw==
X-Gm-Message-State: AOAM532HgmL65psTU0VgGD0rKklvLrR6818CjaW23WgYxXZ/FJ5YmGio
 E9mcjmlNats+tgG3mOGMFk7BXjZdixlpmbf6s8VdltWlh/2Ozr1vzJrm84ErAOx89iv4EnL2wBE
 P8FeFvL58JhOyBaA=
X-Received: by 2002:adf:db43:: with SMTP id f3mr3367005wrj.219.1599147920573; 
 Thu, 03 Sep 2020 08:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwwwI7YP/zZxCfGhEAx3361PASy1J33N7OPda5hpwXVjcCgO03mRElB4SpjDLkLjxXNd23hQ==
X-Received: by 2002:adf:db43:: with SMTP id f3mr3366985wrj.219.1599147920314; 
 Thu, 03 Sep 2020 08:45:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:197c:daa0:48d1:20b2?
 ([2001:b07:6468:f312:197c:daa0:48d1:20b2])
 by smtp.gmail.com with ESMTPSA id y1sm5267167wru.87.2020.09.03.08.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 08:45:19 -0700 (PDT)
Subject: Re: flatview_write_continue global mutex deadlock
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <3abe8579-3540-72fd-c452-3cc52d7fcf26@virtuozzo.com>
 <d8bb04e7-6edd-8b3d-8896-31c4d4075006@redhat.com>
 <242c6d2e-9c9a-7a73-aa47-c2283c3d3a1e@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <10bf4c7d-19b5-16bd-a00b-3f6568d9b031@redhat.com>
Date: Thu, 3 Sep 2020 17:45:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <242c6d2e-9c9a-7a73-aa47-c2283c3d3a1e@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.403, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/20 17:42, Vladimir Sementsov-Ogievskiy wrote:
> 
> 
> so no timer exists now: reconnect code goes to yield during drain, to
> continue after drain-end.. Haha, that's obviously bad design, as nobody
> will wake up the waiting requests, and drain will hang forever. OK
> thanks, you helped me, I see now that nbd code is wrong..
> 
> But still, is it OK to do blk_drain holding the global mutex? Drain may
> take a relatively long time, and vm is not responding due to global
> mutex locked in cpu thread..

It has been like that forever, and it's a major reason to use iothreads
even if you don't care about performance.

Paolo


