Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D1A4823ED
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:15:06 +0100 (CET)
Received: from localhost ([::1]:37428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3GoK-00040L-H4
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:15:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3Ghk-0001CG-EC
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:08:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3Ghj-0002sf-1o
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640952494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hH5cDHKl4BmYx6GnW6WLbo5MG3cmj5rBeWwl0nWRc0=;
 b=i9hBiYElS87+DoSGiMdPD9wHOJjR1XuryOiQJRFSw/bvqC3WyKLAeYQmGBgMaPOWP5kdXu
 3tiqUw3zUZQfBpZZRfkNEY37v2o/OXxnUQtVrezU0ifFkKwZmQ9TugcM4C8+ufH//yvHK3
 oOtQv/x5aFMS6hLmLjapfZop0J8cV/Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-suobHJknP52gsuBsdaZeuQ-1; Fri, 31 Dec 2021 07:08:12 -0500
X-MC-Unique: suobHJknP52gsuBsdaZeuQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 g189-20020a1c20c6000000b00345bf554707so13430410wmg.4
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+hH5cDHKl4BmYx6GnW6WLbo5MG3cmj5rBeWwl0nWRc0=;
 b=dRQp9GtWM1XDaIvGFwSGNPie2kZ+j9+Sl/xRnZRqo9bktb5OWZIc9T7TOXRockGQzE
 W20kFjY0fcFh02SZchTjADyITGdRgj29Pct/YhmTV1tCesVFmZKUgYUf5KmzOYK/hrBV
 3YyxG51gYoYjAexn5TZKCrosDfTKnct/Fydq08L71DSknR83o/A83asobSA/MZQ1mh4A
 x3UIzOGFDwC4ln8TMfMdtpfvwT3bi1JY7PryLPZrivsJ9QNqTE0NCYiFlLeBmmcMbRS6
 uR5QVA3W8KA/8tJNpwZbW9MqGQ8gwzjoM4Vo8no9/fX/XAnKMIDreJayWQJUDmCLH49c
 crCQ==
X-Gm-Message-State: AOAM531dtsjIWbFIx5FCGtQGzz2s3l3nAxl34nitOeK2k+LRxyRfNeml
 zfOGsGewSRXuyot8mJhCkmLVoQ3fzDvmcUI9y4UIngjNfHIHemoHFE6zxjSH3SjGDMmPIapI/HU
 TlhnlvJmYP2j27AY=
X-Received: by 2002:a1c:4644:: with SMTP id t65mr29402283wma.116.1640952491672; 
 Fri, 31 Dec 2021 04:08:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyduJKwdh37+SyyIVLUHk3Bvah14+pUeztD5vAp2aBq0mY5lK6MQ1IpDGSjBhBIOn/52urm8Q==
X-Received: by 2002:a1c:4644:: with SMTP id t65mr29402272wma.116.1640952491538; 
 Fri, 31 Dec 2021 04:08:11 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id y11sm31423501wry.70.2021.12.31.04.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 04:08:11 -0800 (PST)
Message-ID: <87197e91-b152-43ae-267a-e2b895e30de1@redhat.com>
Date: Fri, 31 Dec 2021 13:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] MAINTAINERS: email address change
To: Li Zhijian <lizhijian@cn.fujitsu.com>, thuth@redhat.com,
 peter.maydell@linaro.org
References: <20211231050901.360-1-lizhijian@cn.fujitsu.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211231050901.360-1-lizhijian@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: chen.zhang@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/31/21 06:09, Li Zhijian wrote:
> Fujitsu's mail service has migrated to O365 months ago, the
> lizhijian@cn.fujitsu.com address will stop working on 2022-06-01,
> change it to my new email address lizhijian@fujitsu.com.
> 
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Since I'm preparing a pull request modifying MAINTAINERS,
I am queuing this patch.

Regards,

Phil.


