Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E61130C44A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:47:11 +0100 (CET)
Received: from localhost ([::1]:52128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xtW-0002YW-Ck
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6xdg-000572-82
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:30:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6xdd-0006q8-DO
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612279844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLe2mPluZnvpRMT/4IYoB3dhfDH5hWBLEW0YCBKSRC4=;
 b=XsS3VJjJfSf5d19b6YkVx5gDeD9FFwdrK3hM6koxM0BiYpJelVFkm9MDqwshoI8ANsJSmV
 wnwfIgOepcfnkVUp3S0vokmiZTi8Z4pMyhtsJEa52VTPJQ9HglNNJjrQE4ztVSEjURhfRP
 uOomQTHNua5P3P9kMIGb4HMKUBN+qrE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-AWnZpc8jMq22Fk46FcOmDw-1; Tue, 02 Feb 2021 10:30:42 -0500
X-MC-Unique: AWnZpc8jMq22Fk46FcOmDw-1
Received: by mail-wr1-f72.google.com with SMTP id r5so12758941wrx.18
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NLe2mPluZnvpRMT/4IYoB3dhfDH5hWBLEW0YCBKSRC4=;
 b=QAPrsMsGUCrwRGd2oAFWMEX1nRdwQjk37GS2hjBLulGu5XpvLZph975OvnHWosYsim
 j+2rnwpMm5+yFzEGn95u0HzoMNksbBhNVtZPfvS8bT5SZWUbufB+c/rbEtGrbCQZ+XEc
 ieFwB6ByBeiisy9LaR12olQrOoZYutWw8KbTDmiDs++7xjlnDDveq6tXCN1E10iX0Po4
 E+fVVNwbHuR09Dnc6ntQN0zQbpz4jenrSUYnzGkHqY8NE9ouipdibaEV7ObA+rpgxAj/
 htzo6u6NvNR/7gWUwLJa10bed/GEu7wZjEM3BSr1FPt5Q5XH4bab8KOr71HptIaxFoDj
 tVlQ==
X-Gm-Message-State: AOAM531pEg7W9Cb7B48UQ1P1vOSTM8Ue2H2lz6tyUfTPqLAPZsTj5R5d
 DGjFSbvpsTe/NK16e9HsgLyvYTprGUbdiox+ykJ98ev778xEqmvbP1fN0hV9uf7Xj7EVIIM2rhu
 3SFLbpHfOeWjYt24=
X-Received: by 2002:a7b:c950:: with SMTP id i16mr4154273wml.52.1612279841664; 
 Tue, 02 Feb 2021 07:30:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbeC65hZ1THgMriIx4dodGUbDAKCrbFdki+1ZeOZ8OmqDOaIqjTRX+CyYCVNudLJKgMCS5MQ==
X-Received: by 2002:a7b:c950:: with SMTP id i16mr4154253wml.52.1612279841451; 
 Tue, 02 Feb 2021 07:30:41 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id l2sm2492647wmf.15.2021.02.02.07.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 07:30:40 -0800 (PST)
Subject: Re: [PATCH v4 04/23] exec: Use uintptr_t in cpu_ldst.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d3b5f315-4912-7dc3-482b-53bd987717c4@redhat.com>
Date: Tue, 2 Feb 2021 16:30:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128224141.638790-5-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 11:41 PM, Richard Henderson wrote:
> This is more descriptive than 'unsigned long'.
> No functional change, since these match on all linux+bsd hosts.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


