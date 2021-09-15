Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDA940C3BF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:43:51 +0200 (CEST)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQSOM-0006kT-5Q
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQS7G-00006t-3O
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQS7D-0006Xy-Rh
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631701566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/JniSkWW/YkW6g+j6GgeBlsXM8bvqxJYYEBrXQ4AEk=;
 b=ahYJ0BMeN7LPTAumzN0eHX/tj1I7qj29bEQ3ZW6A8mZM1ZtSnhC33ow9/xheyKKJr57src
 A9+2Rf0uIaqItsaSXsWMhV5Rl96h0DCw9vCve3DR9HiZG+WzjMCdP51576GaEZ9fOhU+lw
 Tha4GxE7S9pv94PoWS9XjPxLDEVr1oc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-SCTSUTSfNbeFoNDwuaPjrw-1; Wed, 15 Sep 2021 06:26:03 -0400
X-MC-Unique: SCTSUTSfNbeFoNDwuaPjrw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r7-20020a5d6947000000b0015e0f68a63bso835238wrw.22
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 03:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e/JniSkWW/YkW6g+j6GgeBlsXM8bvqxJYYEBrXQ4AEk=;
 b=G90RJw2uZiOUADdPs4o0eaVy5fivNxSgoXRdimdyfnHIM6kW+Ef5qJzuMl/95T+aGl
 x5zxHAMO7JNXK9RfcJfcQqmbXA2mApA76rPgqsutGWHxJIr/ccfijt+Uk4lU3nOOaN0w
 bpUV6OtNytLZfMQqnaxZPJfH20HvYdLEjpQPE476srOWrQrcXvnEkOLvCVyhh5kN9CkC
 NW9lCKP/q8AoWSmcJ0KXTkxqwB0EyENw1+avAz8K4brl+ZG4KB/1kXIjmak276Za5XD6
 QAZy3UwQUBc8r4LNDnhsG3lNH8Inex0lXomAwaPlkJECxdLrx8n1rKrgLGzQ/Us6pF7T
 /BGw==
X-Gm-Message-State: AOAM530ZazxonkbUaKvbbVLS1SyGfwoflgZ+p/UAdlEyMf/mjhf+OgHT
 f4nq+LXUjEMuOh5pmX+iJRyJ4YCR3/duNm5e02SPra6/nhUTTDm9YfXBPraZr3F8GzPs2td5Gri
 Nh3g/IN9D7EcRFNM=
X-Received: by 2002:a1c:770d:: with SMTP id t13mr3540121wmi.77.1631701562109; 
 Wed, 15 Sep 2021 03:26:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxz9rPgnX+3R1Bbv5kA5VJ2sojpcSIAEtGEtoQuFqodvQqC7aglf8I9/p5chUSnS2YBro3NyQ==
X-Received: by 2002:a1c:770d:: with SMTP id t13mr3540103wmi.77.1631701561949; 
 Wed, 15 Sep 2021 03:26:01 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id v20sm13444320wra.73.2021.09.15.03.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 03:26:01 -0700 (PDT)
Subject: Re: [PATCH v4 00/10] qcow2 check: check some reserved bits and
 subcluster bitmaps
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <b21945d7-39bc-2353-be56-c7ebf6be18b8@redhat.com>
Date: Wed, 15 Sep 2021 12:26:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914122454.141075-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.09.21 14:24, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
>
> Here are some good refactorings and new (qemu-img check) checks for
> qcow2.

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block/

(Patch 6 is here: 
https://gitlab.com/hreitz/qemu/-/commit/93c40e7dab205047245028e97f7470d89c3a7ef3 
– just to confirm the resolution fits what you had in mind)

Hanna


