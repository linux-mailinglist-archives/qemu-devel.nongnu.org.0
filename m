Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E521B51BF3D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 14:26:32 +0200 (CEST)
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmaYx-0005c5-Li
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 08:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmaXB-0004UT-6L; Thu, 05 May 2022 08:24:45 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmaX7-0001VP-Vx; Thu, 05 May 2022 08:24:40 -0400
Received: by mail-ed1-x530.google.com with SMTP id y21so5010764edo.2;
 Thu, 05 May 2022 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K8vGs0iPBou2FjEIJIHzeibYGborf/eYarBq/t+1CR0=;
 b=PjyEGX42HhyfOFLaX4RqUZU4csQR9uooDEm6qyzx2UKWIAb2ibs0AxG0k1WdDFi9lK
 lk8wuxElX6Q+Zs+xIv2jQzd7DothSaFAuftjxWacZYfXE6pBkzADhJx7QqhZP4mOVyZW
 Dj2Lc4rimeHfxxKNmrwoDbr8cM3s2BJz3Rsm2WDxhjj3BU6OwNcm54999wNCa5jFOcF9
 WcOXXdfzuF6cXL+ZadnmpCQIIWjdVIuqAGSWLVKI1CqdU6U5iNfaHurBEuowkazv0+Tm
 Q9YRfwB2kJEsDk2v3LJrf1qh3MU73hTWKl2WJgVjZTnhZ4sLmbDfoJh1WjFzNMgZziKr
 opWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K8vGs0iPBou2FjEIJIHzeibYGborf/eYarBq/t+1CR0=;
 b=ne0kukl4/0YmpZDec62KEdROf9rQDvEEUwADGP81XeJzZiHeGXOyKLFAKjWBNjtE24
 kDK0TQZrcmdd7Bo9FoEBsic9qP3bIYgyHeBKK51vTqo5rZ+qhbbytider8CuCEaHieL3
 AxHSpVzL40ZO1sD1eqcd/BOXe2TedsQeFDtQNV9SosmsBcYyATowjeKelekHE3vJienC
 xDgDIL0jHvowhx32y8Ominexox6RxhdeM2ez2Ny7mKb2nUVbf2JZpywtbIZovH3vDdGx
 0vB0rGOzURyKRJIHxWz1ymYDZKHsJMBpb7Ja16OfSl3PDGbPd8CiWvbxzxe7KEyBPp9W
 Rdtg==
X-Gm-Message-State: AOAM530Zo+3yiwoo9iSmDFNsyEpNkF/AM0WIaS6mevA1Q43XiwTNtHnp
 SBRhoJSsCjwq6sQhyukOAzw=
X-Google-Smtp-Source: ABdhPJyR59cKhlZx2Y9EZDEwACzS1v/GI9UK7RyPTWtxN7WfWFmqoFe0gQOR9bFh5xuBjVMqu2gE6g==
X-Received: by 2002:a05:6402:5190:b0:427:df4a:19d9 with SMTP id
 q16-20020a056402519000b00427df4a19d9mr16136781edd.384.1651753460118; 
 Thu, 05 May 2022 05:24:20 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 ig11-20020a1709072e0b00b006f3ef214e2csm716617ejc.146.2022.05.05.05.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 05:24:19 -0700 (PDT)
Message-ID: <a592403d-6a89-6686-1aeb-e04a884657f6@redhat.com>
Date: Thu, 5 May 2022 14:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: iotests and python dependencies
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: John Snow <jsnow@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Cleber Rosa <crosa@redhat.com>
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOQAP1J94zH1pEK@redhat.com>
 <6f3c3414-f837-85c9-b401-d856f091ddf4@redhat.com>
 <YnOt+Q6p0fbJzWzy@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YnOt+Q6p0fbJzWzy@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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

On 5/5/22 12:59, Kevin Wolf wrote:
> Am 05.05.2022 um 11:28 hat Paolo Bonzini geschrieben:
>>> Or actually, it could just unconditionally run 'make check-venv' by
>>> itself, which is probably easier to implement than checking the
>>> dependencies and more convenient for the user, too.
>>
>> One small complication is that on BSD systems the binary is actually
>> called "gmake", so you'd have to pass the variable somehow
> 
> I guess we could just export $MAKE as an environment variable?

That would work when invoked by "make", but then that's the case in 
which the venv would be there anyway.

For the other case, it would have to parse config-host.mak and/or 
reintroduce something like tests/qemu-iotests/common.env.  All in all it 
seems like an unnecessary complication over just printing a clear and 
polite error message.

Paolo

