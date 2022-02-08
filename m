Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC354ADFB0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:32:51 +0100 (CET)
Received: from localhost ([::1]:39210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUME-0006nC-T9
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:32:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHTCv-0004VI-L4
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:19:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHTCs-0001d0-FB
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644337145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZSVuTPb1OOGpHr5VCs4GXod5a+LZjjF+AjORikACCo=;
 b=dosKDsuLlVx6/ZAqfQtQhqr4EXIi8h+Kg/2FTm5EnBLbiz0S1oYrdXitgjMQ6fFuZbqmaV
 yTaEljMi4Ls69ukK4OOqqZ1KoBtTGAJl3Ydol56x4+p9Ml0SL0A+k00gUftwryPPOqjAXi
 bwgw+ABD5GwjJ7tNDLuTpMxji9UD39M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-FnYjKc_NM36ngmi9TNqqGg-1; Tue, 08 Feb 2022 11:19:04 -0500
X-MC-Unique: FnYjKc_NM36ngmi9TNqqGg-1
Received: by mail-ej1-f70.google.com with SMTP id
 k16-20020a17090632d000b006ae1cdb0f07so5959821ejk.16
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 08:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iZSVuTPb1OOGpHr5VCs4GXod5a+LZjjF+AjORikACCo=;
 b=1WR9mAPK5Omht5nBjK9c/u43n3frAY7Rgxj60OhTQmseamlUaLYS7LF0/VW5rHi3ZD
 +lsmTMtKfB0zfTyjlzWK4hnxO3mgWWmeVy9pEjbNLYbjwghYi8szh3B9CxsDYh+MGdle
 HO2Dvp7fTrn6qlHE1eqOa/IfYmaOnvCArssG436Ts+bHMPg7sTExRjocFLqE7C5D02Tk
 IofR65b03GAZMegnkJUvJMOBEdCSgFslW0I4yHrJG+vZkXufkPszYp3lN+5QJag6zxPf
 /sRnx5usLa/PTMQFXGCiUopScWWDhnhn2+EmcLkKROW4bE4uZiaA16A1HmRcN82VJTEZ
 83WA==
X-Gm-Message-State: AOAM532jNJECVWH3f2N9Z0VVt2tNwemmxC/1wjmUGaead3GwYv/er7Fc
 aInqMd9yVNKoUjiRRt7UchsFOZz1/rUcXvCx9D0kFAEideQduN2OO9zo0/z5ZoIcWSkZxluhH4w
 GMdVm9uak8vHr8lw=
X-Received: by 2002:a05:6402:2549:: with SMTP id
 l9mr5267825edb.129.1644337142679; 
 Tue, 08 Feb 2022 08:19:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7C/vsMmvRebg8az6WKgrbPWi+CTaXA7sTmPIK/cniJHA7JbAgKX5ZaSUgtEnTSv3qkroIZQ==
X-Received: by 2002:a05:6402:2549:: with SMTP id
 l9mr5267807edb.129.1644337142501; 
 Tue, 08 Feb 2022 08:19:02 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id u6sm3043434eje.101.2022.02.08.08.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 08:19:01 -0800 (PST)
Message-ID: <a0e34d98-38e5-a7a9-2370-1d59ae12a88d@redhat.com>
Date: Tue, 8 Feb 2022 17:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/6] tests/qemu-iotests/meson.build: Call the 'check'
 script directly
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-5-thuth@redhat.com>
 <8718490e-97be-cf09-3e19-36fb46d84a50@redhat.com>
 <bc83a39f-5efd-2bf6-214c-281b179c959b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <bc83a39f-5efd-2bf6-214c-281b179c959b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/22 16:10, Thomas Huth wrote:
> Before we go down that road, I think it would be better to get rid of
> the "auto" group and add the list of the iotests that should get run
> during "make check" to the meson.build file directly. That's easier to
> understand and less confusing.

There are other groups than "auto", though.  It's a bit contrarian to 
the aim that changing one aspect of the build should only touch a single 
place (see commit 32fcc6244c, "contrib/vhost-user-input: convert to 
meson", for a reminder of what it was like to add an executable with 
Makefiles!).

> diff --git a/tests/qemu-iotests/testrunner.py 
> b/tests/qemu-iotests/testrunner.py
> index 0eace147b8..d45a2688a0 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -404,7 +404,7 @@ def run_tests(self, tests: List[str], jobs: int = 1) 
> -> bool:
>               if res.status == 'fail':
>                   failed.append(name)
>                   if res.diff:
> -                    print('\n'.join(res.diff))
> +                    print('\n'.join(res.diff), file=sys.stderr)
>               elif res.status == 'not run':
>                   notrun.append(name)
>               elif res.status == 'pass':

Interesting.  But it should be done only if self.tap is true.

Paolo


