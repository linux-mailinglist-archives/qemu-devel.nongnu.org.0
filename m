Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58CE401CEB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 16:21:43 +0200 (CEST)
Received: from localhost ([::1]:59044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNFVF-00072N-Eh
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 10:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNFUH-000666-Rq
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:20:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNFUE-0007w9-Kc
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630938037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dL8fqFL7Qspfu9BADAy4kZgpFoVsh95v7mrtNsmjcww=;
 b=UXubKYrwhPOW2V0Te/uVKbfBfl51GJDJOeKmsLv2UbiezV1tFWMaiGnwinDek+cynYjeM9
 qrZ6JAhbpDjawfyqn+twNQHWX+n590nxyxOQ5VU7Zzf+2mHZsgmkdSY781LYE0vk/kwsxr
 MKWg9d5K+w7kafisRhvPopUXiWt/QnQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-D7cDp815OrSanL0FDmvThw-1; Mon, 06 Sep 2021 10:20:36 -0400
X-MC-Unique: D7cDp815OrSanL0FDmvThw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so2393078wmj.8
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 07:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dL8fqFL7Qspfu9BADAy4kZgpFoVsh95v7mrtNsmjcww=;
 b=D/jhfefpgx6lR3Dl7F9t/sgroMKN5FGbPYxhn3C5aDt53nH0yI0st9ZSx9pwK8kUxm
 9DWkaQqTnugj7YV/x5yoLW+Fw8ZQ974dbivjJao5IXZZSx4LALpdrrerXH5WVBkV0cdH
 rw6y71NNS8ko71HbLm1vgsVsO9qh97vxG3qqAqbnyKiPALuOYrPM/r/VMFMUCuTXT/Jn
 yUlDE1+wTxaR52o2/frq7VL7L/bvkaUoSNQJXyj5Uc6SiRTAPPiWYzV3aWOa+vZI4PS+
 57T+RxRwCZK21UiTx2I87TqIY632+JJ04aaCoTSSFDodMGHE+Fo8qnWSJ65FThzivQWB
 roSQ==
X-Gm-Message-State: AOAM531B/YlBbUJZ1ye0me3gILmLC/f3t8nKpv+jObuFcriGtDRPpQI4
 pHt+CE98zP13RQyVr+K7SClU8dDZlwHXgYdqZHSOmXzy7OZILs+TJCjgu72uQoxdadxCHy1DECK
 KFirzupLiqFDRjgs=
X-Received: by 2002:a1c:f713:: with SMTP id v19mr11639206wmh.188.1630938035427; 
 Mon, 06 Sep 2021 07:20:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUaysC9A72MdCR/bK4a3jjIfT57uINiDTEX3EMGl2EC2Ru2gNYWaRE5U7yBpq3vRyz9bkJ/w==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr11639178wmh.188.1630938035100; 
 Mon, 06 Sep 2021 07:20:35 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id f20sm7302087wml.38.2021.09.06.07.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:20:34 -0700 (PDT)
Subject: Re: [PATCH 0/2] iothread: cleanup after adding a new parameter to
 IOThread
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20210727145936.147032-1-sgarzare@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8669491e-1cb1-a9af-ab5b-8e5824629691@redhat.com>
Date: Mon, 6 Sep 2021 16:20:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727145936.147032-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/21 4:59 PM, Stefano Garzarella wrote:
> We recently added a new parameter (aio-max-batch) to IOThread.
> This series cleans up the code a bit, no functional changes.
> 
> Stefano Garzarella (2):
>   iothread: rename PollParamInfo to IOThreadParamInfo
>   iothread: use IOThreadParamInfo in iothread_[set|get]_param()
> 
>  iothread.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


