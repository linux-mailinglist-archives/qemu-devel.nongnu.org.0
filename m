Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E4951D6AB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 13:32:45 +0200 (CEST)
Received: from localhost ([::1]:59120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmwCR-00088J-HH
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 07:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmwAb-0007MG-N4
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:30:52 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmwAZ-0005bd-Mk
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:30:48 -0400
Received: by mail-ej1-x62c.google.com with SMTP id n10so13902012ejk.5
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UsvoiwuukGocfju7si1nWCCnJ8C+q8OLvKwXwa6H/54=;
 b=IZ+Mxnc34U1BCAKBTgv8jINeVyyQJ3ZjNAZgEtIdyjInC04/Gj8D3SjBdTkqKU8WDR
 dWxw00b5INkj15yItoJ5h+UZG7u0ExOoUjsg3ZcQHjbAA5sGAHajCqliyG19XMiYTrCT
 4evz/v8rD0yzFWJOiF2mEGTP/VgvTAYFQHuPONYbB1rlJ694BeR2tbTSK80dZRHeZJQ0
 VyeW81ucYLEiJkqs/Dp7krcXyC79BuWIJ+RSpEd4FVLK9eR8Vlg+i5T/PVBrhatGFVKQ
 QDqVmfTdahRP3blZooL1IXZ7wF2NbUsv42fONQeAslfA/6rERbRTev27FKadKdhSCYTv
 nMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UsvoiwuukGocfju7si1nWCCnJ8C+q8OLvKwXwa6H/54=;
 b=vRghC57PAxKYmNHvyzowfweZ/pfi+pXr63ajQswAIQGqN6YYrO35MCgI+HPiJhaT7x
 NCfzdSb4LFpQMKjqHnoQhaDo0xSFrk1zF7zuVgYAQejUn50RGucG2f75EeQJe3gXg04w
 vHnsgGqkGbvPKYdu122341+JWiAikLV82fGc+96QsTVjNTIAlPrjKszh3wCfRJhUYFfc
 QxBZwcUOGRiMQZYIH7Xm5Oe5ivb/890B8w30xYjf3fyIxswgznxfjGoIallfCcEWbh64
 H1ujKiBxVti+NEuFgcrZOHjPUmAsjLi9wPK/GxvdlIbiNJcyY9gNMVvQ65ZXRcBMedig
 gq4A==
X-Gm-Message-State: AOAM530Wi8USj145mjT50D4Y3SfFIeJzLLKF5hYdZsVvtu9nm3oQKwRP
 lTm7PKZRYlNCKcGpcZKN1sg=
X-Google-Smtp-Source: ABdhPJzRfFHqGvWvS7Npyfz8ExnoWsLJoKQTlDEwE3jbvn9JHLPgLk3lT0XHkw7fGvdt5SEJJOdapg==
X-Received: by 2002:a17:906:31c2:b0:6e8:6e8b:cbe4 with SMTP id
 f2-20020a17090631c200b006e86e8bcbe4mr2520212ejf.293.1651836645695; 
 Fri, 06 May 2022 04:30:45 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 qu48-20020a17090767b000b006f3ef214dc3sm1844226ejc.41.2022.05.06.04.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 04:30:44 -0700 (PDT)
Message-ID: <89f3a9d3-c6e3-7538-3c61-118249f4a8da@redhat.com>
Date: Fri, 6 May 2022 13:30:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Fio regression caused by f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94
Content-Language: en-US
To: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: longpeng2@huawei.com, qemu-devel <qemu-devel@nongnu.org>
References: <35dd4da8-5278-767e-4193-ccf53e836969@redhat.com>
 <YnOiRPrLkfjoPbU+@stefanha-x1.localdomain> <YnPGoOlV0CykrKwm@redhat.com>
 <f8cff216-de53-c789-6aa3-b0a23523fb5f@redhat.com>
 <1f773376-afc7-8117-60cc-760879a740e1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <1f773376-afc7-8117-60cc-760879a740e1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/22 06:30, Lukáš Doktor wrote:
> Hello all,
> 
> thank you for the responses, I ran 3 runs per each commit using 5 iteration of fio-nbd using
> 
> f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94
> f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94 + Stefan's commit
> d7482ffe9756919531307330fd1c6dbec66e8c32

Ok, there's another simple change that can be made to bring performance
back to 6.2 levels, actually a bit better.  I'll post patches soon.
Here are 4 fio runs:

6.2:
    iops        : min=58051, max=62260, avg=60282.57, stdev=1081.18, samples=30
     clat percentiles (usec):   1.00th=[  490],   99.99th=[  775]
    iops        : min=59401, max=61290, avg=60651.27, stdev=468.24, samples=30
     clat percentiles (usec):   1.00th=[  490],   99.99th=[  717]
    iops        : min=59583, max=60816, avg=60353.43, stdev=282.69, samples=30
     clat percentiles (usec):   1.00th=[  490],   99.99th=[  701]
    iops        : min=58099, max=60713, avg=59739.53, stdev=755.49, samples=30
     clat percentiles (usec):   1.00th=[  494],   99.99th=[  717]


patched:
    iops        : min=60616, max=62522, avg=61654.37, stdev=555.67, samples=30
     clat percentiles (usec):   1.00th=[  474],   99.99th=[ 1303]
    iops        : min=61841, max=63600, avg=62878.47, stdev=442.40, samples=30
     clat percentiles (usec):   1.00th=[  465],   99.99th=[  685]
    iops        : min=62976, max=63910, avg=63531.60, stdev=261.05, samples=30
     clat percentiles (usec):   1.00th=[  461],   99.99th=[  693]
    iops        : min=60803, max=63623, avg=62653.37, stdev=808.76, samples=30
     clat percentiles (usec):   1.00th=[  465],   99.99th=[  685]


I also played a bit with direct wakeup of threads using a QemuEvent per thread.
Peak performance is higher (low percentiles are better) but the problem is that
it doesn't necessarily pick the most effective thread for wakeup resulting in
oscillations:

    iops        : min=60971, max=65726, avg=63771.93, stdev=1381.06, samples=30
     clat percentiles (usec): 1.00th=[  457],  99.99th=[  685]
    iops        : min=57537, max=64914, avg=63694.37, stdev=1809.40, samples=30
     clat percentiles (usec): 1.00th=[  461],  99.99th=[  693]
    iops        : min=58175, max=64711, avg=61277.80, stdev=2216.05, samples=30
     clat percentiles (usec): 1.00th=[  465],  99.99th=[  685]
    iops        : min=56349, max=63938, avg=58442.33, stdev=2012.54, samples=30
     clat percentiles (usec): 1.00th=[  469],  99.99th=[  668]

I'll go for the simple one.

Paolo

