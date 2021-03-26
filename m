Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5661134AA8C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:52:40 +0100 (CET)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnpH-00006t-9c
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPnmy-0006pR-Gz
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:50:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPnmw-0007dj-Cp
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616770212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPGFvNgslfvabSARLCaR9IukBvRrEcqQ3Wev40/4JTA=;
 b=hTa7R0VMRsY6D+k866GepJLzGpkAWWDsaCGNUko2U9gASBjiU8kA5TDYHMUUv+tRZS3pAd
 XMJWRYFso74vJVa0oniST96TuYqcu4n+5nzOsLricyr3PimS47CfUMMyqSsiqbDUBMZvVM
 aY3Gtm64XjNnW3yPXfGHlBorkODBlaU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-_JY4bNsAOFmSusipAMwl9Q-1; Fri, 26 Mar 2021 10:50:10 -0400
X-MC-Unique: _JY4bNsAOFmSusipAMwl9Q-1
Received: by mail-wr1-f70.google.com with SMTP id o11so4363965wrc.4
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 07:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CPGFvNgslfvabSARLCaR9IukBvRrEcqQ3Wev40/4JTA=;
 b=Dle1QszmJnQLmPKFp64im4rhG+qnb0xK51t7ycNoKwtcLkuHuMFnt1Jn62MX4zV5XD
 YsFnfg7NrsCkvkprDVzk7FAQSB/14f++YE9lDC1RPAae9bXiuepDLD02SXVs0EPmSnt8
 RgjRQAFhVYOd13lTDJLtjy/p2hIHPo0xxmMc/oZR/HcucHKoNg6jLrFNY9Kw1UbBYLOG
 4rzJ+3x9a8P53At/b884H4SKQJ5zB+bakRVgXSEDu7c/3VC2d+UKnCzovZ7ZESCGlFWu
 sr2OKbPvstQLtQHwxs8Mf6W+hmLuU9KAkFo/m94GaE7mZP0TBPi+fofOh9zHWABkBfDE
 1bBQ==
X-Gm-Message-State: AOAM532r7ysbgqANAvlLJuNfokuQuQOgLL04o1N81b/tqmtxwf5qd0CZ
 sYsayrh/rnqxcQvmibjQxtM/R177JPsK9gw2aCJLlvw/Tsu/FxP8XOqV/EI/2uzn98B/76tzZB6
 d/yvh80yAil7gmBKKsYp9uDehq+1FyTbgd5STir+tqfbRqUMgemqNbmTmWObpKmGtVh8=
X-Received: by 2002:a05:600c:35c8:: with SMTP id
 r8mr13221806wmq.130.1616770209229; 
 Fri, 26 Mar 2021 07:50:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuoLb7jfY96T86hmFAIq1G6GhXqDkB0rk0CbYClm0JPGfNDsU0AupsoK3WdwimG0FBJXl3Ow==
X-Received: by 2002:a05:600c:35c8:: with SMTP id
 r8mr13221783wmq.130.1616770208960; 
 Fri, 26 Mar 2021 07:50:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m10sm11527130wmh.13.2021.03.26.07.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 07:50:08 -0700 (PDT)
Subject: Re: [PATCH for-6.0] qapi: qom: do not use target-specific conditionals
To: Markus Armbruster <armbru@redhat.com>
References: <20210326100357.2715571-1-pbonzini@redhat.com>
 <87r1k2tc70.fsf@dusky.pond.sub.org>
 <87a68ae5-74fc-cb36-f78e-d40128a23e3c@redhat.com>
 <87o8f6qew9.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4418ca49-818a-bb5f-b6e8-36dc21b70013@redhat.com>
Date: Fri, 26 Mar 2021 15:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87o8f6qew9.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/03/21 13:27, Markus Armbruster wrote:
> ... until Kevin added some when he QAPIfied.  Looks like this (copied
> from qemu-qmp-ref.7)[*]:
> 
>     SevGuestProperties (Object)
>         Properties for sev-guest objects.
> 
>     Members
>         sev-device: string (optional)
>                SEV device to use (default: "/dev/sev")
> 
>         dh-cert-file: string (optional)
>                guest owners DH certificate (encoded with base64)
> 
>         session-file: string (optional)
>                guest owners session parameters (encoded with base64)
> 
>         policy: int (optional)
>                SEV policy value (default: 0x1)
> 
>         handle: int (optional)
>                SEV firmware handle (default: 0)
> 
>         cbitpos: int (optional)
>                C-bit location in page table entry (default: 0)
> 
>         reduced-phys-bits: int
>                number  of  bits  in  physical addresses that become unavailable
>                when SEV is enabled
> 
>     Since
>         2.12
> 
>     If
>         defined(CONFIG_SEV)
> 
> Your patch drops the last three lines, without a replacement.

Yes, I mean the regression is not from 5.2.

Paolo


