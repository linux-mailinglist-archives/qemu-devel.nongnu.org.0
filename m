Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4CB310DD8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:27:17 +0100 (CET)
Received: from localhost ([::1]:53392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83wy-0000ta-BV
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83sz-0005Ja-B7
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:23:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83sx-0004os-PQ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612542186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLaXjsAccGWOFYV4LHkNPNuwuNfu0xiG2uf1x9Ryd+8=;
 b=LoAnjWPVC9ltwW+ELDhhP6R9F/iojProd2dNkW/DH8jERBNevw1D8v3dWanccxeJSpjT22
 vqYpppC7edjc58LRfo9X2Mv8wVTJmRr8D+JS9nD1/TTBF7/mIihz6aM12SQwdskz6H8SvW
 MLYXcRx8XiFQNIsTdKT0TfesiYBErj0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-i9JhDsr7OvWg2nITB_Q4pA-1; Fri, 05 Feb 2021 11:23:05 -0500
X-MC-Unique: i9JhDsr7OvWg2nITB_Q4pA-1
Received: by mail-ed1-f72.google.com with SMTP id w23so7139663edr.15
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JLaXjsAccGWOFYV4LHkNPNuwuNfu0xiG2uf1x9Ryd+8=;
 b=UBXPn6ecHhwPpRrcQz+rZIHlohfDS4Ci9+0Gttlah1qf3GQ0aLVf9auhawwJuhjkKr
 C0z0O+2AzSsHdy5PBHUdDJTQPlviaBJpqG8J6nvQov4i+QQZfMl/USM4NjdRH6e36ZkQ
 X8gfiGDLBqiqxY6E797qYFnfPhtRAkiAKzx5bme5WyNIrgU2CBzRij1ec+UD+omorqlv
 /+WP5y6TURSUzrnualB7Iy3FOFf+5dl7fvq5dpsmociAmY3tmi0c+P2P/vapF8mSTYWa
 qauYeIavym1yTh8/UL1omCdcLFEP+upUQTaR0x6ublQCwviAJKcbOahSRQVoMOHpsbd6
 nPvA==
X-Gm-Message-State: AOAM532o157PVxN+PVMUFg7bpsltxh96G3v2mts/cSbeSKVVRWDF+AZj
 lkwN/zjVq2kCvIkpJKd7YTL2Dk4v/tL8+1NHowJWk39L/h1SLdnSEWeS5MwEunzUHrHUvLsvLGF
 Rv9HvYe8kQAogzFw=
X-Received: by 2002:a17:906:e03:: with SMTP id l3mr4685614eji.64.1612542184057; 
 Fri, 05 Feb 2021 08:23:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzggzXxSXXScsxU2TD3fNAFfe6VIyy4hfwmSm5WCqpUw1G+Fvw8r8GNdLGhj8SOIwxV3LLH8g==
X-Received: by 2002:a17:906:e03:: with SMTP id l3mr4685589eji.64.1612542183845; 
 Fri, 05 Feb 2021 08:23:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m19sm4211125edq.81.2021.02.05.08.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:23:03 -0800 (PST)
Subject: Re: [PATCH 12/33] migration: push Error **errp into
 loadvm_postcopy_handle_listen()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-13-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3d260288-6aae-d484-4500-cef6954ec5c4@redhat.com>
Date: Fri, 5 Feb 2021 17:23:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-13-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:18 PM, Daniel P. Berrangé wrote:
> This is an incremental step in converting vmstate loading code to report
> via Error objects instead of printing directly to the console/monitor.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/savevm.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index c505526406..447596383f 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1909,14 +1909,15 @@ static void *postcopy_ram_listen_thread(void *opaque)
>  }
...

> @@ -1937,12 +1938,12 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>      if (migrate_postcopy_ram()) {
>          if (postcopy_ram_incoming_setup(mis)) {
>              postcopy_ram_incoming_cleanup(mis);
> +            error_setg(errp, "Failed to setup incoming postcoyp RAM blocks");

New error, OK.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>              return -1;
>          }
>      }


