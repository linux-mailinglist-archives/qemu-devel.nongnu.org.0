Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1BE6D03B3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:45:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqhE-0004y7-0j; Thu, 30 Mar 2023 07:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqh3-0004xZ-Nr
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:43:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqh1-0002NF-Qd
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680176626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qcpUhw1FJ4YDv6mKM0XdJLQ5cue6gwouLW6paE1LB8o=;
 b=STDZWIGZspNA7zF7hUtG8Q2d1Oa8pW1XHqQvCq7XrFDaixE9HWk2eDgv0JIrUFepxwXUIy
 A8RTZIut5RfcLZ3xNJB1SQd62SGfGA0FEW9IqM7KBWt8AREJioNH9CT+6W53scpyb3Xtmr
 owWyfKYiQvcjw3DDra+e+Psfqw7lRsU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-_tI7u1EpPQiRzMinv9920g-1; Thu, 30 Mar 2023 07:43:45 -0400
X-MC-Unique: _tI7u1EpPQiRzMinv9920g-1
Received: by mail-qv1-f72.google.com with SMTP id
 p14-20020a0cc3ce000000b005e14204a86bso4935qvi.10
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680176625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qcpUhw1FJ4YDv6mKM0XdJLQ5cue6gwouLW6paE1LB8o=;
 b=fky/AbnngCufSKMyphaXr8viBPpVB/QHkbLwSlawwfW9vendUmwhOGrbuRBuuX2ZM/
 711x3iZbUN+FbrVXPed1ipF7D36uoF/1hk75iobYPq+PpN+lgyyD1TRetSXIKZnodx1i
 ufdmjkoliCx4jFY1tcJaeSxCa8U5yxZqyZzT2HFVDYhefg1gbkXQsWrcf7c1xcMqqEdq
 pTVz+llI5lXVDyklqKpOPbBlRzKxdMY45MMnD1WV1cF1ftBAiXACQyJC2T7wrmXPNheC
 Ok2eA2FjUvokx9Y3syZyvFOm/tNAvHMeFHmT2HI/nVDgX/gb2QdYY7rAp6EllsfIs002
 wYwA==
X-Gm-Message-State: AAQBX9eqZfY0v369ieTfEJU9RZIg872nLktsGxF9HMNltth0BzcN96CY
 5dLHS1NzQQyvq7On9UYYnR+lS3yPw3dKGR8erCgDuNZCAYnu6o3gHrrpw7qj+dgflpV7Au5P0I0
 jJzfuvG0tj4VJekM=
X-Received: by 2002:a05:6214:29e7:b0:5b1:a698:43c6 with SMTP id
 jv7-20020a05621429e700b005b1a69843c6mr34959070qvb.18.1680176625009; 
 Thu, 30 Mar 2023 04:43:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zscz9VE2XLKbFL7xa2UlOiYxiE5NBGYMGVlXH5wP2i/FiOLobO+kZKMaMDHW3oooQLnUFkFw==
X-Received: by 2002:a05:6214:29e7:b0:5b1:a698:43c6 with SMTP id
 jv7-20020a05621429e700b005b1a69843c6mr34959041qvb.18.1680176624767; 
 Thu, 30 Mar 2023 04:43:44 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a0ccdce000000b005dd8b9345e5sm5372610qvn.125.2023.03.30.04.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:43:44 -0700 (PDT)
Message-ID: <b23ab886-e9f5-bb94-c98d-ccdd45cdeff1@redhat.com>
Date: Thu, 30 Mar 2023 13:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/11] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Cc: Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230330101141.30199-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 30/03/2023 12.11, Alex Bennée wrote:
> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> 
> Avocado version 101.0 has a fix to re-compute the checksum
> of an asset file if the algorithm used in the *-CHECKSUM
> file isn't the same as the one being passed to it by the
> avocado user (i.e. the avocado_qemu python module).
> In the earlier avocado versions this fix wasn't there due
> to which if the checksum wouldn't match the earlier
> checksum (calculated by a different algorithm), the avocado
> code would start downloading a fresh image from the internet
> URL thus making the test-cases take longer to execute.
> 
> Bump up the avocado-framework version to 101.0.
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
> ---
>   tests/requirements.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 0ba561b6bd..a6f73da681 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -2,5 +2,5 @@
>   # in the tests/venv Python virtual environment. For more info,
>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>   # Note that qemu.git/python/ is always implicitly installed.
> -avocado-framework==88.1
> +avocado-framework==101.0
>   pycdlib==1.11.0

Did you check whether the same amount of avocado tests still works as 
before? ... last time I tried to bump the version, a lot of things were 
failing, and I think Cleber was recently working  on fixing things, but I 
haven't heart anything back from him yet that it would be OK to bump to a 
newer version now ...
So upgrading to a new version of Avocado during the softfreeze sounds 
somewhat risky to me right now - I'd appreciate if we could do that after 
the release instead.

  Thomas


