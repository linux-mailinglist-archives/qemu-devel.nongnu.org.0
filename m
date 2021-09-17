Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0FF40F56D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 11:59:37 +0200 (CEST)
Received: from localhost ([::1]:44266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRAee-0001CD-S5
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 05:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRAdl-0000MI-0T
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:58:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRAdd-0004UH-QX
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631872711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1pDGVjEov/tqrXg73Xxf6WX6KCXqfUcFa0/herRzY/A=;
 b=fB1vES4JbnR4LPpo3/9Ut7NIOJdzaosNNp+O4X6xW5BzcgY7990f/KJ8gClNV1jOVHbGKR
 m3YO45LMZLwZZw5QQI9YgbOXGcLUj5ivgD/7F1HwlLc+QyZhBbqREUMOAp2d/HCQSa2Wln
 qMeVWEjL8vAcbZKmSNZHNP7IFJXsCek=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-zfCGWychOQKpf50kybP0LA-1; Fri, 17 Sep 2021 05:58:30 -0400
X-MC-Unique: zfCGWychOQKpf50kybP0LA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h5-20020a5d6885000000b0015e21e37523so3523976wru.10
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 02:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1pDGVjEov/tqrXg73Xxf6WX6KCXqfUcFa0/herRzY/A=;
 b=NMHi/boqLdDxhPkvyPuQ2j7EIXYGs6IHd/OcHByKiVR6yTm6CR0EjW2Bt79x9zR5JA
 HG+ChF4au8AMsA9hpF2YWN7iuvCQOdE30cOEzXS7GB5SXRxRlOb1ldaoxt+vnDWV7xtX
 73/Rya1eXqkHQ4Il28mlFUTif38T1nEJdi2tgqHsmZxseO+tDTiOY8RtvWDqBEH4Tbxq
 1L3OCl4JrRCyEwDnSc3NpyZjTe/P4Tk2miYfTLLoHofl9cYwDmlLs/QG2HsXodI7jHCc
 BgsNfU1WEzkeiS+NQvpsivUx05+u1Hn0Ktz76kmDvr3hHQLWw/rAiYbIZLUh9yaysQhc
 YYBQ==
X-Gm-Message-State: AOAM532jUZyhDfn+Oq8/gL5EnSoGCaZSqgMaCEed5w4rTne27vlpCm90
 /gifGvnp9J+Jj1mWPuOLM4avmd3AxIMYAon4UTmOKKWHHvOtwAK4X8oowvm8gBOn2CIAvNuJHC1
 emaJpycy8Rn2buYQ=
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr14179910wmj.68.1631872709410; 
 Fri, 17 Sep 2021 02:58:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqqtn4+6JH4ex4EFbHtounf+IQNRAKBQc4He2qNkDhisEuWKAJtE71VH0yajdfXbu9xmjz3g==
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr14179895wmj.68.1631872709284; 
 Fri, 17 Sep 2021 02:58:29 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id k17sm6166396wrq.7.2021.09.17.02.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 02:58:29 -0700 (PDT)
Subject: Re: [PATCH v3 08/16] iotests/297: Create main() function
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-9-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <228a72dd-4657-8ff4-b48a-c797ae3aeda6@redhat.com>
Date: Fri, 17 Sep 2021 11:58:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-9-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> Instead of running "run_linters" directly, create a main() function that
> will be responsible for environment setup, leaving run_linters()
> responsible only for execution of the linters.
>
> (That environment setup will be moved over in forthcoming commits.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/297 | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


