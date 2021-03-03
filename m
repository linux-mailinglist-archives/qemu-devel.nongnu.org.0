Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA67432B854
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:50:40 +0100 (CET)
Received: from localhost ([::1]:32794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRtf-00036J-OK
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lHRs2-00021p-Ax
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:48:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lHRs0-0000iM-L2
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614779335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/ll/5VFj1jysr3umm4EoOm9jqaM6+ow1NmVxoQAEw4=;
 b=BCCCyMK4pANCdGorzOCPxrsKtnDKUR0cFMDmIgsBm2y+NehiKhXSv2m87CLEr6umbSDB/F
 91ycesi+iUeLkUoyJ0VGXHGit1NxjvOI4Q2Fd2UqJ2zGRiqt3Nbou7UPcV+/5mz4/41eSD
 twO7eKD6x1b6i7kFCO7z/NbCGkPZSAQ=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-Fn0KC2g6M4KYu2SBx0WvcQ-1; Wed, 03 Mar 2021 08:48:52 -0500
X-MC-Unique: Fn0KC2g6M4KYu2SBx0WvcQ-1
Received: by mail-oo1-f71.google.com with SMTP id o15so5557040oov.22
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 05:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b/ll/5VFj1jysr3umm4EoOm9jqaM6+ow1NmVxoQAEw4=;
 b=iDAatqPaqTdxhBdlBKxmIVuQSnEcq3MY5PcjqE66KVFSDekrH2HtFkikeIh8iyxkeT
 kbu8fEziLos/fuMt0N/TwssiKlVkgijX8PGXl91prO1w7Fgf63ZCqy+WnmVzzXDvpGGc
 97bSf2J0in1JcNpkb/wb9JDLsKTmJARmRbctBc2yrR5G/SylSbbSzzaFUXvUdOKlOpxw
 CxRgzrdT+XIR4YGyToitg0NY8xBtbT4n3TUcSyLCDNEMkXyB0HORRMRPZOKYrM19JfZf
 uR7ElGdtMjgLvOiEPzOevwcvgOxogoCAkj5BWuc3oFYYJ8L8MuZz5z9I8zFMoPjqSMTZ
 zfug==
X-Gm-Message-State: AOAM532wpIQtFa0MtUgnWDkxRAG2uqyz/5yNQW/ZKUQOtYr4eChM0SZg
 XCgJZtGsuDy716NzRp0qUhNRNorJhzjXilLG3nEaC3z6AT3oUNz2UaToGEKF+U63AdijB/XpiFv
 viIuKVAQ4QOHvaf8=
X-Received: by 2002:aca:acc2:: with SMTP id v185mr5410269oie.28.1614779331395; 
 Wed, 03 Mar 2021 05:48:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxXJNYqkLSVHQLU7Q6HHSzLHeoDltFzI55hwQGl06TJut8RjGV9tJX0RyUekA+5GY7nIiuHQ==
X-Received: by 2002:aca:acc2:: with SMTP id v185mr5410255oie.28.1614779331172; 
 Wed, 03 Mar 2021 05:48:51 -0800 (PST)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 f13sm4704836ooo.45.2021.03.03.05.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 05:48:50 -0800 (PST)
Subject: Re: [PATCH 0/2] Clarify error messages pertaining to 'node-name'
To: Kevin Wolf <kwolf@redhat.com>
References: <20210301233607.748412-1-ckuehl@redhat.com>
 <20210303095320.GC5254@merkur.fritz.box>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <5e7f48f6-0558-76a7-6e8d-a214d9d46fa5@redhat.com>
Date: Wed, 3 Mar 2021 07:48:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303095320.GC5254@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: armbru@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 3:53 AM, Kevin Wolf wrote:
> Am 02.03.2021 um 00:36 hat Connor Kuehl geschrieben:
>> Some error messages contain ambiguous representations of the 'node-name'
>> parameter. This can be particularly confusing when exchanging QMP
>> messages (C = client, S = server):
>>
>> C: {"execute": "block_resize", "arguments": { "device": "my_file", "size": 26843545600 }}
>> S: {"error": {"class": "GenericError", "desc": "Cannot find device=my_file nor node_name="}}
>>                                                                                 ^^^^^^^^^
> 
> Arguably, this error message isn't great anyway because of the empty
> string node name. We didn't even look for a node name, so why mention it
> in the error message?
> 
> But your patches are certainly a good improvement already. I would have
> merged them, but git grep 'nor node_name=' shows that you missed to
> update a few tests, so they fail after the series. I suppose you only
> caught the ones that are run by default in 'make check' and missed the
> ones that require running the qemu-iotests 'check' script manually.

Ah, good catch! Yes, I was only using `make check`, I'll use the `check` 
script to uncover the other failures and fix them accordingly.

>> [..]
> 
> This is a good explanation for the change you're making. I think it
> deserves being committed to the repository in the commit message for
> patch 1.

I'll move this to patch #1 in the next revision of this series.

Thank you!

Connor


