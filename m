Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442636B4DF8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:07:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagBq-0005Pp-IR; Fri, 10 Mar 2023 12:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pagBa-0005Iw-Ft
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pagBX-00076y-31
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678467938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIUZBU09rN9ZzXnmgJ73dEGncNQsiWNuz/wpuxTA7wI=;
 b=bJeMVFvHST5NglqCtqMWP1ysTbqIHKiUhx11aoM0riGbylLCfFc7XJd9HZNhqIsNi17xkP
 fOmZjhNZetNftAKy1w3LVUD70yM4ONvLrUuDjn+XLJ0mBQIu71D7s9/nOZkgh+WhIh6t42
 VJO7Jjj87s2G8rlEQNHcOuBc3fTBQn0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-P9fR92wcOAm_XpnMPP9zDQ-1; Fri, 10 Mar 2023 12:05:36 -0500
X-MC-Unique: P9fR92wcOAm_XpnMPP9zDQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so2214763wms.8
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 09:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678467935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EIUZBU09rN9ZzXnmgJ73dEGncNQsiWNuz/wpuxTA7wI=;
 b=idHe7MT8FQzVnMsphMt6mISn5tHaMIR6UyGENhWJcOdqHyltLblmoD4a1u+jTb2O4K
 hg1VhPjdJJAoI3utY4aolbVULhhzozquzpVOPdpBAbi5+IB+b/hEiFlQ4f8JNmBV6khW
 FLLw/wKHCWNFSwTEPy+4gETra7K/q1YrvSZYHmv2J2rGIDMywwXqiHs1AwXiDS3z2qQA
 yIVtWuh7il0UKkU+eqCrQ2bmzqJMYEF1dSwBWn24waHGm3Jp6bITKkJ2+/rLk/3ZHEa9
 9p8CSlHwAu1B86NhYhz7Lpzsg/FP90kqU2MuxPDkpg2NO1YkLQa1BdpMCRSAsr+PalMh
 k0FA==
X-Gm-Message-State: AO0yUKXt9O+a19sx2hRGot5hjLyS+GbCEKZl/HyUv1U5nW3hSUT7eV/n
 32MLuFHEzVc0u5ZCMOVVtP5aolvH1bBOp45Bm6ozqQU5v0NzVLCJFhWs3R3HcKUef5ShOQ1LqcA
 M4pB55wkxND3I7L0=
X-Received: by 2002:adf:dc50:0:b0:2c3:db98:3e87 with SMTP id
 m16-20020adfdc50000000b002c3db983e87mr16251297wrj.20.1678467935372; 
 Fri, 10 Mar 2023 09:05:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8BkyXEP6LeAi9FjNtTPksPHcHqkB1disl3IL4zzHfxtwPZ1x1DxBlTQ7yTIas4KKBFBd5VOA==
X-Received: by 2002:adf:dc50:0:b0:2c3:db98:3e87 with SMTP id
 m16-20020adfdc50000000b002c3db983e87mr16251277wrj.20.1678467935114; 
 Fri, 10 Mar 2023 09:05:35 -0800 (PST)
Received: from ?IPV6:2003:cf:d729:7d22:58d:9cdf:192f:c786?
 (p200300cfd7297d22058d9cdf192fc786.dip0.t-ipconnect.de.
 [2003:cf:d729:7d22:58d:9cdf:192f:c786])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a5d4c91000000b002c5a1bd5280sm247365wrs.95.2023.03.10.09.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 09:05:34 -0800 (PST)
Message-ID: <3c6eec39-fa85-f0fc-f8c0-ec71411dd23a@redhat.com>
Date: Fri, 10 Mar 2023 18:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/8] iotests: make meson aware of individual I/O tests
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230303160727.3977246-1-berrange@redhat.com>
 <ZAtYKpR+OWgz5Rmj@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <ZAtYKpR+OWgz5Rmj@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

On 10.03.23 17:17, Daniel P. Berrangé wrote:
> Kevin / Hanna.....  do you have any comments you want to
> make on this, since it is notionally under the maintainership
> of the block team ? If not Alex has volunteered to queue this
> via his testing tree.

Looks good to me!

So, if it helps:

Acked-by: Hanna Czenczek <hreitz@redhat.com>


