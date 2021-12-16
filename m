Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D09B4773E9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:02:48 +0100 (CET)
Received: from localhost ([::1]:51458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrLL-0008KG-JA
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:02:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxrEP-0006IV-4t
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:55:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxrEL-0002Pw-0a
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639662931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4tWi0CELFcouf8NJ5zdsUJnAgLLBiqnzOZpCknwHqZs=;
 b=cxo/YqMfdZwiT7uGilkclKh9X/1vFru3uVGFn+RJ77D1mLdSroXW/82fQEx8MkYWkUGbfx
 7LsfEJrf5qr/Wq7mjrc68EodNX27X2JVeik/hyh6//lmH3cvPfecacvYvVGQR/JDtY9Hmt
 8GZjpCztBUjHSR28tBh2x99zfXozuAM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-d3QTVY-BMNCVY8X3wVgqpA-1; Thu, 16 Dec 2021 08:55:30 -0500
X-MC-Unique: d3QTVY-BMNCVY8X3wVgqpA-1
Received: by mail-qt1-f198.google.com with SMTP id
 g2-20020ac87d02000000b002b277218d03so33534065qtb.16
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:55:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4tWi0CELFcouf8NJ5zdsUJnAgLLBiqnzOZpCknwHqZs=;
 b=biV07hFAPq5DYldVIjIfZQFB8b03W0Xoi1C24K1ikeATmGvbSnQnV2WA8ynYhu+n+A
 lX19Q0MxiEHolAO7Du5nikChtVSchFJCz1cOcDjCWV3ckV+O0TCjwcmGzAAKkfGIgkH+
 SBEf78meQkZiYvjKidxxNpniyj/lkArkfukBYejETCIuWPl/+ydzBoiFCrPPTSS7/leJ
 98lNgQMcH1Q/iA22cZdIt7D7W/50bkBhbDOaYepW1FKDDqhY4ZyED8v6Db4X217Tzfxv
 /6LOG7nIfw7rgVUkxEA7mZxLhgpeozcBELyUuCVypfXP1yHeDfQY4X97FxVM/g5ltoRL
 9VJQ==
X-Gm-Message-State: AOAM531pkOPWAWDYUtLCmSFIRxdcbKS1BqRimW4X9tLC6hWs7CoSOBZ2
 X/osbuub8XkRzmc3YT8kYhGF5iKLElc6Fm8mWIjc9AKieDe7r8FmPA0SuVQMMT9dJT7G7CH84nF
 I7bQnEi8QYTVDH/4=
X-Received: by 2002:ac8:7d0e:: with SMTP id g14mr16753347qtb.638.1639662930351; 
 Thu, 16 Dec 2021 05:55:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzndjLTAterd844PPRVr4IbYBGeOKpP/bdrQsVHyS62ked+O0ZazKzqthCt3/OPzo5AbBixHg==
X-Received: by 2002:ac8:7d0e:: with SMTP id g14mr16753316qtb.638.1639662930146; 
 Thu, 16 Dec 2021 05:55:30 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id ay36sm2760591qkb.60.2021.12.16.05.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:55:29 -0800 (PST)
Date: Thu, 16 Dec 2021 10:55:22 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 18/25] iotests: switch to AQMP
Message-ID: <20211216135522.qy74zxp6k63luv2c@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-19-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-19-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 02:39:32PM -0500, John Snow wrote:
> Simply import the type defition from the new location.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 83bfedb902..cb21aebe36 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -37,7 +37,7 @@
>  from contextlib import contextmanager
>  
>  from qemu.machine import qtest
> -from qemu.qmp import QMPMessage
> +from qemu.aqmp.legacy import QMPMessage
>  
>  # Use this logger for logging messages directly from the iotests module
>  logger = logging.getLogger('qemu.iotests')

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


