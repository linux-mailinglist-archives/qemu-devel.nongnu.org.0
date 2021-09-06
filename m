Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E6E401AF3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 14:09:03 +0200 (CEST)
Received: from localhost ([::1]:36690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNDQs-0004Rb-8D
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 08:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mNDPh-0003kZ-C8
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mNDPe-0003Q7-6t
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630930064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EP81wPe3JDlFYB7I26DZCq+ZeUN33enLkczItRYIogE=;
 b=CRVQpit3Oa3gbH+OiwtIYoGA+Zd3FfyaaZ3ScstoS4B8PMPnr28momtsovKn0SyHk2bdUM
 ZVZ4bnwCJUBuVstH7S8RWRU3WxeTZfksyk2Vvir11uly0U6FvbLMs9YITEH+sTu4EspgOg
 vohy4FTvSFxKYGWGn+9RdLJJhaHE734=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537--F7cWnZ8OQeM2auZacuEEw-1; Mon, 06 Sep 2021 08:07:43 -0400
X-MC-Unique: -F7cWnZ8OQeM2auZacuEEw-1
Received: by mail-ed1-f70.google.com with SMTP id
 g4-20020a056402180400b003c2e8da869bso3596462edy.13
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 05:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EP81wPe3JDlFYB7I26DZCq+ZeUN33enLkczItRYIogE=;
 b=YuhO60PTAeerXf7cJ4WtqXiPFVxvzkqW7Qjk23vWajz3lVs0ESaYSfJKmiHHjz/tcb
 KEtP2oS4QR3xa6SO5Bl0JATCsrpmg2fbLIEtBtn0c7nl4RHsaSroK32IHY8Yn97o8TXo
 gQCX6rjHd4LetSwhkbTI5LlQMM0VKksT9WUA35Ma46+3GxTWUPFen2dC9tUV+pubKzq0
 FpruaR81gSsa3zu0VveFKD37fiadqeXqzbjjF9LokLgPV1sUPQzrRmXiXbJbLeswPm0b
 IXEyeap4Sd16hMw/ez4TeblRVJGsA6SvGw0Xde4x4us9JcME2SXqRmsgQ/dii+heTapM
 OkjA==
X-Gm-Message-State: AOAM530rS0NbAYEQpYdxMfyT3L8tq5HwZ6u6ytO8LuqE+t4LqOc78FRq
 vA3XL0dF9sdh8Mbld6C8O41sQY5TdA+O7k2+7dvAUGqh4OjfuwEMBAedL9FCTW852VmqY9Fa0gU
 BJjjeEls/9/pkdP8jPXptBP+/MFpXeOCaXHx0BKe8qIbFCDXjdzigmKGXxQXVxNWU8d0=
X-Received: by 2002:aa7:c790:: with SMTP id n16mr13148922eds.223.1630930062030; 
 Mon, 06 Sep 2021 05:07:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLgOGyV/9ko+2EyXDVDl73VATqgKsLvG16fuLLsKAYqtpqJ75LYyldcCAn4+DUB3P8jqYsTg==
X-Received: by 2002:aa7:c790:: with SMTP id n16mr13148904eds.223.1630930061811; 
 Mon, 06 Sep 2021 05:07:41 -0700 (PDT)
Received: from [10.43.2.192] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o6sm3771073eje.6.2021.09.06.05.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 05:07:41 -0700 (PDT)
Subject: Re: [PATCH 1/2] chardev: Propagate error from logfile opening
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <cover.1629190206.git.mprivozn@redhat.com>
 <f34ee80866e6f591bcb98401dee27682f5543fca.1629190206.git.mprivozn@redhat.com>
 <CAMxuvayipXmaR5qWgFEbJpwnHj-pzOx0z3mR1JBLRc_KqqJvtg@mail.gmail.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Message-ID: <d9a28588-0aa0-92f7-e147-58dd8e913576@redhat.com>
Date: Mon, 6 Sep 2021 14:07:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvayipXmaR5qWgFEbJpwnHj-pzOx0z3mR1JBLRc_KqqJvtg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 11:54 AM, Marc-André Lureau wrote:
> On Tue, Aug 17, 2021 at 12:56 PM Michal Privoznik <mprivozn@redhat.com>
> wrote:
> 
>> If a chardev has a logfile the file is opened using
>> qemu_open_old() which does the job, but since @errp is not
>> propagated into qemu_open_internal() we lose much more accurate
>> error and just report "Unable to open logfile $errno".  When
>> using plain files, it's probably okay as nothing complex is
>> happening behind the curtains. But the problem becomes more
>> prominent when passing an "/dev/fdset/XXX" path since much more
>> needs to be done.
>>
>> The fix is to use qemu_create() which passes @errp further down.
>>
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>>
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Thanks, can you add it to your pull queue please?

Michal


