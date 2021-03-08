Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BA73316F3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:05:52 +0100 (CET)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJLCQ-0002aA-L6
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:05:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJKgY-0000Dk-VC
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJKgW-0007gv-Al
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615228370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXuJacXlNbhdqznEr5G2vA01sJQ+rKVuQ6bHS6IMRaY=;
 b=Zi1DzT3F+cs3rS5gaG+L3w1rNg/1cg+1Z2Ey7X12phNj5Sjmg1FQHKapNfXvdwZwRz3c5n
 L064wRoMCznPO43uzayBccSgYIt9++vvFZHshpmlBU4cE+3bmArd4rcPwR7DQagkoG9h3E
 0QenZVi+XpCvYilP3TSHsmzTtFuVhfQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-T8MFmG7iMXClH98pyUuQ0Q-1; Mon, 08 Mar 2021 13:32:48 -0500
X-MC-Unique: T8MFmG7iMXClH98pyUuQ0Q-1
Received: by mail-ej1-f72.google.com with SMTP id 11so4452391ejz.20
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 10:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mXuJacXlNbhdqznEr5G2vA01sJQ+rKVuQ6bHS6IMRaY=;
 b=ZDdRZxfsVPI72mB1GXylGfDRdHcTvxEu9L/AGKP5jXwm60bJXAu2RwtXF3xL+gCD5G
 PL0kaGvsOe2AoQk1OET/YLlrAX/gsaFIyJHXshCcAlLE5w4+rdDG3S66/lQkSZo+HX7G
 MwINr7CqWlVswoGkVTNTgUT1TYXn4aVDwFpc1uHTpzYEyfzVpJrDLUnz3w3Ah1Wy69dy
 FeWI9urpEPn+HXu41C0DugtSXxKKWaaod/kHd1gT4Sdwl7m+OjmwBvBzV193pnmp5v2o
 2K4bUOXIAAjg/mAZm3pAOujCDOOcYgb8gBJQH2alLI3dySn3otNDj9499UwK87APBNkg
 DhKQ==
X-Gm-Message-State: AOAM5335rRZdefHHgPkX+m38MlLpCasuno5kttdM4BjfHF18eV3KUx3I
 rAnCDM35AW9YAqPpJmF2vFoyFW6/loNYyLKDZB0n8QWHgCn9/nR8GFLaQU8zBEL3K7YHKU+iUGq
 3A91BFeyFyHJjCK0=
X-Received: by 2002:a17:906:9515:: with SMTP id
 u21mr16601762ejx.86.1615228367831; 
 Mon, 08 Mar 2021 10:32:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycbktrX/IlrGp2FYzysloIO1vQmUGpRuyKD063rYtB+heW/zEL+KK3aW1ssrUI9MeXQy+Tww==
X-Received: by 2002:a17:906:9515:: with SMTP id
 u21mr16601742ejx.86.1615228367687; 
 Mon, 08 Mar 2021 10:32:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v9sm8057633edj.89.2021.03.08.10.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 10:32:47 -0800 (PST)
Subject: Re: [PULL 01/38] hw/block/nvme: introduce nvme-subsys device
To: Klaus Jensen <its@irrelevant.dk>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210308122313.286938-1-its@irrelevant.dk>
 <20210308122313.286938-2-its@irrelevant.dk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <48178d72-444c-91fd-c1ef-0ae28b8a674e@redhat.com>
Date: Mon, 8 Mar 2021 19:32:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308122313.286938-2-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/21 13:22, Klaus Jensen wrote:
> 
> This patch introduced a simple nvme-subsys device model.  The subsystem
> will be prepared with subsystem NQN with <subsys_id> provided in
> nvme-subsys device:
> 
>    ex) -device nvme-subsys,id=subsys0: nqn.2019-08.org.qemu:subsys0

Hi Klaus, sorry for not spotting this before.  In the SCSI subsystem we 
moved away from using id as guest-visible data.  Keeping it as a default 
is fine I guess, but would it be possible to add an nqn property to 
nvme-subsys and use it if it is present instead of the id?

Thanks,

Paolo


