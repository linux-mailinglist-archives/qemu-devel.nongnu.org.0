Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DFB6E9646
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:50:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUfC-0008EJ-JJ; Thu, 20 Apr 2023 09:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUeO-0007xP-CX
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:48:42 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUdQ-0001Zg-9r
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:47:43 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1584so4907025e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998458; x=1684590458;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gmJK00+5JGCewd6EQIb1eFH56Ltq2AIyULDxuK9x8rc=;
 b=kYLGQ4DCULlsdSYkD/ZpdHXUjSg68OK03Dk6olYUJH7V8Uxqt4py4EgEhv5GOPRANk
 hOAK2Y1e0F0bpMwhzDWi/ZiAbxn4eNJUFXMK6OHrBv1ai3UQqpKd0MeZRjN+pyedV51p
 AkMrCfO6RBLSsEk3XD78C9Yg/Pn5TH3K9TjBfxjDahtcSBYbl1SFQxFBOZzH0z6SQqsF
 QZlCzHu+M+RtKQGurOyCigQLFInPIJMunbKwSuhmb1L5oVqQtFp1bdQFskPu4hgnhDSt
 eTpSD7BIwGUf7AvNE/HFCa48JAt0yHhmuKVw8apFBBTlg309PqXx971WXOhng4gA4kQd
 wN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998458; x=1684590458;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gmJK00+5JGCewd6EQIb1eFH56Ltq2AIyULDxuK9x8rc=;
 b=WPEoEYe0hpKkvMK1yJS/lWhhvP20xemvowx+7SqkClsGQ8O4XfefAnGz5MkSq17mmQ
 wUIIq/gUHmMTi4nWw+5ZtYRSs125VM5Y+wW2mqou+Z/2OqvlKmV7iLfgFiFKbQ17idYT
 UOCxHyaJVUMmrGvvixWiWReDuFn4HMhDjZliGKZW945oLxUVuL2VfOByebAMUGrhIM9c
 WfFLIQmpBr1Apn9tLU/P0Ez7KsO3501lwyZWFCLQ60m6IO2UuY1gzb62MnTePm7oyteR
 iFqDNjDOscUKwHug/siUyiyiY9ksaORnaBDazriwVIp0EcJbt92K1ZXDPSOqFFntKU4Q
 fttg==
X-Gm-Message-State: AAQBX9d4+dmsXvZ8lf85pjupK4NXYUa6RwMsoySkVRLeV7WN4FPfW7st
 s6Iyf5pYURBpSpH60L4P0P90iw==
X-Google-Smtp-Source: AKy350ZDN+1tzv65p3faLVUrg/4y4fQBAZUSvVTYER0BANYDVwizYVCb6HRpO2Bp7FvRpB3vi1Ollg==
X-Received: by 2002:adf:ed0e:0:b0:301:2452:e49 with SMTP id
 a14-20020adfed0e000000b0030124520e49mr1302129wro.65.1681998458017; 
 Thu, 20 Apr 2023 06:47:38 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u9-20020adfdd49000000b002fe33e42c85sm2001949wrm.72.2023.04.20.06.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 06:47:37 -0700 (PDT)
Message-ID: <5b38aad3-73f8-3cbe-fe78-0bcfdd1f2d6b@linaro.org>
Date: Thu, 20 Apr 2023 15:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/4] block/meson.build: prefer positive condition for
 replication
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, michael.roth@amd.com, armbru@redhat.com,
 eblake@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, thuth@redhat.com, berrange@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, dave@treblig.org,
 hreitz@redhat.com, kwolf@redhat.com, chen.zhang@intel.com,
 lizhijian@fujitsu.com
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-2-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419225232.508121-2-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/4/23 00:52, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   block/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


