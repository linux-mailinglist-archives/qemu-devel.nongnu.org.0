Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0DB42B95D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 09:39:44 +0200 (CEST)
Received: from localhost ([::1]:44864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maYrX-0005Pu-5y
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 03:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maYqf-0004jJ-4L
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maYqd-0002dB-HU
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634110726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hfNWcteBihUQy021Uwt3t/tXXwL97d8lDQi4htgzl3E=;
 b=Pnr0o8aVrs248KKDxjLIgiltYqdayXf5SheMxnYfL/fkBU2+wuBKyzHfHCDuHAaQHD/LJn
 LGHe95Nlw8dWgW3D1B3qDnJqcnNXE3GlDoUSu/d1QK0bWGg6SyHI3B1NPuUN+ZyZsUzSRW
 pk9hUXF6v2Gi55dRQsjagSJYOG9PiuY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-LCLYjm6WOs-nzzza9jWzuQ-1; Wed, 13 Oct 2021 03:38:45 -0400
X-MC-Unique: LCLYjm6WOs-nzzza9jWzuQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso1202873wrb.20
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 00:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hfNWcteBihUQy021Uwt3t/tXXwL97d8lDQi4htgzl3E=;
 b=DCKz13AXbRomrbu1zxWYYSAC0dVZ24QbEPFsG3vKjovwQ3HZD2ssITmqPW6SHGccA1
 m0yzGsl9Mfdf/gah4QHytUggLlbvz21bhMFBPsKgziYEKPWliNaB6B3dJIyMhrm85+Ah
 6ZPJeWRofsx2Nw69NyEtjvdqG5Fs0Todj5L5G3QAXFBqGBpZeDmKC+SOmeNe55DHZKqY
 JDwOZ0a0K6k6UiYuzr1ok6W1qgsGdcyEJOgNcSd+2xZZlxUJr7D1m8kfuBcnlCDIEiii
 v5BM51ezk8JwGbtPjjk/3cGXNK/S4fWYdzhCQLQ1Opwdx4KUrjXXnsT5C06o8ZJiSV5j
 tjZw==
X-Gm-Message-State: AOAM530aeveOEPoTvCtIJ1WENXtPpRRau1AwlzJvvuYmN3yolOQUfdaE
 aHHLxpRS9SGXbErXZmLXL5g4+yPi5PZgGmkb6XLfb8TGMbCLHzmvU+023D3mcsPg30xjujdfUDL
 VBAzdFRBEVu3RWK4=
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr11397603wmh.54.1634110724490; 
 Wed, 13 Oct 2021 00:38:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmAKgR+GjO4iFyPu41+bee/r3ttyEqsJMvQ507yx+ARj9TyH1n1WT6uDmS5CuljlGRrTZ4fw==
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr11397585wmh.54.1634110724321; 
 Wed, 13 Oct 2021 00:38:44 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id z133sm4750330wmc.45.2021.10.13.00.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 00:38:44 -0700 (PDT)
Message-ID: <c751560a-d0f6-ca24-1432-888c5391eddf@redhat.com>
Date: Wed, 13 Oct 2021 09:38:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 4/7] iotests: Accommodate async QMP Exception classes
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211012223445.1051101-1-jsnow@redhat.com>
 <20211012223445.1051101-5-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211012223445.1051101-5-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 13.10.21 00:34, John Snow wrote:
> (But continue to support the old ones for now, too.)
>
> There are very few cases of any user of QEMUMachine or a subclass
> thereof relying on a QMP Exception type. If you'd like to check for
> yourself, you want to grep for all of the derivatives of QMPError,
> excluding 'AQMPError' and its derivatives. That'd be these:
>
> - QMPError
> - QMPConnectError
> - QMPCapabilitiesError
> - QMPTimeoutError
> - QMPProtocolError
> - QMPResponseError
> - QMPBadPortError
>
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   scripts/simplebench/bench_block_job.py    | 3 ++-
>   tests/qemu-iotests/tests/mirror-top-perms | 5 +++--
>   2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


