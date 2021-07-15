Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3313C9720
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 06:22:14 +0200 (CEST)
Received: from localhost ([::1]:34068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3st3-0002Z1-1l
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 00:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3ss1-0001sm-Sd
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:21:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3srt-0004bR-5A
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 00:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626322859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtxCjNmJ17aZm7SOz8W2cjKUhLeP03N8Y+/T5taCxeo=;
 b=fjHjVCEi8T7uXtmWpJpe4VkPHzn7H6JVxFkQg/HDQaVgEjQ7SQefysrV7/QsPFqHt3u/oN
 I1kdH1EN5oFFmCN0+7yDTVIrReSdwDSOWgNxu509ClWzf/yka6rXxK1d1DIrtA/04ReAAn
 ZJUWy2jrdRzMlV0t7YDzfEc88KNlpXk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-PJUFgx_UMCKzZoynzHIiug-1; Thu, 15 Jul 2021 00:20:54 -0400
X-MC-Unique: PJUFgx_UMCKzZoynzHIiug-1
Received: by mail-pj1-f72.google.com with SMTP id
 j11-20020a17090a840bb029017582e03c3bso2175804pjn.7
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 21:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RtxCjNmJ17aZm7SOz8W2cjKUhLeP03N8Y+/T5taCxeo=;
 b=dEl+uhA/QWVrRMHoE+x5V5gZD2M363a0KT3zcM96zbGYGpwDBjBXLFjSwmJAwvzB5W
 CItlcJifACMDdd9m/NdmGS3p77zO1dHA3M+SjvtzWlqlfwuMFwT2hHNLiWlxzMTxuN9X
 zqvnX/ayjw3ONEnpDHiXFW1llFsemo9FqAS2g7D23kqkgOevimpicMJF0QFp0jg1LvDs
 EqK+JH6YOfIxjEIYuSdXlpztrmmTiuuc4SXqhpuH4EEqTC+ygzfFis19xriT/3NMn3xb
 vtD0SY+ahflNo2tExqGF9Y0b5KaZx+8ENiBwtOwfXMXaKpc69kyHHxkHtVrIU4PMYrqv
 ukPQ==
X-Gm-Message-State: AOAM533IV2PsecFI2BAuhza0vwknUMHaNqd8XLWTHYt9sroV/CeaZkIi
 m5nV6zNdF2s87z4UH+H9IDgXApiMqwFQlimCBGMQQ0clAsSEbhgVfdPw6KzuqMHwALV3ASaqZmI
 +ynBBTeZ9qfFXYfA=
X-Received: by 2002:a17:90a:5644:: with SMTP id d4mr2010799pji.9.1626322852416; 
 Wed, 14 Jul 2021 21:20:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqzGQnp+NnhdRPcJZcR0B16kapNE+Jwyl4eviifcnqP5k9MIEi71qkqvoDvtZJg5+OOiZDog==
X-Received: by 2002:a17:90a:5644:: with SMTP id d4mr2010775pji.9.1626322852217; 
 Wed, 14 Jul 2021 21:20:52 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y198sm4484718pfg.116.2021.07.14.21.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 21:20:51 -0700 (PDT)
Subject: Re: [PULL V2 3/6] hmp-commands: Add new HMP command for filter
 passthrough
To: "Zhang, Chen" <chen.zhang@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210701091130.3022093-1-chen.zhang@intel.com>
 <20210701091130.3022093-4-chen.zhang@intel.com> <YO8xWHrtParXqSip@work-vm>
 <BN0PR11MB57570940435B251AA6D8DF3F9B129@BN0PR11MB5757.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <09927fb3-7971-c989-906c-e93cd3114b8c@redhat.com>
Date: Thu, 15 Jul 2021 12:20:46 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BN0PR11MB57570940435B251AA6D8DF3F9B129@BN0PR11MB5757.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/15 ÉÏÎç11:07, Zhang, Chen Ð´µÀ:
> Oh, good idea. I will quick update it.
> By the way,  please review or tag other patches in this series.
> Maybe we can catch up 6.1 merge window.
>
> Thanks
> Chen
>

Note that we probably miss the soft-freeze since it's actually a new 
feature.

It could only be done for 6.2.

Thanks


