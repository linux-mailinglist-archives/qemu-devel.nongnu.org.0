Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FFB6A95B8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:00:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY39O-0002gX-Vf; Fri, 03 Mar 2023 06:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY39J-0002gB-KW
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:00:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY39H-0005M6-Sr
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:00:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677841226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZtegFE70obj21q7zWxOWf4qmcQCFam2ZS9RY39KFr8=;
 b=MOW9669BqghDkGr3P2xc+2KezIrRRKBhQmLeSQkqqoU1qTUns1N5dBvhrO2fej+f88X7/S
 YiNM6l5agf5X5Q1kRc3QbqhIN/R/rtftovC9jERAS4l+tMc9hIAUtiIbQEqwdqivWWmBit
 e+IOKqPJcfe9oA7uuFTf/b110cUQp6U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412-Di3Ih68jOLewxznYvUMlGg-1; Fri, 03 Mar 2023 06:00:25 -0500
X-MC-Unique: Di3Ih68jOLewxznYvUMlGg-1
Received: by mail-wr1-f70.google.com with SMTP id
 l14-20020a5d526e000000b002cd851d79b2so327162wrc.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SZtegFE70obj21q7zWxOWf4qmcQCFam2ZS9RY39KFr8=;
 b=PG/x+ccCubocw/objOhHKzOmfsOLgzfMsv6eds9I+3S9yUmo9rwf8CrDHlLdFYo52t
 yL2JTJjZJQunAsk8wKvtoMGG8m9NTIppfA0eZ7rC53nrYwsWyC1fhi978kBwWUAKGZFl
 v3FVwgiwTwAuZ6MOZ+rBShcB18Mo+hqCrm1KGIw9B/0LAY9b4wyJKMy3sBJmNh1MGqmo
 gcl0lnc33ozaFBl1XoJtReSLNz9Q3qWVVIQ5RAPoH7sUBK4+A/PWo6KFn63z1VChmkU8
 jYPdEI10nwaNVM7YEvP/YDlfW3o0lApfi3rvn+S/VUNb9BHFXjiNRMTQdp0RZBgO7j4L
 L+lA==
X-Gm-Message-State: AO0yUKUHOZR4dhmGAjE5P1MbgQmPoQCMz3Q8Xj1QDig04ooL/fqZpwDw
 Ed31ByJvwJg/wvtpPtOTnLvUqS6bQU0xpsEwLMGTUA457Nw/U9r69PRqfHkalWUjrGH7XGcw/nv
 c799NWivcV9VEKnc=
X-Received: by 2002:a05:600c:4511:b0:3ea:e554:7808 with SMTP id
 t17-20020a05600c451100b003eae5547808mr1186309wmo.19.1677841224156; 
 Fri, 03 Mar 2023 03:00:24 -0800 (PST)
X-Google-Smtp-Source: AK7set9kXlJFMEGsyFgRrhcDMslM78QhkEidtwNG2vZZylSRvYDh+2XiuXZHS4kjU3JivjCnoPp7nQ==
X-Received: by 2002:a05:600c:4511:b0:3ea:e554:7808 with SMTP id
 t17-20020a05600c451100b003eae5547808mr1186288wmo.19.1677841223808; 
 Fri, 03 Mar 2023 03:00:23 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a05600c3c8c00b003e8dc7a03basm5993858wmb.41.2023.03.03.03.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 03:00:23 -0800 (PST)
Message-ID: <e06d72d1-9628-2b5a-8ff9-7a1bedea087f@redhat.com>
Date: Fri, 3 Mar 2023 12:00:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Is the fix for "DMA MMIO reentrancy" in qemu stable now?
Content-Language: en-US
To: byzero <byzero512@gmail.com>, qemu-devel@nongnu.org
References: <CA+LXE64nmGveP834FfUKxfrGN5dGX-615-OvFsTSLCuoKombmw@mail.gmail.com>
Cc: Michael Roth <michael.roth@amd.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CA+LXE64nmGveP834FfUKxfrGN5dGX-615-OvFsTSLCuoKombmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 09.27, byzero wrote:
> Hi,
> The bug class of MMIO reentrancy is fixed by adding a member "memory" in the 
> struct "MemTxAttrs", but the patch only exists in 7.x version, which is only 
> release version, but not stable version. The latest stable version is 6.1, 
> and there is no stable version being released for nearly a year.  According 
> to the docs(https://www.qemu.org/download/ 
> <https://www.qemu.org/download/>): "The stable trees are located in branches 
> named stable-X.YY branch, where X.YY is the release version.".
>    So I want to know that if the patch is stable enough? Will the community 
> be possible to change the way for fixing the bug class?
>    thanks for reading this email.

  Hi,

as far as I know, there are currently no more stable releases, due to time 
constraints of the stable maintainer. So your best option is currently to 
pick the corresponding patches and apply them on your own before compiling QEMU.

  Thomas


