Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0230FFC4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 22:58:52 +0100 (CET)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7meJ-0005LI-72
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 16:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7mcz-0004tW-2r
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 16:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7mcx-0008V0-3D
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 16:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612475845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htSB847kroRThl5wV3/xgiiKNVcrw0qiOnTHuYp7gKs=;
 b=Q+j3uEmAS2pBvlzFtmyio1RkDNwhqrZdxueIw2BZkhgc+UhXQlnuv2aV9V8zjAP/Ie7QFU
 hlzwfuhNJveb7Edavq0mXIHJqG7aPCl8jMpXiZymgfy3nyhWphTsE9ZPPFdPxgGl05PKlI
 C+BWaChpaIL8jxlfNUMAl5F9avhdYWc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-bFQfEvkeN8ms-9-jaTBN_A-1; Thu, 04 Feb 2021 16:57:23 -0500
X-MC-Unique: bFQfEvkeN8ms-9-jaTBN_A-1
Received: by mail-ed1-f70.google.com with SMTP id a26so4429052edx.8
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 13:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=htSB847kroRThl5wV3/xgiiKNVcrw0qiOnTHuYp7gKs=;
 b=L4TBZWG0x4BD0cAkVIbBqhqpeMKlVUWFD9nDHsSUJhzWEz+HT5KhiaIWKO+HFHgj6b
 VosykIu5RkYHDaYByrARryVUQI/v6dBBECXgkLdQ+fKiBNqS1jhnWQLA1G1xq6nLUc+c
 v38M2jwg23TvvnoEZD+FAG0YU/bTmXVQSxS2FLnHDcwRaE0YB6G1aHacEHGSs7kdKGje
 VoPZjqyrLQ0aDGlMZ3LvK4umoXKp7U5SAxMknnbAZolk2dXIxAXY4pspp41tbDSyzPXj
 4JooThBRgYoezosBe+UC0PZn23SHKwMIOwbSnwcixFyphJzDHZsCsKGtR4Bdpv3CwWWT
 4ryw==
X-Gm-Message-State: AOAM530s0AW9+LCAUvluAgLYEiWmf8dk3qzanUvGMyNYj63vxoWInyjW
 jV1KeP3t4EpPgKCOJ9P9JgMR3nNvZA3yI8JryeZRva1/wu98U5VkDD0tEBX4JYklqb2/1Js1QEJ
 Kv9F3miBdlp+Pz0Q=
X-Received: by 2002:aa7:db13:: with SMTP id t19mr664034eds.74.1612475842531;
 Thu, 04 Feb 2021 13:57:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx15m5QcJ69FB50P+IAsQ7BU2Tba/Ud6HpzY8gJMBlY84SALAcbUrY+nnDmcYcm7E9PFCphZQ==
X-Received: by 2002:aa7:db13:: with SMTP id t19mr664019eds.74.1612475842310;
 Thu, 04 Feb 2021 13:57:22 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id p10sm3090657edj.2.2021.02.04.13.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 13:57:21 -0800 (PST)
Subject: Re: [PATCH 01/33] migration: push Error **errp into
 qemu_loadvm_state()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <74407f84-c670-cc87-27fe-f3d9d38bda33@redhat.com>
Date: Thu, 4 Feb 2021 22:57:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
>  migration/migration.c |  4 ++--
>  migration/savevm.c    | 36 ++++++++++++++++++++----------------
>  migration/savevm.h    |  2 +-
>  3 files changed, 23 insertions(+), 19 deletions(-)
...

> diff --git a/migration/savevm.c b/migration/savevm.c
> index 6b320423c7..c8d93eee1e 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2638,40 +2638,49 @@ out:
>      return ret;
>  }
>  
> -int qemu_loadvm_state(QEMUFile *f)
> +int qemu_loadvm_state(QEMUFile *f, Error **errp)
>  {
>      MigrationIncomingState *mis = migration_incoming_get_current();
> -    Error *local_err = NULL;
>      int ret;
>  
> -    if (qemu_savevm_state_blocked(&local_err)) {
> -        error_report_err(local_err);
> -        return -EINVAL;
> +    if (qemu_savevm_state_blocked(errp)) {
> +        return -1;
>      }
>  
>      ret = qemu_loadvm_state_header(f);
>      if (ret) {
> -        return ret;
> +        error_setg(errp, "Error %d while loading VM state", ret);

Using error_setg_errno() instead (multiple occurences):
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +        return -1;
>      }
>  


