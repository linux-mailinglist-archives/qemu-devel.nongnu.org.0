Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07A73DDFA6
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 20:56:48 +0200 (CEST)
Received: from localhost ([::1]:52586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAd7H-0005Hw-Q6
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 14:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAd5C-0002OX-Jb
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAd5B-0001q7-56
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627930476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxeu0blTQ1uuGkopGtPaqdKGNLsCwox1qlV/ST3lMV0=;
 b=FlNMwjypBiRh7Q2JG0Mvo7Ia725wBwnou6jgmcVo1DURgjusTeBVnNRrtoi/BCAI71rbTD
 qoWRF3N+eS+SvgbPHlFfn65KGHv9Gk1cUbxibVzHUo74LezBC279/Zj0y2h2msuIWACQgB
 /PmYpZwjC205ahFPIkp6dhDUPM+799I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-w-wnRfvCPdKQDhqbKbgtIQ-1; Mon, 02 Aug 2021 14:54:35 -0400
X-MC-Unique: w-wnRfvCPdKQDhqbKbgtIQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l38-20020a05600c1d26b0290259bef426efso165751wms.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 11:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pxeu0blTQ1uuGkopGtPaqdKGNLsCwox1qlV/ST3lMV0=;
 b=Vvcyqp2pCDa1KKeiqYL5IDklHP7lcqFDqHJIAvbluInPVHePH5bRzWKQPhjSwD4Ua/
 hPz3GlwoFhLAB3EuKYOLZQ+kYWtQ/eLudVBy29SW6Do+MFkoYWJ0ll3dPlruBLkXd9IG
 JkKG3e5jTLSB7bMN9Cdp8n2cYtcYH+AXGQTGrd1X+osJ01aHogoT8mys29+CLJE0UQqx
 nmk3QzNzAsTvvLPbxL72LRtjMxhV2FtZBCQd0WIwHaEMWkIV0Wu16XAaNJkui13G4PNR
 +W8gqPEvey/kAztk0rHrONpjvba5umuN+bbdK4Eh8BUH5wxujzTyGE02v4tWW1PZCTxa
 WCLQ==
X-Gm-Message-State: AOAM530MCp4sIYRXSs2jWlinq6aqv1lpKMb1kmaTCz0OMQa8zD9N5kJA
 eoEYCyU+CkMt1euZMTxnDubl2Yiu/9I8sg49T1fsZfM5yrMMozEaRD6AZHXmyMDIh2pxtixcXUU
 zcFcwkaZcGlmnyls=
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr346219wmm.120.1627930474115; 
 Mon, 02 Aug 2021 11:54:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPIoqjvQyJMKGx/QKZEUUU5QTq2TeM5w31U5nK1VfY8vkUdEjSM9hI1bMEQCCDNscLSYQXzw==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr346210wmm.120.1627930473929; 
 Mon, 02 Aug 2021 11:54:33 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id m39sm165562wms.28.2021.08.02.11.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 11:54:33 -0700 (PDT)
Subject: Re: [PATCH 02/16] spapr: Plug memory leak when we can't add a
 migration blocker
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b68e8dfb-23d9-0050-f739-70d3442e6a10@redhat.com>
Date: Mon, 2 Aug 2021 20:54:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-3-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 2:53 PM, Markus Armbruster wrote:
> Fixes: 2500fb423adb17995485de0b4d507cf2f09e3a7f
> Cc: Aravinda Prasad <arawinda.p@gmail.com>
> Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/ppc/spapr_events.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


