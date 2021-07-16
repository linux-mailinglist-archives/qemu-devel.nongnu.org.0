Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12743CB804
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 15:41:20 +0200 (CEST)
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4O5f-0005SQ-Sa
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 09:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4O0q-0004Lz-K5
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:36:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4NlH-0001ww-Ix
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626441615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PNaDZpmNYc8gFWRPy7GbPUV+qg7al03yPpjXUimfz8=;
 b=CI+XzcVefEbm6acqKdVjZox08cVbjytgQv+ng9ciEOFlbEoBdx/Y8SgRI6DhjPR3tfb+10
 7e+W9WnKFVLyoSlBrIR+CTE5gCm1rRJs0AEzwslVa3y86wvW4PK2rHgytIA6mpTITQaglK
 3nIMoOzGwiq/BbuZ74EYFI/bNTNMyTg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-9LF4syS2PcqNbSIVVhLbfg-1; Fri, 16 Jul 2021 09:20:13 -0400
X-MC-Unique: 9LF4syS2PcqNbSIVVhLbfg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j141-20020a1c23930000b0290212502cb19aso3174959wmj.0
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 06:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8PNaDZpmNYc8gFWRPy7GbPUV+qg7al03yPpjXUimfz8=;
 b=L3g1eVE5ZC2BVrqgkjYZmzMg22X/Glac44BtFMza2lm5UpGAsLSMmkEW9Rn345wMlv
 eQoISRlf463lECt2guFJ3iKj/V/kv0x/PPb26h49nPEmr8sZWBftMSsy0zlNDN5jHniO
 ci8xZbU38r3RIDbz+esSgJC51ZvoBKypmnOUDOF2N3SliK1Pcy5YFLDbM6GnkOTqTJBm
 Q++BPphOePgBxWqZMVOti8KgVILI0h6YBurdA8EV1sU+h3mi21yhfF4yHxnY9Ps/UG+n
 X5mfXe1Wv7UIsXyIzdTvXghEwdKKrNDLkqsOb5Y3GJrH1Cp02LqgfdotnVbkx7Mr4Bwz
 qmHQ==
X-Gm-Message-State: AOAM531DcWmwkRejHRvjx/p9MTnb9T0sS7jgzZcAy44itgwS3IbM2mH2
 678jeokxoaSG7gviVaAIJ0V2fZqa3Oft9RwfOFAxs1sDk4lKCKMwh4oLkVqs2u2V8qvIO2DtsJO
 v82Y5ryk/cyjC9Ck=
X-Received: by 2002:a05:600c:2189:: with SMTP id
 e9mr16100816wme.35.1626441612836; 
 Fri, 16 Jul 2021 06:20:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzubjM4vxtAcRHZCW9DD0ad89kTYhqx5p/SxjzO3GcOUemvzQzof9gwEm0ND279wrMG9L2pxw==
X-Received: by 2002:a05:600c:2189:: with SMTP id
 e9mr16100796wme.35.1626441612674; 
 Fri, 16 Jul 2021 06:20:12 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 o3sm9669210wrw.56.2021.07.16.06.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 06:20:12 -0700 (PDT)
Subject: Re: [PATCH 12/14] iotests 60: more accurate set dirty bit in qcow2
 header
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-13-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <877b0d7f-95ad-1728-2ca3-cd54b882a679@redhat.com>
Date: Fri, 16 Jul 2021 15:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-13-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
> Don't touch other incompatible bits, like compression-type. This makes
> the test pass with IMGOPTS='compression_type=zstd'.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/060 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


