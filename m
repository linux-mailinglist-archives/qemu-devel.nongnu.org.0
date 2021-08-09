Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7956A3E3E42
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 05:24:43 +0200 (CEST)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCvu6-0002RO-H8
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 23:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mCvt8-00015Z-1P
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 23:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mCvt6-0004OI-1u
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 23:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628479418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UnsGxZ08AR5I39z6HLCfVGxxmuqACWD73I2pG9lwp9Q=;
 b=BGdaZsZuXXsQWSN4przFcpyUedAWTgSuR5lysUXPZHRT1rgFxButFA24hsg9SBgKHA49aX
 tXqw1oK/r9NDGwXP6IMvvNsqRBZBwE9UoVH8aaPfyaZuJmSqV34jBfLxz6O4S4ssjfREEA
 aCw+nxzrSSR/ia4NIXH2NgXjqwzoL5Y=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-6onNL_REOxCKIFtcuRI6-Q-1; Sun, 08 Aug 2021 23:23:35 -0400
X-MC-Unique: 6onNL_REOxCKIFtcuRI6-Q-1
Received: by mail-pj1-f70.google.com with SMTP id
 g12-20020a17090ace8cb029017797b2c0f8so13384349pju.4
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 20:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UnsGxZ08AR5I39z6HLCfVGxxmuqACWD73I2pG9lwp9Q=;
 b=EJLBxmmoaSYYvNOrtASXhBHSgqyMOssRaLnWgryeiWJwBFKelqgTQi3hALmMRsib4O
 L4t07Ef7t2iyaK+g7CeHLcIf8vnKUBUiD0mEtFegzSev13j7S33pwEqzdnrKp10Uoq7h
 wc72kXoqTlTNnZPkX6atPKZdp3UzKoCpPOjIHLdCINcAW6JsG4aZ9cisbwlHRjFnrGYa
 pyWs2lXCwQNhDSc3EfSDL5Kdd9zuDH6Pysgf6QldhS3tDVowLxZCFZfM6dxPFlHImkdw
 sCqJXzy4G4f2lyKmliDnNtpBAzI6lXxweUXoBFfXMqNm7ofHN51VQEx/Y0afwCA/mKds
 eMhg==
X-Gm-Message-State: AOAM533arzImA1rHNrKauXSoPIr47HxABPb8ZyyE7tKJKr/OSTo8mDo/
 Xjin+YffzchpZm5fZwqtkxzHvmmYdAJ/xnaPR8i3EaExP/C8Je8UMpKrkOGAVDzDgVDld/bJiJ4
 syNKkPnVcb2Zih5Q=
X-Received: by 2002:a17:902:f541:b029:12d:27cb:832e with SMTP id
 h1-20020a170902f541b029012d27cb832emr757994plf.22.1628479414892; 
 Sun, 08 Aug 2021 20:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGtJb2IXFaDALVba8JwgglIschX/ys9kayPpPKk7cxBTQA3X++WCdMvUffcpXRfala6WHoSQ==
X-Received: by 2002:a17:902:f541:b029:12d:27cb:832e with SMTP id
 h1-20020a170902f541b029012d27cb832emr757985plf.22.1628479414687; 
 Sun, 08 Aug 2021 20:23:34 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c14sm20776310pgv.86.2021.08.08.20.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Aug 2021 20:23:34 -0700 (PDT)
Subject: Re: [PATCH 0/7] Add vmnet.framework based network backend
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
 <CADO9X9T9LVMCpJBgnwuSRN=FU5w1cvQXUCbpRvezD9jsyaO3xQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <006193b9-81db-04b2-a312-dbc22cf531f8@redhat.com>
Date: Mon, 9 Aug 2021 11:23:31 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CADO9X9T9LVMCpJBgnwuSRN=FU5w1cvQXUCbpRvezD9jsyaO3xQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/8/7 上午3:03, Vladislav Yaroshchuk 写道:
> ping
> https://patchew.org/QEMU/20210617143246.55336-1-yaroshchuk2000@gmail.com/ 
> <https://patchew.org/QEMU/20210617143246.55336-1-yaroshchuk2000@gmail.com/>


Will review this week.

Thanks


>
> чт, 17 июн. 2021 г. в 17:33, Vladislav Yaroshchuk 
> <yaroshchuk2000@gmail.com <mailto:yaroshchuk2000@gmail.com>>:
>
>     macOS provides networking API for VMs called vmnet.framework.
>     I tried to add it as a network backend. All three modes are supported:
>
>     -shared:
>       allows the guest to comminicate with other guests in shared mode and
>       also with external network (Internet) via NAT
>
>     -host:
>       allows the guest to communicate with other guests in host mode
>
>     -bridged:
>       bridges the guest with a physical network interface
>
>     Separate netdev for each vmnet mode was created because they use quite
>     different settings, especially since macOS 11.0 when vmnet.framework
>     gets a lot of updates.
>
>     Not sure that I use qemu_mutex_lock_iothread() and
>     qemu_mutex_unlock_iothread() in correct way while sending packet
>     from vmnet interface to QEMU. I'll be happy to receive
>     recomendations how to make this thing better if I done sth wrong.
>
>     Also vmnet.framework requires com.apple.vm.networking entitlement to
>     run without root priveledges. Ad-hoc signing does not fit there,
>     so I didn't touch anything related to signing. As a result we should
>     run qemu-system by a priviledged user:
>     `$ sudo qemu-system-x86_64 -nic vmnet-shared`
>     otherwise vmnet fails with 'general failure'.
>
>     But in any way it seems working now,
>     I tested it within qemu-system-x86-64 on macOS 10.15.7 host, with nic
>     models:
>     - e1000-82545em
>     - virtio-net-pci
>
>     and having such guests:
>     - macOS 10.15.7
>     - Ubuntu Bionic (server cloudimg)
>
>     Vladislav Yaroshchuk (7):
>       net/vmnet: dependencies setup, initial preparations
>       net/vmnet: add new netdevs to qapi/net
>       net/vmnet: create common netdev state structure
>       net/vmnet: implement shared mode (vmnet-shared)
>       net/vmnet: implement host mode (vmnet-host)
>       net/vmnet: implement bridged mode (vmnet-bridged)
>       net/vmnet: update qemu-options.hx
>
>      configure           |  31 +++++
>      meson.build         |   5 +
>      net/clients.h       |  11 ++
>      net/meson.build     |   7 ++
>      net/net.c           |  10 ++
>      net/vmnet-bridged.m | 123 ++++++++++++++++++
>      net/vmnet-common.m  | 294
>     ++++++++++++++++++++++++++++++++++++++++++++
>      net/vmnet-host.c    |  93 ++++++++++++++
>      net/vmnet-shared.c  |  94 ++++++++++++++
>      net/vmnet_int.h     |  48 ++++++++
>      qapi/net.json       |  99 ++++++++++++++-
>      qemu-options.hx     |  17 +++
>      12 files changed, 830 insertions(+), 2 deletions(-)
>      create mode 100644 net/vmnet-bridged.m
>      create mode 100644 net/vmnet-common.m
>      create mode 100644 net/vmnet-host.c
>      create mode 100644 net/vmnet-shared.c
>      create mode 100644 net/vmnet_int.h
>
>     -- 
>     2.23.0
>


