Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118A342BFE9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:26:50 +0200 (CEST)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1madLM-0008J7-Sf
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1madIL-00063r-Fx
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:23:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1madIJ-0006ex-Rr
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634127819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6JM8hEzCjKvGVc89286cdUW5Y5TwuQTXup3OW1FJwA=;
 b=ZGBLdnyNCGnUHZyW69LM83z1lmdzf3K0ffFgaCbdhN9KQhtnTuRHmHvwYMp2lAcbKFW3XL
 gU8FzgG4WhYaKwA3LmdKqDug3WUa3qEsLTuHLuOyvy/6erIc1Ert34/MHp8DNe9hhDqA35
 0OPI5AmavwXZn+V6R1iXr1Zwzd456vk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-S2FZEkQHOUamR4fPQK7Y9A-1; Wed, 13 Oct 2021 08:23:37 -0400
X-MC-Unique: S2FZEkQHOUamR4fPQK7Y9A-1
Received: by mail-wr1-f70.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so1887102wrh.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z6JM8hEzCjKvGVc89286cdUW5Y5TwuQTXup3OW1FJwA=;
 b=jmrN53sV8SYjD9uV3kZeb2SN3w5GZXdbIW6o/srhjwfsV+xIQVe40G/MBIPdYzh9KB
 9KS+kHzxTGUEr932Fk/HmftGDazwrNg9mSJWMFRpWgqcDuraNNxurByY+jpE+BfJZ44J
 bSGfBuifFfiEszjLAwXk+FMPMKQOcOkk8fGZy4U4p316i3CxFdW63WJhr0zYBA4+LWXJ
 0VnbzEMogVmWvdA50fFLzKrUG+YdbHgjaPKtnFYIlZXgGA2j0KcMp44cNsNXDUMmw52q
 YmM5QW93pq0RsTSEqmjQEEUwajVuR8usNXfzV/oRmtH+9gtbztElw+CfJI9yeYkbbgUK
 Riaw==
X-Gm-Message-State: AOAM53278NAYZs5xJE3J47F6qqGCP59QwVWq5OrXnBbGI5PboS9495fL
 HwbCrGgWIF4JfPZCSgLU5Uzee1BJqUwa9Xoq62A+LJlRIFvmIUF9Ydw3cLBiPVGZl61uzDloWaI
 rq30D+QghYQyKdqs=
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr12815571wmq.124.1634127816837; 
 Wed, 13 Oct 2021 05:23:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4bmSMXwjkHAttvXxX/Wbh9w7FpJRETg2okhS4WtKiMESedQnAzRgxdIoTR+aYxsd2VyNm8w==
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr12815561wmq.124.1634127816721; 
 Wed, 13 Oct 2021 05:23:36 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id a2sm13229971wrq.9.2021.10.13.05.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 05:23:36 -0700 (PDT)
Message-ID: <51e1976f-baed-9fb4-f80f-78779663a9ba@redhat.com>
Date: Wed, 13 Oct 2021 14:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 13/13] iotests: [RFC] drop iotest 297
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-14-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-14-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 23:05, John Snow wrote:
> (This is highlighting a what-if, which might make it clear why any
> special infrastructure is still required at all. It's not intended to
> actually be merged at this step -- running JUST the iotest linters from
> e.g. 'make check' is not yet accommodated, so there's no suitable
> replacement for 297 for block test authors.)

OK, acknowledged. :)

Hanna

> Drop 297. As a consequence, we no longer need to pass an environment
> variable to the mypy/pylint invocations, so that can be dropped. We also
> now no longer need to hide output-except-on-error, so that can be
> dropped as well.
>
> The only thing that necessitates any special running logic anymore is
> the skip list and the python-test-detection code. Without those, we
> could easily codify the tests as simply:
>
> [pylint|mypy] *.py tests/*.py
>
> ... and drop this entire file. We're not quite there yet, though.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297        | 52 -----------------------------------
>   tests/qemu-iotests/297.out    |  2 --
>   tests/qemu-iotests/linters.py | 20 ++------------
>   3 files changed, 2 insertions(+), 72 deletions(-)
>   delete mode 100755 tests/qemu-iotests/297
>   delete mode 100644 tests/qemu-iotests/297.out


