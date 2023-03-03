Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D056A9C6A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:54:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8fG-0001cp-No; Fri, 03 Mar 2023 11:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8fE-0001cD-4c
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8fC-0003eK-OP
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677862425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0U2HhcaJbgi/hb0X1stDyG1E3gnbsQpP/lCNtte5B+U=;
 b=cpqenMSQ5mvU3qDytGJftA+OzTNXc05pDSyxH39+XsVysi1Q7ScYdjlUD8mPs78DY805l+
 ZOE74C8KfgoO1AUBwKL4Jd/2nrsDMXFDWsUo/W7Z6Ufy/Cd/fu0tp5LY1W5schieFyuKkT
 gllbeUSlJcqYmTDDfCONqGzYyZN8zBU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-KzwM8HDMNwi2xkHPsn94cQ-1; Fri, 03 Mar 2023 11:53:44 -0500
X-MC-Unique: KzwM8HDMNwi2xkHPsn94cQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so1170797wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0U2HhcaJbgi/hb0X1stDyG1E3gnbsQpP/lCNtte5B+U=;
 b=wFChH+44jLfP3LL0q0liV30BYeUrekOKbCQw5v8wMYrWBvIACcNh8JEGo5Q80mBjkZ
 y+nC5BTFUhJQr4rQyHNKKCIcMzRzyWg4V5BetELtqXzik1eZKV7aFE99xU9wZ6nnrKkC
 Gq3gQXNre2GdSretVnkYmpUwEO33mJ2Mz4g7eZvjjdSjE/1q0Ig+XClnQIJvpz3TdWvM
 GNtbG6PwDZ6hpvgwvZpEO6sHlREl+sBVN5oHmtkXXVCRMGCOTT7bI1nNuVAxIsMgGmp/
 2JHOF7RvHro0uS3cJPgLMb/qVeaC7XcNQIMFPx1SkIo8HLHWILgrGaLytKMnHXzwR7MR
 byuQ==
X-Gm-Message-State: AO0yUKU5ti5KrOs1YiUtiuBnBzotSbCvOewT0f4HwARtL+dr20387Vtj
 HRMRseehkncS9nvdF7H+IxVWklmuPjwZvpaDkUP8OaTV7rknJE/R1+YjyEoKSjEmIX4Ppso71qY
 gmyTIICZ38bEJ/zo=
X-Received: by 2002:a05:600c:470b:b0:3eb:29fe:fe19 with SMTP id
 v11-20020a05600c470b00b003eb29fefe19mr2242152wmo.34.1677862423573; 
 Fri, 03 Mar 2023 08:53:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+juvO2msGo7InCI6CJOKUQCIapHs2Dm7+HmQPt4SFV3Dz6Ql9p+P4RdDP7RSGFfBIoEQctHw==
X-Received: by 2002:a05:600c:470b:b0:3eb:29fe:fe19 with SMTP id
 v11-20020a05600c470b00b003eb29fefe19mr2242131wmo.34.1677862423285; 
 Fri, 03 Mar 2023 08:53:43 -0800 (PST)
Received: from [192.168.8.103] (tmo-099-97.customers.d1-online.com.
 [80.187.99.97]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003eb192787bfsm2823199wme.25.2023.03.03.08.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 08:53:42 -0800 (PST)
Message-ID: <ece04520-31eb-06b2-d208-caba3e05963d@redhat.com>
Date: Fri, 3 Mar 2023 17:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/8] iotests: explicitly pass source/build dir to
 'check' command
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230303160727.3977246-1-berrange@redhat.com>
 <20230303160727.3977246-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230303160727.3977246-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/03/2023 17.07, Daniel P. Berrangé wrote:
> The 'check' script has some rather dubious logic whereby it assumes
> that if invoked as a symlink, then it is running from a separate
> source tree and build tree, otherwise it assumes the current working
> directory is a combined source and build tree.
> 
> This doesn't work if you want to invoke the 'check' script using
> its full source tree path while still using a split source and build
> tree layout. This would be a typical situation with meson if you ask
> it to find the 'check' script path using files('check').
> 
> Rather than trying to make the logic more magical, add support for
> explicitly passing the dirs using --source-dir and --build-dir. If
> either is omitted the current logic is maintained.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/check      | 25 +++++++++++++++++++++++--
>   tests/qemu-iotests/testenv.py | 13 ++++---------
>   2 files changed, 27 insertions(+), 11 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



