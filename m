Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A858142F531
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:24:52 +0200 (CEST)
Received: from localhost ([::1]:60602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbO8h-0008Sg-Ls
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbO7A-0006rT-6x
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:23:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbO78-0008Iq-39
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634307793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWke74yd6zVon9qN7qlR3IxeW3mrY1X5hIXDGemC3SY=;
 b=R33CWMLuoH5hrWhf+Olgu8aN8rwpo0KoP0E7v1HSlx2Vyt/gyh9AroFbayf6ehpHypw6+C
 zhE9tmuyQweY0CUUvi0Xv0n1r9FaAk9g//CRjY/VfluVZEeYygLdYK3QviQKPO3FIryV9h
 R7yoDuB4cSdRztSgT/b3RDwNdskCKqU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-Rcop7vH3OTOWs40eaV-wjQ-1; Fri, 15 Oct 2021 10:23:11 -0400
X-MC-Unique: Rcop7vH3OTOWs40eaV-wjQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso710270wmc.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 07:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eWke74yd6zVon9qN7qlR3IxeW3mrY1X5hIXDGemC3SY=;
 b=6jbZ0Yg+TmvMnVD2OVe3FIXDNojPBwdpOCmCfCisQxb2dLH17O785ThcFINX8qF74w
 KZCZpnlp7wwCZwfDgy03pTyd+ADFdh976DNXjPsEvNh9uIoJ3eknzsmq6jBh+uWVxwvj
 4K9R4y10aeMnQCb6m/44JwcYXDPDknjHSlKzsSidGep7M2FLIgpt5I7YIcvuVBfPYXEQ
 a9JJbnTdj70A+7hqP7ygSI6+qXkByMRA/ryVZRf5hAUGqYoSgv1gLsksGss10TWQko/z
 jcuzYgPQHrEEhhyNxU9T2e5j1cCxSJHbtlzZmhNRaLU8tEaAr8lyRyzcBD9phnKQK8sI
 RilQ==
X-Gm-Message-State: AOAM53083WDDM7cwjd6i/0Vk7EIj2Ub0onAmT7szcavkQB2ZGAvswo42
 +ZrsVvKO3QiH6qrSxGcwCY52Nu48DCK1qDD3/tK+jzh1ngPToqiCXOlNcj6Yz8DcCgqZS5l6ZyX
 KjlnEAf78q4vDag4=
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr12712517wmq.79.1634307790232; 
 Fri, 15 Oct 2021 07:23:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFXXTvP8Iphz+Qk74dvKywVfYjcE3tqKtr9k8hS8bX5WMwsgfecAgGO1mD9s1p2zCQdnrzJg==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr12712500wmq.79.1634307790091; 
 Fri, 15 Oct 2021 07:23:10 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c17sm5215632wrq.4.2021.10.15.07.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 07:23:09 -0700 (PDT)
Message-ID: <7cc39c8f-a8b3-5a53-994d-a41eeb5dccb1@redhat.com>
Date: Fri, 15 Oct 2021 16:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/4] configure: remove dead EXESUF variable
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211015100718.17828-1-pbonzini@redhat.com>
 <20211015100718.17828-5-pbonzini@redhat.com>
 <c352ccff-68aa-51c7-9261-de2e024dd16a@redhat.com>
 <8d3c0b03-6967-952c-782d-13b0eb1aa6ab@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <8d3c0b03-6967-952c-782d-13b0eb1aa6ab@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, thuth@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, hreitz@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 15:36, Paolo Bonzini wrote:
> On 15/10/21 14:38, Philippe Mathieu-Daudé wrote:
>> On 10/15/21 12:07, Paolo Bonzini wrote:
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   .gitlab-ci.d/crossbuild-template.yml | 2 +-
>>>   configure                            | 3 ---
>>>   2 files changed, 1 insertion(+), 4 deletions(-)
>>
>> Maybe squash in patch #2 or place as #3 mentioning
>> "the previous commit"?
> 
> Anywhere you place it it's wrong. :)  Squashing in #2 I dislike because
> of the functional change in .gilab-ci.d (in truth, the variable is
> *almost* dead!).  Having the change as #4 makes it survive one patch
> longer than it should, on the other hand having it as #3 separates
> similar changes to "check-block.sh".

Indeed.

> What I will actually do in the final submission is not include the TAP
> patch and submit it separately.  Then for this one I can indeed add that
> it was used only in the implementation of check-block.

OK then,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


