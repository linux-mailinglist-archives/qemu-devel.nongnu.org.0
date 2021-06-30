Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E90F3B85BC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:05:21 +0200 (CEST)
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybmC-0000Pe-Ki
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lybjG-0007SJ-1q
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lybjD-000237-IN
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625065334;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iumui361QxMnp5y5fr9HA6BZ/qpC0DEZYSomh//NyX8=;
 b=IYogJ1tma22B4OY4ccVFROGEFPVqakt+i4A9fSP/C55hgbCjN1B8/Zsl09GyiY1LcZyDYC
 R0V+EOLgljk8GSXeuDkb7ymu7HpvPt4tYEMcXg9odCKtnOkmrHkYGVM6WGtlk1LUrd4+Sw
 f1jn8mmNB7l+3GEOUC59NV3NQi/HSgg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-Lcj6xXQdMu-tJ05y3dC_Ow-1; Wed, 30 Jun 2021 11:02:13 -0400
X-MC-Unique: Lcj6xXQdMu-tJ05y3dC_Ow-1
Received: by mail-pl1-f198.google.com with SMTP id
 e14-20020a170902784eb0290102b64712f9so1293305pln.10
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Iumui361QxMnp5y5fr9HA6BZ/qpC0DEZYSomh//NyX8=;
 b=EshRF7cFhBhH3mJI9DRUGHedQRGm7I4lOHgsGoZ9OLturRkZbIPh58f40wHXPHvOZm
 3x9icCShVIzbuJwISr+dpF7SvRLDjr5OysKovhIvuLzaBCMAoldcLjHsXbmqapFgxMnT
 RhGG72lYqpBmaoUoFQ6BuHI9typ/i1QrrVzMJ25sTHa1+MO6wpMiZLMCoPNUv6Grp48Z
 7KM6kuvkO1HaVM0S1W1N0hnKGafCooOJZNWVFMtfsXWTDijxLJzoQ9+E4pXQpdZ4KYGi
 mys/vDaZrxeT8lRqpNvImTWHR/JzvGfWv1tkjIwKr6oufySBRS23bqOjpqzonbSRMOdh
 4kSg==
X-Gm-Message-State: AOAM531FbL1RT/r8bVy2+GVumqSSkBBMMcURE/1V2ugLO5sRmrrTfJA1
 2WKyYtMlPXYKPVs2yWt66hU1Fow+VxUBMxr2JJMIVkVcJkT6ppzKn5GkKdaI5Nt3Xr6r83GdLp2
 Jq+7krTGyETynz9w=
X-Received: by 2002:a63:514c:: with SMTP id r12mr4462502pgl.70.1625064882958; 
 Wed, 30 Jun 2021 07:54:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtR7nS1TiUSRAubEZX1GQWUy0dbOlVQCwyR+bSYHolfBsYmEm8NhH71d0UB8UxTAvQ/yOf8A==
X-Received: by 2002:a63:514c:: with SMTP id r12mr4462483pgl.70.1625064882717; 
 Wed, 30 Jun 2021 07:54:42 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id 9sm3433679pfv.42.2021.06.30.07.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 07:54:42 -0700 (PDT)
Subject: Re: [PATCH v3 10/15] python: only check qemu/ subdir with flake8
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210629214323.1329806-1-jsnow@redhat.com>
 <20210629214323.1329806-11-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <2144725e-1529-db7c-2441-233ca4a5bb01@redhat.com>
Date: Wed, 30 Jun 2021 11:54:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210629214323.1329806-11-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/29/21 6:43 PM, John Snow wrote:
> flake8 is a little eager to check everything it can. Limit it to
> checking inside the qemu namespace directory only. Update setup.cfg now
> that the exclude patterns are no longer necessary.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/setup.cfg       | 2 --
>   python/tests/flake8.sh | 2 +-
>   2 files changed, 1 insertion(+), 3 deletions(-)

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

How I tested it:

$ make check-dev
VENV .dev-venv
ACTIVATE .dev-venv
INSTALL qemu[devel] .dev-venv
ACTIVATE .dev-venv
make[1]: Entering directory '/home/wmoschet/src/qemu/python'
JOB ID     : 41162d4a9e93095abb66c219227b6af27edbcf43
JOB LOG    : 
/home/wmoschet/avocado/job-results/job-2021-06-30T11.50-41162d4/job.log
  (1/4) tests/flake8.sh: PASS (0.30 s)
  (2/4) tests/isort.sh: PASS (0.12 s)
  (3/4) tests/mypy.sh: PASS (0.32 s)
  (4/4) tests/pylint.sh: PASS (4.46 s)
RESULTS    : PASS 4 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | 
CANCEL 0
JOB TIME   : 8.46 s
make[1]: Leaving directory '/home/wmoschet/src/qemu/python'

>
> diff --git a/python/setup.cfg b/python/setup.cfg
> index e730f208d3..11f71d5312 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -62,8 +62,6 @@ console_scripts =
>   [flake8]
>   extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
>   exclude = __pycache__,
> -          .venv,
> -          .tox,
>   
>   [mypy]
>   strict = True
> diff --git a/python/tests/flake8.sh b/python/tests/flake8.sh
> index 51e0788462..1cd7d40fad 100755
> --- a/python/tests/flake8.sh
> +++ b/python/tests/flake8.sh
> @@ -1,2 +1,2 @@
>   #!/bin/sh -e
> -python3 -m flake8
> +python3 -m flake8 qemu/


