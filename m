Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D223F236B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 00:54:34 +0200 (CEST)
Received: from localhost ([::1]:49258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGqvh-0000GL-Ll
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 18:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGquq-00077P-U4
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 18:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGqup-0000oH-Ec
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 18:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629413618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTrO1Od3fdTfn0dsb8godx4zsH/11REcDlmLtDNCZZw=;
 b=XRsABalU8C61BL8w2IhY5C5tLu7Y+vNg7NO1WmnfQSj2D5Gy1sBT58Xinrpev9M4DmjBMw
 d8UiJGLRhrD+MuKG3//sHNCjhEDb4UUqKXQb/JV26CRXetConqjeZh3cdUKgHQu/Dp5aNf
 0s2H4fcpIWTZK5w5j1zc9zJfrPJ4VEg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-yO4OHX35MmmFcSg97fV_cw-1; Thu, 19 Aug 2021 18:53:37 -0400
X-MC-Unique: yO4OHX35MmmFcSg97fV_cw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j19-20020a1c2313000000b002e7012b83e9so2767385wmj.2
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 15:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PTrO1Od3fdTfn0dsb8godx4zsH/11REcDlmLtDNCZZw=;
 b=c0dqLlB4O9nsxptNQWlQN8fp3f2ZoPRF87Hk27CcGCoHbjRmzL+nSc52gDKvHI+Ej+
 kQoa7P+CCmnSb9aYCNNzU19XtuKP15Z6VqVh+mA5gsIs1nr3+TwevZ21aio3VlViJq4f
 oBms/Mmul3FNLDEXI//3IHSAUHI3sOntsXJfiw74dUERatDOOyj4j5uLycXjW8HY8KJw
 LF+PVwquQ/G7D5Fytt5tR9ludFR9sPYDlS54UL/TiOHf5R2ipSSTA3gZAKn8/lz0p0yI
 u2RbiMvi9tJu6CQT4dOACpM+tunrzLW8s4v9UvGGVycPjIX0ph0rrWcPWfsgNfcKKGEZ
 wUbw==
X-Gm-Message-State: AOAM532JrLi+JissauSmzB4ruJROjDSDW9hVHrh2fK4n6ZOgD38s/bUf
 c2/CqLez4hL31hArl5mz0WmPZr2QUeXbABjDu1+Bmo4i4hIr2e4ApdW1yxhGxCVdhwG75xBxxF7
 rh5ffyMXFYcTRrgM=
X-Received: by 2002:a1c:1b4b:: with SMTP id b72mr833031wmb.168.1629413616427; 
 Thu, 19 Aug 2021 15:53:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKgjGqVqxM2gBksoK5qi4co9rldFdwtljDbPo85knouciW2jtVHC754I7jZS6nlbQmQ1V87A==
X-Received: by 2002:a1c:1b4b:: with SMTP id b72mr833012wmb.168.1629413616228; 
 Thu, 19 Aug 2021 15:53:36 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c7sm3429159wmq.13.2021.08.19.15.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 15:53:35 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm/cpu: Introduce sve_vq_supported bitmap
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210819193758.149660-1-drjones@redhat.com>
 <20210819193758.149660-2-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0a13b4ce-d869-d3cc-820f-eeb36171cf25@redhat.com>
Date: Fri, 20 Aug 2021 00:53:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819193758.149660-2-drjones@redhat.com>
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
> Allow CPUs that support SVE to specify which SVE vector lengths they
> support by setting them in this bitmap. Currently only the 'max' and
> 'host' CPU types supports SVE and 'host' requires KVM which obtains
> its supported bitmap from the host. So, we only need to initialize the
> bitmap for 'max' with TCG. And, since 'max' should support all SVE
> vector lengths we simply fill the bitmap. Future CPU types may have
> less trivial maps though.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.h   | 4 ++++
>  target/arm/cpu64.c | 2 ++
>  2 files changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


