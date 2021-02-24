Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB96323BBF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:03:08 +0100 (CET)
Received: from localhost ([::1]:57450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEssl-0001X6-QJ
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEsqm-0000ep-Rw
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:01:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEsql-0007Pq-6z
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614168061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=31Fq8tFp+JpVic2Lsz4dXDVNrHNsVQzy0unUbGwZufs=;
 b=h1YHbIZXhEil0S9Jy71020QLJujCwSlYly7BwAanO/R3owZpzekQWpmea+6nG+ZTvqGAr8
 8gZKdGvBbttygRWTieygNSeGh8f0KKHk9wAs50EL5BlPJ87tsOEyshfxVfkZ0T4xoalNuH
 e6HRVsuJq9D77rVQ+kKXq/iF3gPk+SI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-keUioYLRPuGuupNAkQvURw-1; Wed, 24 Feb 2021 07:00:58 -0500
X-MC-Unique: keUioYLRPuGuupNAkQvURw-1
Received: by mail-wm1-f70.google.com with SMTP id h16so460406wmq.8
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 04:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=31Fq8tFp+JpVic2Lsz4dXDVNrHNsVQzy0unUbGwZufs=;
 b=aQ5ovOs4g01H/nFBoYTK8lbqqIT4SC1cxP9vwmveM0LBciwClnXLVV28URBiGDpKuR
 xwGkHwEbxPabQG8KTcyH3+wafTuDX8iRpHBsi1TXWrjNLpXQYMQDPBXf+8OXDJ1isdvU
 bttznEE+ZmsJKLpKPOq8Yrsz78DQtY8XaYothUoH8XQchQMYkPtCL1yAw7SZjBCUwhlR
 S34HkHUrTezhac/PCrxJTV3yaTw7KoOTpVXbXLRw5NIV/1xIvtKHDujzI5zZOI2SwBxl
 cCaO4Z9kbzqKPS0cvaHVCuu1G06VLkzdlAfUEYbuSu6UOpjFi6m3bTmI35udheszVrGp
 ldgQ==
X-Gm-Message-State: AOAM530IWp9fJ3CxMHfylbSZszpu7heydV7T1aoBB7T9/QxbV7A9seGC
 FhtlujZmeSDenbmvjMGmfTfClOS63uZ3lf8NuU4d4gDBikUvxlKBPTZfE1PxaNeufLSMtkcfRKp
 r3aHo/m+8UvvcKzs=
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr3493678wmh.171.1614168057189; 
 Wed, 24 Feb 2021 04:00:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6eOl2PrFnQuOREDC1DD3JtWJ0jwL9X9PzyEu1s+JQMgUXRiX5GdNtt5hF43rWMo6HoEtfSA==
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr3493665wmh.171.1614168057089; 
 Wed, 24 Feb 2021 04:00:57 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm3541165wry.90.2021.02.24.04.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 04:00:56 -0800 (PST)
Subject: Re: [PATCH v5 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-5-crosa@redhat.com>
 <21f882ba-21db-2d45-0e74-be27e1119355@redhat.com>
 <YDUlozcbgzWfQetX@redhat.com> <20210223182539.GH987581@amachine.somewhere>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <247471f5-1b65-b93c-8c23-18857653e3b8@redhat.com>
Date: Wed, 24 Feb 2021 13:00:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223182539.GH987581@amachine.somewhere>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 7:25 PM, Cleber Rosa wrote:
> On Tue, Feb 23, 2021 at 03:56:19PM +0000, Daniel P. Berrangé wrote:
>>
>> Urgh, well that's a big problem. We certainly don't want *anything* being
>> placed on the custom runners without explicit opt-in, otherwise jobs run
>> in the main repo have a different environment from when users run on their
>> personal forks.
>>
>> IOW, we need anti-affinity against our custom runners really.
>>
> 
> I'm assuming Phil missed that documentation, because that's a
> non-issue, really.
> 
> Just unchecking the "Run untagged jobs" check box on the runner
> configuration makes sure that the custom runners won't pickup any jobs
> not *specifically* tagged for them.

Can we explicit this when registering the runner instead of having to
access the WebUI?

$ gitlab-runner register --help

   --run-untagged
     Register to run untagged builds; defaults to 'true'
     when 'tag-list' is empty [$REGISTER_RUN_UNTAGGED]


