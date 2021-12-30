Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A2B481DE6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 16:59:51 +0100 (CET)
Received: from localhost ([::1]:45160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2xqH-0004Jd-R1
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 10:59:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xox-0003GK-B3
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:58:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xov-0003TT-Ks
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640879905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0inpC4rgQSLacVdX/szXEg4tFy8Ls9Ja3FyifbzcQlM=;
 b=gn5HhGP7taQI//q+mlj/VzkErOoOU4mkUQEjwmK+DT1Rr+LK/0t/MQgdQhm5/4ahpBmBk6
 C1+LtCOOD9bf71BAEBdS6jZSaFuypat5zM4YTH+s5NNyqMISWVTh76mV1Y074HtzY846Ik
 MFGlxQxiX2J747kStTh9nR5fHGjVQ1I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-eVADxDuNMSy8enajkWI2Dw-1; Thu, 30 Dec 2021 10:58:23 -0500
X-MC-Unique: eVADxDuNMSy8enajkWI2Dw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l20-20020a05600c1d1400b003458e02cea0so13599815wms.7
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 07:58:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0inpC4rgQSLacVdX/szXEg4tFy8Ls9Ja3FyifbzcQlM=;
 b=Bi6B2rkMoZvZXdyaXkzjxwbYfNnJEVkpF91ZOxEbjOAUZ5HaY5U9A3nURjnFjZEQBf
 oS4MDYhKUlEISfZsPcIsC5AB6C58Mk6TrHN9j8Sz1mdpD2YOTMRkQCXh6mdbaXYRyHuC
 O4MQYC8KiCx4RP6o7eGvfCsNXI4vqlrK0vch5erCEKCW1H4PZifygjXGzTo3P6fsaiIo
 XkCqexJ0GasArvkTlGfeFiWHC92cYB7AugqEM94oeQ9R2xOCMhm3ROFHaM8K24psP6yp
 7r1SWnCsyhgYCnN+v2ytDGl1maUjoeIXMhi98hjMiZK7x8RoPq+dO3EYWg70YOFgtbRV
 hb3w==
X-Gm-Message-State: AOAM530gFlCtqcFtNKGaPG78S1izXi01Scb8zlhA2wRHcpgFxXs/sm0K
 GyZn59jYjZi0fBq5vcVeobBBGAAExuqLUOB8QXt3/yVDKpdaAC4HNl8BL/NDWa5Z1qBQzJnc1Nw
 U/A9xJfQ+u3rqGcA=
X-Received: by 2002:a1c:4c08:: with SMTP id z8mr25188095wmf.48.1640879902503; 
 Thu, 30 Dec 2021 07:58:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOEMyXJcBkdb/3DCeMh1bAuQOh2dJ74CL5xsuw+NBN9Ce2esmYnShW7Sv5K5Z/zdB5pLvi4g==
X-Received: by 2002:a1c:4c08:: with SMTP id z8mr25188079wmf.48.1640879902323; 
 Thu, 30 Dec 2021 07:58:22 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id v1sm27904189wru.45.2021.12.30.07.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 07:58:22 -0800 (PST)
Message-ID: <b5e38221-e7c9-587c-e86e-e3b5ce223b54@redhat.com>
Date: Thu, 30 Dec 2021 16:58:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 6/8] migration: Dump sub-cmd name in
 loadvm_process_command tp
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211224065000.97572-1-peterx@redhat.com>
 <20211224065000.97572-7-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211224065000.97572-7-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Edmondson <david.edmondson@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/21 07:49, Peter Xu wrote:
> It'll be easier to read the name rather than index of sub-cmd when debugging.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/savevm.c     | 3 ++-
>  migration/trace-events | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

> diff --git a/migration/trace-events b/migration/trace-events
> index b48d873b8a..d63a5915f5 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -22,7 +22,7 @@ loadvm_postcopy_handle_resume(void) ""
>  loadvm_postcopy_ram_handle_discard(void) ""
>  loadvm_postcopy_ram_handle_discard_end(void) ""
>  loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s: %ud"
> -loadvm_process_command(uint16_t com, uint16_t len) "com=0x%x len=%d"
> +loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"

Also: len=%u

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


