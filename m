Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388C030FFC5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 22:59:56 +0100 (CET)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7mfL-0006Ff-A6
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 16:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7meX-0005ow-Rv
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 16:59:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7meW-0000iB-BU
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 16:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612475943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8k/af6VuJ5C+sZeA+znOAkz+Yp9p0VdPmI5IQ1GvfwA=;
 b=B7kZ0to6IE3HQxRjaafd1prXBtbUmjyC8YYGG6rYA5MJUTrpc4X8mqw39qBiSNv3XK+FkZ
 pJJ9phY1nkESiCnFyn0Gtb29MyfM+8tOo3aY8WSQOpp3aZZz3jR8vB7zLyDdKQMB+nGu43
 uO7WCL07AE3mEue6yOrTcoZjCgFCqYA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-SPgU_jCnPPOiMw-wNIC7ng-1; Thu, 04 Feb 2021 16:59:01 -0500
X-MC-Unique: SPgU_jCnPPOiMw-wNIC7ng-1
Received: by mail-ed1-f70.google.com with SMTP id g2so4360804edq.14
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 13:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8k/af6VuJ5C+sZeA+znOAkz+Yp9p0VdPmI5IQ1GvfwA=;
 b=PE+7reNVkyHYDKYkB8WUgP8Ortb1t2MH80Vuzq5TmxT65XKmPFIlfG7ORliKJbapXK
 1uRHguWfIY/VV+K5u6ck1EpkiarwFAoUJtKgvuWvw7b4kfx7zHzzf59k33Jh4qAocfwc
 9guDAdsO76oQt2RAXAkSszJOYigc6spoZME2HaZ4sEVn/fjDW5B0fCG44teTn3Vcxu42
 PTqEYb0ii+q7UvYGMWi15Ao48D8o13Z6312Z/2sFKiBJQFuU8HKynn28AKSpaUz57qLb
 zpT94JX0KVRWAkUsyzgYpUeL/fN3p4hk1RMP2JvZpdSjjBauvmHxDAbIYJkMqqphi5Gb
 eTJg==
X-Gm-Message-State: AOAM533/Y+CA9EmOlWonQFJ72KBXb+x4/LLfWyGU+M1huiyl+bcjRVYZ
 pNSX1PlmR42U3dePvcVcFBLrBpQe+qVqJkXaLOpBNe4ji6DPvwe3mwc6hO7x+swG4r7fpQE2D1s
 PmeOOWEh+zDneLYo=
X-Received: by 2002:aa7:da19:: with SMTP id r25mr636952eds.1.1612475940604;
 Thu, 04 Feb 2021 13:59:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPrFiXforfbMrWMNzkuuasWg5aySV4t8eWIYvoYFP/DdHEawSdMjdbBIijxm8Z8nbke77q0A==
X-Received: by 2002:aa7:da19:: with SMTP id r25mr636930eds.1.1612475940426;
 Thu, 04 Feb 2021 13:59:00 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id s1sm3071439ejx.25.2021.02.04.13.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 13:58:59 -0800 (PST)
Subject: Re: [PATCH 02/33] migration: push Error **errp into
 qemu_loadvm_state_header()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-3-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3f135b3d-ebec-6a75-d2c1-72aa76a58a3f@redhat.com>
Date: Thu, 4 Feb 2021 22:58:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-3-berrange@redhat.com>
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
>  migration/savevm.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
...

>      if (migrate_get_current()->send_configuration) {
> -        if (qemu_get_byte(f) != QEMU_VM_CONFIGURATION) {
> -            error_report("Configuration section missing");
> +        v = qemu_get_byte(f);
> +        if (v != QEMU_VM_CONFIGURATION) {
> +            error_setg(errp, "Configuration section missing, %x != %x",
> +                       v, QEMU_VM_CONFIGURATION);
>              qemu_loadvm_state_cleanup();
> -            return -EINVAL;
> +            return -1;
>          }
>          ret = vmstate_load_state(f, &vmstate_configuration, &savevm_state, 0);
>  
>          if (ret) {
> +            error_setg(errp, "Error %d while loading VM state", ret);

error_setg_errno(), otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>              qemu_loadvm_state_cleanup();
> -            return ret;
> +            return -1;
>          }
>      }
>      return 0;


