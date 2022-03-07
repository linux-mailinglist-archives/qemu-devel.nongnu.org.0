Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF37D4CF1E2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 07:27:56 +0100 (CET)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR6qZ-0004Kl-QA
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 01:27:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nR6ph-0003eL-Ll
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:27:01 -0500
Received: from [2607:f8b0:4864:20::531] (port=43536
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nR6pe-0003uM-46
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:26:59 -0500
Received: by mail-pg1-x531.google.com with SMTP id 27so12726615pgk.10
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 22:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A6d23r1DHeZVJ/dK8RmJYBYBDN3577bn/IM47T6tISs=;
 b=BJLbf33m0LRefst1wDSBS+s4IT51BtSRWGLDNCc0nkcGF2BA28sH8bzspNU2jlS+72
 LuJbQgxGKxXYHukH71juuOnL59AB7jwFZbYDR6L5YVzj9EelTgM6HZf7QQr9TTbINIR6
 ADfQ2s0AAcktMgx2BF0XHAN9M1Ofq29f8qe2ieibPtev6RAibwh+EFvn+znJuOjy/gZx
 ZCk5m846sH0sRX9pGjj1mjpGMXhy6tKc5PIywOGt4wjGSgRpCMSlpLiSSMQ6W4iWdImn
 2VtRmlpkZ2wpeQb498kRxmSn/TLWzxtdnRjlcLjpr1vchd8fnjkcn4p6zP5UIeU7bOzS
 R/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A6d23r1DHeZVJ/dK8RmJYBYBDN3577bn/IM47T6tISs=;
 b=DUFTB291FIXk7lS2EiIHGv//UJi7nMBa/bi2TGiDw0ryRTIzgnozaZHxHzLPwscNdr
 RvF6P79e8V5WpU2s7iV/nM3TcSTiI3t12x5I2NVvRcG8Q+MaGFeM6rYzL9sH3qwQjBcn
 JWQL08ZUs5a22RHDw4R1zrYbXjtS7wFJXANOAWMTZfo8uw5yp6W0nXSjET+1kfvUWnMb
 2sS2uzeVT01hlH16nwBMvGoNyWcHLWykkOnX32W6tLKFtLMadEgeR8sjSCukIrUnHmP8
 n102wMoDaElk0jD+EI82ov0ooQYZVUer66np8VKPCtczh53WJ3hHMBJvc/njdFIExKwq
 gCdQ==
X-Gm-Message-State: AOAM531mC2pROZyFhIgm3NoPXqiAfIwivXVBA5hGbdPnpXI/QGxFwreY
 l1gYF2T4KzjB4/3uva9wslApyz8Ncty4Pg==
X-Google-Smtp-Source: ABdhPJzPw9Pb01DR9XdmyBU0j/hr2KVIkHPIyzQYDb4mWHfx3PLSTQYkbsscXY/ANH6OBhdsZkKhBg==
X-Received: by 2002:a63:4756:0:b0:373:e14b:5848 with SMTP id
 w22-20020a634756000000b00373e14b5848mr8634614pgk.337.1646634416487; 
 Sun, 06 Mar 2022 22:26:56 -0800 (PST)
Received: from [10.76.15.169] ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a63d952000000b00372a1295210sm10575607pgj.51.2022.03.06.22.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 22:26:55 -0800 (PST)
Subject: Re: Re: [PATCH] qga: Introduce disk smart
To: Keith Busch <kbusch@kernel.org>
References: <20220304085407.1334358-1-pizhenwei@bytedance.com>
 <20220304145157.GC2824821@dhcp-10-100-145-180.wdc.com>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <0c336134-6be3-e746-063d-b0a0c0638efa@bytedance.com>
Date: Mon, 7 Mar 2022 14:24:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220304145157.GC2824821@dhcp-10-100-145-180.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: michael.roth@amd.com, philippe.mathieu.daude@gmail.com, armbru@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 10:51 PM, Keith Busch wrote:
> On Fri, Mar 04, 2022 at 04:54:07PM +0800, zhenwei pi wrote:
>> +        smart->u.nvme.temperature = le16_to_cpu(log.temperature);
> 
> The 'temperature' offset is not properly aligned, so I think you need to
> use an unaligned le accessor like 'stw_le_p()'.
> 

Thanks, I missed this point, and I sent a v2 patch named '[PATCH v2 
RESEND] qga: Introduce disk smart'.

-- 
zhenwei pi

