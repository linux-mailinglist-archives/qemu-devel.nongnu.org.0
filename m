Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1488A30FFDA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 23:06:04 +0100 (CET)
Received: from localhost ([::1]:51634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7mlG-0001kM-Up
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 17:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7mjk-0001Cb-RU
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:04:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7mji-0002ij-Lx
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612476265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mm0NtvQy9YG8ImxHWDP25+if2CZfiwBShiQP8cxTxwc=;
 b=PVqY71we9vlRIM+wjr1jX2q0nBFh3iGIZrl9izGPjsid+1tcdo4jqPm6nA3/bi9nwpXgZ4
 ZZynsbGkgHYZh46IXzzynVyuqMeOh7AvdC55V264Aru9kX8wHl1x0BmQFgpMdgvJQJ6QOH
 Zle2LM3da/4rxRpd/SqhZc51zRxgEJs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-sFj_J8NcPsmZeIQSfNhu2A-1; Thu, 04 Feb 2021 17:04:23 -0500
X-MC-Unique: sFj_J8NcPsmZeIQSfNhu2A-1
Received: by mail-ed1-f70.google.com with SMTP id a26so4456626edx.8
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 14:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mm0NtvQy9YG8ImxHWDP25+if2CZfiwBShiQP8cxTxwc=;
 b=BS74gbeswltUVdtl67ZIHIb8m8Z0pcY35i6nT/1kVTPJyWMBduwY8f0oR50YGf4dFF
 YleKAZYoEZoxbWbvG290RPzHdtMVTlGOkXoIs9ep4OY1vw9E3P0hamnAGuz6SqjfLI6T
 Hx8t1l3YQeVqSLOxmf2HNweGgYhhHpySb16O1Dj0h+gldTgiIVM2AhwaxaWZo53Z8rFo
 tbm7tx53vM/qD78vM7Ij5YoDx02eEfWMh2596HXb9syYW4eNT4/zJupw49FYZZEZ5Jzh
 BiZnYA4IbLfx2n5t3QBKWj3odhThjUqERPdex9VmKrSJOlw5o4WyXZDqY1KEOfbD60Bq
 4GGw==
X-Gm-Message-State: AOAM531VFpefGx4ECuvAAEYIY/f86lyGcGs33F+FFa2mROfkbRKKqOdK
 9WG0EWODT9uqurJMixed8nOmpxb4q7OQ7ow3lhk3jTaiDrFEQUlUA45doQug6ToKkxH6ikKre5b
 Lv6eS09yKdgrbAJA=
X-Received: by 2002:a05:6402:149:: with SMTP id
 s9mr630184edu.247.1612476262605; 
 Thu, 04 Feb 2021 14:04:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaiKk8PP9ihgypX5Wb3EPJEx9oxLi1TzSf8r6TMLZM5yuBhSZgN0F8NN4HLhhbeAAKJauKiw==
X-Received: by 2002:a05:6402:149:: with SMTP id
 s9mr630167edu.247.1612476262371; 
 Thu, 04 Feb 2021 14:04:22 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id u18sm3060599ejc.76.2021.02.04.14.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 14:04:21 -0800 (PST)
Subject: Re: [PATCH 06/33] migration: push Error **errp into
 qemu_loadvm_section_start_full()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-7-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cd1ad5bd-6027-844c-7a98-f7a181e6d674@redhat.com>
Date: Thu, 4 Feb 2021 23:04:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-7-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> This is particularly useful for loading snapshots as this is a likely
> error scenario to hit when the source and dest VM configs do not
> match. This is illustrated by the improved error reporting in the
> QMP load snapshot test.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/savevm.c                            | 49 +++++++++----------
>  .../tests/internal-snapshots-qapi.out         |  3 +-
>  2 files changed, 25 insertions(+), 27 deletions(-)
...

>      instance_id = qemu_get_be32(f);
>      version_id = qemu_get_be32(f);
>  
>      ret = qemu_file_get_error(f);
>      if (ret) {
> -        error_report("%s: Failed to read instance/version ID: %d",
> -                     __func__, ret);
> -        return ret;
> +        error_setg(errp, "Failed to read instance/version ID: %d",
> +                   ret);

error_setg_errno()

> +        return -1;
>      }
...

> @@ -2601,11 +2603,8 @@ retry:
>          switch (section_type) {
>          case QEMU_VM_SECTION_START:
>          case QEMU_VM_SECTION_FULL:
> -            ret = qemu_loadvm_section_start_full(f, mis);
> +            ret = qemu_loadvm_section_start_full(f, mis, errp);
>              if (ret < 0) {
> -                error_setg(errp,
> -                           "Failed to load device state section start: %d",
> -                           ret);

Ditto.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>                  goto out;
>              }
>              break;


