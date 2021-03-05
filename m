Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664E32E50F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:41:41 +0100 (CET)
Received: from localhost ([::1]:60866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6xo-0006HJ-4P
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lI6vI-0005EY-RO
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:39:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lI6vA-0004MB-84
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614937133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AL2ER00bxl2MI94pPEzNXu8VODCKWOtrxp+181WvX30=;
 b=i3edsymw6RGFiAkMhbtJJ8NKq3aN9cTQFAl/k4RTYphssx6Hk3UfNsQHWAhF2GNLzrkOu9
 O6L6Mf+M5BUEM8dYx6iIrF3amxNHdM1zr9lYA8YyCHS6HD1pcZ2LsbCkcrlqF49BAh9zBc
 ZQfiBlpPqkEgqsjEKVrMMgtyZIhcf3o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-p5cP1YXvMUi3PnT0ZnUy1Q-1; Fri, 05 Mar 2021 04:38:52 -0500
X-MC-Unique: p5cP1YXvMUi3PnT0ZnUy1Q-1
Received: by mail-wm1-f72.google.com with SMTP id n25so534114wmk.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AL2ER00bxl2MI94pPEzNXu8VODCKWOtrxp+181WvX30=;
 b=D8WLgpsatgXkkfCjziRPZWlDVUxq7L4fQUEBbk13AJZI54KBI42G9jaxBJbA/uu9Ne
 jKDXJqeuUY1QTZSpcUXDDV6v85SErz3NeP0hiNPxjh/5LTsZUwUFFeyHf3CFkpZ1/fwg
 FgCcapWWUhPqnYNIs/AnpPVYG/NA5zeoXTynB5s7mWnoIITyZm6E58GYib6gEN9pMOqj
 IJq7YOPKH8Hj5Veq2X7z5ZbRNsfS4lwaBId/u2Rhkj0WpGkhuWi5A8MD4EyBuwIpLBzz
 bHqeP/OXKZfWubDPKlvGYNPsPG3HhlMRya/5kuX3WSH+vdPVqFcL2pobX59LlipJfEcf
 1A+Q==
X-Gm-Message-State: AOAM533MNofYX16ow1Dcs6F35ybFA3/Z8be4pKgi2G90BbJSM/9buznT
 tao9X7KlfaNz7IiqCuxex/robylaSb1cJS84WEsAAGjjvuIFLuJn2zI9nV+sR4H9j2Ump9Thyda
 7Fdsien/QHAlcNlY=
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr7056548wmg.108.1614937130719; 
 Fri, 05 Mar 2021 01:38:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDjWKnMcCvKkbi5gHKWzltj29PSPr1RFxAdLOPYzbKwDxSsSUEwbuqZ2sUGLkPrDpoQbXfdA==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr7056539wmg.108.1614937130599; 
 Fri, 05 Mar 2021 01:38:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p18sm4071680wro.18.2021.03.05.01.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:38:50 -0800 (PST)
Subject: Re: [PATCH V4 00/10] Detect reentrant RX casued by loopback
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 qemu-security@nongnu.org
References: <20210305062638.6749-1-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <79eb1502-9bcd-febc-2fd6-b8bd2c47e4f4@redhat.com>
Date: Fri, 5 Mar 2021 10:38:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305062638.6749-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: alxndr@bu.edu, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 7:26 AM, Jason Wang wrote:
> Hi All:
> 
> Followed by commit 22dc8663d9 ("net: forbid the reentrant RX"), we
> still need to fix the issues casued by loopback mode where the NIC
> usually it via calling nc->info->receive() directly.
> 
> The fix is to introduce new network helper and check the
> queue->delivering.
> 
> This series addresses CVE-2021-3416.
> 
> Thanks
> 
> Changes since V3:
> - clarify CVE number in the commit log
> - ident fix
> 
> Changes since V2:
> - add more fixes from Alexander
> 
> Changes since V1:
> 
> - Fix dp8393x compiling
> - Add rtl8139 fix
> - Tweak the commit log
> - Silent patchew warning
> 
> Alexander Bulekov (4):
>   rtl8139: switch to use qemu_receive_packet() for loopback
>   pcnet: switch to use qemu_receive_packet() for loopback
>   cadence_gem: switch to use qemu_receive_packet() for loopback
>   lan9118: switch to use qemu_receive_packet() for loopback
> 
> Jason Wang (6):
>   net: introduce qemu_receive_packet()
>   e1000: switch to use qemu_receive_packet() for loopback
>   dp8393x: switch to use qemu_receive_packet() for loopback packet
>   msf2-mac: switch to use qemu_receive_packet() for loopback
>   sungem: switch to use qemu_receive_packet() for loopback
>   tx_pkt: switch to use qemu_receive_packet_iov() for loopback
> 
>  hw/net/cadence_gem.c |  4 ++--
>  hw/net/dp8393x.c     |  2 +-
>  hw/net/e1000.c       |  2 +-
>  hw/net/lan9118.c     |  2 +-
>  hw/net/msf2-emac.c   |  2 +-
>  hw/net/net_tx_pkt.c  |  2 +-
>  hw/net/pcnet.c       |  2 +-
>  hw/net/rtl8139.c     |  2 +-
>  hw/net/sungem.c      |  2 +-
>  include/net/net.h    |  5 +++++
>  include/net/queue.h  |  8 ++++++++
>  net/net.c            | 38 +++++++++++++++++++++++++++++++-------
>  net/queue.c          | 22 ++++++++++++++++++++++
>  13 files changed, 76 insertions(+), 17 deletions(-)
> 

LGTM, maybe worth adding the "Cc: qemu-stable@nongnu.org" tag
when applying.


