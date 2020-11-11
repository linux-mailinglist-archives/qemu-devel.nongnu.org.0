Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD6F2AED7F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:24:54 +0100 (CET)
Received: from localhost ([::1]:45024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmN3-00070D-Sp
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcmM2-0006Gf-5B
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:23:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcmM0-0006dz-CL
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605086627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=023YwxFToVQjnNlxknBRX28XGZaynFuWQ0MsDQohq/Y=;
 b=ZrBPoMkhT1IIAMEX9tSESmOF8PHiMJf5ODY/1V2dqwNzo7wldLckgGIQNFcddLOZF1GsbE
 pQV1IK5ZMWH2OdIwxdn/gLy0Xq23VI/m3DcmTO/dwrfPzXOykgOZQVDEtPQ+h5VDfT54gG
 AbpQ2yJt0AN6pV3hGyrKykZQnSYRS0w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-v5DmF3sGNNO-dAOAJu3ijQ-1; Wed, 11 Nov 2020 04:23:45 -0500
X-MC-Unique: v5DmF3sGNNO-dAOAJu3ijQ-1
Received: by mail-wr1-f71.google.com with SMTP id w6so395222wrk.1
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 01:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=023YwxFToVQjnNlxknBRX28XGZaynFuWQ0MsDQohq/Y=;
 b=itB8Zq3i9MIsTdhiefcTQCjejSrFW7fHq+6pZf+uuoA3NGt3ZpUNZixsqI4TCkRpGD
 aJUWe/7B6GR8nDKGd4crdXTupx6rhO5S3uB6OQePzvjMl1gWbJ0zCgq8OdYzWeK0KW4T
 TSx8q2415UhMbdYfHDERHMY6iAHozLDJnATfSQ/OB5a8rqk24+YclKsqG38H0KJCBmCq
 V8dIY4y2Mflf6N56JS/S81qlGuh3VIz4UUhaZMxWODBhi6w/Owt5PBBIydBuKelIl/H4
 egWogCimc/Qkqw6kJBOgkS5FOB5Y/MedcBoWnoqfFDa0OF3iy5fdcAL2gX91qWcEN3aM
 3VrQ==
X-Gm-Message-State: AOAM533ohSliAjO6MrP2LUJAhoXbutfFYJ56Wf4ymII5ZsPJmg1FYgH4
 K5rwvoBuTXe6GRMBj4x/rRe+g3vk40zZnVIU6SHSmXC+T46GYBg9o2gLDW/O93ev8T7qFJTYEpJ
 G7XF8vXjJG+IEaAg=
X-Received: by 2002:adf:8bce:: with SMTP id w14mr28032743wra.242.1605086624403; 
 Wed, 11 Nov 2020 01:23:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4sPjdDwNz5XQbnPs3Elu/Buqvdjd1UbBKKG2M3M1yhLMFa+W1lfxmaLqcZVGUu6HY9RVpWQ==
X-Received: by 2002:adf:8bce:: with SMTP id w14mr28032726wra.242.1605086624224; 
 Wed, 11 Nov 2020 01:23:44 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id a128sm1798644wmf.5.2020.11.11.01.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 01:23:43 -0800 (PST)
Subject: Re: [PATCH 3/3] configure: mark vhost-user Linux-only
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201110171121.1265142-1-stefanha@redhat.com>
 <20201110171121.1265142-4-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd717b66-22fa-9bb5-dfcd-9191d743401d@redhat.com>
Date: Wed, 11 Nov 2020 10:23:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110171121.1265142-4-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 6:11 PM, Stefan Hajnoczi wrote:
> The vhost-user protocol uses the Linux eventfd feature and is typically
> connected to Linux kvm.ko ioeventfd and irqfd file descriptors. The
> protocol specification in docs/interop/vhost-user.rst does not describe
> how platforms without eventfd support work.
> 
> The QEMU vhost-user devices compile on other POSIX host operating
> systems because eventfd usage is abstracted in QEMU. The libvhost-user
> programs in contrib/ do not compile but we failed to notice since they
> are not built by default.
> 
> Make it clear that vhost-user is only supported on Linux for the time
> being. If someone wishes to support it on other platforms then the
> details can be added to vhost-user.rst and CI jobs can test the feature
> to prevent bitrot.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  configure | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


