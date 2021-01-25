Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0B7302781
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:11:51 +0100 (CET)
Received: from localhost ([::1]:34182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44T0-0008Uw-US
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l44Pq-00063P-Sv
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:08:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l44Po-00055H-6S
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611590910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBN2dktxTrpO9M6k6ef1tF5vBWOoz39+ja9xurhvQ1s=;
 b=ZzZRtznQwisOoTrOPxVBIktqTFFrDQ0yixFKokzOgkGDQVQ/Q57G0klj1ZI+Mo7QLKxWQz
 vr5RfCgyzEncyPs8wAUWiQkyjurODK6HB2/hntde41ts5maxJDKTrsLTcaT29uZReXan2V
 9S7SuSr8cu378O6ztstWBO/hS5U6B8A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-auitLtf3M-C3rEAfpU-2dw-1; Mon, 25 Jan 2021 11:08:27 -0500
X-MC-Unique: auitLtf3M-C3rEAfpU-2dw-1
Received: by mail-ed1-f69.google.com with SMTP id o19so7710270edq.9
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 08:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jBN2dktxTrpO9M6k6ef1tF5vBWOoz39+ja9xurhvQ1s=;
 b=pmc3Y90Sk422r4qyN4IRhJsiybEQwKemE5w9gvC/GRv6yUUZ73VhdQjnkbea/zp9me
 vtRxmhjlC8W0q+eQwmn0798h/wvBRFR/JnZqQlr2yxRypis32PWpGLSd0B1dEFrLwusB
 tqbd9meKn4qGW8xhTvTJtOvaCkyWI0e01GhauI9UD3MEZIGr8qBE08ftZYcK903LeDNh
 sualSExNS1P+UNc8KIDv25dmq5aC8y8FYCYRHEesdw/gEQpFb1fzBlBplHuS1jSVi/wl
 KQLsfARJo6y9omV+Ea1M7ZPGlMHitz9/cdb37EY5IU/jHFIwtXoyb2LCSTTPjRVWDvRH
 wfyg==
X-Gm-Message-State: AOAM533byQZXan52l74vM5K6qZkAknDdrIwYRbAfBr5IZncWhbhjEU79
 KmIGhZUCE44KNz9t5aZT5xfwL/57Gjv33NZ/d9nm7Ow2e1GBLxQbZUuRkGjJ7d4txnqH8G7ttyy
 pJpLs5DnSIqptC6s=
X-Received: by 2002:aa7:c384:: with SMTP id k4mr1044252edq.23.1611590905765;
 Mon, 25 Jan 2021 08:08:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+CL7sj8/+xEU+PEX8ORng+pepYe+ve9v6GJLYzyNNYntV3DvKzz8xylLmtv11og4Tm0jVyQ==
X-Received: by 2002:aa7:c384:: with SMTP id k4mr1044243edq.23.1611590905622;
 Mon, 25 Jan 2021 08:08:25 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id dm1sm10497599edb.72.2021.01.25.08.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:08:24 -0800 (PST)
Subject: Re: [PATCH] net/slirp.c: Fix spelling error in error message
To: Doug Evans <dje@google.com>, qemu-devel@nongnu.org
References: <20210122004251.843837-1-dje@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f2162586-0970-14e1-81e2-367fb94dc66e@redhat.com>
Date: Mon, 25 Jan 2021 17:08:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122004251.843837-1-dje@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 1:42 AM, dje--- via wrote:
> DNS should be DHCP
> 
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>  net/slirp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


