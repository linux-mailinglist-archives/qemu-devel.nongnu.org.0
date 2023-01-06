Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE6665FC43
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 08:51:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDhUN-0005Ja-FZ; Fri, 06 Jan 2023 02:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDhUE-0005J3-FF
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 02:49:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDhUC-0002BV-RI
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 02:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672991395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yk6rq+Bffnar8B5+he/EztX3DZbWU8aTLvNsgH6PpI=;
 b=gE07GVz2PJ0flpQWL1++eFa596awOfoi46bZ9F9rN1nhJilnk1GXGhoH3TaZYszfbwq7Ya
 9y9Wbj2YQBVlp15hBfvMbksdL+uuyKqiKwSzI/ZPwyqAaeZv5t0CVN1tUk4g3uEHlWRTpJ
 7qbTtJN0mx8jsF/9jt2iADNeImeMaOc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-249-FOccANF3NVq3x0YiBD_aFQ-1; Fri, 06 Jan 2023 02:49:51 -0500
X-MC-Unique: FOccANF3NVq3x0YiBD_aFQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 ob12-20020a0562142f8c00b004c6c72bf1d0so420501qvb.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 23:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9yk6rq+Bffnar8B5+he/EztX3DZbWU8aTLvNsgH6PpI=;
 b=pHgBkTb3ABeuo9LhqpO+fmuupvEbOb7k5iesG3SaRtQPzjAFyr0++kGCs9XqMCJClR
 BjlEFKoBjJup5THVoLFRhNBCYl3RS9Jy9CSmgh2FhLXPyUIdf7HXmwsn6PHvs+gR+ZYa
 eWDwpwyPA5eu34W7WWSfW3De9wCjcBb7S/zi6C96L8YBxnARlQJ6YKpuGAL+w1bf3KQE
 TBlsNI+Ll34lwovJZsa+YF3py8w6BV5F5R8oKSQO+Gt37LPiDMGvyDT+kTAYMFDQHXov
 M1ni+jHy1/XvlbDgWIB7m6+MiMe8iQgxrgUYlVoU+tVppgjLuXjVdZm6TTAQQ738+O8g
 egHw==
X-Gm-Message-State: AFqh2kqwagcam9u2i7MWHrQijgzrMb+9gZG2hxEPmlVwu8YkVanCDMQp
 O7x6qDlaqiutI9hBIn500fFTLW4CmJdpzZsFk8QRWlBpwiHU6eMxXBRAvh3KWouI8Atq6XeeUMb
 ZK435O8dNC1cbU+Y=
X-Received: by 2002:a05:6214:2ccf:b0:532:bd9:f596 with SMTP id
 lf15-20020a0562142ccf00b005320bd9f596mr11915364qvb.50.1672991391101; 
 Thu, 05 Jan 2023 23:49:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvwMoTdUZCc4j+/9FuWneY5RuTYrYaYqU8deeCBpzM4e8WHgsOrKD8DR0dqHoKkuZHaaqScKw==
X-Received: by 2002:a05:6214:2ccf:b0:532:bd9:f596 with SMTP id
 lf15-20020a0562142ccf00b005320bd9f596mr11915353qvb.50.1672991390860; 
 Thu, 05 Jan 2023 23:49:50 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-170.customers.d1-online.com.
 [80.187.98.170]) by smtp.gmail.com with ESMTPSA id
 do14-20020a05620a2b0e00b006f8665f483fsm145524qkb.85.2023.01.05.23.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 23:49:50 -0800 (PST)
Message-ID: <5a2d8ef1-a478-0b6d-3c65-d792f162feaf@redhat.com>
Date: Fri, 6 Jan 2023 08:49:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>
References: <20230105204819.26992-1-thuth@redhat.com>
 <4ff2d01a-e6bb-5a99-356b-6b2ade61b667@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] .gitlab-ci.d/windows: Do not run the qtests in the
 msys2-32bit job
In-Reply-To: <4ff2d01a-e6bb-5a99-356b-6b2ade61b667@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 05/01/2023 22.42, Philippe Mathieu-Daudé wrote:
> On 5/1/23 21:48, Thomas Huth wrote:
>> The qtests are not stable in the msys2-32bit job yet - especially
>> the test-hmp and the qom-test are failing randomly. Until this is
>> fixed,
> 
> Who is gonna look after this?

It certainly has to be someone who's got a proper Windows installation. I've 
now tried to debug the failures for two days via the gitlab-CI jobs, and 
that just does not work. The turnaround times are way to long, and I really 
cannot waste all my limited CI minutes for such problems.

> I'm not against this patch, but I'm afraid this config starts to
> bitrot more.

It's not really a big step backward - the qtests have just been enabled 
there 3 weeks ago (see commit a35e2ee929741fd), so this is just restoring 
the state from the time before the qtests have been enabled for Windows.

 > That said, maybe it is time to deprecate the 32-bit
 > hosts?

Certainly fine for me, but that's up to the Windows folks to decide. Maybe 
you could just suggest a patch to start the discussion?

  Thomas


