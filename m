Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B373F2364
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 00:54:05 +0200 (CEST)
Received: from localhost ([::1]:46768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGqvE-000753-4c
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 18:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGqtQ-00045T-Vk
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 18:52:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGqtN-00088K-MR
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 18:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629413528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4oHSq3D3/aszrGiK5fX4TKEs3uTF+2UfVH/knIwM/w=;
 b=Iqab8j5OJyFmJri9YS2k69dq47v2JPaikaJcsUawgP4BOLSBqki54QiMjaHwvNe6P9tDF9
 qdOCdk1w3qyMhcLjgjgHJ1yhBCimgzVkV+NiglEk+VgMFB4Ze7LJ0Gqu67H8F0fld89nlx
 kp0M3llUhWW7RO4DQmvDdY+A4dvRImM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-n1_hu6pcOh2VfJxkfdENhw-1; Thu, 19 Aug 2021 18:52:06 -0400
X-MC-Unique: n1_hu6pcOh2VfJxkfdENhw-1
Received: by mail-wm1-f70.google.com with SMTP id
 11-20020a05600c024bb02902e679d663d1so1588585wmj.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 15:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g4oHSq3D3/aszrGiK5fX4TKEs3uTF+2UfVH/knIwM/w=;
 b=JJIS9D4JtXMaNDx9LBuDYEZdfhmHdcooQDs4GScvtPolhYUqc0L8kusHnntuyjsfaN
 Rq36iy+XDUPbZ8k3LvuVjya0ZUs37DaPLiNVbBq0MnbSiiox7Mignsj5taMkOeRwUULL
 cKcq7a5QEspSlLKh7awoKnP44x1Mj8EpIi1PqwbAmu0K35jtZV3mezyHBQydZM8s95b7
 lb0MC7NkUVQiFTsQKsJOwj7rWyzC/hVixMHBOIauC9WCHW2uCh2ZBvV8fD7GPZj35TNa
 Xb/iv9LUMskz33SOAHAuVP5rcZPyZ2N252G2DYGgGJW/M2ye0gHyeMqkwNuuXYyqMBoe
 cx+A==
X-Gm-Message-State: AOAM531lfXYoUdWfngocT95C++BDSoFhxmQAANx43psw5HbmxtpoDi+/
 EEddfhyh4LIq2GDhyIyla2bBgNbruNXwruwMv9EzESSTbm3xzUxa4pAWnc4agNYllDMI7oNpFVH
 TkHnR1uB396WiI4M=
X-Received: by 2002:a05:600c:a44:: with SMTP id c4mr789530wmq.83.1629413525834; 
 Thu, 19 Aug 2021 15:52:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfQ1FoBO/3tQ06k6DnKq/FTCrB/20zsqM+DFiZr5TCNF3QQ1eu0mlvssUc7bLNgvC+1Rc5WQ==
X-Received: by 2002:a05:600c:a44:: with SMTP id c4mr789516wmq.83.1629413525620; 
 Thu, 19 Aug 2021 15:52:05 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g6sm3856358wmq.14.2021.08.19.15.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 15:52:05 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/arm/kvm64: Ensure sve vls map is completely
 clear
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210819193758.149660-1-drjones@redhat.com>
 <20210819193758.149660-3-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7a864706-6445-760b-efd8-0026892c00f8@redhat.com>
Date: Fri, 20 Aug 2021 00:52:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819193758.149660-3-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 9:37 PM, Andrew Jones wrote:
> bitmap_clear() only clears the given range. While the given
> range should be sufficient in this case we might as well be
> 100% sure all bits are zeroed by using bitmap_zero().
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/kvm64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


