Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65F7365E47
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 19:13:29 +0200 (CEST)
Received: from localhost ([::1]:58508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYtwG-0008Gw-Si
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 13:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lYtua-0007Pw-Lq; Tue, 20 Apr 2021 13:11:44 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:46679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lYtuY-0001mw-Mx; Tue, 20 Apr 2021 13:11:44 -0400
Received: by mail-qk1-x72f.google.com with SMTP id v7so12016462qkj.13;
 Tue, 20 Apr 2021 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DFrmQ+Iss+G8Bu1YgIHn8kBTaqOAyyTWZHCTEVY9RDs=;
 b=lLL1Nf+7TYjMVWSpVVPIRS4/6GI+91mSou/0jg4isqIwF3Y9QVZY/oMbHJPD0ieXjf
 o60zPMZEsR4/4Ob/gOxjrN604F4vOR0pC3s6kcbfByGLp2CjToQ2b/xYtj6SuSOTr7tg
 fOMrwMNzGXyz+2Yu4PLvZ+AeWau0+J8H44wa+nHdN2XIGH68Nsb2ZiiGmIvSsdowIYqT
 SmEuaP3x4WM9fFJrY9Ks5sRaRVRNw9HSgMCL3c/6OOnyRmDT4F5g/wZ9JAUOIXpDzGqH
 Gra+AImIfI/YTugVt8zBp6VGUsXpRQR0xSrCTqTU7lqW4Xd9w6OxB2OYm0djwRZ+NpD4
 6Tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DFrmQ+Iss+G8Bu1YgIHn8kBTaqOAyyTWZHCTEVY9RDs=;
 b=mxB+nASdn/EOHBlnuMQRDcX0Yy+rUa/NtIXiYPnMY5uZsFxoUcCq/VYy0aKmCH1mb/
 8IupECsd8cm8GXRh1+t1ABPjDTIvqK7qe/9Xqv0G3Xj2FXtVn0FP7eIR8HBEDjGqLl92
 aakvj86CU8RGA0wkWy7M0RycKqtN621lw7do1ssOy3roV1iX3v9hbBSplfubR12gbA8Z
 zdW4WJfjtkk+Y+gJT1n02wlHGLOvYziOCK9LqLBXYTQwsozdiIJdVSovQOWk7UP+9Tu3
 PQQvvEi3hHIvVo+Yb5/9Va1fKgtKXZlzRaO6o34K19Zfy/IMboa8J55k2+JUNkdOYfzQ
 I3Ig==
X-Gm-Message-State: AOAM533i7OJMQ7fuzWTR83aIUZf5Hsenakc02yOPnuvFGZVJdO7nXYWA
 /RR2lZeWabMZ1hvTUFnGn2Y=
X-Google-Smtp-Source: ABdhPJy6A994e5dFQpUtmVf2hJ5fzQDXbVPU1nnN7khLJapm3KCTYdCsDOGzbBdERPWMsdVOwvHmSQ==
X-Received: by 2002:ae9:e8d5:: with SMTP id
 a204mr18213567qkg.409.1618938701363; 
 Tue, 20 Apr 2021 10:11:41 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:8811:45c7:4abc:f19a:be81?
 ([2804:431:c7c7:8811:45c7:4abc:f19a:be81])
 by smtp.gmail.com with ESMTPSA id j9sm719801qtl.12.2021.04.20.10.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 10:11:41 -0700 (PDT)
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
To: qemu-devel@nongnu.org
References: <20210312200740.815014-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <c350efdf-cc61-243d-6d8f-7eade48618e4@gmail.com>
Date: Tue, 20 Apr 2021 14:11:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210312200740.815014-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Quick update about this work:

- the hotunplug timeout was reverted in the pSeries machine for 6.0.0.
This means that we have no use for a DEVICE_NOT_DELETED event or similar.
I'll drop it for the next version of the series.

- there is a good chance that the pSeries kernel will introduce a way to
report hotunplug errors in v5.13 ([1] for more info). This would make
the DEVICE_UNPLUG_ERROR event relevant again (otherwise it would just be
a rebranding of the existing mem_unplug_error) since we'll be able to
properly report guest side unplug errors for all devices in the pSeries
machine, starting with CPUs.


Thanks,


DHB


[1] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210416210216.380291-3-danielhb413@gmail.com/




On 3/12/21 5:07 PM, Daniel Henrique Barboza wrote:
> Hi,
> 
> This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
> DEVICE_UNPLUG_ERROR. They were (and are still being) discussed in [1].
> 
> Patches 1 and 3 are independent of the ppc patches and can be applied
> separately. Patches 2 and 4 are based on David's ppc-for-6.0 branch and
> are dependent on the QAPI patches.
> 
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg01900.html
> 
> Daniel Henrique Barboza (4):
>    qapi/qdev.json: add DEVICE_NOT_DELETED event
>    spapr_drc.c: send DEVICE_NOT_DELETED event on unplug timeout
>    qapi/machine.json: add DEVICE_UNPLUG_ERROR QAPI event
>    spapr.c: use DEVICE_UNPLUG_ERROR event in
>      spapr_memory_unplug_rollback()
> 
>   hw/ppc/spapr.c     |  2 +-
>   hw/ppc/spapr_drc.c |  8 ++++++++
>   qapi/machine.json  | 23 +++++++++++++++++++++++
>   qapi/qdev.json     | 28 ++++++++++++++++++++++++++++
>   4 files changed, 60 insertions(+), 1 deletion(-)
> 

