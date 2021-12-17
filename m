Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0F04795F4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 22:03:54 +0100 (CET)
Received: from localhost ([::1]:44050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myKOO-0000yS-Sm
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 16:03:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myKMN-0007kZ-Ok
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:01:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myKMK-0003b9-DE
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639774902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWm8C29LvR/6Lyf3N0BXO+RTVkVPB9vr741JDLiLSbQ=;
 b=GYJJjUyqekdwRVwljnnJ0xbqhxyR6CdmNsDlXmsqzPI4qfTRVzNpjoJojxWfnGVlFXAkDg
 iDCfiI1PqTk1BHViLawDdIEd3kvAFH1yeBT+SHfaPuk2pLN6FqLhnNZoxbBcYakr8ymmOo
 zBERiKJAsDEy6Sx2LFS+NQrYp5OK0HU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-s7me6IPEOXiTp2aw1jXgoQ-1; Fri, 17 Dec 2021 16:01:41 -0500
X-MC-Unique: s7me6IPEOXiTp2aw1jXgoQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 a203-20020a1c7fd4000000b0034574187420so2565876wmd.5
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 13:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TWm8C29LvR/6Lyf3N0BXO+RTVkVPB9vr741JDLiLSbQ=;
 b=renQW3nM69n2xWdZctJwF29OiGHICyrVOMfuIxQUFCUlGfFeHUf+1WwWzW1MHxckHV
 MX8O7YjORtw/wpD7hR7wQZyNiGgeCpKieY5/ZbnJJuHPejN0NFYUNKqLe+ZpUxQ5tlk0
 qHb/eerIqN+tVQBmzhK6/iD/7nTxqhEEX0sSc1aHvxewaykN2FiugiMBW0T2bwz2eBE6
 f5b3gRjvmrvBGMjwHlab5bs73HYufM5P0UPMzEcCtiTQGMroYK1tehBRTJEpzqulvXt2
 WjBIGf74X+WGpmY291CnVYoZZ0s/jUK8tnFeR7Le1uXvkoOSaou/zib/cyHdiy6hSDpp
 yHqA==
X-Gm-Message-State: AOAM5337Yg1e/ofdsaxfSUNoUw9f4V8neye2aJnfoxilIgV3s6WrBPcG
 wr9W7O/RceMyDYZLvaqpIdMAvNFjsu/wBKMFSGapXBb4cpSgP80bDqlTPWWY6jx3qpTWtf2e7sk
 EiH2W0XUWEEYGFw4=
X-Received: by 2002:a1c:9dd4:: with SMTP id g203mr4231568wme.114.1639774899433; 
 Fri, 17 Dec 2021 13:01:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcAw5CA43RwoaM5M3VFn9ZK+y+FE2qrfbG4tfkwZYs07G9iM3FcLE2b30VbWIBDqVXfsvI7w==
X-Received: by 2002:a1c:9dd4:: with SMTP id g203mr4231557wme.114.1639774899250; 
 Fri, 17 Dec 2021 13:01:39 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w17sm9120527wmc.14.2021.12.17.13.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 13:01:38 -0800 (PST)
Message-ID: <61dc3ace-ccc0-a0d3-d76e-a4e336b40b89@redhat.com>
Date: Fri, 17 Dec 2021 22:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] migration: All this fields are unsigned
To: Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211216091332.25681-1-quintela@redhat.com>
 <20211216091332.25681-2-quintela@redhat.com>
 <efafa479-0c54-fbf2-58f8-17462935daa9@redhat.com>
 <3abdf9e0-3fa6-1bd6-0aa1-3325c0f23207@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <3abdf9e0-3fa6-1bd6-0aa1-3325c0f23207@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 21:25, Richard Henderson wrote:
> On 12/16/21 1:26 AM, Philippe Mathieu-Daudé wrote:
>> On 12/16/21 10:13, Juan Quintela wrote:
>>>   multifd_send_terminate_threads(bool error) "error %d"
>>
>> Nitpicking: bool is unsigned :)
> 
> Eh, while the value is not negative, bool will promote to int in stdarg.

Oh, TIL, thanks :)


