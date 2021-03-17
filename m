Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315FF33F0FB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:18:05 +0100 (CET)
Received: from localhost ([::1]:44666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMW3o-0002uY-85
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMW2O-00021j-9f
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:16:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMW2K-0000SE-8S
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615986987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67ER8ymn3RvOiFRP6UbBR+cbhZxq/8Mxqp/n/1Awsvo=;
 b=f7rMOe6zP2K47iUvLrE+SlKi+P/+C735g1DshIhe7uTy5Hb481aIxnrfMQ6CtBEA2ZpXsb
 0q4vf8MbD1iIk8eEkBTfhfXONITEmIZyYCrJfA9n+YN8zo3d+8Z/havg4ijeNPoHTlJUFz
 nYRtJojPcgpaAN6yWsk4juv565G3Z4U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-e6H7VjqzNdyRjQ15AhYMNA-1; Wed, 17 Mar 2021 09:16:25 -0400
X-MC-Unique: e6H7VjqzNdyRjQ15AhYMNA-1
Received: by mail-wr1-f69.google.com with SMTP id h21so18238954wrc.19
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=67ER8ymn3RvOiFRP6UbBR+cbhZxq/8Mxqp/n/1Awsvo=;
 b=r/Isv4R/cRTq+RDoCVRuV62pa+72peS53qNC2Fe9CUNf6rTq3Wc56LJT1W5l18uuwX
 P6dV0JSdWmqvJv876WYGGHbDhex3xypl89c92/azWVG2pr8oYnANc0hJl3WBv+B80JA4
 z0FpXhIOoMC5pxRwLB5TEvwqPT4G3PwHJ+npnNSyjLRNiJbGxhdisrHrJhL/boaHbi5H
 INkXpZDHt2c4Q2no/K5SW6sATVGh0yqdhnmdt6o3ZNGQAkAsWXhgjbKxkG6/+ef8vopp
 mvKla6DRhCoO64jNY5WAwqKVWKS6P9IjzFHLFPJ4b7K89SEg/aYSpsgFplS3hdo7aGHL
 HtWA==
X-Gm-Message-State: AOAM531xao38lmgxteoQVTgE02D/e96fzgOyDi2pHHYRbwQ/FGV/yNJR
 qtom/GKl6VDvC3Ls8VlcUy/veOCmoPLd9wtadScaXxUNUwDyy/KX2MELYLJLOqxF1KBBz4tcWqA
 oZr1LiPt8W3SHuSfOvxck2fxDHQisE51inQunXMmAQsPOd3zOscLfZXrPsBmXeLYP
X-Received: by 2002:adf:ed87:: with SMTP id c7mr4473299wro.9.1615986983837;
 Wed, 17 Mar 2021 06:16:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm0VGLR7ddOduS/MUaFsggSwI7q1T5NXesG6xcPBafAOnwfRtrj4Ra0HXT00nEzNx14ogPJg==
X-Received: by 2002:adf:ed87:: with SMTP id c7mr4473270wro.9.1615986983512;
 Wed, 17 Mar 2021 06:16:23 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m11sm25720599wrz.40.2021.03.17.06.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 06:16:23 -0700 (PDT)
Subject: Re: [PULL v2 01/15] utils: Use fixed-point arithmetic in qemu_strtosz
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
 <20210317072216.16316-2-alex.bennee@linaro.org>
 <a6e34081-89bd-2af1-fa0d-72a8fc8daa04@redhat.com> <87h7lac70s.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <285185a0-fa94-9e25-317f-cb24a39c001a@redhat.com>
Date: Wed, 17 Mar 2021 14:16:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87h7lac70s.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 1:13 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Hi Alex,
>>
>> On 3/17/21 8:22 AM, Alex Bennée wrote:
>>> From: Richard Henderson <richard.henderson@linaro.org>
>>>
>>> Once we've parsed the fractional value, extract it into an integral
>>> 64-bit fraction.  Perform the scaling with integer arithmetic, and
>>> simplify the overflow detection.
>>>
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Message-Id: <20210315185117.1986240-2-richard.henderson@linaro.org>
>>
>> Something is odd with your tooling, the '---' separator is missing.
> 
> Surely that's only when you have bellow the line comments? b4 strips
> then when applying series.

Yes, the problem is your series doesn't apply on top of 7625a1ed013
("utils: Use fixed-point arithmetic in qemu_strtosz")

$ git am v2_20210317_alex_bennee_misc_fixes_strtoz_plugins_guest_loader.mbx
Applying: utils: Use fixed-point arithmetic in qemu_strtosz
error: patch failed: tests/unit/test-cutils.c:2128
error: tests/unit/test-cutils.c: patch does not apply
error: patch failed: util/cutils.c:275
error: util/cutils.c: patch does not apply
Patch failed at 0001 utils: Use fixed-point arithmetic in qemu_strtosz
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

But skipping this patch, the rest can be applied properly by git-am.


