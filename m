Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F79F57E392
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 17:14:08 +0200 (CEST)
Received: from localhost ([::1]:54874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEuLu-0006QP-CT
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 11:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEuFQ-00058g-Cp
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEuFN-0001iE-33
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658502440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4ceIwmIpo6VF90bAFoKfiugXPvAFI3Dxl59Pmu90hw=;
 b=f4s609BaColCIIpFKnyu5AYBp9nvzj/eFU7s5mTNJt26nYA1BXDItGuXGAGe0I+dzbbpd7
 fieAVZRM1fynCqkUXXzWeMl4xu+j57KmbUqqJ0zcEAyB9yyqYhN8SR3hCd1id3QtBxs8GH
 8v/z5zaaprrDo79FSoqlWuLIjlP64wY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-aVgVGN14NumFyeX_BgIXeQ-1; Fri, 22 Jul 2022 11:07:11 -0400
X-MC-Unique: aVgVGN14NumFyeX_BgIXeQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n19-20020a05600c3b9300b003a314062cf4so3956508wms.0
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 08:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f4ceIwmIpo6VF90bAFoKfiugXPvAFI3Dxl59Pmu90hw=;
 b=Kv4pL81xkBhCKIlh+rcjoWu/0tk9NUGRylMigcyBV9qofK7FGmeopfLD1ThGx3AMdX
 eCM9s8/Rp0ny1ZNBjrQPky5qpOiR0qKddTI7p/syOMewO7pYPQUFY0FXggGdwYDkbN63
 KM5zC6hAV8x91X1OvZOOZePXnxd7d1JJdmZkeQi1ngxDEPk98E7fvfw9A3d/etiORyU0
 VQ6RN4ei8hgs9vVrVAv1uuQyJvigeQHSEOZpWgIBmfujSXGMMh3V8BFQnP4pEmob18V5
 E/3/4ImS3Da0G9NwM5eOr5Q8JGX9mUU3z4n5iOxLx9m6dYL1ru/BrRywrEUKah13jpXh
 kNCA==
X-Gm-Message-State: AJIora+YMHlzRbultIMU0CU7nXNpNccToZ0/Y3pVmuZDn11figNLvwpR
 51y1q2klYVq52EAc6nD26ItuGhRGWpvHnflAFDrAIyFH5Jr3NVZF9gkcTzrBOpr9SpEDhk88tqw
 tGPVtt9+Dd33HVEc=
X-Received: by 2002:a5d:5747:0:b0:21d:65e9:be07 with SMTP id
 q7-20020a5d5747000000b0021d65e9be07mr243258wrw.215.1658502430826; 
 Fri, 22 Jul 2022 08:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ssx1h81Q7RsPbDLM9Ot61U5GfBLggtgSrLR1kpduszR1Jl1CNX3NIinh0XoDWqyo+S48T/wQ==
X-Received: by 2002:a5d:5747:0:b0:21d:65e9:be07 with SMTP id
 q7-20020a5d5747000000b0021d65e9be07mr243227wrw.215.1658502430298; 
 Fri, 22 Jul 2022 08:07:10 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-42.web.vodafone.de.
 [109.43.176.42]) by smtp.gmail.com with ESMTPSA id
 a7-20020adffac7000000b0021e3e73dec6sm5735900wrs.72.2022.07.22.08.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 08:07:09 -0700 (PDT)
Message-ID: <368acb07-ddcd-7d6f-a86d-deb82a64d82b@redhat.com>
Date: Fri, 22 Jul 2022 17:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] trivial: Fix duplicated words
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20220722145859.1952732-1-thuth@redhat.com>
 <Ytq8MarsylEWxvhQ@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Ytq8MarsylEWxvhQ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 22/07/2022 17.03, Daniel P. Berrangé wrote:
> On Fri, Jul 22, 2022 at 04:58:59PM +0200, Thomas Huth wrote:
>> Some files wrongly contain the same word twice in a row.
>> One of them should be removed or replaced.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Removing duplicated words seems to be the new hip trend on the
>>   Linux kernel mailing lists - so let's be hip in QEMU land, too! ;-)
> 
> I've got patches proposed for this, as well as test to detect it:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01405.html
> https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01403.html
> 
> though I'm not checking 'this this' or 'a a'

Ah, ok! Sorry, I should have had a closer look at that series...

So never mind this patch here - but what do we do about "this" and "a" ? 
Shall I respin my patch limited to those two words, or do you want to 
include it in your series?

  Thomas


