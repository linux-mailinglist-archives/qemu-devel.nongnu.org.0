Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C9A675023
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 10:04:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pInJ2-00089n-Ki; Fri, 20 Jan 2023 04:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInID-0007wB-0m
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 04:02:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInIB-0004MV-Jz
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 04:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674205354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M669Ra0kWWc5NR7HmCHSAjJ6OFOE8e7akObsZ2e0lPE=;
 b=GnFIy9dUaVrd2z5V6lbGsB+cyksFBJLGLZ50VzcAyj7YlH8XMGUBX/yUFkF/x2b9DkTLSL
 UaruzVcdnLmUTwpzXQSgYQS6uy8CFv46n5RGY3r+iyCIXH8AXuLIbc4yiecvMl/wmVMTvG
 eWlkVPmujWOWNxVfcjS9SCWm4ZVq6Ag=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37--Ru68qqLOJ-r9F5IcQwEZQ-1; Fri, 20 Jan 2023 04:02:33 -0500
X-MC-Unique: -Ru68qqLOJ-r9F5IcQwEZQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 z8-20020a056808064800b0036aae651f2aso1614309oih.17
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 01:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M669Ra0kWWc5NR7HmCHSAjJ6OFOE8e7akObsZ2e0lPE=;
 b=PeDE39h4+aEISfwgg2uZsPH98NWbCfvm3fExtlZlTl+nzoWOCf3ck7gzqYSiYwbOv4
 /xsOxH1LjGe1scteUfKYQuPHLuTH9zlbFtTVWyx3cNk/Pzym4vXng2Tpcm5PkC5R5VBW
 0B+UHredl1pGd+qdxf5c/ZxfBXDRtPa51vOGzbUQwHqgks57+UgD+g7rDr+qsLsv7k5H
 5DNoslCUlLO0arf4/RDMGnSm4RSdQmCPXpCP3wqxCNbt34oTgZy+i7Nug3Oy0TSvoWh0
 GXXPSTZcHueeLKjlmas31f+YrgJgbbuYtmzxL2uOHDMjlQ89VfhMWiZxoMHOqfc3xfkF
 p5zw==
X-Gm-Message-State: AFqh2kogvUhVyPBawciKV8zLHEk3EsdBc9rSumXslRfOmV0WlOCI+mYO
 UFq8A5CUEZU354f3zxiMukAREys8f6l+gt3KFHq2pVQcpUAbyy8QbxBo3JgMDO98QBwgRdlkYX1
 zL6X/yvHmbC4Ib8w=
X-Received: by 2002:a05:6870:4c83:b0:150:14a3:6556 with SMTP id
 pi3-20020a0568704c8300b0015014a36556mr7595159oab.51.1674205352681; 
 Fri, 20 Jan 2023 01:02:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7yBOJLuJ3T3gPgh+EMIf+rDym70EZ01oaqyjAdRU0T+o03C6I/ucg5fo/laImjznKWXRD/Q==
X-Received: by 2002:a05:6870:4c83:b0:150:14a3:6556 with SMTP id
 pi3-20020a0568704c8300b0015014a36556mr7595153oab.51.1674205352489; 
 Fri, 20 Jan 2023 01:02:32 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 br31-20020a05620a461f00b00706c1fc62desm2928461qkb.112.2023.01.20.01.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 01:02:31 -0800 (PST)
Message-ID: <cd802b6b-1fe7-2640-1ae0-0227c3e8e335@redhat.com>
Date: Fri, 20 Jan 2023 10:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 06/11] tests/qtest/migration-test: Reduce 'cmd_source'
 string scope
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119145838.41835-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/01/2023 15.58, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)

Missing explanation in the commit description. What's the benefit of doing this?

  Thomas


