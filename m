Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFB9325F99
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:05:12 +0100 (CET)
Received: from localhost ([::1]:34550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZ3f-00029r-9g
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFZ1m-0001Xw-6X
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:03:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFZ1j-0003AJ-8e
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614330189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hb+R21osh8a+EXqBoyIC8V8eOGiT99AygmxKZ05qAWw=;
 b=i2kT0I31dIO7/6dYnPyrSH4tyVL48ya6sxG5l0PQKGXcEyCxwITPBm2l02y2PmGiIr093z
 iOYL6bZatOQJZQElkEVnV+9fNFfa2RYrCFWj5zMIEBPqDsOBpAZHq3CMgOp4gReoNwerMW
 XVY/BhAM2g/ufxrkSvoR5Cdz6Caxgr4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-gC2KFDFUMG6jMV3KV9ejtA-1; Fri, 26 Feb 2021 04:03:06 -0500
X-MC-Unique: gC2KFDFUMG6jMV3KV9ejtA-1
Received: by mail-ej1-f71.google.com with SMTP id ia14so3968367ejc.8
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hb+R21osh8a+EXqBoyIC8V8eOGiT99AygmxKZ05qAWw=;
 b=oe5PKNmI7WZuA4HWhswslk1wmUVez0zV9qcu7IT6MiO47lx/kN/RWXb/c6wyYfYgV3
 ow2etBa5HsmDrcLHR4TJN2d+uISagHVdSSB7U/37JWbQ6QTyXs6+tV625FKSIo1K/NKW
 fLT48wxss7gf05+uup9rWA5//UeJbQtpmsoB8wqbnv2Z3ItshOo/IkdidmhuT8Q3pMQ3
 wAR/Mm+b7vMcalNs/n5aQS6sBrzP1SKPw9VHhhAe25ttSVPiZ01DNVIOXBABT2tkz/rC
 +7FJd8gtlRorRMMYKcekqDOo0JI/KSEIUSYz+uHq1mVqLoRbcGV8tUXP6qkL/kKlyu4k
 vqVw==
X-Gm-Message-State: AOAM533tWIkUW2Rgd2yJtRvHM90o7aYpYI4sWzAPfaakaKY23L/KNcT7
 F4rIKAT3T1uKs452gt92C8XYI03s9tO6dSyHfSsDCFCJmNo99CFgrqBEDICb5UHBlYR8rU52H3k
 5FWrf4I5m0mPF6Pc=
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr2171112edt.152.1614330185261; 
 Fri, 26 Feb 2021 01:03:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMtzAsMoUPXeY1ocy1NYoZLbcfs7uO7MzStKw9YT9/MdPnYkonKata0rH5uwLu0gh0Z3iAZw==
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr2171095edt.152.1614330185121; 
 Fri, 26 Feb 2021 01:03:05 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id jj16sm3801772ejc.19.2021.02.26.01.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 01:03:04 -0800 (PST)
Subject: Re: [PATCH] net: Fix build error when DEBUG_NET is on
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
References: <1614326161-65017-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <914b84c2-3caa-d5a0-75bd-8e3ce0855713@redhat.com>
Date: Fri, 26 Feb 2021 10:03:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1614326161-65017-1-git-send-email-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 8:56 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> "qemu-common.h" should be included to provide the forward declaration
> of qemu_hexdump() when DEBUG_NET is on.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  net/net.c | 1 +
>  1 file changed, 1 insertion(+)

Similarly:
- hw/net/fsl_etsec/etsec.c
- hw/net/fsl_etsec/rings.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


