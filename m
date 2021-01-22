Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B562A30081A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 17:03:43 +0100 (CET)
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2yuU-0002BC-Ac
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 11:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2ytg-0001YQ-0y
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:02:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2ytb-0007Zu-Lo
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611331364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=877z3cWam5UrpFqsmkT/eLU6qhBV36dOASel2b8+v6o=;
 b=HT+hJMb9DVyjCZytbqO9KRx5yvg/wvYHWrYdd+VRGkX/0PL2IHNr4HPbRTKVxDzUJb54gA
 iZhv1nLMD9djRRPnyXZPm4bqLq/4TWKbgZi4b7twjHK8oPbFtgMEx/m5sJeBaPtlYhptW8
 tnDOVoNQM008TmGtHRfJOqTyf7PERy0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-kfBlcNOeMhGcRDmB45bRjA-1; Fri, 22 Jan 2021 11:02:42 -0500
X-MC-Unique: kfBlcNOeMhGcRDmB45bRjA-1
Received: by mail-ed1-f71.google.com with SMTP id f21so3137992edx.23
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 08:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=877z3cWam5UrpFqsmkT/eLU6qhBV36dOASel2b8+v6o=;
 b=OHSqFaHNUo+ZfI83JVCU3LqAe1QVaawk+OYKoNEBvAsd5L7qcRYxdO4QKJG/cOg4OC
 ckVKc0mkgg/8fn6N1UOovtxPOw21mrKryWQEkF+wkhoiYlU7SYLwB78+3ftH9tst828k
 Z2XotSiZEYyQckwskuDelu3ney31LwKuHX3yxFaFoXa8t47JGKcDfMrjHWKKb7+P3Jc4
 o5l42h74FKvU/K7svH2lkWiA47V8RMn9MSVJipEl7qFDxgkunLvwfrwT0s1m7i/WHxql
 EWMxOvOvq+5Cf4dtV5+DueJtqnwa1/EwFmNT3yFsFuc9PnVcpM/blSy0gdHAmEZbpPXV
 siag==
X-Gm-Message-State: AOAM532Xwi09OVUEVuCbPnUowd9MoTbERC+BGbInzcTSiE+zyYmKlUTp
 /wNITzTR5rIBrstGfkUcnhxEPfAC2tbtBG/Ei/HuiakhcZStnjYGi3FHVvTZ0Pi4NTt9zbiMMMk
 tdTe6ExCULCK+3uY=
X-Received: by 2002:a17:906:4d8f:: with SMTP id
 s15mr113987eju.389.1611331361341; 
 Fri, 22 Jan 2021 08:02:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhISdHajJBB1P3EDieUddovev/0zcq7qmg8Lm0NFpYKnxzzrTlTJzdekkL9LgYfxsr5NcHVA==
X-Received: by 2002:a17:906:4d8f:: with SMTP id
 s15mr113970eju.389.1611331361189; 
 Fri, 22 Jan 2021 08:02:41 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r26sm6151530edc.95.2021.01.22.08.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 08:02:39 -0800 (PST)
Subject: Re: [PATCH 0/3] configure: Do not build TCG or link with capstone if
 not necessary
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210120151916.1167448-1-philmd@redhat.com>
 <260346c3-e1c1-5cb0-20d9-fb8a285e38f9@redhat.com>
 <8ff38dab-06e3-e250-7202-f46f613031c3@redhat.com>
 <f404421e-d2e0-17e8-735f-098c55cc9181@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b47a8eb4-16ca-383b-c645-4bfea506a0ed@redhat.com>
Date: Fri, 22 Jan 2021 17:02:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f404421e-d2e0-17e8-735f-098c55cc9181@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 6:35 PM, Paolo Bonzini wrote:
> On 20/01/21 18:02, Philippe Mathieu-Daudé wrote:
>>>
>>> For patch 1, which files are not compiled with the patch that were
>>> compiled without?
>> softfloat.
> 
> Really?  I see this:
> 
> specific_ss.add(when: 'CONFIG_TCG', if_true: files(
>   'fpu/softfloat.c',
>   ...))
> 
> Maybe
> 
> -subdir('fp')
> +if 'CONFIG_TCG' in config_all
> +  subdir('fp')
> +endif
> 
> in tests/meson.build is enough?

Yes, 464 unnecessary objects removed :)


