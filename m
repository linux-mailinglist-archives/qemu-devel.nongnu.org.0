Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B863F17E5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 13:19:28 +0200 (CEST)
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGg50-0006qN-Lu
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 07:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGg2s-0005mm-Hr
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:17:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGg2q-0003fN-MR
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629371831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpllkBGU+7GN0iNDrd1ShkBm9ByEIynfsjwmUBa0Pjg=;
 b=WqrnALmDSjWWST+5XZVwykR2LD7NxODMu6AQtK+H/AsjwunWae0aPnoeAiGvpE34kF2TQy
 WyU+yyM/Iw7bjKA0acRFH7A1CTZ9FyV+slFb1IPDMjcY/tuP3E3q8gtGYwav4aNs1IsJuX
 brVFIWjvRvQp6ZXZtxI94kPP1X2gIEc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-4uaLbLpbMKuju8-2h3q0zQ-1; Thu, 19 Aug 2021 07:17:10 -0400
X-MC-Unique: 4uaLbLpbMKuju8-2h3q0zQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m13-20020a7bcf2d000000b002e6cd9941a9so3382526wmg.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 04:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UpllkBGU+7GN0iNDrd1ShkBm9ByEIynfsjwmUBa0Pjg=;
 b=I51rna7aWy5EzM7X0xjp360a7uAC2RyQNhZjMyAmYuD1BbLhDOAa9FpZsH7INX+cW2
 0kMWkPsxwHT3Z4Pm67jU3Z+CqDgVCTD/dpwRPGahXzash3XE39p7csKAtqjOYUa3wrfF
 Fihn8LmpnJ8AmSJV5hpYJ7ZmhfQIpcPDKxPJ69Vb5FcjgH+A4HLcx/rwJTAjjgCFan30
 uTSjReM9ELpdX55qfz97zpw7S43B9JgGqRoJOWl7yvM4EQG6VKgR4ajluP1wo7DNhI71
 hFSIGjUcz91eHocbkG5RLhCAn2L9HYAimtD+Cb8hWM4cYcR4d5aqV/HMH+IyurNCDsZF
 aTiA==
X-Gm-Message-State: AOAM530h9IXDoVg9bXFjbYRmswbVozHFQgVnnd8SDfFRbkXCF8btQIAU
 X5mOtatnD7clLPavNumSB8JiSPx0UHBGf4H+YT8x6WXrF9a2NQRHW6UTF9sSB3vFIJpAVIhDmyv
 MPjpCcFUR9Qz6Ku0=
X-Received: by 2002:a1c:7316:: with SMTP id d22mr13440407wmb.171.1629371828886; 
 Thu, 19 Aug 2021 04:17:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydOR26EBcc/sTBTXoW25yVImJktPeIgVlYThCYaYp0LRbuolwVMqEVJCIEse6SlySNV0Dx1A==
X-Received: by 2002:a1c:7316:: with SMTP id d22mr13440385wmb.171.1629371828706; 
 Thu, 19 Aug 2021 04:17:08 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 z1sm2679619wrv.22.2021.08.19.04.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 04:17:08 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210819102501.69638-1-hreitz@redhat.com>
 <155c4025-cac0-b4e2-ac4c-f0f36dff2398@redhat.com>
 <3d934aad-1676-19cf-ec8f-b3991efd6893@redhat.com>
 <79bac137-bc68-2461-9ff2-84fe1659d19d@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <da534b3f-fb24-430b-f1fb-22ce19245ffe@redhat.com>
Date: Thu, 19 Aug 2021 13:17:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <79bac137-bc68-2461-9ff2-84fe1659d19d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

On 19.08.21 13:09, Philippe Mathieu-Daudé wrote:
> On 8/19/21 1:00 PM, Hanna Reitz wrote:
>> On 19.08.21 12:37, Philippe Mathieu-Daudé wrote:
>>> On 8/19/21 12:25 PM, Hanna Reitz wrote:
>>>> This post explains when FUSE block exports are useful, how they work,
>>>> and that it is fun to export an image file on its own path so it looks
>>>> like your image file (in whatever format it was) is a raw image now.
>>>>
>>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>>> ---
>>>> You can also find this patch here:
>>>> https://gitlab.com/hreitz/qemu-web fuse-blkexport-v1
>>>>
>>>> My first patch to qemu-web, so I hope I am not doing anything overly
>>>> stupid here (adding SVGs with extremely long lines comes to mind)...
>>> GitLab allows Mermaid and PlantUML diagrams in all tiers products:
>>>
>>> https://docs.gitlab.com/ee/user/markdown.html#diagrams-and-flowcharts
>>> https://about.gitlab.com/handbook/markdown-guide/#diagrams
>>>
>>> I find the mermaid live editor easy to use:
>>> https://mermaid-js.github.io/mermaid-live-editor/
>>>
>>> (I looked at that recently because I'd like the pages job to
>>>    generate QOM dependencies tree).
>> Interesting, but it does seem limiting, so unless adding SVG graphs is
>> unacceptable, I’d rather avoid it, to be honest...
> Understandable ;) (I haven't said it is unacceptable).

Yes, but perhaps others think that, so... :)

> However I expect long term text-based generated diagrams to be easier
> to review. But I'm not sure, maybe the whole text is shuffled around
> and this argument is pointless.

Definitely thanks for the pointer!  At the very least, I now know for 
future posts.

Hanna


