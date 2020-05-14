Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B1E1D4163
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 01:03:38 +0200 (CEST)
Received: from localhost ([::1]:53652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZMt7-0002j0-HZ
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 19:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jZMsE-0002Hp-6W
 for qemu-devel@nongnu.org; Thu, 14 May 2020 19:02:42 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55941
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jZMsB-0004vS-Ht
 for qemu-devel@nongnu.org; Thu, 14 May 2020 19:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589497357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iuHSSJ/1NsIj2/Y2xJouyGAuKbTnaWmt9HWfOk+vPEM=;
 b=DHjsrqi1CZQCgAPKlkUomoIy3gPSCwEk5OWsWyJqTdaPeC3R8kJEDljG4eVy80C23yPFI/
 dz8WDIb6OhjgihFJ9+Z16uC5Ygq09sz1hb176iECdw/hVgXgCXkv7JAcD5in7sBjfuTGFl
 C4ha7KN576Aloa1E/OgzF58h8UNIad0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-KuS7g_-5PtWMoc98WDvwMg-1; Thu, 14 May 2020 19:02:33 -0400
X-MC-Unique: KuS7g_-5PtWMoc98WDvwMg-1
Received: by mail-wr1-f71.google.com with SMTP id l12so182562wrw.9
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 16:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iuHSSJ/1NsIj2/Y2xJouyGAuKbTnaWmt9HWfOk+vPEM=;
 b=Ip/XroraAFvXElBJjyC4L5W2hyRrAFHpoOT4Ju03b+cLZ/56/dxgiBHQaUVq3bx2b0
 dLo7daz5QVUQhOtV7gCK1nBOE5cNBa2vS23ed9xbIWhvvqYLA/3XJ04xAMPggZKsoSC9
 hZUi3SkLWv3v+KjqnJgBw1g7OOJG+IVeTWQlhX0NKlpN7epeU0NoQo2mFcRdwyhPARxp
 Kp0l4+AaM3dp+o91nPIgElK0ki8AZLTnnvkRIifoCflwrZFlAD+EVHSIVt/Hnbs6wT5U
 cdqCr0D1zH9ajYOBuik/rzMePjfaeGTfg/AwDQAvJUOQYD00jIuUGGWb7TrEvJkWWVjA
 Gslw==
X-Gm-Message-State: AOAM5324WwzinMyjNLGBLj4So9krE3mYQsHneOqi9PeMb6hrX4hLlQiG
 7IeOnSE8JrOzGTL4q2byHBvdow6OMvbHBZgUHR/4L6XEZ/yQ1XbD8yn882pxJhJLq4NQBzE3nLw
 NXC6+Cbt+DUH7pHs=
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr793071wrw.256.1589497352296;
 Thu, 14 May 2020 16:02:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwuZLrZfn4PhfaAmkCXxhmaafuhc6ZODhGDSn68VpYntWCz20PxTB6HjowfhP42RxPdNu8dA==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr793049wrw.256.1589497352062;
 Thu, 14 May 2020 16:02:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:bdd8:ac77:1ff4:62c6?
 ([2001:b07:6468:f312:bdd8:ac77:1ff4:62c6])
 by smtp.gmail.com with ESMTPSA id q5sm727164wra.36.2020.05.14.16.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 16:02:31 -0700 (PDT)
Subject: Re: Ping Re: [PATCH 0/5] target/i386: fxtract, fscale fixes
To: Joseph Myers <joseph@codesourcery.com>, qemu-devel@nongnu.org,
 rth@twiddle.net, ehabkost@redhat.com
References: <alpine.DEB.2.21.2005070038550.18350@digraph.polyomino.org.uk>
 <alpine.DEB.2.21.2005141821240.23319@digraph.polyomino.org.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ddbea348-698c-0e41-983c-9b617b872fdf@redhat.com>
Date: Fri, 15 May 2020 01:02:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005141821240.23319@digraph.polyomino.org.uk>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 19:02:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/20 20:25, Joseph Myers wrote:
> Ping for this patch series 
> <https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg01465.html>.
> 
> Although my three patch series so far for floatx80 and i386 floating-point 
> instructions fixes are independent of each other, it's likely future patch 
> series in this area will depend on some of the previous patch series.

Sorry, I'm lagging behind on my QEMU reviews.  I'll get to it tomorrow
or next week.

Thanks,

Paolo


