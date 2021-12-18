Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA47479A87
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 12:17:15 +0100 (CET)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myXiE-000309-E9
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 06:17:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXgp-00021n-MH
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 06:15:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXgn-0000FL-6m
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 06:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639826143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzMCg3fOAziUVxgFfEfEzVqkdelPYpEAoyxOKdlb80o=;
 b=NF0YMrl6lzomKtwaTTrO+tUwo8zonRnbxh+WAHHGz8IpzJfGXA0XMTYsRan6MYvtnFAN1t
 NCF088WItBd9bAVpyOTYKm+kp5LvJKSd9Rh900QKp/5iiUBDZb+gY289A8OMtdEduBTDeC
 L9V9Q0GhYdvpMb6AMQBXRT3iK8ymfkU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-QCOuoadvOAGbR81tX9A6Jg-1; Sat, 18 Dec 2021 06:15:42 -0500
X-MC-Unique: QCOuoadvOAGbR81tX9A6Jg-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so2247894wmb.4
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 03:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CzMCg3fOAziUVxgFfEfEzVqkdelPYpEAoyxOKdlb80o=;
 b=jg6MiF6iaaKo0duXtQD4bLgeRZmqzQVF+OXo0Vkv67V3rKuFmbXKIUtYTNnp1Ty24d
 KRGfuhf3zxvAlxpOkRRhupYwOwnO+KhFAaJOja4i6kHu4nGGr36pt0RN7JuyOkxY7KiG
 ZOSpVTgIjUaOKQV7wIvRSkbgzn8uwImpQJYaES6pIrAvdDa1nWvlwn4cQNnNQBvifewn
 FDP73ro1Zf1bfCdap7C9zO/bQiDn5mW/uNb4f8foMqRAkv6bdjHKVQGnvQ1Z2a//XZT7
 NIXHjih6Rmy5mfHAI9vvXTK4LGg6huPPKcbDKFT9m9BlrXPIhxpfsrI4op+WKycoNtTD
 IB6w==
X-Gm-Message-State: AOAM5325XsK7PNiaFBfgAXddPLVuqRf4J3hphNHjH0f8d8EOWm1xkFTi
 Z+KUfEntSsoKzSHGuERXjSSTOV+IYK1VzT6DVuvwgXRD+33Et784gS56W+2rBmxc63lYJ3kuLZS
 1qy4xE9ylLDtDgA4=
X-Received: by 2002:a1c:9856:: with SMTP id a83mr6285131wme.157.1639826141715; 
 Sat, 18 Dec 2021 03:15:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6nP5zHnrOZCX97fWYh2Qc7vpQeF8KcSCAIMRyAZS5J9Qa55kOWUSVubZmrKMSrl59KNZoCg==
X-Received: by 2002:a1c:9856:: with SMTP id a83mr6285113wme.157.1639826141438; 
 Sat, 18 Dec 2021 03:15:41 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id i17sm11144254wmq.48.2021.12.18.03.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 03:15:40 -0800 (PST)
Message-ID: <6cdce8f1-859c-9504-3158-cea7e30bdda9@redhat.com>
Date: Sat, 18 Dec 2021 12:15:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/scsi/megasas: Simplify using the ldst API
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211217231542.1461286-1-philmd@redhat.com>
 <32549938-46c1-94d0-dc3a-3a722d4fc31d@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <32549938-46c1-94d0-dc3a-3a722d4fc31d@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 01:36, Richard Henderson wrote:
> On 12/17/21 3:15 PM, Philippe Mathieu-Daudé wrote:
>> -    cdb[3] = (len >> 8) & 0xff;
>> -    cdb[4] = (len & 0xff);
>> +    stw_be_p(&cdb[2], len);
> 
> Wrong offset.  Otherwise,

>_<

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thank you.


