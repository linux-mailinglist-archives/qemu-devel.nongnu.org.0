Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C51B310DC7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:22:53 +0100 (CET)
Received: from localhost ([::1]:42076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83si-0004CI-In
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83oV-0001k8-5T
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83oS-0002vh-KG
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612541908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56UTV0JY/EvIJYvksWHkJ62fo1QmetVobOtRlnWYg8M=;
 b=SE4FxumJ5Ck7AV8xeYhuwund7/NHKXyPkg+j+5ciiWZ/n/IzrXWFUuNg8gRGeKvflYTqLs
 woO8qQvZJBTMM5WED+BrWzBzbH+h/1lhN6a9Hk5MlwRdiyZFnI9V8gf8t1FtM9scGmjn6B
 56OjQwg91I89bOntnsnTKpygxVt0pWA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-e-AJoqG-OTS3PKk4C48BvQ-1; Fri, 05 Feb 2021 11:18:25 -0500
X-MC-Unique: e-AJoqG-OTS3PKk4C48BvQ-1
Received: by mail-ed1-f70.google.com with SMTP id l23so4565051edt.23
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=56UTV0JY/EvIJYvksWHkJ62fo1QmetVobOtRlnWYg8M=;
 b=HLP7JHGBf2lHirYdB6YFNuu37/fSLY8/dG1Gw6xuQ2GrqUoYxvlzbig8b4k/Hi6wsL
 1OOLLd1V18jivb5AOc0Byrf1i9MllHi1FTyl2/5v0ZY7xNoGTN6lnSxT2rR4db93cD1x
 Gm/RnPGGI6Xh+d1jJJa1ycuowe+MqX0H1zs+sArvKtiJEED4nwSO30ZYYGA7PKtQEy/1
 mNcqJELd2I5mMprwmhOC/sjrXYShhOlwe93LNZxOBABdx9/RsGSsdkx7CzwgGsT9IriQ
 I/lQNhtPKj9dTyEN5wMPlpvvOpDh9wz8MjQ/JcYVdZDLK+xke5dmK/u1Kdv9/1FNe11v
 I2bQ==
X-Gm-Message-State: AOAM530s/uwpIimiw/W4LNoObpzMaSAr74SneX+7B5WM4Q+++I24vFov
 0Meu1TVOEeq4e2GrUJBCOpWfcoM09q7ePoSonl4CnM1aLNUcTKVicQBPCIocF1WFVQwaC6JIam/
 9Ep4uAeYmoProQkc=
X-Received: by 2002:a17:906:d189:: with SMTP id
 c9mr4856784ejz.36.1612541904505; 
 Fri, 05 Feb 2021 08:18:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwddTk/rbQMNxFxtLhhlLL2djoFByDUz7FxwaMUEFx0VdDmS265tAAfFXwIbFcz3ta6N6+vkw==
X-Received: by 2002:a17:906:d189:: with SMTP id
 c9mr4856768ejz.36.1612541904369; 
 Fri, 05 Feb 2021 08:18:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id di27sm2335194edb.21.2021.02.05.08.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:18:23 -0800 (PST)
Subject: Re: [PATCH 08/33] migration: push Error **errp into
 loadvm_process_command()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-9-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2e42662e-61df-707b-1b5e-027a08d4279b@redhat.com>
Date: Fri, 5 Feb 2021 17:18:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-9-berrange@redhat.com>
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
>  migration/savevm.c | 87 ++++++++++++++++++++++++++++++++++------------
>  1 file changed, 64 insertions(+), 23 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 350d5a315a..450c36994f 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2223,34 +2223,37 @@ static int loadvm_process_enable_colo(MigrationIncomingState *mis)
>   * Process an incoming 'QEMU_VM_COMMAND'
>   * 0           just a normal return
>   * LOADVM_QUIT All good, but exit the loop
> - * <0          Error
> + * -1          Error
>   */
> -static int loadvm_process_command(QEMUFile *f)
> +static int loadvm_process_command(QEMUFile *f, Error **errp)
>  {
>      MigrationIncomingState *mis = migration_incoming_get_current();
>      uint16_t cmd;
>      uint16_t len;
>      uint32_t tmp32;
> +    int ret;
>  
>      cmd = qemu_get_be16(f);
>      len = qemu_get_be16(f);
>  
>      /* Check validity before continue processing of cmds */
>      if (qemu_file_get_error(f)) {

Eventually assign 'ret' and use it here

> -        return qemu_file_get_error(f);
> +        error_setg(errp, "device state stream has error: %d",
> +                   qemu_file_get_error(f));

and here.

> +        return -1;
>      }
>  
>      trace_loadvm_process_command(cmd, len);
>      if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {
> -        error_report("MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
> -        return -EINVAL;
> +        error_setg(errp, "MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
> +        return -1;

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>      }


