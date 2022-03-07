Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA004CF35D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:15:49 +0100 (CET)
Received: from localhost ([::1]:37290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8Wy-0001lS-Db
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:15:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR8Ua-00084E-MD
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:13:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR8UY-0002st-TX
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:13:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646640798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mR336Amv0h3l9cd+gHN3VXXKFqIF+Nb1EZ1ssYWXx8k=;
 b=QMd2VGj6lbRZULwJ9XuVYmTWGsm9ScxysMUrZaff8c/836wgy/N103vtHOF3Gr9XQot09Z
 eh4Z8a460K9LGxnchyXtW9IytFLuZtNr9fG8dPSzEgXgThMy6oj+BjhTSSmS9KurToQxYw
 lYcU3hYU5vgttyG7NJk0NsdUi+3dPik=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-hNERkCVVN16rCaufrd3XGA-1; Mon, 07 Mar 2022 03:13:16 -0500
X-MC-Unique: hNERkCVVN16rCaufrd3XGA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so4232590wrp.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mR336Amv0h3l9cd+gHN3VXXKFqIF+Nb1EZ1ssYWXx8k=;
 b=W35EOKV/UHuV6I4/2I1E+gDwLNm5YbVH68Qn9aWuaK8b9x9Hlva8q8RX5Mz6j56eXV
 aA0qZIWYKGFclBM5iw68QgicloJ1fXJOFfRzcIQ4FBW3Ftr3qQzIGXsVz7TRV712+MVn
 pQdgEG+R3neBTp6/p8lSvI8VQB6tQiQGm/tuQrW0YSsN35HUeB8FRtErWNOEVooxyUh3
 DkhNH1Ax1HEORcP3oK1NOk/A4oXf+zbBGpuoVmd/qeY4RRnWLetoSmAeMUp3QY+laffN
 CPJPjmyT3BEt2I8ybHuJknVgX12V9psrXBUXkF4iwufJKQw9BrQm/1vJ3c6nU+AHxYru
 5cDg==
X-Gm-Message-State: AOAM530P+hoQeGgJnLtuRZoHasG9bWT0t7wKcMXMNru2mI5M8wPYZfEP
 y/efKA+YtLOG4ICQWIYrCs/LzeG9cWI97YPRuUa+aoGcq2RUd2e2F9l0JObp4lvRFP1N8L6oDwi
 /9uz/JaprHu4zIKI=
X-Received: by 2002:a05:6000:1847:b0:1f1:f134:4333 with SMTP id
 c7-20020a056000184700b001f1f1344333mr3840890wri.292.1646640795301; 
 Mon, 07 Mar 2022 00:13:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoBu0j09xiChcu/H85SY8DE9ZlYKgEQEqKQbyF6VjUg+y0I0WZO3p+zZSxJYteL20mgNw9/g==
X-Received: by 2002:a05:6000:1847:b0:1f1:f134:4333 with SMTP id
 c7-20020a056000184700b001f1f1344333mr3840872wri.292.1646640795049; 
 Mon, 07 Mar 2022 00:13:15 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b00380deeaae72sm28731803wmb.1.2022.03.07.00.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:13:14 -0800 (PST)
Message-ID: <3137076a-d0b2-510e-8da5-446281dce70d@redhat.com>
Date: Mon, 7 Mar 2022 09:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] Revert "check-block: replace -makecheck with TAP output"
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220208124432.84924-1-pbonzini@redhat.com>
 <YiJE5n8CkFTX4Zqn@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YiJE5n8CkFTX4Zqn@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/03/2022 17.57, Daniel P. Berrangé wrote:
> On Tue, Feb 08, 2022 at 07:44:32AM -0500, Paolo Bonzini wrote:
>> This reverts commit d316859f4e28c74ab8b618895d2a5e0a865d3cf1.  The
>> TAP output is inferior in that it does not include the diff for
>> failed tests.
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   tests/check-block.sh             |  6 ++--
>>   tests/qemu-iotests/check         |  6 ++--
>>   tests/qemu-iotests/meson.build   |  1 -
>>   tests/qemu-iotests/testenv.py    | 30 +++++++++----------
>>   tests/qemu-iotests/testrunner.py | 49 +++++++++++++++-----------------
>>   5 files changed, 44 insertions(+), 48 deletions(-)
> 
> Peter mentioned that he's seeing the CentOS 8 CI job fail
> continuously: eg
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2163919781
> 
> [quote]
> 1/1 qemu:block / qemu-iotests qcow2 ERROR          163.04s   120 subtests passed
> Summary of Failures:
> 1/1 qemu:block / qemu-iotests qcow2 ERROR          163.04s   120 subtests passed
> Ok:                 0
> Expected Fail:      0
> Fail:               1
> Unexpected Pass:    0
> Skipped:            0
> Timeout:            0
> Full log written to /home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/build/meson-logs/iotestslog.txt
> make: *** [/home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/tests/Makefile.include:156: check-block] Error 1
> 
> [/quote]
> 
> None of the individual tests are showing ERROR though, only the final
> status is error.
> 
> We also don't have access to iotestslog.txt which is very annoying.
> 
> When i run it locally I got the iotests.log and found that it
> contained an error message saying the TAP outout was malformed
> and couldn't be parsed.
> 
> When I ran the iotests manually I confirmed this, it prints:
> 
> ok qcow2 037
> ok qcow2 038
> ok qcow2 039
> ok qcow2 040
> ok qcow2 041
>      [case not run] test_after_a_quorum_snapshot (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_cancel (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_cancel_after_ready (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_complete (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_device_not_found (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_image_not_found (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_medium_not_found (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_no_node_name (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_nonexistent_replaces (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_pause (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_with_other_parent (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_with_other_parents_after_mirror_start (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
>      [case not run] test_wrong_sync_mode (__main__.TestRepairQuorum): formats ['quorum'] are not whitelisted
> 
> ok qcow2 042
> ok qcow2 043
> ok qcow2 046
> 
> 
> All those '[case not run]' lines are invalid tap output.  The
> need to start with a leading '#' to be treated as a diagnostic
> message. I briefly considered sending a patch, until I remember
> this change to stop using TAP.

A patch for fixing the TAP problem is already on the list and has been 
queued by Hanna:

  https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg05074.html

So that should hopefully fix the problem with the CentOS 8 CI job once it 
gets merged.

  Thomas


