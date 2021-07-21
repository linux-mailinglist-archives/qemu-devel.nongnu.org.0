Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D2C3D147D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:48:10 +0200 (CEST)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6FOD-0008Kw-W0
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6FML-0007bV-Lr
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:46:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6FMJ-0008E3-EO
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626885970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XA7FWesAoD65P8HaaeKCSwd74Xu3hlmzXV6vTQVaokI=;
 b=I/Q3ysmLv+mUhIKIwU+jkhSUuos/xpPM/WUkr0+WphLCrkvpUa4NJp2VxZmTff6VwkM+zT
 Z4F+wYhmxscbDBXPeST2PTMgavYfV0/mqw3uw+BP+tpJJ859GzlQftTfiY/jtzXdbZ5h3l
 GPicHjyssZO9my1TX6/DD4YrwG3AGCc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-4fPqtFf8PXCAutoeCB3Yhg-1; Wed, 21 Jul 2021 12:46:08 -0400
X-MC-Unique: 4fPqtFf8PXCAutoeCB3Yhg-1
Received: by mail-ej1-f70.google.com with SMTP id
 rl7-20020a1709072167b02904f7606bd58fso1021517ejb.11
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XA7FWesAoD65P8HaaeKCSwd74Xu3hlmzXV6vTQVaokI=;
 b=b9puTIuxm06l6ymz1B4F+M2V58z3lYFX2DO7qKHD9uh5HxYYj80YeiW6e+KyH9Hxio
 F+Zv1ZFkf5Y+yviqTQzK+OqxYcSXI7Mq5LRoIdguDzghgwAcjgiKsuQmVh+fAJOv+hQy
 wRBroeFiPJL6ib5IeRArci4JzS8qN4004h7m2oRPtPibyC9+OZpN6Ze8pP3m+gtcZocm
 UOJFtgXFx94yi/TPc4mbwPWrYxeo+K/G86nBnE18Fij31BTPTH0vpEtS9wYS2C3tScRK
 58dpKbEBqir6nbL867w/1zM+UkSnWqiDuKq+rpqNfIZG6TAkr/FErJNXAFRX/BUQYSJM
 0TxQ==
X-Gm-Message-State: AOAM532vwgSLs5Ixe7JW6++nrg01DHVYUBcEic6xTtkBt5/HrbhOLwtt
 +WV6wUBA46jNiICnwLpQzj9uTNM1w2V5bEUK0c3MSAJn8rI7zKsXeDyi6qB/zDigY7jTCIbe2Cy
 k2ubAo4+HYozbPswOxJFEKDuCvsZKzXyJUU27nMHRzVRo79iq+KrjOEn14RpfNuL22yE=
X-Received: by 2002:a17:907:207b:: with SMTP id
 qp27mr39695580ejb.258.1626885967135; 
 Wed, 21 Jul 2021 09:46:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6RYNlmPQQat0XrRiA7fwxer8cdHtXR/a9QmwB4Aont3whNOdkU2l7za4qCH7dAH8euQwFqw==
X-Received: by 2002:a17:907:207b:: with SMTP id
 qp27mr39695555ejb.258.1626885966856; 
 Wed, 21 Jul 2021 09:46:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z10sm8464201ejg.3.2021.07.21.09.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 09:46:06 -0700 (PDT)
Subject: Re: [PATCH for-6.1] qemu-config: restore "machine" in
 qmp_query_command_line_options()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210721151055.424580-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <03a42c38-6524-f2e0-db3f-c863e4d6b616@redhat.com>
Date: Wed, 21 Jul 2021 18:46:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721151055.424580-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/21 17:10, Stefan Hajnoczi wrote:
> Commit d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 ("vl: switch -M parsing
> to keyval") stopped adding the "machine" QemuOptsList. This causes
> "machine" options to not show up in QMP query-command-line-options
> output. For example, libvirt cannot detect that kernel_irqchip support
> is available.
> 
> Adjust the "machine" opts enumeration in
> qmp_query_command_line_options() so that options are properly reported.
> 
> Fixes: d8fb7d0969d5 ("vl: switch -M parsing to keyval")
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> I'm not familiar with this code. Better solutions welcome!
> ---
>   util/qemu-config.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index 84ee6dc4ea..52db5e743c 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -255,8 +255,6 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
>               info->option = g_strdup(vm_config_groups[i]->name);
>               if (!strcmp("drive", vm_config_groups[i]->name)) {
>                   info->parameters = get_drive_infolist();
> -            } else if (!strcmp("machine", vm_config_groups[i]->name)) {
> -                info->parameters = query_option_descs(machine_opts.desc);
>               } else {
>                   info->parameters =
>                       query_option_descs(vm_config_groups[i]->desc);
> @@ -265,6 +263,13 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
>           }
>       }
>   
> +    if (!has_option || !strcmp(option, "machine")) {
> +        info = g_malloc0(sizeof(*info));
> +        info->option = g_strdup("machine");
> +        info->parameters = query_option_descs(machine_opts.desc);
> +        QAPI_LIST_PREPEND(conf_list, info);
> +    }
> +
>       if (conf_list == NULL) {
>           error_setg(errp, "invalid option name: %s", option);
>       }
> 

Given that there's an "if" either way, I guess it's easiest to do it 
this way.  It may be even be possible (later) to build the info from the 
MachineClass properties instead.

Queued, thanks!

Paolo


