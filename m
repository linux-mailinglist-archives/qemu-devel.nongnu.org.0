Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ABD37F4F8
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 11:42:27 +0200 (CEST)
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh7rO-0004uO-5a
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 05:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh7or-0002xG-2D
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:39:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh7on-00052A-SL
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620898784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Slie+0DqekzOYTzmr0Ngxw7xhiAWy2MKyRcR5uJYu7Q=;
 b=XK3DY5k8tpgYqTBVU0euRrPR0c2CrPHXTted3cDR/h0v6CTP3SdLvH1GjZhK7Hp66A/IRN
 6dZayjAj8gzJfoJ6MJrzI2v7rqR68KT5PE4PyIzGDkouq71zqR+R57w1euqd1zg3Tw43CF
 KPtTi2GynmIxqcrgLyvO5aIJVWEo2ls=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-NuD_d1paNsG8GtBHW5Dr_w-1; Thu, 13 May 2021 05:39:39 -0400
X-MC-Unique: NuD_d1paNsG8GtBHW5Dr_w-1
Received: by mail-wm1-f71.google.com with SMTP id
 y184-20020a1ce1c10000b0290143299f39d7so674380wmg.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 02:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Slie+0DqekzOYTzmr0Ngxw7xhiAWy2MKyRcR5uJYu7Q=;
 b=gHzCNCVZBeYXljsx3QJ8jLtLrrjR2/ACQLaOo7fuDaF0baT39ixmtPTsjfMkGelqgt
 WPkMpuOx8fem+RBkUwr4Op8dzPKg+KjP07f1Se8HyUg1EWWRCk7oJ/6FVTKE6A83KFqY
 M4hQGkoPAKSc84X51PNHb4/JR4ef5FV1E6HHAa48RWA5lerfjfeWpdVDJy88/3j1jHmx
 FUp93JXOMZNsFKROZgjvIJ+ND97BVsxrbaUFoKPa4TpOqxB3sJSJwR/psJZn6jIzXwuS
 cHFnQXCuaFRt0MJnBa3a+k0pvWL1vkqgrLdDST+Z6OFJ8A45pOrdyOTedv6hbMvpaIGp
 jKhw==
X-Gm-Message-State: AOAM533k9XfmBOfmopr/upLgvnGYAvEAbxtVOpS0RRE/N2vcdUAsdRpx
 LiXEURiDWGzFxvRwyVKgTh1w1J4BYxBShFunP209aUSV4Zt1gBLSmn66erLys75uxn8GUzFEoQF
 h9fzg61z/nA1Yk2w=
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr49708582wri.257.1620898778802; 
 Thu, 13 May 2021 02:39:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3IwCa+77rNwxhh2wd4+1daEeQ6vGB1Yn4DD/MNVjk0pfO+8BonYen3LnZ2P8642SD3GDEEQ==
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr49708562wri.257.1620898778595; 
 Thu, 13 May 2021 02:39:38 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t11sm2246411wrz.57.2021.05.13.02.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 02:39:38 -0700 (PDT)
Subject: Re: [PATCH 01/10] python/console_socket: avoid one-letter variable
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210512214642.2803189-1-jsnow@redhat.com>
 <20210512214642.2803189-2-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7998bf67-aa00-f311-bab1-5263aec77f8f@redhat.com>
Date: Thu, 13 May 2021 11:39:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512214642.2803189-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 11:46 PM, John Snow wrote:
> Fixes pylint warnings.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> ---
>  python/qemu/console_socket.py | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


