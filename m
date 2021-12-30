Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDFA481DE5
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 16:58:33 +0100 (CET)
Received: from localhost ([::1]:43016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2xp2-0002rP-ER
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 10:58:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xnm-0001bM-Ef
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:57:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xnk-0003N0-Lx
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640879832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bp3fUA2kncPLGuhg+TCPvIoDp106DF6NtRj/boaXCAk=;
 b=JoY71zwYdxukdEWu86CFKSKr9aoKoXdN2WLc0nS1INCtLebNoBWNZvYH/shtXra5fw54mt
 SGYpaGMNKVgVm4i/wgdtAdJe4K+CCgN9uf7At1x+7zT6tyqDxURs6IcvIE9/OiFLf8gPj4
 rb+/t9lx5SdTNvA9OSB1hJkIbteUai0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-B4WHf2PpOl6gy5AjAIapkg-1; Thu, 30 Dec 2021 10:57:11 -0500
X-MC-Unique: B4WHf2PpOl6gy5AjAIapkg-1
Received: by mail-wr1-f69.google.com with SMTP id
 h12-20020adfa4cc000000b001a22dceda69so6340539wrb.16
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 07:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bp3fUA2kncPLGuhg+TCPvIoDp106DF6NtRj/boaXCAk=;
 b=i94nEoNr5TabTcoj4ahajeB4Tf4sQN9vZ9VGtBEM0GcCBMvebUaBe/PHHOVicIZwND
 +ZsmaAyM+A70zX++YueWsD/D4inxDCLy5aI40GrOeyckI0XJ5Tt45cE0sBb0Ili5UOXH
 o9I3aGAXGB+vcIBbFOsQsxr1jyds9mOGI9SETdFt4H18HT/vOj5SCiV2gqgUDHOlA2Nc
 Rhw0yFAYLuGPjKfVPE+z9bX/zFLPe95X47rzMqWKrtnanDQWQql5QpfRi7kt0yFB3WL5
 uP9iLybhbRvoi+kYIQdzrrprzrVCOs18nWpjWRq/PmfRebCV5M4NsWmGWCz3S3/OYg+T
 9aow==
X-Gm-Message-State: AOAM5310v+PiDTGfhCWZRthtqfQpvrxSvqUhjI3gFceFhJIm6zbkygZC
 k2mNP328xwNk/AiH4E4rwklyVIGnwKt+DaM604KxTXzVbBeVy+9hnkykfrk7PFSRBQofbCOvPrZ
 5zFJtGynSHyjo+3k=
X-Received: by 2002:a05:600c:3d8c:: with SMTP id
 bi12mr26670916wmb.63.1640879829808; 
 Thu, 30 Dec 2021 07:57:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ0NznGt9MMYf1UET0xaTCUqC51IPtSSiS+wG2c0voNS72ITxrvvWNbO4vsxGqYBNH1oIK+w==
X-Received: by 2002:a05:600c:3d8c:: with SMTP id
 bi12mr26670904wmb.63.1640879829679; 
 Thu, 30 Dec 2021 07:57:09 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id t12sm27600995wrs.72.2021.12.30.07.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 07:57:09 -0800 (PST)
Message-ID: <00950a09-6c75-b0ab-89d7-284939853fda@redhat.com>
Date: Thu, 30 Dec 2021 16:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 8/8] migration: Tracepoint change in postcopy-run
 bottom half
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211224065000.97572-1-peterx@redhat.com>
 <20211224065000.97572-9-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211224065000.97572-9-peterx@redhat.com>
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

On 12/24/21 07:50, Peter Xu wrote:
> Remove the old two tracepoints and they're even near each other:
> 
>     trace_loadvm_postcopy_handle_run_cpu_sync()
>     trace_loadvm_postcopy_handle_run_vmstart()
> 
> Add trace_loadvm_postcopy_handle_run_bh() with a finer granule trace.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/savevm.c     | 12 +++++++++---
>  migration/trace-events |  3 +--
>  2 files changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


