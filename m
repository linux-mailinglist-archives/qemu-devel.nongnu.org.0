Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130C3BC8DD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:57:41 +0200 (CEST)
Received: from localhost ([::1]:42678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hpk-0003OZ-29
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0hoA-0001oo-UU
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0ho6-00078M-Ki
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VL7sOlTaleWx9kDUQWI+9cTng1e8c7L8JxDVUCCyAEg=;
 b=edIF8DN2SY2V4AgQhDhfPYrPt/SD1CyBs7pMe8tvbZdyIBxRDpxvM3PY0SWMzTOWB5Joyh
 CDoMid9gDXSQeczB5ZYvUKfPoXe5ZrYJbyFiMMMt5JGHIniNNN/97Z1o8EIer678yhGEaZ
 qSs86Xg6wFXSWQhjkQoq3cjfildwgp8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-ibE2nuOlMgSoHeeq3zJjSg-1; Tue, 06 Jul 2021 05:55:55 -0400
X-MC-Unique: ibE2nuOlMgSoHeeq3zJjSg-1
Received: by mail-wm1-f69.google.com with SMTP id
 i3-20020a05600c3543b02902075ed92710so921261wmq.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 02:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VL7sOlTaleWx9kDUQWI+9cTng1e8c7L8JxDVUCCyAEg=;
 b=jlHT9ofJcRxt1q8KAOLUzeRHsbN2MnOysHVLyS8UbprQNNERrZ2p1Z93meRrvyz5Qk
 AARDhTHh9AqMQb4XZ4vOHd26CLyolhC2Srh9lM4dePt9Xn2n+qx2O2iM3b0gEtQwjVhe
 8eDvU0Y65qh4xsXX9U4ise1mBnvvco8u3sELl1utAAON7VVRFEXuam1wHTyruhXcKxCp
 BKDgdAQbI+YBJLKi7gGutalcxQw/gpmRv0GfxhjWU7IUH87jRwkHkxr5K8tA+kOXynp2
 lRegUGXCvy4OMGy2cclc0wtdaYsmE/tCHV2kL+n3umCbt9rCvFh32Q+ztsPhAXADRsm0
 EFPw==
X-Gm-Message-State: AOAM532lEqk2qMm7axXlNi9fkUbx7IsQeBQ4PjgQlFYxCmzMPjQRW7aZ
 Khs86gCOGkNBrBAt0okVQViU63rkNMQTVZdqT4s49+euBUJ02VRJvU0ZSyMnT2Ce8jFuthdri60
 aUvhXr3PgttvTUV4=
X-Received: by 2002:a05:600c:358e:: with SMTP id
 p14mr19296895wmq.136.1625565354250; 
 Tue, 06 Jul 2021 02:55:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWCjvZdupiZbkHaaHMqlQbigV0pi33B/RNRmQx88HDabaO0wp6m3Agv7b2T5FpJ6L0BRyuQA==
X-Received: by 2002:a05:600c:358e:: with SMTP id
 p14mr19296861wmq.136.1625565353987; 
 Tue, 06 Jul 2021 02:55:53 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z7sm2262483wmi.1.2021.07.06.02.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 02:55:53 -0700 (PDT)
Subject: Re: [PATCH] misc: Remove redundant new line in perror()
To: Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <20210706094433.1766952-1-lizhijian@cn.fujitsu.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <adc664b6-f4c8-1804-357a-f3f0b94e8e24@redhat.com>
Date: Tue, 6 Jul 2021 11:55:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706094433.1766952-1-lizhijian@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com,
 richard.henderson@linaro.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 7/6/21 11:44 AM, Li Zhijian wrote:
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>  migration/rdma.c | 2 +-
>  softmmu/cpus.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 7fb9646f6ef..e99e2e16a73 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1133,7 +1133,7 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
>                      IBV_ACCESS_REMOTE_WRITE
>                      );
>          if (!local->block[i].mr) {
> -            perror("Failed to register local dest ram block!\n");
> +            perror("Failed to register local dest ram block!");
>              break;
>          }
>          rdma->total_registrations++;
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index c3caaeb26ec..071085f840b 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -325,7 +325,7 @@ static void sigbus_reraise(void)
>          sigaddset(&set, SIGBUS);
>          pthread_sigmask(SIG_UNBLOCK, &set, NULL);
>      }
> -    perror("Failed to re-raise SIGBUS!\n");
> +    perror("Failed to re-raise SIGBUS!");
>      abort();
>  }

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


