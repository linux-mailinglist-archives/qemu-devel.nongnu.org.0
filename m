Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF2338F27
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:52:28 +0100 (CET)
Received: from localhost ([::1]:42698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiDL-0001VZ-TS
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKiAR-0000KZ-FZ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:49:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKiAO-0000TK-Iy
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615556963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zL6CegdiYeoe+1TCwRhpefstyzcKUHltE+o1NHslSOg=;
 b=FMw8u+Jn++zCXw6IeF8fKpyLjlOH4XfZ0AgTlbRrvQQrtgSU79JWISgsk+l0RmskNAQIw7
 kTuxkpzRBoctoFMFwChy62ZJ3HI3EKK0cHkKPZaCGg+8huZZ4IVMtThWo7c8hN0Sc5kOTg
 dBZBnDw+dJlXXCBcN36y8m81iTRVuWw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-NWRfqCLuNB-IrEBaA3SYHA-1; Fri, 12 Mar 2021 08:49:19 -0500
X-MC-Unique: NWRfqCLuNB-IrEBaA3SYHA-1
Received: by mail-wr1-f72.google.com with SMTP id r12so11197239wro.15
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zL6CegdiYeoe+1TCwRhpefstyzcKUHltE+o1NHslSOg=;
 b=NkqA99htnsV/dEng7RsGaEy+IsuNLCwWtYM5L4dOCZiiY0MsmoBVDFEXGTbtmfTE+0
 VIU0vYAMruVNvdTAoC4rvJ9z2NvwL2p1iKGPhNpp1gEu1iYUFABONvlj/kBw5jGQTCuM
 G23/9ECGQg+DlekjFqwtz6ZMiKHtwWqZ3CcdXLnsUptY1UB0WjdG9Y3cRW8EkKg7YCjE
 n3ta0pdt/OCQTZe/KXk9WbovJCTZPIzlZWQlFTran/CvRkGh+KYaiQD3U0m92eeEsOEv
 GTG412Zmz/zLuodZpQLqAPKK7M2VeHaWUsrhAitrweUTCj5PRYXHFGFyotvH5A0oHcWt
 idtg==
X-Gm-Message-State: AOAM532pPrDfwqS5TK3PYU7ZuWoLOICW4BqnVqjyCzayzudVlPsKO6YR
 6zkbZkM2G+NO4S/sZsIdJ/xZWmS7m4gDhb8VAyMqXrFwaaWakBsoFuz+S7+kTv0MHaj8JjB85hJ
 HxiYk9hki1hkUzCM=
X-Received: by 2002:adf:d0c9:: with SMTP id z9mr14547747wrh.396.1615556958385; 
 Fri, 12 Mar 2021 05:49:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvgmVJbOpBUcLP0IVDaZFOfip/FH0CKMpeL6UBhd00dykFcsGap5sFRJXyPddnuCf7E/n1PQ==
X-Received: by 2002:adf:d0c9:: with SMTP id z9mr14547728wrh.396.1615556958223; 
 Fri, 12 Mar 2021 05:49:18 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k4sm10266411wrd.9.2021.03.12.05.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 05:49:17 -0800 (PST)
Subject: Re: [PATCH] Add missing initialization for g_autofree variables
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <20210312120309.138913-1-mrezanin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a93e4e14-bc86-ef7f-26dd-83d3a0754732@redhat.com>
Date: Fri, 12 Mar 2021 14:49:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312120309.138913-1-mrezanin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 1:03 PM, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> When declaring g_autofree variable without inicialization, compiler
> will raise "may be used uninitialized in this function" warning due
> to automatic free handling. This usage can cause gfree using unknown.
> Such behavior can be dangerous and exploitable.

Will we be able to catch that earlier when building using
the Fedora/rawhide Docker image?

> 
> Add inicialization to NULL for these declaration to ensure uninitialized
> value is not used.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>  hw/remote/memory.c       | 2 +-
>  hw/remote/proxy.c        | 2 +-
>  hw/s390x/s390-pci-vfio.c | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 32085b1e05..bf0047a81b 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -43,7 +43,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
>      remote_sysmem_reset();
>  
>      for (region = 0; region < msg->num_fds; region++) {
> -        g_autofree char *name;
> +        g_autofree char *name = NULL;
>          subregion = g_new(MemoryRegion, 1);
>          name = g_strdup_printf("remote-mem-%u", suffix++);

There is a reviewed patch for this one:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg787631.html


