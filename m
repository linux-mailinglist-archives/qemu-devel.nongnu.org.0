Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F940F973
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 15:41:53 +0200 (CEST)
Received: from localhost ([::1]:59970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRE7k-0003YW-6F
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 09:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRE56-0002db-8L
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:39:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRE53-0005mt-KW
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631885944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FidiCpx8xbxKax6CSqETtQxo8fXigLPLjgBaOucmRxw=;
 b=Num4AvmNf81d5rZY+coTg2YiVZqW+QWFaUhxd3OOARiclFqYAAQdKHlO3Xdf//1j070hIc
 cmQxvPBoiskO4vSrAqD74tTtKmiio99TpuxltBMGq3Kwg8hTGrSrvbM0wH5nAX74IlbM2O
 VWqnJczLhF5buaNvJzju7rX1eu6nCaI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491--Zh-UxC0P2ClU6d0VaVi-g-1; Fri, 17 Sep 2021 09:39:03 -0400
X-MC-Unique: -Zh-UxC0P2ClU6d0VaVi-g-1
Received: by mail-wr1-f70.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so3722336wru.15
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 06:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FidiCpx8xbxKax6CSqETtQxo8fXigLPLjgBaOucmRxw=;
 b=FvHMN6AgYzF05MivjtgfWv2p6m7kdV9xbOxSllAIx2a6gcrADXREyWn68vqSAy9Q0j
 CgmqDTWgm0jMSAdjPW+LJJSp1IqHI5ThnlcGclKdgFNruG7FYHYfrL3gHZZZlO4xSLdb
 FDX+Rwp1X4QQ0kXxyT4Rsm+oBwVqrK/Ir985g3P8Xi9ycSowEGMMu/FchZDRvIc5zZBH
 ktqzz0qQ9o/U0fZ8vKQC7DeObEI1B1dzPa66LQA5PA/9dOtMmMxQyv+sBT2LR1hWNyKb
 AEVPsXh0alnS8DggvIsB4aYgleYu/cCt/zBydQEPop171g1dUTILg7E5qUplp0YCpeSc
 5Npw==
X-Gm-Message-State: AOAM53345e9wjMwetRMr1nXBIIedJYif45sankzzitZbdZ6DUcLpK6DY
 k8Q2NntiBcQOeIcfxKS1xaTN5uYAr+sTSJ8JKxvVrmX5nqAIfuWSBe4Ukujykcgjh+ge5fTxEav
 2lUmhm1C5wMuWZLc=
X-Received: by 2002:adf:ce84:: with SMTP id r4mr12348967wrn.107.1631885942168; 
 Fri, 17 Sep 2021 06:39:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSq8N/WkU9XSBbtGb6GB7/8Vw5naDslPOqQW/D9bD6BMYZ2I0bhkYYr+EfzgHj0RgoJkARfw==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr12348927wrn.107.1631885941927; 
 Fri, 17 Sep 2021 06:39:01 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id i67sm1899518wmi.41.2021.09.17.06.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 06:39:01 -0700 (PDT)
Subject: Re: [PATCH 08/15] python/aqmp: Create MessageModel and
 StandaloneModel classes
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-9-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <fa088868-d112-59e4-7181-159d3c0cac58@redhat.com>
Date: Fri, 17 Sep 2021 15:39:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-9-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.488,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 07:40, John Snow wrote:
> This allows 'Greeting' to be subclass of 'Message'. We need the adapter
> classes to avoid some typing problems that occur if we try to put too
> much into the 'Model' class itself; the exact details of why are left as
> an exercise to the reader.
>
> Why bother? This makes 'Greeting' ⊆ 'Message', which is taxonomically
> true; but the real motivation is to be able to inherit and abuse all of
> the Mapping dunders so that we can call dict(greeting) or
> bytes(greeting), for example.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/aqmp/models.py | 67 ++++++++++++++++++++++++++++----------
>   1 file changed, 50 insertions(+), 17 deletions(-)

(I feel like this is a bit much outside of my scope, so this’ll have to 
do without my R-b.)


