Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491016A9244
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0bf-00064R-Fb; Fri, 03 Mar 2023 03:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY0bZ-0005wL-OC
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:17:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY0bW-0006iU-W3
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677831445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CTAaJCMNYd3rn1Fzt/tbSfazvlc6V7hLM7sGRXGqqts=;
 b=jFQkxYOwnVVN85MdESN9iK7/LF/lSDWAko9DSTdkvGjIcvlcVW9928LTyhD54Hs39kyQxe
 I4JoWjsDuj24WqgQQpk8kPDS83Q0NOYKQvNaB7j0xvumpd+Z/SlpUFObQzojCAyPJcI9zs
 h20JeEE3offOu0Ns1rwbgWct6/AC408=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-512-pIopXJBlP-2EiGRNURuGGg-1; Fri, 03 Mar 2023 03:17:23 -0500
X-MC-Unique: pIopXJBlP-2EiGRNURuGGg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so2488572wml.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CTAaJCMNYd3rn1Fzt/tbSfazvlc6V7hLM7sGRXGqqts=;
 b=L3rBTEJaYQtVxyrY2cni0x2+i0kPLjDNkHLLhzUCfI9yLBIc/pRmB41uPyXTtQpYEI
 PpWmAqGP+pgj4ZmcMxIf/QuziLpMyvKqA8QKv4U1hfZIYmR5ZkbEWNaGbYJBxOzo0Buk
 DCpI9Iuz7lUmCQI7igtPmbtUwA9Rk1hgmI+eOh5CHC4LekqoHXxFoITnM1m1u9DiMSbW
 wmX6RN6sqLRXJY4uV0uDLhvgEkDfMzKGoxBIwfmv5ag3AUWu3xbYEhCluwr0w+SJEpH8
 O8lhypGWJhQhwp8nvW4aYy4Y4ZeHV8IScJWKDpNouzNzYJ3u/X6MwD6UVvoofjuZOHtJ
 Q1mA==
X-Gm-Message-State: AO0yUKWOAdzepqYMM9ysklbjui5GPMNRvtHsaEP1roJgxs4ti9SheP3t
 cVFLgs3RaiOtVdXE7RWMHty/y1sxowY6C1RSJvzi+JHemNlJVutesjNU/zZekaSJi40F2wQDMtI
 UXVhGnacDxqBjE7g=
X-Received: by 2002:a05:600c:444c:b0:3eb:39e2:915b with SMTP id
 v12-20020a05600c444c00b003eb39e2915bmr732613wmn.31.1677831442625; 
 Fri, 03 Mar 2023 00:17:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+ta+AECneQqkcGZLlmKrmS20EseO6N76Qp1Na+ZbpDgCPApdpAFREhcS5rmLg84r1miG69Jw==
X-Received: by 2002:a05:600c:444c:b0:3eb:39e2:915b with SMTP id
 v12-20020a05600c444c00b003eb39e2915bmr732593wmn.31.1677831442332; 
 Fri, 03 Mar 2023 00:17:22 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c12cc00b003de2fc8214esm1665290wmd.20.2023.03.03.00.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 00:17:21 -0800 (PST)
Message-ID: <be0c7d6f-c464-385c-afa1-eefd5d522f17@redhat.com>
Date: Fri, 3 Mar 2023 09:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/5] iotests: print TAP protocol version when reporting
 tests
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
 <20230302184606.418541-5-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230302184606.418541-5-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 19.46, Daniel P. Berrangé wrote:
> Recently meson started complaining that TAP test reports don't include
> the TAP protocol version. While this warning is bogus and has since been
> removed from Meson, it looks like good practice to include this header
> going forward. The GLib library test harness has started unconditionally
> printing the version, so this brings the I/O tests into line.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/testrunner.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index 5a771da86e..e734800b3d 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -391,6 +391,7 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
>           casenotrun = []
>   
>           if self.tap:
> +            print('TAP version 13')
>               self.env.print_env('# ')
>               print('1..%d' % len(tests))
>           else:

Reviewed-by: Thomas Huth <thuth@redhat.com>


