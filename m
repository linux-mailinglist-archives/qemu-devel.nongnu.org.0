Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D05D2DCF02
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:02:35 +0100 (CET)
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpq7G-0008Aq-Ik
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpppf-0000WI-2A
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:44:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpppZ-0000TF-VV
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608198257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L/7TpK3Ef4tIMDY4Nzwi5+MjAuy+oBEvFOcs2XikCqs=;
 b=JHoSrK2KmtCodSo265CE74bVy36rDLWGKBs7jpvgvCsiABJOa8p7GoC2ncgG1GUNlsydb7
 hw8QFGTC38klZbBxhtWNNxmio1kzWj7MqmD/nSLDk8rIp6TXeEMeWo0eZVZGkza3vjGvpE
 vRgknKOTYy6rmWN2wfFG5dxzYRCALcU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-hEkGB5lqNWy8ocqBkRC5hw-1; Thu, 17 Dec 2020 04:44:15 -0500
X-MC-Unique: hEkGB5lqNWy8ocqBkRC5hw-1
Received: by mail-ed1-f72.google.com with SMTP id bo22so13153451edb.15
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L/7TpK3Ef4tIMDY4Nzwi5+MjAuy+oBEvFOcs2XikCqs=;
 b=qwx0v5aWF84aIuJrszQJM5n3tJzTsHGlCwu1oUQZ3s8TpzK8aCDDbtx3ASxTDaNmnz
 w4hUQ/M9KZ4lFrzY2rzPUYeqgsRwcNXz4SgTQBfoZirolfx1pbS/iHuchlSdI1FcpPwP
 VoWUz9hiVdpbTduyiBvj3xQb+qSUS12LODYpVAxstJliGyD9piCUodTeoNXvk6zV+INv
 ezRlc43BuAzd/TMCxD3CwRtbFjJGsaFMOBmnrVztwSh1MU7A+IdEKf8oPsShKhd0h8Zp
 fqOAH+PjGrg7nnuPZGaNnTNgLKqUTGdVMnBft+In7fPLTCryFMK686nxIsFhhl/MZbgp
 Kzzw==
X-Gm-Message-State: AOAM533gwSpetP/CoN+VhL9tw1MPHfKhm0VmdXb4AAsNRG9RTnL+wkFt
 v7hnX7rTN6HhhaGzugcwjdL64I2gCCTx9nuf6ZPOwPQKqmblZ0d1/SQcq2UJxhDMOAhABO2U5RZ
 x5Yven0q8YNTcFpk=
X-Received: by 2002:a17:906:eb49:: with SMTP id
 mc9mr33447678ejb.487.1608198254016; 
 Thu, 17 Dec 2020 01:44:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4DlrWQq4ReDA7aZV4nTczADu3FTGIhcsJefxzwXZCN32QlMN5kVA9VhHTryQV2JUo4YEgHA==
X-Received: by 2002:a17:906:eb49:: with SMTP id
 mc9mr33447669ejb.487.1608198253835; 
 Thu, 17 Dec 2020 01:44:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id op5sm3366021ejb.43.2020.12.17.01.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 01:44:13 -0800 (PST)
Subject: Re: Bug: qemu-system-ppc -M mac99 boots into compat-monitor, not
 openbios.
To: Howard Spoelstra <hsp.cat7@gmail.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <CABLmASExSbekU=r2LajHDVxWXEY-vxBnT+_BnjdAm6Y9Nw8y1g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <353a6f24-3027-d80d-bed3-82560a8afab5@redhat.com>
Date: Thu, 17 Dec 2020 10:44:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CABLmASExSbekU=r2LajHDVxWXEY-vxBnT+_BnjdAm6Y9Nw8y1g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/20 22:16, Howard Spoelstra wrote:
> Hi all,
> 
> It seems a qemu-system-ppc from current master no longer boots into 
> openbios, but into to the compat monitor.
> Command line to reproduce:
> /home/hsp/src/qemu-master/build/qemu-system-ppc \
> -L pc-bios \
> -M mac99,via=pmu -m 1024 -boot c \
> -drive file=/home/hsp/Mac-disks/9.2.img,format=raw,media=disk
> 
> Bisecting leads to this commit:
> 
> commit b4e1a342112e50e05b609e857f38c1f2b7aafdc4
> Author: Paolo Bonzini <pbonzini@redhat.com <mailto:pbonzini@redhat.com>>
> Date:   Tue Oct 27 08:44:23 2020 -0400
> 
>      vl: remove separate preconfig main_loop
> 
>      Move post-preconfig initialization to the x-exit-preconfig.  If 
> preconfig
>      is not requested, just exit preconfig mode immediately with the QMP
>      command.
> 
>      As a result, the preconfig loop will run with accel_setup_post
>      and os_setup_post restrictions (xen_restrict, chroot, etc.)
>      already done.
> 
>      Reviewed-by: Igor Mammedov <imammedo@redhat.com 
> <mailto:imammedo@redhat.com>>
>      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com 
> <mailto:pbonzini@redhat.com>>
> 
>   include/sysemu/runstate.h |  1 -
>   monitor/qmp-cmds.c        |  9 -----
>   softmmu/vl.c              | 95 
> ++++++++++++++++++++---------------------------
>   3 files changed, 41 insertions(+), 64 deletions(-)
> 
> Thanks for looking into this,
> 
> Best,
> Howard

Should be a one-line change, I have sent a patch.

Paolo


