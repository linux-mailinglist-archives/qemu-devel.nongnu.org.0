Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF942402D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 16:33:49 +0200 (CEST)
Received: from localhost ([::1]:43764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY7zQ-00070D-LI
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 10:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mY7yF-00064D-9Q
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:32:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mY7yD-0006Rm-O2
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633530753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oqx0fDtWtRTk1edamjc5s/sAAfgZGwVRb+DDcYzw/zg=;
 b=NPKjqcDQ6/UTF7qqMgqjJoAYz/eWzo5lY7gn6tA/NG47iKT7zS0CjWUtFq91z1+noNNYdq
 zcr9oqYFmeSr7FDsmsWPFEWPbEVEyjKivSLJSFKg9ezzzxb21HIGZtZTnSNFrLvPbhEA9o
 e+FKq58OVLoPpA71hxPhatbN/1ETjjM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-5XxaPnDNPom9ZGrMW8zyqw-1; Wed, 06 Oct 2021 10:32:31 -0400
X-MC-Unique: 5XxaPnDNPom9ZGrMW8zyqw-1
Received: by mail-ed1-f70.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so798038edy.14
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 07:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Oqx0fDtWtRTk1edamjc5s/sAAfgZGwVRb+DDcYzw/zg=;
 b=6sIqpAzE941NFbcJ8UAUMcSQL8EmAZKSJf7Jtujv78kcaqMkTub2x7ZtpbJSDfghmh
 1sLWcmwkZovN7KOzoSXMTBWvEl6p8pHJJAvvrrUab15TxsQe4sVsD4C2FAvZq7i0Ciu0
 y5XqolObgizJFjfG92uuDtTtk/2ObmAgDqfmO7d3Ifat5BVio3WDHaw5ylkCFgxJ0Rhr
 KisPMuCNJmE592AWjXPt33A+BNeO2gHGS+bjT6h5N4iKbLqdI6lcuQwBd9gUjm14hPbS
 eiFKgvHXWoG+P0tEL5QQzCJN7NsXhldbpYGYOUDC4WyxLVfA3WthEp+Npb5MW9423/oF
 FWDg==
X-Gm-Message-State: AOAM533Wu6qXuosGEMsUTau9r2zN1Uf7pNaz1l9Gg2D1QFIWuyoKGqFu
 eM72MP7hhRIzH/k5i4tdjcpPlQf23FMLQ8Nh4YCr47LBDVYtbeeIWvHcNuVi/++7GIcJvGdAR06
 sfN1zmyeB14Bkylk=
X-Received: by 2002:a50:fa8c:: with SMTP id w12mr35415031edr.65.1633530749847; 
 Wed, 06 Oct 2021 07:32:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZEIjoEML9JjrwOD1GKrhgJqcYBwycI4RIv+Y7SfCwW/c/RottvZ+2mOSUFdROXld3QA6TAw==
X-Received: by 2002:a50:fa8c:: with SMTP id w12mr35414986edr.65.1633530749521; 
 Wed, 06 Oct 2021 07:32:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id h9sm7732568edr.67.2021.10.06.07.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 07:32:28 -0700 (PDT)
Message-ID: <1b31dc76-c124-be62-340e-00bc85e4c819@redhat.com>
Date: Wed, 6 Oct 2021 16:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 15/17] python/aqmp: Create sync QMP wrapper for iotests
To: John Snow <jsnow@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-16-jsnow@redhat.com>
 <aea93f68-68ff-b1d0-4966-869c89e7f707@redhat.com>
 <CAFn=p-YT_QNNyWc5D5GKoBZncgX-C4a6wULnNerKURL7chTGzw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-YT_QNNyWc5D5GKoBZncgX-C4a6wULnNerKURL7chTGzw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/21 16:24, John Snow wrote:
> 
> I had plans at one point to make a sync.py, but with an interface that 
> matched async QMP itself more closely. I spent some time trying to 
> research how to make a "magic" sync wrapper around async QMP, and hit a 
> few trouble spots. I've still got the patch, but I felt some pressure to 
> try and switch iotests over as fast as possible to get more 
> trial-by-fire time this release cycle. I named them "sync.py" and 
> "legacy.py" in my branch accordingly. Of course, I made a beeline 
> straight for the iotests version, so now it looks odd. I may yet try to 
> clean up the other version, possibly converting legacy.py to work in 
> terms of sync.py, and then converting users in iotests so that I can 
> drop legacy.py.

Got it.  So maybe aqmp.qmp_next or aqmp.qmp_experimental?  What I mean 
is, it's all but legacy. :)

Paolo

> (Mayyyybe. I am not heavily committed to any one particular approach 
> here, other than being very motivated to get AQMP tested widely a good 
> bit before rc0 to have a chance to smooth over any lingering problems 
> that might exist.)


