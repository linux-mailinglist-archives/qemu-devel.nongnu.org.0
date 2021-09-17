Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F173E40FA35
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:32:54 +0200 (CEST)
Received: from localhost ([::1]:51772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREv7-00040e-PM
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mREsg-00031h-UJ
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mREsc-0007bb-IU
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhXcF/ewmGYXgcr/AQOoADqOiXFPF3801VgywbgnzP4=;
 b=dC/PcvqF0e/Rslw31J4t+2TOw+J7G8oCO3NqD13SDwHFZ5Nyj09mtQY1aaWCvRhLeTyqeM
 exhmx1aoLy1BN9wE2yYDItkANzy52A4D+CvPSrxdTBfJFPSimcnbmk75TXnMcHAuGtT5nE
 idyjJW+YiW0gXTXLJeIdqQuNaOypIgs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-6upuU7MuPW6js5n-kzZ-Ng-1; Fri, 17 Sep 2021 10:30:16 -0400
X-MC-Unique: 6upuU7MuPW6js5n-kzZ-Ng-1
Received: by mail-wr1-f70.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso3783957wrw.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 07:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VhXcF/ewmGYXgcr/AQOoADqOiXFPF3801VgywbgnzP4=;
 b=rtGr6To4lcurGGfJueA9bL+Re7o3KPgyx0rMQiMkw4WoOVoCEytKd0UpAjqgLIOrYj
 cLJywJHxh2wSmlRWAIPzSeRU/wZefTSI6Cjrfqez+s2eL51Jvy4igFy0MiTdJj6xHL3j
 2sxMZBZlaJERD+Lhal50oWki/tQXgfVFFmW6oqAyfi4lR1oi/ikO+DMelk+dPkM73SUe
 UL+m+XyoTEYvX8wobw38AaJzL1URwGjAhy2SS6piWo9Q3FCvJizkd9cDjpWAlPc5l7r5
 JlaLPZOQcLcnoDMRYhHLv1cFAmlLZ+9k8+Nd3mvJ4S7i5m1FGUjhfDieU3gkcg0g58b/
 wCsw==
X-Gm-Message-State: AOAM5310yOMLU3Pk5jnikWIQKqXC0wyOwwjcGmxOYzVwBPCBWzIduYtA
 wyKxH+r1jCVjeTSxoGIVAayJzjFxcy/x3IIgTaO/sUaVeogdxy6wObm5wxRzcWJldL1RCTijrt7
 /kHb+lZRYsPt8L6U=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr12249906wrq.263.1631889015502; 
 Fri, 17 Sep 2021 07:30:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy4lbExTi/cgymM3Bc57Z7Xg1hgI2E38TXpVg37SFPPtPLxQEfxXBFb8Pxv2DIKKboWv5lAg==
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr12249885wrq.263.1631889015321; 
 Fri, 17 Sep 2021 07:30:15 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id s24sm6269435wmh.34.2021.09.17.07.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:30:15 -0700 (PDT)
Subject: Re: [PATCH 12/15] iotests: Disable AQMP logging under non-debug modes
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-13-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <e885ae38-5e31-8a89-96d2-10ffab69e373@redhat.com>
Date: Fri, 17 Sep 2021 16:30:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-13-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 07:40, John Snow wrote:
> Disable the aqmp logger, which likes to (at the moment) print out
> intermediate warnings and errors that cause session termination; disable
> them so they don't interfere with the job output.
>
> Leave any "CRITICAL" warnings enabled though, those are ones that we
> should never see, no matter what.

I mean, looks OK to me, but from what I understand (i.e. little), 
qmp_client doesn’t log CRITICAL messages, at least I can’t see any. Only 
ERRORs.

I guess I’m missing some CRITICAL messages in external functions called 
from qmp_client.py, but shouldn’t we still keep ERRORs?

Hanna

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 273d2777ae..47e5f9738b 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -1383,6 +1383,8 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
>       if debug:
>           sys.argv.remove('-d')
>       logging.basicConfig(level=(logging.DEBUG if debug else logging.WARN))
> +    if not debug:
> +        logging.getLogger("qemu.aqmp.qmp_client").setLevel(logging.CRITICAL)
>   
>       _verify_image_format(supported_fmts, unsupported_fmts)
>       _verify_protocol(supported_protocols, unsupported_protocols)


