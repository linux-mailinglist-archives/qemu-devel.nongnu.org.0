Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474585B8FAB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 22:32:31 +0200 (CEST)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYZ3a-0000e5-7M
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 16:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYZ0o-0007Wm-83
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 16:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYZ0k-0007N5-TO
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 16:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663187369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PhREPHhXm+crAtuezNs5+K9qCzV3incP8lph2OQ7jjs=;
 b=AsnAfMQ7NQONc8JBT8QB9ly2Y0Rwdt3WLxYctPNnFJje3MWDawqqbTfEpRScJ7xbb1+LVL
 tla6c/RzW9yK8I4sKBP5UGld5E1AxRAImnATtmI50zo4aaVjcQHumrNNHb55/HfDISjZOG
 X//7Il/BA1PRUJAk5IEbhy8KuPhESX0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-148-FJF0YSGCNoKlTCpRgfSFJA-1; Wed, 14 Sep 2022 16:29:28 -0400
X-MC-Unique: FJF0YSGCNoKlTCpRgfSFJA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d30-20020adfa41e000000b00228c0e80c49so4238302wra.21
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 13:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PhREPHhXm+crAtuezNs5+K9qCzV3incP8lph2OQ7jjs=;
 b=KVRPxbax8UzNnqzK9J2CXxmidlClI6KZmnn7/4aa7SA+hGx72TLvfv9XXHHFHP0Pvf
 +HUQTjEJu7tOY3UJhwHB5yo8p5cXvLHXetPiGH0I5opMvt+au5CpY7kqk0IlhkFIavLv
 +SeUmi2XiN2X0aRSjX2mpcUNPbqiuaNR9WTSddzurLWUewHYmRmOQOY092rI7kZw5AV2
 hs5hHztgW8H/NMsXatPyIup0q7htNTPpvOOQRsAJvtAwFmhVjzF5nu31+AcG4jkLgGpP
 otHqC5QXUGfrta2xfLhnFIbv4eqQDj4JPPlnH2ifiMrx0U2BuCmsePrFqS148kwmMyoo
 J93Q==
X-Gm-Message-State: ACgBeo2kHsFin2i4vQxIFJQxSWhbHYtbO56ltPWhI2FArkKh170geDRl
 47PfhmBguG8Hi9ZXBVYfifTNz9f09tg61mXtXcBliTtRIId8P+pwIXrFTPcR9/YlwH4xlmZGSPW
 dlUUdLqnWi4Lt+MA=
X-Received: by 2002:adf:fbca:0:b0:225:2ac9:e306 with SMTP id
 d10-20020adffbca000000b002252ac9e306mr22985704wrs.259.1663187367469; 
 Wed, 14 Sep 2022 13:29:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6YXTaJOacdFSbxSeKGCDnlhfkDPhCbwzOsad/tcT/rwmf7YkdrU5vyi+BuMa/rM5LxIoKJyQ==
X-Received: by 2002:adf:fbca:0:b0:225:2ac9:e306 with SMTP id
 d10-20020adffbca000000b002252ac9e306mr22985680wrs.259.1663187367144; 
 Wed, 14 Sep 2022 13:29:27 -0700 (PDT)
Received: from [172.20.194.41] ([79.140.208.123])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a5d430f000000b00228de351fc0sm175784wrq.38.2022.09.14.13.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 13:29:26 -0700 (PDT)
Message-ID: <f62c6a7e-960d-9552-582c-4b3f676b3b5d@redhat.com>
Date: Wed, 14 Sep 2022 21:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 04/30] tests/avocado: add explicit timeout for s390 TCG
 tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220914155950.804707-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.583, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 14/09/2022 16.59, Alex Bennée wrote:
> We don't want to rely on the soon to be reduced default time. These
> tests are still slow for something we want to run in CI though.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux.py | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index 67a24fe51c..4f07c27ac6 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -130,6 +130,8 @@ class BootLinuxS390X(LinuxTest):
>       :avocado: tags=arch:s390x
>       """
>   
> +    timeout = 240
> +
>       @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>       def test_s390_ccw_virtio_tcg(self):
>           """

Reviewed-by: Thomas Huth <thuth@redhat.com>


