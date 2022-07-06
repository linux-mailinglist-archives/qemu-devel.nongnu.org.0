Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405B0568F04
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 18:24:31 +0200 (CEST)
Received: from localhost ([::1]:58300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o97pG-0004lA-Ba
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 12:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o97nk-0003BN-6F
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:22:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o97nh-0002je-Gh
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657124572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jeCGzhV98vzQ7N4zEXIrfkLOCuqU3EtD6NcQJ0bR5gY=;
 b=W1JioB0K2Iw7pe9lliqoahNVknXvK3AULCm0/4QBmnAqgZNfwcHOlu3QBHQHzWIBSLDTnc
 kEu/F3pvcBgY1XjR/cpqT8oPB5pf3TgxiRwlYN4KhG1+qqsjH5Jgb7EWdbEmeGhII4TtY2
 WV6gEjH7LY+vPqxe7tPE88OLorW3cv8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-ZjCnt_6hNaWEN0QsHwAJjQ-1; Wed, 06 Jul 2022 12:22:51 -0400
X-MC-Unique: ZjCnt_6hNaWEN0QsHwAJjQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n35-20020a05600c3ba300b003a02d7bd5caso8300082wms.2
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 09:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=jeCGzhV98vzQ7N4zEXIrfkLOCuqU3EtD6NcQJ0bR5gY=;
 b=hwPMu5JoL2vqKtM/ruyuD9NkcMAhFtt+8TQW6BEImwIIh5gUiOMZkAxwsHFEYZt6AJ
 ckQ3pUwoJKBEdpPbBWo+YKKx+CoHNh1eFeq4gYlbcYWPKUr/HSthWm4z+MRtaBgCJY8Z
 O7MHFFOr6CRtl/HbqbP8FYZiMFCyckLdaMfwW2gQqLMnHHfaU+64aLX+vi3CIfjHBnRU
 Y8Gbri7rDmO8BjNrFtQ+cD91jkudGCw954bXGGOmrdF1jlru4TqwTVE7VQ/o56vBd2DQ
 NFYS/KpmWc4hdcCYAxWbgopav1oyQj9lyq2nqdhG7M1GsIOI+w5sfWYtTTIc/g8aTOig
 I0hw==
X-Gm-Message-State: AJIora8V5sIcjuE2/3+KiXI7xmjR4p73cKFndlTvwECWkvSeIjdD/LPE
 6QcjvCFZQnl9wI6Ot4oVIXtXI9WXjlI35VxIdgTynCC/HeflWIvNcWwxrdgtf2hNQ/GlADNKjrH
 kVBzcjZUTJKXZlIg=
X-Received: by 2002:a7b:cd08:0:b0:3a0:37f9:6e5d with SMTP id
 f8-20020a7bcd08000000b003a037f96e5dmr42827742wmj.167.1657124570699; 
 Wed, 06 Jul 2022 09:22:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vaoZKcGnu7cgXAHRcxDjPx2dT2MeO0A6EVwoDIH3vqnJOi0++GkZvNPQHuQfkuk5CHPwtu9A==
X-Received: by 2002:a7b:cd08:0:b0:3a0:37f9:6e5d with SMTP id
 f8-20020a7bcd08000000b003a037f96e5dmr42827704wmj.167.1657124570322; 
 Wed, 06 Jul 2022 09:22:50 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 q20-20020a7bce94000000b0039c4b518df4sm32155413wmj.5.2022.07.06.09.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 09:22:49 -0700 (PDT)
Message-ID: <eceb0156-f3e0-a51f-32e6-1f7de13398bc@redhat.com>
Date: Wed, 6 Jul 2022 18:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: copy-before-write test failing
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
 <20220614102910.1431380-8-vsementsov@yandex-team.ru>
 <6201a201-24fd-3906-4d9d-06f8c6d94d84@redhat.com>
In-Reply-To: <6201a201-24fd-3906-4d9d-06f8c6d94d84@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 05/07/2022 11.03, Thomas Huth wrote:
> On 14/06/2022 12.29, Vladimir Sementsov-Ogievskiy wrote:
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>>
>> Add two simple test-cases: timeout failure with
>> break-snapshot-on-cbw-error behavior and similar with
>> break-guest-write-on-cbw-error behavior.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   tests/qemu-iotests/tests/copy-before-write    | 81 +++++++++++++++++++
>>   .../qemu-iotests/tests/copy-before-write.out  |  4 +-
>>   2 files changed, 83 insertions(+), 2 deletions(-)
> 
>   Hi!
> 
> Seems like this test is failing in the CI on FreeBSD and macOS:
> 
>   https://gitlab.com/qemu-project/qemu/-/jobs/2670729995#L5763
>   https://gitlab.com/qemu-project/qemu/-/jobs/2670729993#L3247
> 
> Could you please have a look?

I just hit another failure, this time in a restricted build:

+FFFF
+======================================================================
+FAIL: test_break_guest_write_on_cbw_error (__main__.TestCbwError)
+break-guest-write behavior:
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/tests/copy-before-write", 
line 124, in test_break_guest_write_on_cbw_error
+    log = self.do_cbw_error('break-guest-write')
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/tests/copy-before-write", 
line 82, in do_cbw_error
+    self.assert_qmp(result, 'return', {})
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/iotests.py", line 1190, 
in assert_qmp
+    result = self.dictpath(d, path)
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/iotests.py", line 1164, 
in dictpath
+    self.fail(f'failed path traversal for "{path}" in "{d}"')
+AssertionError: failed path traversal for "return" in "{'error': {'class': 
'GenericError', 'desc': "Driver 'copy-before-write' is not whitelisted"}}"

I think you need to check for the availability of the driver first, like it 
is e.g. done in the image-fleecing test?

  Thomas


