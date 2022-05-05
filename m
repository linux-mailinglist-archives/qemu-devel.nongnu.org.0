Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D88751C6AF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:04:31 +0200 (CEST)
Received: from localhost ([::1]:35368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfq2-0007m1-Gy
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmf8P-00074W-G8
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:19:25 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmf8N-0003Rd-OD
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:19:25 -0400
Received: by mail-ej1-x636.google.com with SMTP id i19so9980032eja.11
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z78bLrtcaASPzi8w1CnjMXbUtXV5m6K37RHzoP7DafM=;
 b=iykYk5+5hDiJRdFD5io93oHSpZUZ0la9QRSL4B+zlNZABqqpTWRWbaMxvrJCcSWu32
 1clvMsm4xZtF2WCr8fwYuy5uPufwbHCNkbFjyje6QUZrMyvtWsdjuhS3DoZjAvW2p1r3
 cALeALgKEf6FL/8F4Id3GMxmr4G8BvMyWg74PYJIGQtQ1asmn86D79zn6M7bwQCpT7Ir
 RCwSt6er8/7pkYoC3Cc9K3uGy3ohpPG/dEO/Adc/OwD/w7xm+F3XqZzWleSFfl9j7W3b
 EjLYv/0L8elKviNfogxVSNQDEGwM9Bm5yIgHJ883Ysx6h/6jUPT3YWCrexbcYS+u7i3t
 lFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z78bLrtcaASPzi8w1CnjMXbUtXV5m6K37RHzoP7DafM=;
 b=54ELNaTl5Tmtc7i6deV1oYgC649m3nCioiAvATcAXaikS646i1jZkKYlJyCdTdHtrr
 ocTDn/0MUFqnV9FHruF/zbcKhM8ZuGb4gacAz+npjoe/rvnkei3TIGIrevRrw0FcWPag
 xq1TgN/IE2rEUOTXeUvaIrOAqE1Z/U2i876hHlGU9jMxVehmnVlxocMET3PZuU9D8ps5
 TtEM3xlO8uTsPKVExxQZ34VOdHOAAWt7ossuHztx/FuT5DsWzJXDVT5d1PXeBD1CdE4g
 lP/xpdKYLiQ1uKyd3uH0ahvZnoGlROv8y6PfklTAKpSVbWFpE/IworjJvM45NEkA62Oe
 oYWg==
X-Gm-Message-State: AOAM531bZpZd4lS0nh+I6O8Yecwr0M/OcEN9In6FH6b5ZJPYrZwuLnsj
 TvpzAmno226yL2E+4NZwkyw=
X-Google-Smtp-Source: ABdhPJxr9nrK94wnRmKYpYIpyt52l0nFJVvWtYEBVin3/ydfLULHXVwJoqBaEGNiXOq1M0RBivxY/Q==
X-Received: by 2002:a17:906:dc8d:b0:6f4:75da:2fc8 with SMTP id
 cs13-20020a170906dc8d00b006f475da2fc8mr16506527ejc.7.1651771161811; 
 Thu, 05 May 2022 10:19:21 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 d13-20020a170906640d00b006f50ceabcb8sm244413ejm.102.2022.05.05.10.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:19:21 -0700 (PDT)
Message-ID: <a0e6e14f-5326-be45-2f6a-41da01ea05fd@redhat.com>
Date: Thu, 5 May 2022 19:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v4 00/25] Misc patches for 2022-04-29
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220504210615.680072-1-pbonzini@redhat.com>
 <8fd8cf3b-08f5-3666-edac-2dec322e88b0@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <8fd8cf3b-08f5-3666-edac-2dec322e88b0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/5/22 17:17, Richard Henderson wrote:
> In file included from 
> /home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/include/qemu/osdep.h:30, 
> 
>                   from ../block.c:26:
> ../block.c: In function ‘bdrv_format_is_whitelisted’:
> ./config-host.h:44:163: error: called object is not a function or 
> function pointer
>   #define CONFIG_BDRV_RW_WHITELIST "qcow2", "raw", "file", 
> "host_device", "nbd", "iscsi", "rbd", "blkdebug", "luks", "null-co", 
> "nvme", "copy-on-read", "throttle", "gluster"
> 
>                                                                            ^~~~~~~~~
> ../block.c:478:9: note: in expansion of macro ‘CONFIG_BDRV_RW_WHITELIST’
>           CONFIG_BDRV_RW_WHITELIST
>           ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from 
> /home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/include/qemu/osdep.h:30, 
> 
>                   from ../block.c:26:
> ./config-host.h:42:66: error: called object is not a function or 
> function pointer
>   #define CONFIG_BDRV_RO_WHITELIST "vmdk", "vhdx", "vpc", "https", "ssh"
>                                                                    ^~~~~
> ../block.c:482:9: note: in expansion of macro ‘CONFIG_BDRV_RO_WHITELIST’
>           CONFIG_BDRV_RO_WHITELIST
>           ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2418086124

I'm really sorry.  At least this should have been caught by the 
contributor CI though, I'll send a patch.

Paolo


