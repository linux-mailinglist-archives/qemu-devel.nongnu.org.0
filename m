Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7503F17C1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 13:10:52 +0200 (CEST)
Received: from localhost ([::1]:48920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGfwi-0003dG-3H
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 07:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGfvf-0002k4-9V
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGfvd-0008Qh-Fi
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629371384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/Ofm6PE2X+YzXngG4qPEPfbNPLgfsFsYKfCTJP28cw=;
 b=aQmzYchWt0EYpgL9VN+e0q50BOPjTFVpMGXCjbWTH7tY1eB6HhBnQ+oxpRfAtXHQdUdwAA
 f3uc7yzYhnXGvnicylisHQH1B/sqZlMdtnoOHUOqLbtaF+4D7Y6bKNJ45FNEGfqQmzlM8O
 bEMJLhSrVBHqRUgPwCHfvA/W3JzwBsc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-7irVNbD-NMitW_XRdUQ3dA-1; Thu, 19 Aug 2021 07:09:42 -0400
X-MC-Unique: 7irVNbD-NMitW_XRdUQ3dA-1
Received: by mail-wr1-f69.google.com with SMTP id
 a9-20020a0560000509b029015485b95d0cso1588772wrf.5
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 04:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K/Ofm6PE2X+YzXngG4qPEPfbNPLgfsFsYKfCTJP28cw=;
 b=YlATBpDZjnL2g+PaoULttJ7kmXGFNRAr72j/nlXhmc8d0RDFk31Lbv1K1rmkmZyE1r
 VELCtNscHuqkfbSDQ+RonXk9DI3ZpnyRSCR65KEumwaGSzUv8pDsFs4ABlhSMmoJA/fl
 Ye88DxLly7Gtn/VUVIefgAxPDfxNg8AeNFgqGmvJWpT5+eL7oLzJjiRqVevTIkcd7hqE
 S/Z+TBKL3PjWL2nBDYM4Is/exxC4+Qz65oo0CWEVeYBJtSD0UwUIMnARJOimVWCJKoXx
 pREPRD9nMq2FKc7VzBFzvSQMpt0yHiH6b7YtawyNhc+8bFURLg6DU7PPGkckxXNVj4dY
 Dhfg==
X-Gm-Message-State: AOAM532yz7qbQKm9PXNKwrbONIoRjFfwPtV/iyMeGsbs5ExjZ4zUDKwn
 4S3jp4ZEnY9vENqsZFNWm4FfssdIxqlml0m0PQmUNULaiPiBRHpQ+OOQtRnJVeD2nMbFT2q1t5m
 RfJvJeHjVGxby+Xk=
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr3163198wrx.65.1629371381297;
 Thu, 19 Aug 2021 04:09:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykQHKsOJiPsjgDEy7sNkntSlF+aflFqVqLf4TZ7X448yPUsdwaw2CPrMcyl2ZpBVasseNe6A==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr3163180wrx.65.1629371381192;
 Thu, 19 Aug 2021 04:09:41 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id v5sm1668330wru.37.2021.08.19.04.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 04:09:40 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210819102501.69638-1-hreitz@redhat.com>
 <155c4025-cac0-b4e2-ac4c-f0f36dff2398@redhat.com>
 <3d934aad-1676-19cf-ec8f-b3991efd6893@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <79bac137-bc68-2461-9ff2-84fe1659d19d@redhat.com>
Date: Thu, 19 Aug 2021 13:09:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3d934aad-1676-19cf-ec8f-b3991efd6893@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 1:00 PM, Hanna Reitz wrote:
> On 19.08.21 12:37, Philippe Mathieu-Daudé wrote:
>> On 8/19/21 12:25 PM, Hanna Reitz wrote:
>>> This post explains when FUSE block exports are useful, how they work,
>>> and that it is fun to export an image file on its own path so it looks
>>> like your image file (in whatever format it was) is a raw image now.
>>>
>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>> ---
>>> You can also find this patch here:
>>> https://gitlab.com/hreitz/qemu-web fuse-blkexport-v1
>>>
>>> My first patch to qemu-web, so I hope I am not doing anything overly
>>> stupid here (adding SVGs with extremely long lines comes to mind)...
>> GitLab allows Mermaid and PlantUML diagrams in all tiers products:
>>
>> https://docs.gitlab.com/ee/user/markdown.html#diagrams-and-flowcharts
>> https://about.gitlab.com/handbook/markdown-guide/#diagrams
>>
>> I find the mermaid live editor easy to use:
>> https://mermaid-js.github.io/mermaid-live-editor/
>>
>> (I looked at that recently because I'd like the pages job to
>>   generate QOM dependencies tree).
> 
> Interesting, but it does seem limiting, so unless adding SVG graphs is
> unacceptable, I’d rather avoid it, to be honest...

Understandable ;) (I haven't said it is unacceptable).

However I expect long term text-based generated diagrams to be easier
to review. But I'm not sure, maybe the whole text is shuffled around
and this argument is pointless.


