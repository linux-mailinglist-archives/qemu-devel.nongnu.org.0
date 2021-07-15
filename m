Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52783C9F8A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 15:33:38 +0200 (CEST)
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m41Uf-0001Mx-P3
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 09:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m41TC-0000Oq-SP
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m41TB-0008Ac-7c
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626355924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CacGam6aF0RRhehNnA3e0JC6CBvukYoKyz5nbk9aIQA=;
 b=ZLD0jqVuCRWqHqq+v8wTEq+Ejf7LvGZ93OidIP5vi65XBDf1OPDRWWQ99gM1u0AOsTgbSx
 aZ6sfiwe/RaDZtdzwPPGA5fkh11jBMNxNZMz5j3WwA9QWWRWu2hyWryqFdZDYS7/kKgtCB
 6Bv6NMEM+pN39yoSkRmn5e7vGoIIxSM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-niR0s0h7PWiGCJvKX8qBSA-1; Thu, 15 Jul 2021 09:32:03 -0400
X-MC-Unique: niR0s0h7PWiGCJvKX8qBSA-1
Received: by mail-wm1-f70.google.com with SMTP id
 x6-20020a7bc2060000b0290218ad9a8d4aso1708276wmi.1
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 06:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CacGam6aF0RRhehNnA3e0JC6CBvukYoKyz5nbk9aIQA=;
 b=UN7c2uEDxiW3/jVFXcEdHabJbCRlZx+//eggGTHbq2MM799DXoQZUEtVygprEX7run
 zltk8GahVCSFPmrrGBpRxDIvYNRJL8dd3AWNDDKi9zQpVgoqo4l8H3qmaX3b/9Ezo5qm
 07zATgCgzg5UiwWtJfU4TFD3lsSUWaWH+au7Pqca1+MWKzH+EQDSmaZ77IKf/2NR+NOG
 gnZQ7oHe3J2y1yFtF7NYuKCtt4roA0QH/Oxp/+V5+SikXZBp55lOMV7cGKnGFTJJ6DWh
 8vTGuETyW4UpKqmm60Mq0R8v+Urg5B77bsEHBGnXSLW9+wahAnLu/lbhUBOfHn6osBNY
 rpaA==
X-Gm-Message-State: AOAM530/TI56X8DNKBpp8SWsQsUaFOtlJmXrDKwLsZ61pOBUJoYVJAhW
 CkZRiLIeH8ifUhFpK4w9R6xxrjcxP9PVakkwM5sowJLCwYkLAj4Y1MpYzlBKwPTgd1Xybd8q0mM
 Ob3g3nCwrAlM3M7wiASfG/VmVg2afFeeqUhNRTbwhCWYf6I5ZCv4Z92l9u58DQYgk
X-Received: by 2002:a7b:c1cd:: with SMTP id a13mr4504218wmj.94.1626355921969; 
 Thu, 15 Jul 2021 06:32:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXFXchYBDG7RMO43s+dXC1Jc9BbNi0Ctoy4J8X6Bm8Xx70L1iiKCEheE3pKx9FnWwIOArVYA==
X-Received: by 2002:a7b:c1cd:: with SMTP id a13mr4504184wmj.94.1626355921751; 
 Thu, 15 Jul 2021 06:32:01 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 f2sm6376266wrq.69.2021.07.15.06.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 06:32:01 -0700 (PDT)
Subject: Re: [PATCH v8 16/16] docs/devel/testing: add -p option to the debug
 section of QEMU iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210705065711.127119-1-eesposit@redhat.com>
 <20210705065711.127119-17-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b13ffa83-1f47-496f-be82-b671ed1668c2@redhat.com>
Date: Thu, 15 Jul 2021 15:32:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705065711.127119-17-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 08:57, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   docs/devel/testing.rst | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 719accdb1e..e5311cb167 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -249,6 +249,10 @@ a failing test:
>   * ``-d`` (debug) just increases the logging verbosity, showing
>     for example the QMP commands and answers.
>   
> +* ``-p`` (print) redirect QEMU’s stdout and stderr to the test output,

Sorry, my bad: s/redirect/redirects/

With that fixed:

Reviewed-by: Max Reitz <mreitz@redhat.com>

Max

> +  instead of saving it into a log file in
> +  ``$TEST_DIR/qemu-machine-<random_string>``.
> +
>   Test case groups
>   ----------------
>   


