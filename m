Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DAB43AFAC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:03:46 +0200 (CEST)
Received: from localhost ([::1]:38072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJJ2-0003S2-ST
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfJHO-0002c5-Nq
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfJHJ-0006oB-7I
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635242516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACSmbkhTi+JWhCB8rF5L73y2KVv1QRzIE6skpkRYZKM=;
 b=GJjrNmLqJeuPk3NrbAnFROqlHihTQO+10cWt9IJgGi5gv7uFBMRGu1fxOHOOZKxAqa+Xss
 tRT+6A8A12Jne9TPh1XZHptYjCucctmZNZW7EK+L+tw9UV0cdqq+jI6oZ80TftUEnxRdT/
 LAKOxbtw22vY4usMbUWfJPnaxEnLIJM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-i19VA3VpOBmgjvvGodwTuQ-1; Tue, 26 Oct 2021 06:01:55 -0400
X-MC-Unique: i19VA3VpOBmgjvvGodwTuQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 y9-20020a5d6209000000b001684625427eso2688245wru.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ACSmbkhTi+JWhCB8rF5L73y2KVv1QRzIE6skpkRYZKM=;
 b=RUe5li8T9f4CqXiWzSvO1Ujg9b27X0yZ2qj8Nsi98QZC2ibQajyH9NWsH6CjOWLtR5
 0Q++lqmro+JL8CVeUK7+jzz/wApAIVamg0kqgnzbgz3sCfSmdAUIe5wkfVdBQSTp+EJX
 XHiT7WbN93Bmz3wAfj1hCRmef92eDLdqbvyQrvTtvmiOTWKTMZl/Su5m9wdBQQUxoR6+
 RvQiqRDZxKSxIu1vbQ6mFxhczHppMVV9/kXpleAVzJBzMQ53uZYWjhboSLu/O0IMF4Yj
 MBwBUIkO/hjVjGJNHAZIWzoLLJdoBEh66qmkN0o21tcVZJZeS450dhp3fBTTtJXYaq8T
 JScg==
X-Gm-Message-State: AOAM530ucDUG+usRYl8U9Qw/tNGtePxDnZAkO07xo0g9bYHPj43S8WKa
 NZbvsah/MCeSV0EmXJOz85fbZm5b9EMFNtPMFibcBqIFaD4pxpTH6RgINkjy20z5VI+DPBahqVH
 qMWv/p9iCNDwnPNM=
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr55352050wmq.63.1635242514379; 
 Tue, 26 Oct 2021 03:01:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSRkjto/E5y15v/B4L5q821iGVFAUtT/l519Z2UvcxbH87oiRQDOrf2dRjC14BTccsmFRdug==
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr55352032wmq.63.1635242514196; 
 Tue, 26 Oct 2021 03:01:54 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id d1sm19047418wrr.72.2021.10.26.03.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:01:53 -0700 (PDT)
Message-ID: <8a4f1a73-b409-0865-f4eb-35f7f0ca55a6@redhat.com>
Date: Tue, 26 Oct 2021 12:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 07/15] iotests/297: refactor run_[mypy|pylint] as
 generic execution shim
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-8-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211019144918.3159078-8-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.10.21 16:49, John Snow wrote:
> There's virtually nothing special here anymore; we can combine these
> into a single, rather generic function.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297 | 42 ++++++++++++++++++++++--------------------
>   1 file changed, 22 insertions(+), 20 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


