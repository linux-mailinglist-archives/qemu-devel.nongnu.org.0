Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C9A347BED
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:18:36 +0100 (CET)
Received: from localhost ([::1]:46494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP5HG-0004fN-Tm
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lP5Fx-00041j-VA
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lP5Fv-0000on-Ah
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616599029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqdmI6XB2rEUGarY7bJq2yeq6u/+x0KoVNtsWHJxMr4=;
 b=dtTGZCNWWHTxLLxamRyBa14D9rD7OQFhdY7uGNHxMqpz9HkvxF9Zq9boeLaOIKCbVEqAwn
 wWIjNhUMiR8jN5+cVfRG+NX3fV61A4XOALTYzwBs+tlWPVzLA0CTyh51ukiEPzsUgHwDpR
 xyy030MRF1fygW0ZHZgUNo4AntCl6II=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-8iX5Pp_6O9mq08coueoayQ-1; Wed, 24 Mar 2021 11:17:08 -0400
X-MC-Unique: 8iX5Pp_6O9mq08coueoayQ-1
Received: by mail-wr1-f69.google.com with SMTP id h21so1203654wrc.19
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 08:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JqdmI6XB2rEUGarY7bJq2yeq6u/+x0KoVNtsWHJxMr4=;
 b=L6VyL1XsMrK7FB8NOHZ03qMtnaKMFTfiIT6+gugEL3aPv/75c5hNIg9+PPuzhLQ3kL
 YNosgKMRsRgLZ5S5RXWaG2sDAgdx8jKNkN6Z0XkC5CAUHQelFKtV3jL+X/665FX+W/qm
 k9q/miyJv1R5YoOIf7Cc1gK0pgp9ycJdTB5gilOIJNl2c6P2OKfzQXDx8tvqFqj4wQB/
 fdGqC3GvvTXiw9Wyj3WxzSRfkBPEI9mewQpGmsf/TFXkT++EhFHfyQ31VF6M1FSEa73Z
 6G0e8OYP7L4ZXt8+pVhNphPdM8DBlIRWt2jIbjRf7rsJ5bh7ohb+vIfd746JLJGM6TAO
 sNLQ==
X-Gm-Message-State: AOAM533q5/mVZelt8gJ6UwW6XrVfy2HfuJ9n2L78UN5Ed+KgFnWwwEJn
 yR4QPXfsqB05sl47zBNQHdouoZlfyFaezBSLrwh5RIddiUArRgo2XPsYav7BNjKVoFBVYMSnkao
 SEsvc9Gzf9eo5xws=
X-Received: by 2002:adf:c401:: with SMTP id v1mr4179490wrf.242.1616599026589; 
 Wed, 24 Mar 2021 08:17:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsJdJXUORfubhiVmlRiyW3ugTtHn47MZnNrR0FQC/dyqdw7scYkcGS1uFUOdpJNk1N9ruclg==
X-Received: by 2002:adf:c401:: with SMTP id v1mr4179458wrf.242.1616599026315; 
 Wed, 24 Mar 2021 08:17:06 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.229])
 by smtp.gmail.com with ESMTPSA id c11sm3540412wrm.67.2021.03.24.08.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 08:17:05 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] qemu-iotests: quality of life improvements
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210323181928.311862-1-pbonzini@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <ccc12713-51fa-ba77-af2a-e43e926c7aa7@redhat.com>
Date: Wed, 24 Mar 2021 16:17:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323181928.311862-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 23/03/2021 19:19, Paolo Bonzini wrote:
> This series adds a few usability improvements to qemu-iotests, in
> particular:
> 
> - arguments can be passed to Python unittests scripts, for example
>    to run only a subset of the test cases (patches 1-2)
> 
> - it is possible to do "./check -- ../../../tests/qemu-iotests/055 args..."
>    and specify arbitrary arguments to be passed to a single test script.
>    This allows to take advantage of the previous feature and ease debugging
>    of Python tests.
> 
> Paolo
> 
> v1->v2: patches 1-2 are a rewrite of v1's patch 1
>          moved print_env change to patch 4
>          do not use argparse.REMAINDER
> 
> Paolo Bonzini (5):
>    qemu-iotests: do not buffer the test output
>    qemu-iotests: allow passing unittest.main arguments to the test
>      scripts
>    qemu-iotests: move command line and environment handling from
>      TestRunner to TestEnv
>    qemu-iotests: let "check" spawn an arbitrary test command
>    qemu-iotests: fix case of SOCK_DIR already in the environment
> 
>   tests/qemu-iotests/check         | 15 +++++-
>   tests/qemu-iotests/iotests.py    | 78 +++++++++++++++++++-------------
>   tests/qemu-iotests/testenv.py    | 22 +++++++--
>   tests/qemu-iotests/testrunner.py | 15 +-----
>   4 files changed, 81 insertions(+), 49 deletions(-)
> 

I can confirm that this helps a lot when debugging tests.

Tested-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


