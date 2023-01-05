Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A9165E6E0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 09:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDLhu-0005Je-9D; Thu, 05 Jan 2023 03:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDLhY-0005JE-TB
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 03:34:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDLhV-000116-MP
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 03:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672907652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntDj2El8prdHVWl7liKzHJ1AXdwQnlRApPGQtMgaK40=;
 b=VAGCKCBD7AsU/TPhu0XLcAlp0rFJ95OTH+ke0S/Ae8wXiSPyTiSL3yFjQUQohqxatAaw24
 PaWH69octf/b56liTecmukXPYbhlotOypIP3uVWiLYUXKxWuZiZvGFb/YIoWXQqUi+js0x
 q3AIK48/8TRRzYLwegGQcqqkQ11QVFE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-541-43cdlNYLNeq2L66EnsYnhg-1; Thu, 05 Jan 2023 03:34:11 -0500
X-MC-Unique: 43cdlNYLNeq2L66EnsYnhg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m7-20020a05600c4f4700b003d971a5e770so17347122wmq.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 00:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ntDj2El8prdHVWl7liKzHJ1AXdwQnlRApPGQtMgaK40=;
 b=h7B+pQR+OkRa39MlJ+vmr+eUvMTFvEyQngg+d17UeQ2mUsOoklDuC/vW9T2oyASr8t
 +4E00jhMDaI4z63JNs3kZjEpu3saYhwrQSTa6A28c6tegDuKOf60BNdaG4zXZYvlH9Sz
 q6+qrbwbDLssr6iA6THhiFvTqpoQYizlrfo6XP8p38xsHpOpZscg/xSpZ9wGwAN9chlg
 nDBmYvSwmCfxayvgjGQENN75zslWudtS1fY55BSjf4SeMDZIFCXo5SC3aWqNWybjHgpY
 ASsAs8sJBjwb1eD1AquuAanTkTa+MKaevZg4ys0n9zWjRlU9Rjqfw8Asrj4FUq1ukAbC
 xHTA==
X-Gm-Message-State: AFqh2krFoFUtSGXm/H+d71+YIACW8QUDl+Dp41xFkJMAEANg4k74ehMu
 8xVHHvYe3t9Jc+wvl6qNrR2LDgKJMAxwh9Y/xRV7FRqnwb7+lu1AfIYHkcxjUlHnAggIGFbTled
 4agr0QbeCkgDP2mI=
X-Received: by 2002:a05:600c:3589:b0:3d0:6c60:b4d1 with SMTP id
 p9-20020a05600c358900b003d06c60b4d1mr43388301wmq.6.1672907650109; 
 Thu, 05 Jan 2023 00:34:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt3i+HHVonuL9CUlFGOrMG+G5Un5Fgx7M9lJ369IkGE/2HoX3DSJtfTNu+JU7/5qMOo8i1JTw==
X-Received: by 2002:a05:600c:3589:b0:3d0:6c60:b4d1 with SMTP id
 p9-20020a05600c358900b003d06c60b4d1mr43388285wmq.6.1672907649857; 
 Thu, 05 Jan 2023 00:34:09 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 t64-20020a1c4643000000b003cf75213bb9sm1556182wma.8.2023.01.05.00.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 00:34:09 -0800 (PST)
Message-ID: <46726378-d075-e77a-5439-bbfa822f70fd@redhat.com>
Date: Thu, 5 Jan 2023 09:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] .gitlab-ci.d/windows: Work-around timeout and OpenGL
 problems of the MSYS2 jobs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20230104123559.277586-1-thuth@redhat.com>
 <CAFEAcA-1-CBVd9FRYHS5_KTjC9UfTUz6E7qDz0g7xYjsA7PC=w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-1-CBVd9FRYHS5_KTjC9UfTUz6E7qDz0g7xYjsA7PC=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.708, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 04/01/2023 23.01, Peter Maydell wrote:
> On Wed, 4 Jan 2023 at 12:36, Thomas Huth <thuth@redhat.com> wrote:
>>
>> The windows jobs (especially the 32-bit job) recently started to
>> hit the timeout limit. Bump it a little bit to ease the situation
>> (80 minutes is quite long already - OTOH, these jobs do not have to
>> wait for a job from the container stage to finish, so this should
>> still be OK).
>>
>> Additionally, some update on the container side recently enabled
>> OpenGL in these jobs - but the corresponding code fails to compile.
>> Thus disable OpenGL here for the time being until someone figured
>> out the proper fix in the shader code for this.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Now that the timeout and OpenGL problems are gone, the 64-bit is
>>   working fine for me again. However, I'm still seeing random issues
>>   with the 32-bit job ... not sure whether it's a problem on the
>>   QEMU side or whether the builders are currently instable, since
>>   the issues do not reproduce reliably...
>>
>>   .gitlab-ci.d/windows.yml | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> Thanks; applied to master on the assumption it will improve the
> CI situation. I found that the msys2-32bit job still timed out
> at 1h20, though:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3555245586

I just gave it a try again, too, and for me, it finished within 65 minutes:

  https://gitlab.com/thuth/qemu/-/jobs/3557600268

... let's keep looking for a while, maybe it's ok in most cases now, but if 
not, we have to consider something else.

  Thomas


