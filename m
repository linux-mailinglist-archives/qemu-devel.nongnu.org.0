Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF593422C35
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:19:17 +0200 (CEST)
Received: from localhost ([::1]:54522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmDs-0005tt-JU
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXm2N-0008Ho-0d
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXm2G-0004AG-68
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633446433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubi3ep+j1P3LKCt0Np0+oa8NSKmAiF5aYaYqDb/suHk=;
 b=iYvEsLbAeQ+DV2ljWFTR27+fc9XopshYsGc/LwQlv+xMUhEfi0sjeAH8Y91hafYeWywjaQ
 lWHRuqy79JOfoVVr4L9m++aFdtn/vf/1+b+vERwAcVfmBosAjc4y9ODIFzoa2Pozr6T4F5
 /98LFiQ+tEIIfnSH0zYJg5+mywk+XLc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-vK1m-k_lPfO6Q9PIg6_4ZQ-1; Tue, 05 Oct 2021 11:07:10 -0400
X-MC-Unique: vK1m-k_lPfO6Q9PIg6_4ZQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso4066782wrg.16
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 08:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ubi3ep+j1P3LKCt0Np0+oa8NSKmAiF5aYaYqDb/suHk=;
 b=IHWVL7Txf20sDAbNrLkxA+81bWO5QU8nu17CrNT0zQdLzR2hESY32DxfxfEEQp7nsr
 FTiWF0Fa6CXA0OW0m4m6o3dchGDXWI+aWha6Ev1lPnH8n1KILdYCvztWl+wzfTEfuQUA
 VY2JjAPqR2sc12VKZrPNI9/xf9C+273Ldp5vEy7IL4L2TDpGVDIP0Mi0sKKsfp4Guc5h
 aIwDOouYY0ForBiXlGnsDRjjfTjv12XCOd0zZm7zZYl12OFPBcLIjrdfoMby85F0fpLE
 UhPJKzGCxEcn/UILt/Kjl7maU5b8Pcdcd5ud9A6c30/Be4swHwyjH8rhT3VUE0TUbMOg
 uMLg==
X-Gm-Message-State: AOAM531sS4DHKUDl/oH112M5KHADvmmO99K/0t3p/ArPVwsumTGwVYm6
 9Y3UlT+PoFMSNXqHjBRChnSwrRaCKF4IAhWz4bDkacT2rkQhyFiCrnXYgXHrjbpo1ILNQ2ocylz
 oP5nfANLedCxnh1Y=
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr21952716wrz.29.1633446428888; 
 Tue, 05 Oct 2021 08:07:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMRLiAUDA6UL1YwmF31E4bEqkwMJ2NalxYHnnfNuQpyOQ4GTrMXd7spaOtYNVDws7ajWkmKQ==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr21952692wrz.29.1633446428671; 
 Tue, 05 Oct 2021 08:07:08 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c9sm2267647wmb.41.2021.10.05.08.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 08:07:08 -0700 (PDT)
Message-ID: <e91b1c71-63dc-644c-bdab-308b989d5b94@redhat.com>
Date: Tue, 5 Oct 2021 17:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/3] rSTify SubmitAPatch, TrivialPatches, and SpellCheck
 wiki pages
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <YVxarQkCtPkhRc4Z@stefanha-x1.localdomain> <YVxdKpks4ARkVHlj@paraplu>
 <YVxgBvQTwfnBgZXI@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YVxgBvQTwfnBgZXI@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 16:24, Stefan Hajnoczi wrote:
> On Tue, Oct 05, 2021 at 04:11:54PM +0200, Kashyap Chamarthy wrote:
>> On Tue, Oct 05, 2021 at 03:01:17PM +0100, Stefan Hajnoczi wrote:
>>> On Wed, Sep 22, 2021 at 02:10:51PM +0200, Kashyap Chamarthy wrote:
>>>> As of writing this, qemu.org is down, so I've used a one-month old
>>>> copy[1] of the wiki from 27Aug2021 to do the rST conversion.
>>>>
>>>> My main motivation was to convert SubmitAPatch (when Peter Maydell
>>>> pointed out on IRC that it's still on the wiki).  But it links to a
>>>> couple more small wiki pages; so I converted them too:
>>>>
>>>>   - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck
>>>>   - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches
>>>
>>> What is the motivation for moving these pages from the wiki to qemu.git
>>> (https://qemu-project.gitlab.io/qemu/devel/index.html)?
>>
>> They were linked to from the SubmitAPatch page.  I thought having one
>> doc in qemu.git and the other two related docs on the Wiki was clunky.
>> I can leave them on the Wiki as-is.  But I thought upstream is wants to
>> move away from the Wiki to in-tree docs where it makes sense.
> 
> I meant SubmitAPatch too :). I may have forgotten or missed the IRC
> discussion so I wanted to understand the reason.

One point Peter raised on IRC is it is easier to update a Wiki page
than get a patch merged into the repository. IOW we are making things
harder.

GitLab provides a wiki for all tiers, but requires contributors to have
the Developer role to be able to modify the wiki:
https://docs.gitlab.com/ee/user/project/wiki/#edit-a-wiki-page
I suppose this is a no-go since currently it is enought having
contributors as reporters (to fill issues).

Alternative could be to have a qemu-wiki project within qemu-project
gitlab namespace, and have point to this one instead (currently we
point to the external wiki).


