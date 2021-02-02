Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFF530C329
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:13:24 +0100 (CET)
Received: from localhost ([::1]:51500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xMp-0007Wi-Eq
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6wwf-0007Sq-8S
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:46:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6wwd-00035R-Dl
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612277178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncLz2mkdGz5/0MPtXjtL4yPHYPDTZ371Tjfs6iQjZgQ=;
 b=WvE14JOyJpaP4/3mwsRGJo4lguTHN/2cHNR3uOq9oAuZ5ZeHvMsw6XKmzB7fh0Wmi9MQ0N
 b8in0+J4175wJm50wKRmohG5hyCgUYcQPurN+N4RAQnEpIHMkUu9wv+McWVZThdS716XeL
 TaBV+8MnRtdI+hJULbonG9boM7GztqM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-3c9P8hKfNYCcnK68S3w2lA-1; Tue, 02 Feb 2021 09:46:15 -0500
X-MC-Unique: 3c9P8hKfNYCcnK68S3w2lA-1
Received: by mail-wr1-f72.google.com with SMTP id j8so12650675wrx.17
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:46:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ncLz2mkdGz5/0MPtXjtL4yPHYPDTZ371Tjfs6iQjZgQ=;
 b=dbVdfqLJNm1g+V4dPEFLO72TgeWmD4wBD4nOpLxFGBLlwkeUFvzdquEDHpZ576h0uZ
 SKwGeTBx7vlQ1/woNIUWNL1pvVpVT9wtRzpLY8yILHlQ/6oEeSyjmvqLUvCMamw5nLfb
 dULEu7GfTqh19dG0EH1e/rEmS0lYAmVRuJLPqXzmCB9T6Mk5sg7R1QihGe1CfbpM/9KC
 aO8fdSWV/6Sdd+JRmY+oW0rSkcR+xac94S4VSLxKNNtN6l5/GmCdW7riV7im3CtgtnSU
 651yi3Hg/pj5541B4VHjR0IG6+meqhtiZW+XKmYx9ONYaIP95djIJ9scVz5ET+yhY+2y
 QBVA==
X-Gm-Message-State: AOAM530OMkjniaZFrRx6RHuj1BLCYjToq8nSbBSVQ0HyCYUcdY5Q10hO
 zQpHSWJyQ+//NYGGXmaykKfd7UBQOZBpS9YK2ayb8ozF+pomJCMm/IlvyJxOk9ljYAwr7F/jleG
 /gv08pwP66LClEHK5WfvuhCLOvpS8i5FNqPEVu3eEQZGJ/yUQVaxvBZ1JUNjSu94R
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr24102846wrs.80.1612277174465; 
 Tue, 02 Feb 2021 06:46:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeaIhS8WZL093+lRN5kOu9xIPNZ/2sm/souhXk5X+65fv9aiph+1OJA+Mo7ht745HTVeeDig==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr24102813wrs.80.1612277174090; 
 Tue, 02 Feb 2021 06:46:14 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id b83sm3582304wmc.44.2021.02.02.06.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 06:46:13 -0800 (PST)
Subject: Re: [PATCH] iotests: Revert emulator selection to old behaviour
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210202142802.119999-1-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <48115c56-66cc-3f94-316c-95a9f64879a7@redhat.com>
Date: Tue, 2 Feb 2021 15:46:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202142802.119999-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 3:28 PM, Kevin Wolf wrote:
> If the qemu-system-{arch} binary for the host architecture can't be
> found, the old 'check' implementation selected the alphabetically first
> system emulator binary that it could find. The new Python implementation
> just uses the first result of glob.iglob(), which has an undefined
> order.
> 
> This is a problem that breaks CI because the iotests aren't actually
> prepared to run on any emulator. They should be, so this is really a bug
> in the failing test cases that should be fixed there, but as a quick
> fix, let's revert to the old behaviour to let CI runs succeed again.

FWIW this is the same problem I had 1 year ago and tried to
fix it by sending QMP 'query-version' (introduced in v0.14):
https://www.mail-archive.com/qemu-devel@nongnu.org/msg675075.html

> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/testenv.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index b31275f518..1fbec854c1 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -135,7 +135,7 @@ class TestEnv(ContextManager['TestEnv']):
>          if not os.path.exists(self.qemu_prog):
>              pattern = root('qemu-system-*')
>              try:
> -                progs = glob.iglob(pattern)
> +                progs = sorted(glob.iglob(pattern))
>                  self.qemu_prog = next(p for p in progs if isxfile(p))
>              except StopIteration:
>                  sys.exit("Not found any Qemu executable binary by pattern "
> 


