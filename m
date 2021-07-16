Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E233CB7F2
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 15:37:54 +0200 (CEST)
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4O2K-00079C-L7
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 09:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4O0Z-00041f-Io
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4NwB-0007rX-Oe
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626442290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOYmuDZUABt2Z5tkHO0Pva481vcRPQCYMmiZNL2Ibbk=;
 b=h7vokA2Pa/0O+Wa0s+6/Q/cMbwruQtxPdiTbvrj0WoksZ2EVmPM7+Uk+VvJB/Bzucz/PqN
 jDXICRgrBQ3I1g7Wh5OmiyIXmkYD6K5u7tZb9mvullRbt6zXQVremEh2Ymigrilm6QcEY+
 07/m2yCt9IPAX07RlU1kP2kt8qrN63k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-9moZRiZyMwK4Xlg3ZHF58w-1; Fri, 16 Jul 2021 09:31:29 -0400
X-MC-Unique: 9moZRiZyMwK4Xlg3ZHF58w-1
Received: by mail-wm1-f69.google.com with SMTP id
 j141-20020a1c23930000b0290212502cb19aso3186520wmj.0
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 06:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wOYmuDZUABt2Z5tkHO0Pva481vcRPQCYMmiZNL2Ibbk=;
 b=kQAIRab/FTRgSApXcfkN+1Jc089TZXb8vyTP5L6fqknvtkgkSX6WPSoX8bea1Y4I7H
 +Mlq+w0vJghCRbnIPl8pMwSJnIy73kGGZSNS2d4jwfuWxqDmwo1mZ/p9T33mLg+j4MmP
 rnIlL5iXg1/mOIY5NE/kYdoP5nk659KVkHoViP1FNpSBewSB8PBOwDLEZsSfOtg1b3pi
 MRGfBMkoOy5Kjzmiqrw0titdZJPBny+a/yaoBpm682k6nvSKvy6puLk0ah7EB72l5uNs
 JS4MoJAnl7chHhyPZF8bt8M/+RcVuyPsl8i7LP7YQHHb+S6YyP724qU1THcuGkz6Vz1d
 6D+Q==
X-Gm-Message-State: AOAM5316Ox5ooJMW4APTzY4P2TSKsXWGERln8iplaaZy+uj/X3TL8ZG9
 6IYmuRlXweXj4zDfGgj7Zkj8zQWOZXSQryo8bZxW7QvqmgzKGLKqh0aCFH8pkSZt06CxwT18Hre
 EDnw5zVOkoFIn5/I=
X-Received: by 2002:a1c:7f57:: with SMTP id a84mr10436054wmd.46.1626442288209; 
 Fri, 16 Jul 2021 06:31:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVOE/0WT16B1DpSHjKyrzTaNLOF3ctU4/mYpHYlLSZaGZvKJvt9epRQgNwUalfK5A5hjGFHg==
X-Received: by 2002:a1c:7f57:: with SMTP id a84mr10436030wmd.46.1626442288049; 
 Fri, 16 Jul 2021 06:31:28 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 y66sm8248476wmy.39.2021.07.16.06.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 06:31:27 -0700 (PDT)
Subject: Re: [PATCH 13/14] iotest 39: use _qcow2_dump_header
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-14-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f275cae1-70b3-4ae5-c9dd-edd1831dc374@redhat.com>
Date: Fri, 16 Jul 2021 15:31:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-14-vsementsov@virtuozzo.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
> _qcow2_dump_header has filter for compression type, so this change
> makes test pass with IMGOPTS='compression_type=zstd'.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/039 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>

But as I said, I’d prefer this to come right after patch 10.

Max


