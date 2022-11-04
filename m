Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF7061975A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 14:17:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqwZI-0003V9-EU; Fri, 04 Nov 2022 09:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqwZ1-0003Sb-NP
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:16:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqwYz-0007Xs-Gu
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667567808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFC7rmB5sYoAmNQNMeqnyfeCJGWCjPqbisighW50rE4=;
 b=atVxbxJ24RTlnjfyXFqCgAr7+4JH4vzX3AnpU4uL+wp3yc90NukYO16hyuj2T6Ccs5UrmW
 d0bFmWU7YPEsc/Fi1i10CK4s0q2LD7UzHw8WBpqcCcQfZiDvRp/OAj7Jdfp6/yiW7RAB8m
 MzVbOqyLnvD6yZI59HyaMLr1OSjo4Zs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-s4TAx_oNNnOw79AY6_ziUg-1; Fri, 04 Nov 2022 09:16:47 -0400
X-MC-Unique: s4TAx_oNNnOw79AY6_ziUg-1
Received: by mail-ej1-f72.google.com with SMTP id
 sc40-20020a1709078a2800b007ae024e5e82so3236462ejc.13
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 06:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PFC7rmB5sYoAmNQNMeqnyfeCJGWCjPqbisighW50rE4=;
 b=XzuGN0BqQqPnVmQCFXn+xUepEkou0mj51WcRcoB5ZJvokEijR3Xj3EcR5+AQwtBub7
 U/t12pSrt2JNW2FaQyZoxtdNn70zPd8X+jC0WTr/i/4Tdg5AUMCEb+GU1vO/Z1c++2kc
 6+VpHuuGBlYsQqFesyOV4SAQQCfsynv8enCGncqyhHDn7Od1yLwEbwzV0GAsF3x8Hh3I
 QK3ClPj0ju7DFi9Chm5bhaY+wvLRzml+MYLauIfLjtqwnORtVZlbOIMxUGv4GEe0VgOi
 5u7OKal5I1yD22vstDVpMp0dwg5GDliOzR9NlcN/urrmPcdWjcGw4lnJLo7CY/IpZrFo
 8vAQ==
X-Gm-Message-State: ACrzQf2wXHrIwwKSnk8JJwy+ax1pyTx+60LeCG9YYAkAv1cIhvDZ/0YM
 iYZGH3DudsNfxp3/29vkIpF0UmbhByWaqHfOOmHunMZNzAu2wFtmIAjcZcmNTrlU7TXYtqzmvzC
 nDmeQD9wqG+3cTjE=
X-Received: by 2002:aa7:df94:0:b0:461:aff8:d3e1 with SMTP id
 b20-20020aa7df94000000b00461aff8d3e1mr36193030edy.10.1667567806694; 
 Fri, 04 Nov 2022 06:16:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5L9wkHTU+gKDcrxBhJn+ipbLYE7Le7kkbYXN1DL4CpxoGwR/OPUBxzamazWPSLNzcHFoRzhA==
X-Received: by 2002:aa7:df94:0:b0:461:aff8:d3e1 with SMTP id
 b20-20020aa7df94000000b00461aff8d3e1mr36192993edy.10.1667567806374; 
 Fri, 04 Nov 2022 06:16:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 o1-20020a170906860100b007ad96726c42sm1803481ejx.91.2022.11.04.06.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 06:16:45 -0700 (PDT)
Message-ID: <465fa134-e9a0-41be-10a0-cd62c2c7c105@redhat.com>
Date: Fri, 4 Nov 2022 14:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-3-eesposit@redhat.com>
 <8f24c24c-ca61-108c-924b-39465a3c67fe@redhat.com>
 <Y2QDPXegFTdpBy6S@redhat.com>
 <dfb4906f-5fff-0430-a3c8-c1f660d3497d@redhat.com>
 <aa37a312-96c1-3bf7-29fe-fbe83eb48f61@redhat.com>
 <ac92cf1f-49c4-b263-f48f-4be17044d61e@redhat.com>
 <a0594b2a-9ceb-9738-75d0-e583236cf38c@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <a0594b2a-9ceb-9738-75d0-e583236cf38c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 10:20, Emanuele Giuseppe Esposito wrote:
> At this point I just want to make sure that we agree that it's correct
> to add coroutine_fn because of "the function calls a g_c_w that
> suspends" *&&* "all the callers are coroutine_fn". If the callers
> weren't coroutine_fn then g_c_w would just create a new coroutine and
> poll, and I don't think that would be part of your definition of "can
> suspend".

Yes, we agree on that.  The confusion was just on the commit message.

The even-better fix would be to also call coroutine_fn from 
coroutine_fn, instead of calling mixed coroutine/non-coroutine functions 
such as g_c_w functions.  However, adding coroutine_fn *is* correct.

Paolo


