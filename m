Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB443E6B8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:59:38 +0200 (CEST)
Received: from localhost ([::1]:45584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8kb-0005wu-Sq
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8id-0003wq-0Y
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:57:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8ib-0007K3-4B
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635440252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DhcdOmzpT2ny6HbIO8wAH/iZPmmYyp8Sq2oelgyipu4=;
 b=a3MC/+PCSNSIW8lPOyUlHl629hCjxuo1JxZZh5uHYq+jpiVYZzwMaOMDUwpYtmn0AeIece
 01FU414m5Sk+PtzwXnb6jxg5L09zjmhdmh9/+8l3PwYiB3BapbF0tDUV7OG+tYa6k9XKCx
 ZUxWMM+AtGyUe2FHdswS/BQd1eGHlgw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-uR1unUApMr2jkHezo0klKA-1; Thu, 28 Oct 2021 12:57:31 -0400
X-MC-Unique: uR1unUApMr2jkHezo0klKA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so2339584wrb.14
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DhcdOmzpT2ny6HbIO8wAH/iZPmmYyp8Sq2oelgyipu4=;
 b=zTe5TU6TKFohH1/GGEEiGH+xMyG7rTIGMWSRX8TOQ6OZHp8scjRbAgF+LxLb6vm+DH
 dxt9Myrp0BMC5OX+XJJZ5DTImZD/4RqTevHzEQfeBl/XeinadMx+ALjI99h5VnfKTkUG
 WEaI5Dli7QQWN26Q3Yd+wdwNIGD/6FEvdK+ewhIIV4AuCZJ3jCTg/Mk2A3vq8YVLNWJi
 j03pYCXV3AQZAj5JSoAzifhuHxdkSH3A/0eq+Jc/p/0f+sI7CDD01Z9ur/4/QzBoRazA
 IvzpFvvtv7cgqTAbVc9bB9qnL1CRVJWHpiNLQLvIOlTWrl6Y15iDQ8SB/9LTQhVYz39Y
 HfUg==
X-Gm-Message-State: AOAM530r+bUJwkdi+41OqzWSVsCMXSTCF1wHQUEop/yaf5uB5uy9wa01
 5P0zuy+VOlw+7a9X2T9kHRLof8/dA5qqx9mPBfYvPFQllm+ZtdUH2z6eIi1UNsd1tScME8VmUMS
 qE/q58DWXXN+IwN0=
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr7180329wrs.110.1635440250053; 
 Thu, 28 Oct 2021 09:57:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGsAFwqkAVoTcLGdpdII7mQAFGqeTsHqEDG1X4dZNR4NGvkWHwIBNOFOP+z9g3Q5hKAv2eTw==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr7180306wrs.110.1635440249869; 
 Thu, 28 Oct 2021 09:57:29 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 3sm3448160wms.5.2021.10.28.09.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:57:29 -0700 (PDT)
Message-ID: <c41a502a-0738-a332-ab90-18a3d2e00a1c@redhat.com>
Date: Thu, 28 Oct 2021 18:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 13/22] qapi: introduce x-query-usb QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-14-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-14-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info usb" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hmp-commands-info.hx       |  2 +-
>  hw/usb/bus.c               | 24 +++++++++++++++---------
>  qapi/machine.json          | 12 ++++++++++++
>  stubs/usb-dev-stub.c       |  8 ++++++++
>  tests/qtest/qmp-cmd-test.c |  2 ++
>  5 files changed, 38 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -49,6 +49,8 @@ static int query_error_class(const char *cmd)
>  #ifndef CONFIG_PROFILER
>          { "x-query-profile", ERROR_CLASS_GENERIC_ERROR },
>  #endif
> +        /* Only valid with a USB bus added */
> +        { "x-query-usb", ERROR_CLASS_GENERIC_ERROR },
>          { NULL, -1 }
>      };
>      int i;
> 


