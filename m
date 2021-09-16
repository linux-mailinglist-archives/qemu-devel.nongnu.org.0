Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F4E40DD97
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:08:52 +0200 (CEST)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQt0N-00054n-4v
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQsts-0006l9-Be
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQstm-0003Vb-47
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631804519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YsKsGAonVX725/1+BJvHYpsrT1g2xx9Dp3XRQ7pfIKM=;
 b=aoE3itd+hq74CVk0orql7p/xE0c6uwNY3Lnxr9PiuUgADgY4XReH6QlQmw+0AujBgNseAH
 aM3a2iBo6QwflrXSQLKjg84rWul5UQ8jVVWaXGcGnG4LdODgN5hrrPRBTIedU6Vw3MdWd6
 TWZR9Lz0oxq+oSYRMrjquQN0uFZhr1U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-0kbOj54PNhq0DP96_b7RGw-1; Thu, 16 Sep 2021 11:01:58 -0400
X-MC-Unique: 0kbOj54PNhq0DP96_b7RGw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so2685478wmq.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YsKsGAonVX725/1+BJvHYpsrT1g2xx9Dp3XRQ7pfIKM=;
 b=0jur6M8N5v1bXqHJ4qXJvVQsFBGQYpHX1mJRsEG5aWB/5ThijWwwsFYCnpenlrRA2l
 Cg991yYA817eC4omHJLCqlpxEUqx1LQD3wU3IpWmVwQu/RqDVWe/q5RVz9dEkTo1QEEQ
 w4cPXdSKMxfTeaMsyidOAXgfuwdnGGpxlF2dYOAMykKSrq1ne+xkR2wzVkfP0qepktyJ
 0DKuY3R8ivzVx9GmGrJDxxd0qjJBx3JuSUTBDBMhl1Bc37Jo1MdEfAa8SwLJJ113vmH2
 bap8ZxYLRx8iqSvn/0lKDJfkX/hIo1tkyjhcz+PDvH3Fl033WHaWM/4qjeD28KSOJ8nL
 Ne4w==
X-Gm-Message-State: AOAM530mi4lYSxy5kwrOX0km8wbWVAuITxveQW+Bm8IIjDXg4RVk7kLa
 fKAVcbweaF0Ml7Wm+JrGzzRHUxFNbBZq0PTJjy8L7OhUAssCWDlb8qgFZesZYq+3vrFywVDgQZs
 JfpJxwTlnskaHEcg=
X-Received: by 2002:adf:e485:: with SMTP id i5mr6486909wrm.22.1631804517262;
 Thu, 16 Sep 2021 08:01:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3zlTCn+SEXQfuxfrBAbhNmRqMZ/47SBN7y2p1LqrZphfYYxOV56rKJ8kQIMmh3h9LA4PejA==
X-Received: by 2002:adf:e485:: with SMTP id i5mr6486785wrm.22.1631804516088;
 Thu, 16 Sep 2021 08:01:56 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id s15sm3804289wrb.22.2021.09.16.08.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 08:01:55 -0700 (PDT)
Subject: Re: [PATCH 09/22] qapi: Convert simple union ImageInfoSpecific to
 flat one
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-10-armbru@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <21247eaa-7980-4d2f-4792-e5d3737c92c8@redhat.com>
Date: Thu, 16 Sep 2021 17:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913123932.3306639-10-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, jsnow@redhat.com, eblake@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.09.21 14:39, Markus Armbruster wrote:
> Simple unions predate flat unions.  Having both complicates the QAPI
> schema language and the QAPI generator.  We haven't been using simple
> unions in new code for a long time, because they are less flexible and
> somewhat awkward on the wire.
>
> To prepare for their removal, convert simple union ImageInfoSpecific
> to an equivalent flat one.  Adds some boilerplate to the schema, which
> is a bit ugly, but a lot easier to maintain than the simple union
> feature.
>
> Implicit enum ImageInfoSpecificKind becomes explicit.  It duplicates
> part of enum BlockdevDriver.  We could reuse BlockdevDriver instead.
>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qapi/block-core.json | 56 ++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 49 insertions(+), 7 deletions(-)

Acked-by: Hanna Reitz <hreitz@redhat.com>


