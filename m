Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD4F600895
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:17:09 +0200 (CEST)
Received: from localhost ([::1]:42474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLJ6-0006MV-71
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1okLDY-00023s-QY
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 04:11:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1okLDV-00084r-13
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 04:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665994280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qDsiZLK6GYBuUZw5NGMuTWajVUjnGftqmcBwrt1X9U=;
 b=R+BUZiA+1/Sc6s3HU4tx6efYqBHETHz7oxHEht69bdzAS7zloMHPrBiduzpytvP5qcz45D
 WZTiOybNdEfTMVLDWgerKFYTmadRhqKu3VI/605+gXr5mrlKXqTG4ouT3+g0UiJxwjHOyQ
 c8ViuFxYx73U80oP/vD2Tm1wzeiHuwA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-PwpCdgdsMvCp6e79PMVNmw-1; Mon, 17 Oct 2022 04:11:18 -0400
X-MC-Unique: PwpCdgdsMvCp6e79PMVNmw-1
Received: by mail-qk1-f199.google.com with SMTP id
 bj1-20020a05620a190100b006eececec791so6815972qkb.15
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 01:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0qDsiZLK6GYBuUZw5NGMuTWajVUjnGftqmcBwrt1X9U=;
 b=8BHTcYCIZydFx8civv7fM73NfZzuTleyIbY90heFbk2paK98lJHk3YzjyVa2xO2zP8
 tBEkQLY19MjXcXqevjywNC7C4c25Jact1iODdpE/2q8aimT0eVNl2jKHdE1VIpBOk5Rb
 87fLPcXfddc+DawPAa0fuDVWy2vvABuV5Zk/oPD7DmTFR0PRlnQqLh1mI2RDFTHGRj9k
 6Bh23/i8BqgCXwMj/hrpOPOj2jR7JlpIHf1PV8Zpw0INRONARh/Rko8zWjJmOPdOkp9Z
 jlpPrngIyJBb06AK3sUgzSv4uPODhapJ83axvcVbOZnmVSg9neK6ttQ3G34s3Aazs2fF
 fUFA==
X-Gm-Message-State: ACrzQf3IdbeRDPfiv2CzjyU3C1pyvsl2asRXfLe/xvFpH6Xc0GiMsTt9
 MUvGLbU6mnzUXSmAPkaE6vMWf+JkTdv+cdZAWz0aTx0bI23MlC0uLdcPwsDLD5OT6NQYoYqLS9z
 OgxzYzFu1bwwE1Iw=
X-Received: by 2002:ac8:5b53:0:b0:396:9a39:a57f with SMTP id
 n19-20020ac85b53000000b003969a39a57fmr7549814qtw.123.1665994278516; 
 Mon, 17 Oct 2022 01:11:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69qwH3XorrCy7Jfh2URybbOF8kKh0dQ8aX3M69CCfH8w/hELBu95zGMU+KqweT1naqdy0Ndg==
X-Received: by 2002:ac8:5b53:0:b0:396:9a39:a57f with SMTP id
 n19-20020ac85b53000000b003969a39a57fmr7549805qtw.123.1665994278319; 
 Mon, 17 Oct 2022 01:11:18 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-160.web.vodafone.de.
 [109.43.178.160]) by smtp.gmail.com with ESMTPSA id
 cq10-20020a05622a424a00b00398946670f3sm7375443qtb.1.2022.10.17.01.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 01:11:17 -0700 (PDT)
Message-ID: <d5226e0e-440d-5069-54e3-b9522c9cb27a@redhat.com>
Date: Mon, 17 Oct 2022 10:11:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] s390x/pv: remove semicolon from macro definition
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, david@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, pasic@linux.ibm.com, cohuck@redhat.com
References: <20221010151041.89071-1-imbrenda@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221010151041.89071-1-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/10/2022 17.10, Claudio Imbrenda wrote:
> Remove spurious semicolon at the end of the macro s390_pv_cmd
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>   hw/s390x/pv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 401b63d6cb..9bcd5d829f 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -45,7 +45,7 @@ static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *data)
>    * This macro lets us pass the command as a string to the function so
>    * we can print it on an error.
>    */
> -#define s390_pv_cmd(cmd, data) __s390_pv_cmd(cmd, #cmd, data);
> +#define s390_pv_cmd(cmd, data) __s390_pv_cmd(cmd, #cmd, data)
>   #define s390_pv_cmd_exit(cmd, data)    \
>   {                                      \
>       int rc;                            \

Thanks, queued to my s390x-next branch:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


