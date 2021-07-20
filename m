Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA753D0122
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:01:55 +0200 (CEST)
Received: from localhost ([::1]:54648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5u42-00087C-EW
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u21-0006VY-5n
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u1z-0005i1-2I
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626803986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dqhclZ5rTEumFUVvTN8WrFhd5oz0Z9oiLRsQzZe/P04=;
 b=OXJws2meg7MQuB9LbxV8rpCKOR+MuBvMWIGutljsmmPxvTLBjWezSz0MbQYGj19kd/QOlA
 +N2QjD/xf0K/Q5AO411pQg8JsqbYR+SBq08iT7ZHyPHOgWGdmfSYv6DpThSZnjLR9L2Kut
 r9ipUkRpnmajBcFA9+bmr/BOvjKSAXk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-LoRMjGgKNuW8SsDHQT24UQ-1; Tue, 20 Jul 2021 13:59:45 -0400
X-MC-Unique: LoRMjGgKNuW8SsDHQT24UQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 g13-20020a05600c4ecdb0290242a8f4cf9cso27491wmq.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 10:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dqhclZ5rTEumFUVvTN8WrFhd5oz0Z9oiLRsQzZe/P04=;
 b=R9hOINwnPE3IHuv5LN8JLHIcfa8WQXeiCmM0ianKpLXfs20DZA+M2Bl6Ho50PRzSqF
 3xaNsOUL7nBY+Il37pWBXhzAp9smcEhTHqv5KEJET87enpPUNNOCo3VvtsKDbQknSiTY
 frr76Xnu4rTcn2ADee+bXKGQNFaVjgMAFQljFiTsmbclmMb5nfEyFGnBgjUdF9cRfc/g
 k1XO9NCRMQVaTAJi/IrmXpbbNVrGGRYCRTxX/DpgksPLBwQIJMm8z/YTVUVkAjrRfp/7
 1x5MbjFuw9TTTA60Wo54m1ZBnczD8hD79U8w4/HulYaOn3duKmx0YA0FL+RBQrgKvQ6C
 G4nQ==
X-Gm-Message-State: AOAM532JzJlSuywSCx9ddXFPqLPYcj4NFe5Be2yLVEagUpxcokT6bow1
 lR0G6lhkIx8BgP+bYuIEnW8GIpdClSupdkJt7GvgzM/fXiH/NL9Dm/3rrVciRJjdOiQzjyt/8DP
 AOlHIrg7jXVlZHzQ=
X-Received: by 2002:a05:600c:a04:: with SMTP id
 z4mr32289536wmp.103.1626803984321; 
 Tue, 20 Jul 2021 10:59:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhcNLF9MwhAEQmSFFMEzs5AvoeE3jGGtUFlNO81wKVMKCjowOoXy0WjTFe2PdZ5S1vbbUeqw==
X-Received: by 2002:a05:600c:a04:: with SMTP id
 z4mr32289529wmp.103.1626803984153; 
 Tue, 20 Jul 2021 10:59:44 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id f11sm2926797wmb.14.2021.07.20.10.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 10:59:43 -0700 (PDT)
Subject: Re: [PATCH v2 09/17] iotests/297: Don't rely on distro-specific
 linter binaries
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210720173336.1876937-1-jsnow@redhat.com>
 <20210720173336.1876937-10-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5c9895d4-c94e-c804-06a3-9dad3b226e91@redhat.com>
Date: Tue, 20 Jul 2021 19:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720173336.1876937-10-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 7:33 PM, John Snow wrote:
> 'pylint-3' is another Fedora-ism. Use "python3 -m pylint" or "python3 -m
> mypy" to access these scripts instead. This style of invocation will
> prefer the "correct" tool when run in a virtual environment.
> 
> Note that we still check for "pylint-3" before the test begins -- this
> check is now "overly strict", but shouldn't cause anything that was
> already running correctly to start failing.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/297 | 45 ++++++++++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


