Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680302C68FC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:54:26 +0100 (CET)
Received: from localhost ([::1]:32950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kig4n-00041Y-Dw
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kifxx-0006Jm-2d
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:47:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kifxv-0007sF-J4
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606492038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRdmKEuquxBmPhHB+Uh0gOB2UtsQa+eMBI6J+S4QdEI=;
 b=aMkbxJfMiPTduQuRzeo8vG6gSWX6QYxvEgQaX69wA3inVu4/j6FCg3CK2hVYElHeK3gIy6
 +JpAJhLKRz6VNSZRUc00FWXJ+ZKQ2MGVPNlzHhIx1fEi2Whaw8a7MmFcDHaT1hpm9MSB7p
 5oJuT+UjJBmNe+vmVq0ZiklcuoPDdW0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-p2cpC0h0PxOvRXk6xeon9A-1; Fri, 27 Nov 2020 10:47:15 -0500
X-MC-Unique: p2cpC0h0PxOvRXk6xeon9A-1
Received: by mail-wm1-f69.google.com with SMTP id s10so2856591wme.0
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 07:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sRdmKEuquxBmPhHB+Uh0gOB2UtsQa+eMBI6J+S4QdEI=;
 b=M2VAdndE5ft/wB29dJoIdf6krJIu8F6spShBBTP6zsRuROCsd4HkzbEOC3QVxeBxnI
 9p/jt1Vpa4Wkn/dXeu15uloI+svJ7G21/HOXcpHZi9nwHXhZHQq8Xld5RG/hU9ByYX78
 VBPQKS0jtLzlz1qQCaDhoMkhwBOgQcOoWiTuAzUHC65gdaO1pR9lDW3oPwbl6GTC/u53
 YSAqRl/8tKXpscyuF/BJBwIxWhaE9JxHKvpY+P3LMTFbPLqWmFfsaok3WY4w6wQ1YaCc
 yb+T7si37N+oQerUpSZCzbZdRCTwmDGrDMCgKENhgRpPxPw6+2pgGloUP8trauLMhSuK
 hcOQ==
X-Gm-Message-State: AOAM530JOJba+GUacQcRhAUwsIPs3ZcYkbxY2Yerf5Ts0Ge4NGXVJb7L
 fajntRtvzATkNCKpt8dQw2i1OamB3sTUTzXZqx7cnPKsgB+T6zdKpCG46twcDyugOnU+dj9gBS5
 +9HuNPRZBA2J30m8=
X-Received: by 2002:a7b:c154:: with SMTP id z20mr9681032wmi.160.1606492033835; 
 Fri, 27 Nov 2020 07:47:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWfnTenReR7+FzpX7JZiuWScpS4chBnrd9pHPMnuWc8R36xPVs+Z5DLoekC9gsI4izmprC5w==
X-Received: by 2002:a7b:c154:: with SMTP id z20mr9681018wmi.160.1606492033692; 
 Fri, 27 Nov 2020 07:47:13 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id b83sm2585234wmd.48.2020.11.27.07.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 07:47:12 -0800 (PST)
Subject: Re: [RFC PATCH-for-5.2 0/2] net: Do not accept packets with invalid
 huge size
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20201127154524.1902024-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e0f290f0-6bd3-b4f1-f774-9f60598e8ae0@redhat.com>
Date: Fri, 27 Nov 2020 16:47:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127154524.1902024-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, P J P <ppandit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 4:45 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This is a simple attempt to avoid the following pattern:
> 
>   ssize_t pkt_size = get_pkt_size(); // returns errno

Sorry, I meant: returns "-errno" (< 0).

> 
>   // no check
> 
>   send_packet(size_t size=pkt_size); // size casted to unsigned
>                                      // -> overflow
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (2):
>   net: Do not accept packets bigger then NET_BUFSIZE
>   net: Assert no packet bigger than NET_BUFSIZE is queued
> 
>  net/net.c   | 4 ++++
>  net/queue.c | 7 +++++++
>  2 files changed, 11 insertions(+)
> 


