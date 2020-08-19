Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE29524A8BB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 23:50:30 +0200 (CEST)
Received: from localhost ([::1]:56510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8VyX-0005lo-87
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 17:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k8Vxe-0005Ga-Ir
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 17:49:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51642
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k8Vxa-0002JR-Tt
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 17:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597873770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gg021XtuzW02chm4aPsHCUPHR0j5ruXzqvbgKN9ZFeo=;
 b=CfcZEHkrDtjs+5l8UyeS6eMItfGIN7n7YbLgEghSJVZu8qd4vwePFp+wjlNhfb8jgNeQfg
 u1ScXqfqOQtzls57qvNbEnhNaizRlBjMA36qGcN/7HvSTUhKgJqU052UISfhK5zFrWMtEx
 tqrB4hWJ3PPHtbVdjUB5MruN1LSZ6+8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-BYe3Nvi8N26CTRxGnHN8iQ-1; Wed, 19 Aug 2020 17:49:27 -0400
X-MC-Unique: BYe3Nvi8N26CTRxGnHN8iQ-1
Received: by mail-wr1-f72.google.com with SMTP id b8so9786770wrr.2
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 14:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gg021XtuzW02chm4aPsHCUPHR0j5ruXzqvbgKN9ZFeo=;
 b=HRj2EO92l3/ZVB4zvUW96LJBdvfOFoEHdhYW0HIsNuHdvaymO26UYyTf9UNMUV7zbX
 XzFE29KjImFBU8sC+7z6QbhcfNUs+RX8FFtTh1ZWYiVjo/cA2u9WjovO2Q7C8NIwFxNu
 p1Orcqxi4EDNLa9kAb3EKoWT99mb/cPJkIo7gSyrVJb2uxYcfR1vsBW2U7Aomb2QYlFJ
 5QOSz/Z14ZJufI8x4VmvVSu77tZ/4vWAQ5fcBk5J8GvFcgr7blS8TOt3E67Y4pmNYElg
 t1ZxuwMoMkWqKtYtr2TC8+Y3xgVl7yMtTxXHdMsztR8ClhVxw3536y/yKpeEf6c0Fx4M
 PMzg==
X-Gm-Message-State: AOAM5314XwtPGNJfMAvp0vjmpCYWXCwvG+8EGA0KwcEIGh3/LODCTuag
 z9ErebrKOaqUKr5exk/dGxbBXLjfiCawm9RZSrjQUy5xHfbGal/enkGc7pJi4cOVFwmdAMCWPCj
 sXfJgHnZ6DvCMuyE=
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr282689wma.21.1597873766034; 
 Wed, 19 Aug 2020 14:49:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ2VCQ5LoNt92vJ2AW/uYAgj3ydLBsfEwMTqZRNw4kjU5Z0whpnQiGqOTJxrEQuYH4K8Bw4w==
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr282675wma.21.1597873765817; 
 Wed, 19 Aug 2020 14:49:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1cc0:4e4e:f1a9:1745?
 ([2001:b07:6468:f312:1cc0:4e4e:f1a9:1745])
 by smtp.gmail.com with ESMTPSA id h10sm260172wro.57.2020.08.19.14.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 14:49:25 -0700 (PDT)
Subject: Re: [PATCH] qtest: add fuzz test case
To: Li Qiang <liq3ea@163.com>, thuth@redhat.com, lvivier@redhat.com,
 alxndr@bu.edu
References: <20200819141533.66354-1-liq3ea@163.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <edd6033e-47ef-1b6f-7dbd-ed36406fcf9b@redhat.com>
Date: Wed, 19 Aug 2020 23:49:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200819141533.66354-1-liq3ea@163.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 16:00:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: liq3ea@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/08/20 16:15, Li Qiang wrote:
> Currently the device fuzzer find a more and more issues.
> For every fuzz case, we need not only the fixes but also
> the coressponding test case. We can analysis the reproducer
> for every case and find what happened in where and write
> a beautiful test case. However the raw data of reproducer is not
> friendly to analysis. It will take a very long time, even far more
> than the fixes itself. So let's create a new file to hold all of
> the fuzz test cases and just use the raw data to act as the test
> case. This way nobody will be afraid of writing a test case for
> the fuzz reproducer.
> 
> This patch adds the issue LP#1878263 test case.

Pretty it is not, :) but it does make sense, as a balance between
practicality and usefulness.  Good idea!

Paolo


