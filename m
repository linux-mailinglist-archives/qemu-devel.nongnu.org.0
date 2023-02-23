Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B06A0B19
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:47:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBvv-00027k-B5; Thu, 23 Feb 2023 08:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVBvr-00025Z-6Y
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVBvp-0001P5-Pp
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677160005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbbAVZHHuJpu6xJmoCdUnTzKI4ohQc3GFeN4Sg2nPwA=;
 b=UXOxt1mj3WgfUEDTEVTu7RWRtgg2fZhRyV6V7B/40/eNSgz6OEhuoPXLmxeio1psx/6Ign
 uHBRx+Dx3XX5lgClCSmLgXPDAjajpxy6aIshop4WDDJ4Xcs5qkXW3vMoA+Hr0nJefa24Qm
 nszcHQkdbw/kOYitQSgPyuzRnXZBTHQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-8j96f9itNUi4heJPaxiTpQ-1; Thu, 23 Feb 2023 08:46:43 -0500
X-MC-Unique: 8j96f9itNUi4heJPaxiTpQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l16-20020a05600c1d1000b003e77552705cso3353542wms.7
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 05:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NbbAVZHHuJpu6xJmoCdUnTzKI4ohQc3GFeN4Sg2nPwA=;
 b=bu6V5c/HhMeNdYTcUEaVrLqKpLkc0IYJ5jrb/kmpnfxXOGdV4C93DV19pQb/aBeE3S
 jXABdVtNUDkQ4+2IiRmcg1gTxdHm1P56ow2kx9auQkYeMTf5+umj4QMMISjAJAn4Jd78
 pkTv0n+eKsBboGyGBq6HcepoAgF+XPOjjh85Ij4dtq1j0VUpkEwqsQWVCY+NBQI63Sey
 uvEhHxMIeo0OQmmUreBMlPa0iwO4z+06xtw78yiw0ckAiU3UpAPqnrQ3VTTinEbZGUP0
 RTwat+APJCtjrFo7jc6E3m9KuutERskt3FaVwkdkdSI7OXUGVU6/cpxXMY62uz2Vzkdu
 fWpQ==
X-Gm-Message-State: AO0yUKUoRa9TD9AcuxB6Qh1kBe+o5xJ7OZCvnJkWB/2L7hR/TWQeyq/B
 bPwlOga5zgSfPI11juks2d/6xsvg887K73b5cSvBayElnBrMzwpHH2S6xYEBS68xiV5U5mVpJyh
 /3UjNY3/cLRVdDJs=
X-Received: by 2002:a05:600c:329b:b0:3e2:12a2:ecdc with SMTP id
 t27-20020a05600c329b00b003e212a2ecdcmr8818773wmp.25.1677160002362; 
 Thu, 23 Feb 2023 05:46:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8CHcUQy05axJ29dRMLpaMV9Gp6mRaBWIJMvQPl8PUJXlqbqcMkZSNqR60pQsoFFom4TT9ICg==
X-Received: by 2002:a05:600c:329b:b0:3e2:12a2:ecdc with SMTP id
 t27-20020a05600c329b00b003e212a2ecdcmr8818764wmp.25.1677160002122; 
 Thu, 23 Feb 2023 05:46:42 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c468800b003e2232d0960sm13147262wmo.23.2023.02.23.05.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 05:46:41 -0800 (PST)
Message-ID: <3e1f9f5f-c4ec-d13d-7f88-df741a63f747@redhat.com>
Date: Thu, 23 Feb 2023 14:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: out of CI pipeline minutes again
In-Reply-To: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 23/02/2023 13.56, Peter Maydell wrote:
> Hi; the project is out of gitlab CI pipeline minutes again.
> In the absence of any other proposals, no more pull request
> merges will happen til 1st March...

I'd like to propose again to send a link along with the pull request that 
shows that the shared runners are all green in the fork of the requester. 
You'd only need to check the custom runners in that case, which hopefully 
still work fine without CI minutes?

It's definitely more cumbersome, but maybe better than queuing dozens of 
pull requests right in front of the soft freeze?

  Thomas


