Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CBD6A9BD8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:38:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8PD-0002T7-Ro; Fri, 03 Mar 2023 11:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8PA-0002QE-Lr
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8P8-0007U9-Uo
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677861430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4AS8phio193RPsFUi8pScqTWb6IVm5LQ7uczICHrBA=;
 b=U2a/89aB8Vish3CpMMAJYmIS8W4Zdt/Ol3rsAsgI+jj62ofTMDLA7pCRWzJ+szpNR91QPn
 TkUi6NHQG5G+/jom3g8VJ//+t+U3M/OlLdh8b85MR4BccY/jh0vYgshOR69qdkCPdpRugK
 VZpp5nvMQXf2Y+eS3i6xeezcV4yoewo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-LF4qL-4QMiy8UL5Zinu4wA-1; Fri, 03 Mar 2023 11:37:08 -0500
X-MC-Unique: LF4qL-4QMiy8UL5Zinu4wA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so1153414wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T4AS8phio193RPsFUi8pScqTWb6IVm5LQ7uczICHrBA=;
 b=2bO03bCNfjNplIhtQ4WUn0zk6aJyLfi+gj0omPkYMUdFTZIVAR5+COJQ09r2x1UvFS
 vydHdxIGkp+c6iONrZyqoRF8F7anMPTf3o6fQ1TuGUoYJLHVTefN6MOP7iE5fnSGc0Vm
 q3U3I2GRsJ25aAQ7wnm5sBcNYdSWG+ELM+3aVAaY4P4pGvFcJhpuUNPa+O1Rh5Jsjatz
 hN+fISIukW7wlvyTdjCZEzhfGo/+xrpT/hZO6oqgLMKomrdFZ30qGPt7EiwUPnI3b2+E
 zR7X7naxA1+XopJEczp0Dclm0qz/Yevbpo8chsL7bdpzUPlv28X5RdVhtnpqFM6GS/vs
 z1dQ==
X-Gm-Message-State: AO0yUKVkPcJSiGpf+6v5Ne7g5jFg6UR6HcOiH/K4hgVU+e4UpSv2Da5T
 MOqMG4KscXGHYJh/YyBJr/j6/+0i4U72yh0JkG2CqZDEuW5JxPjbjZHniOoHJEA2mhkj+9NGYou
 Up4EPyFmz3j5S16U=
X-Received: by 2002:a05:6000:11cb:b0:2c9:bb03:7843 with SMTP id
 i11-20020a05600011cb00b002c9bb037843mr1821950wrx.69.1677861427875; 
 Fri, 03 Mar 2023 08:37:07 -0800 (PST)
X-Google-Smtp-Source: AK7set//hWSj85k0uXl6jGLYpOtpZlmpwOKQte2S+bH2NFKtaRC3+CMX0bPCTgtadH6+I220Yv61cQ==
X-Received: by 2002:a05:6000:11cb:b0:2c9:bb03:7843 with SMTP id
 i11-20020a05600011cb00b002c9bb037843mr1821941wrx.69.1677861427623; 
 Fri, 03 Mar 2023 08:37:07 -0800 (PST)
Received: from [192.168.8.103] (tmo-099-97.customers.d1-online.com.
 [80.187.99.97]) by smtp.gmail.com with ESMTPSA id
 m5-20020a5d56c5000000b002be505ab59asm2593056wrw.97.2023.03.03.08.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 08:37:07 -0800 (PST)
Message-ID: <5e428a2a-a3ae-c07a-8d14-7f7df124cfb7@redhat.com>
Date: Fri, 3 Mar 2023 17:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 5/8] iotests: connect stdin to /dev/null when running
 tests
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230303160727.3977246-1-berrange@redhat.com>
 <20230303160727.3977246-6-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230303160727.3977246-6-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/03/2023 17.07, Daniel P. Berrangé wrote:
> Currently the tests have their stdin inherited from the test harness,
> meaning they are connected to a TTY. The QEMU processes spawned by
> certain tests, however, modify TTY settings and if the test exits
> abnormally the settings might not be restored.
> 
> The python test harness thus has some logic which will capture the
> initial TTY settings and restore them once all tests are finished.
> 
> This does not, however, take into account the possibility of many
> copies of the 'check' program running in parallel. With parallel
> execution, a later invokation may save the TTY state that QEMU has

s/invokation/invocation/

> already modified, and thus restore bad state leaving the TTY
> non-functional.
> 
> None of the I/O tests shnould actually be interactive requiring

s/shnould/should/

> user input and so they should not require a TTY at all. To avoid
> this while TTY save/restore complexity we can connect the test
> stdin to /dev/null instead.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/testrunner.py | 22 ++--------------------
>   1 file changed, 2 insertions(+), 20 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


