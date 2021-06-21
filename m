Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D933AE785
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:46:36 +0200 (CEST)
Received: from localhost ([::1]:47716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHRr-0003jp-EX
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvGqg-0005iS-9J; Mon, 21 Jun 2021 06:08:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvGqe-0003qw-Mr; Mon, 21 Jun 2021 06:08:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so8240473wmb.3; 
 Mon, 21 Jun 2021 03:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=22LJHUW7U6i/FWiUcyvyOKfzI0Sa30ISHPM6h5NhVPc=;
 b=IXA4abe9Sx3+esg92aRcfd/QeU9gaP9ikCagSpdycKgksAggXqAM7J2vj07qSPNS1T
 52IqG5Ppv0ad+B1PWprwogM7fY1Wkai57K30cKCfqq8MXFK1pLFGyqyjYHlgydPc7vD+
 iHDT4YOPq7TdioQQovoh1F1UE98dgk6PAYGp09zIpndDKUIB2//ducag1vvkK8DDSmY6
 KSEP26pv/NTd26wsAH8GQVaqreaVA5qjqptI4G1vGAuuGSGxiB1j5NhjF0QgAlR+bE8i
 O3pPy1HxKkaqk3ZKJjhwUVwaypYMmemklSiWyde4K3hQh7NoT6kjmMPmuvaU/9iwJcbe
 O/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=22LJHUW7U6i/FWiUcyvyOKfzI0Sa30ISHPM6h5NhVPc=;
 b=qx99T/E1MComOOWtxK+C2qmE7FqCqSB4aUCdt95DXPtEKjj8TTg9jrgQaG1p2kCtPk
 f0G6DQAaeMetoMP+krZmrqz6i0a5O4kWMoyc8xhmMIu1oJwohtTtuRJDa0Yj7S7qsCbK
 GdCv3o3S8orr2S+HbP75YCI1c+2LlRXQ2Wtze/p5qONYNW+qkoy8BN+mce04e2R+kFQA
 BS/EqFubX9KMVdS/jFHywyb63wxLPiZPQnerqhB9a0E6SFF3QFEKETNaH11rRm6tA9Dg
 vQ3wEXi7Gzv5URq2WnjWk5ccdiN5ACaDa3DuveD/vxuwTa/OYz+wr+QKApREHZYnXuMO
 8zWA==
X-Gm-Message-State: AOAM532/RA+k6b2UhXBjk76C718atsYurE6Mvqc+M4/sQLD/hq6vEDlb
 ZmmY5BOnKTF7wr0UbFDNKeY=
X-Google-Smtp-Source: ABdhPJyNLOBAOzlKpSRWjMamiWDlZwLd1MRNZwqASNAS4JpQeZ/O90UroORgETGHQ9mtyDTyBJc3uw==
X-Received: by 2002:a05:600c:5112:: with SMTP id
 o18mr25376783wms.15.1624270086703; 
 Mon, 21 Jun 2021 03:08:06 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n20sm15866274wmk.12.2021.06.21.03.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 03:08:05 -0700 (PDT)
Subject: Re: [PATCH] memory: Display MemoryRegion name in read/write ops trace
 events
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210307074833.143106-1-f4bug@amsat.org>
 <8892fbd6-a63c-ef02-78f3-935e4f95dbb1@amsat.org>
 <2def176e-8707-78cc-b524-3fd47456261f@amsat.org>
 <c4b050f9-8d36-28a5-b5fe-343bbbe0efdb@vivier.eu>
 <dadd0b69-e613-a0f6-5f81-a62159b41493@amsat.org>
 <a3660d89-0a2b-bb28-8a78-8d8078b71a01@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ac9ed125-4efa-6068-9050-3dc367066de7@amsat.org>
Date: Mon, 21 Jun 2021 12:08:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a3660d89-0a2b-bb28-8a78-8d8078b71a01@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

On 6/7/21 1:29 PM, Laurent Vivier wrote:
> Le 07/06/2021 à 10:28, Philippe Mathieu-Daudé a écrit :
>> On 6/7/21 9:33 AM, Laurent Vivier wrote:
>>> Le 02/06/2021 à 12:49, Philippe Mathieu-Daudé a écrit :
>>>> Cc'ing qemu-trivial@
>>>>
>>>> On 3/18/21 4:39 PM, Philippe Mathieu-Daudé wrote:
>>>>> ping?
>>>>>
>>>>> On 3/7/21 8:48 AM, Philippe Mathieu-Daudé wrote:
>>>>>> MemoryRegion names is cached on first call to memory_region_name(),
>>>
>>> It is cached on first call but now that it is used in the trace function, does it mean it will be
>>> always allocated in memory?
>>
>> Yes, this is how memory_region_name() works:
>>
>> const char *memory_region_name(const MemoryRegion *mr)
>> {
>>     if (!mr->name) {
>>         ((MemoryRegion *)mr)->name =
>>             g_strdup(object_get_canonical_path_component(OBJECT(mr)));
>>     }
>>     return mr->name;
>> }
> 
> OK, in fact I didn't see it was called from inside a "if
> (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_XXX))" and was worrying about the memory for
> the string always allocated.
> 
> So it looks good.

Is there something else you expect me to do with this patch?
Maybe you expect another R-b to take it, so I should keep
pinging for review?

