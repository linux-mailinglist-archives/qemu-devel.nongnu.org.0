Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A6824D3E4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:26:11 +0200 (CEST)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k95BS-0002Dx-8b
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Hl-0001tG-Oz
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:28:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Hj-0002UU-W6
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iw8NbbzuK9twPrjLzGasEAhTvgqsOp/IhJp6r0cDO+g=;
 b=TNjvd8Hgf1MokTrHNyncziKFahNFa0MROHydRoicEW0gLM8MhSoWEDxNXh6cHmdY1J1p3F
 euIptRY3zr567+BXSj/4NlbagTX9qNLJGAFMZtk+pVCRw7F7pBcxTUMOpjXXMAbJpE2wBb
 wrhOaOerpb72ArHJwG7Ht7bpSAnalzM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-eA0NFLs0M561OkGd5xL01A-1; Fri, 21 Aug 2020 06:28:33 -0400
X-MC-Unique: eA0NFLs0M561OkGd5xL01A-1
Received: by mail-wm1-f69.google.com with SMTP id r14so660047wmh.1
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 03:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Iw8NbbzuK9twPrjLzGasEAhTvgqsOp/IhJp6r0cDO+g=;
 b=SpcHRwjpLqmSlrJpj0HFb9X0WNxzkv/CKco9E9YjXbAFfx1DXu+tU4w02720d2WV9P
 vZstV9BblAvVNa0QijsTWX2SnX7PmEdp6QDEnZeqXr0BqjyXflmVn0Iz4rcIdsj7JRS0
 4ieZq4QUdMkU0kFks56zrcV+HEsrzWh0oUstbfE2Zh4W4kjZUswuotrln1EsOf879tad
 vZqeRMWs5jBqH0h49OFJNpWf/m4HaM5I4kMI2v3juhZVWrmz7RxPhjRkbQ822moBgddd
 5eIBSsCQRYPPaKm/tCM+MjH8TeFRtBuCg5MzkqY2LVOvfVXC68falHcbRl5oBa99xGfP
 Rbog==
X-Gm-Message-State: AOAM530ruhoqsasJIOVgJWfFzfkmj7u/h8OwT8HXoLulAjgnrYWYvt5H
 eWskj2+RieXBReEmT6ypgZHszJ6ha+QR/LCxYWyEcCMogna85InatJ/UydepXS3asP7CMmIOYlS
 jC76sHw6+r1plS8w=
X-Received: by 2002:a1c:6087:: with SMTP id u129mr3002643wmb.157.1598005712628; 
 Fri, 21 Aug 2020 03:28:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUMAJc2lUlQ26ITXWQWo76vc0jVksR1b0Poj7HfCirhY1yv++pU5AGNNZK3BlJrBRPTzbU4w==
X-Received: by 2002:a1c:6087:: with SMTP id u129mr3002624wmb.157.1598005712418; 
 Fri, 21 Aug 2020 03:28:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1cc0:4e4e:f1a9:1745?
 ([2001:b07:6468:f312:1cc0:4e4e:f1a9:1745])
 by smtp.gmail.com with ESMTPSA id 145sm4666549wma.20.2020.08.21.03.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 03:28:31 -0700 (PDT)
Subject: Re: [PATCH] configure: add support for psuedo-"in source tree" builds
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20200820165543.215372-1-berrange@redhat.com>
 <938bfa57-01f9-a50a-6439-0965c91dce1b@redhat.com>
 <20200821095821.GA5153@linux.fritz.box> <20200821101417.GG251583@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <28a875f0-a9f7-5c8e-d934-a78365dccea0@redhat.com>
Date: Fri, 21 Aug 2020 12:28:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200821101417.GG251583@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/08/20 12:14, Daniel P. Berrangé wrote:
> I can remove the "rm -rf biuld" in configure if we are happy
> to require
> 
> 
>   ./configure
>   make
>   make distclean
>   ./configure
>   make
> 
> because the "GNUmakefile" wires up "distclean" to purge the
> build/ directory.
> 

I have already included this version in v8 of the meson pull request,
actually (to place it early in the series).  Any other refinements[1]
and bugfixes can be done on top.

Paolo

[1] such as requiring --i-really-want-intree-builds :D


