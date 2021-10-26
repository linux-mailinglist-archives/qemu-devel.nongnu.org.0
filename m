Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C743B103
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 13:18:57 +0200 (CEST)
Received: from localhost ([::1]:33514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfKTo-00053N-IT
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 07:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfK9I-0001UR-2F
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfK9G-0002V2-JN
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635245862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9VP1atN0/Jr4fl/EVZ4rS+Eu8ybRQ0/SqBjnV+pEiw=;
 b=FSw2L6cOvFqA9jPHrAwvSKqMTV4m5aYz6mVjSMhS+vA1vNJMF9LyxUyJQ/0MuOFNYJ7e9M
 ZBVH+bOPMCfhkhqxVC604D3fgGSW/fmoVVTPYHTs+fmJ8HMOMjp8dmPHZ0VBncVAVM95D/
 pYtxsuISSLaSmjjPZKg50ePeQND7kQs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-7tG3uypaMVur9sbtlltwww-1; Tue, 26 Oct 2021 06:57:41 -0400
X-MC-Unique: 7tG3uypaMVur9sbtlltwww-1
Received: by mail-wm1-f71.google.com with SMTP id
 k126-20020a1ca184000000b003231d0e329bso870322wme.4
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q9VP1atN0/Jr4fl/EVZ4rS+Eu8ybRQ0/SqBjnV+pEiw=;
 b=a5KQXadNxZl9/IxeTqJsOqi36BMmXSQCOznjHWOFEtIW5a5on3GVHx3tCOCBdPswJn
 gyY7Dpa39sXxZMmnGDobquZ4KndahZW2ghuz8lFdJpJqV9IQQ4k0BoqzaWNT5o6X8d/4
 2CizSBleyLJrn98eEekhCpIZzORv5nyWT1epAt+ozyhPLc6HlVms0ZWECLKg09oOTUgU
 sNkQM8FoedvbheML6kXAv2eoPcfIsB8wF0M2CbDCJqTMvydZrfEJtmO1n0aqfRZONCeC
 mUcwt8L0VknZFGpXP6UoBeNTvNp1Uk0sdPtwD0W+ldREcWv9QiqfQ02Fp61P9T+N91Pj
 7FMg==
X-Gm-Message-State: AOAM5332tPVOK3Fpmpk0YwFyCtLzOdN6O8ffguCgO3++EnL+k8+UY0zt
 rs7ahKGhdqyl8w/SCiKPvEBDGAfPxc/QBgoWR2pyEm/ehTCQ75BA2hRd433le5mVlWo8wq4SDbg
 luFwXxPZxfinClBM=
X-Received: by 2002:adf:f48d:: with SMTP id l13mr31692347wro.94.1635245859850; 
 Tue, 26 Oct 2021 03:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxleAKVftm600GBjWmU30pMYv1uP7byqKYH8AED31qcSxjRytm5kP1X+cmt5JDDyV/qBXQUaA==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr31692316wro.94.1635245859653; 
 Tue, 26 Oct 2021 03:57:39 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id t1sm21772931wre.32.2021.10.26.03.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:57:39 -0700 (PDT)
Message-ID: <df8bd300-1d04-7df8-7916-8b004766d173@redhat.com>
Date: Tue, 26 Oct 2021 12:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 12/15] iotests/linters: Add entry point for linting via
 Python CI
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-13-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211019144918.3159078-13-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.10.21 16:49, John Snow wrote:
> We need at least a tiny little shim here to join test file discovery
> with test invocation. This logic could conceivably be hosted somewhere
> in python/, but I felt it was strictly the least-rude thing to keep the
> test logic here in iotests/, even if this small function isn't itself an
> iotest.
>
> Note that we don't actually even need the executable bit here, we'll be
> relying on the ability to run this module as a script using Python CLI
> arguments. No chance it gets misunderstood as an actual iotest that way.
>
> (It's named, not in tests/, doesn't have the execute bit, and doesn't
> have an execution shebang.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/linters.py | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


