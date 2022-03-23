Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAB44E4E78
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 09:45:10 +0100 (CET)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWwc9-0003w1-Qy
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 04:45:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWway-0003EO-G6
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 04:43:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWwav-0000CP-LV
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 04:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648025031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=maJaflA9QLOpFneetN2cxuhdPk8DzhvOBWR8t+czQro=;
 b=FWj1F7aPv8p8ff0csyDM7thORNaFZPbnBTlG4hMiBWCMQQlkATRA5Iqd6haDXvHZlOex39
 nKtkffKYuedQn0msHcLj+z7fvOCM+ZRTchTjOxKVTH3+23FMDL6PrMooHeknoN6cA58MXX
 eil5UfCh7El/1JhFkqJHR/eYwzFg98s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-EDOIwJG2PyKHe6QAVB7nVA-1; Wed, 23 Mar 2022 04:43:50 -0400
X-MC-Unique: EDOIwJG2PyKHe6QAVB7nVA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg28-20020a05600c3c9c00b0038c8da4d9b3so2529625wmb.0
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 01:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=maJaflA9QLOpFneetN2cxuhdPk8DzhvOBWR8t+czQro=;
 b=mIRwG1BIcNgGWiRRjgUeg4r2qluxrxJL8BdsWxLDDD1cGybvF2vwNVUSnLaVIwrkuX
 2WT2e6/gQ8qlIxatAGIH6Bvf1vMlFwKcwOqJ/N5bahBwcr/sN/TybZp41pdHzPcJed2/
 WDJH3zmPWoRlZkUXbh1N1D3PLAKS6X9CXJUPR9+pPTR9tQa54DTIbIwg2NoaYLtiZk6G
 rfpad9+Mm7cZ+9d4xhSYuhMU0A8ibdXGaa+8wL4a5C1yUkDwXSXO52KBLJGzSvQicW1D
 5vsr/BLcNefaGh/DrOsTaYCSF/T3hqD3NRT86ev/U/MNwfp1uF8dFEiTUyHuQS5lE3GO
 r+Yg==
X-Gm-Message-State: AOAM531zHrgysq7ko91CMkduDpvLKqMGGf3FSOnWEl0XpPzxDNhQoCL6
 O9Su3sNXlk9wpbkluvYOOewXEd/aq/hVGbfaVIblqy216cof4U+5gmX8ORJjN+dQzZhMBFMiNY7
 msj0MvVXt2WjViiY=
X-Received: by 2002:a05:6000:1a85:b0:203:86bc:9816 with SMTP id
 f5-20020a0560001a8500b0020386bc9816mr25547073wry.67.1648025029187; 
 Wed, 23 Mar 2022 01:43:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/UTUINmcwJVWqnvI2nNfXjgz9auuZwlxI80zqwHWZ6dk0T9zCn9aC2aUXnroLSMzyV8CS1g==
X-Received: by 2002:a05:6000:1a85:b0:203:86bc:9816 with SMTP id
 f5-20020a0560001a8500b0020386bc9816mr25547062wry.67.1648025029021; 
 Wed, 23 Mar 2022 01:43:49 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0038cb924c3d7sm3096622wmq.45.2022.03.23.01.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 01:43:48 -0700 (PDT)
Message-ID: <80b5df42-bf9f-8d3b-b6f4-7392e51fa35b@redhat.com>
Date: Wed, 23 Mar 2022 09:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: Problem to compile on windows 10
To: "axe.test2" <axe.test2@gmail.com>, qemu-devel@nongnu.org
References: <0d641a95-d222-cb39-4587-953c760ac7ac@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <0d641a95-d222-cb39-4587-953c760ac7ac@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/2022 23.00, axe.test2 wrote:
> Hi,
> 
> 
> i would to compile QEMU with a 3DFX-Patch but i have problems to do it. I 
> tested to compile QEMU alone and i have the same problems.
> First after compiling it will ask for libzstd.dll, i found the github 
> project and downloaded the dll... but there is another problems.
> 
> I don't know where to ask help this is why i use your mail, i'm sorry for 
> that. I'm French, most of people i know on forums, don't use it with windows 
> i followed the tutorial on the wiki page.

That missing "g_spawn_async_with_fds" indicates that you're missing the 
right version of the "glib" DLL ... you need at least version 2.58 of that 
library, I think.

  HTH,
   Thomas


