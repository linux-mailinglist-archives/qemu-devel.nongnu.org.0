Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756B53A6FF3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:14:19 +0200 (CEST)
Received: from localhost ([::1]:36708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssyQ-0008PX-He
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsswX-0005fd-Hh
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsswR-0004Ri-1P
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623701534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rkMd05i5hI8kT08ek2RX1FQOa/GFsYub2T3HWuU5gus=;
 b=Lbt7ywzIotUHPFx/qs36KL4pvSZiUBpSpkdPxCO0qVB9/24YBwvGLhLwXJf86GvPZ+JtT3
 0D88IK6nTWzdn5HUaFsLtOjXyncOsj0/tmXGERRpNqD45C1Ag2KVnOESeZ7Y8xtV/zQccS
 13OfK54sxoigr9e+0YDEtELl5lDIcKs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-BJbUR7X5M8yTx_Y8BrlHjA-1; Mon, 14 Jun 2021 16:12:10 -0400
X-MC-Unique: BJbUR7X5M8yTx_Y8BrlHjA-1
Received: by mail-wr1-f71.google.com with SMTP id
 e9-20020a5d6d090000b0290119e91be97dso7535904wrq.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rkMd05i5hI8kT08ek2RX1FQOa/GFsYub2T3HWuU5gus=;
 b=oQIgYqz+REPGs9MgQiiohafqkfHrBuXPGThQ5LCRX2GXdvVtyv7xkWL1eSLsKRNT/4
 FlIsSF3hNxbwqK6fiu0314ec1j3vAthpewVwwHRO9UShKB/y5UPVXISgymm/FT/9n52W
 sTSc0aGxT5SJaOOvXKBrWi9cVXu1DVvFEH1+umF6rHb6dKxYMrIq8B/cmjgaUldWsKBN
 w04FNaGYiZilTu+fpxzHaISqM1jLmKz6YBrBOTrqQ2m+1u6E6hbvhuxZ/azHdqTTYCZr
 sF3YUrnjO9CuOSWaVWs5T3yR1TEit3Zf3MzzYdBnd2IyLyc+JxeIak/grdMmbYITeVxW
 Zwag==
X-Gm-Message-State: AOAM533LhadH1UfsSDPZu1DWUrz3abnH7P85u61gtg9dmEXDbjCK3E7d
 wPrQh9zZAAHnzbQDV9qX47mIP5Az1gqF+BBGZ891m/TkOsJ8hSjmOzIwmhDWdS3JCdLfLdOGf3q
 ZnTHuJHbHfePglfY=
X-Received: by 2002:a5d:474d:: with SMTP id o13mr20248104wrs.176.1623701529515; 
 Mon, 14 Jun 2021 13:12:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwq1r/mo57P8wCvJS+L4RlojEc0rGX3NP9xiQPjZkfMYaizqxCnJLGPsiRAX3V6AIiLyQxMhQ==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr20248078wrs.176.1623701529248; 
 Mon, 14 Jun 2021 13:12:09 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p10sm16416359wrr.33.2021.06.14.13.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 13:12:08 -0700 (PDT)
Subject: Re: [PATCH v3 5/5] tpm: Return QMP error when TPM is disabled in build
To: qemu-devel@nongnu.org
References: <20210614200940.2056770-1-philmd@redhat.com>
 <20210614200940.2056770-6-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <270e0d89-f074-0713-6871-6e4a21791494@redhat.com>
Date: Mon, 14 Jun 2021 22:12:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614200940.2056770-6-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 10:09 PM, Philippe Mathieu-Daudé wrote:
> When the management layer queries a binary built using --disable-tpm
> for TPM devices, it gets confused by getting empty responses:
> 
>   { "execute": "query-tpm" }
>   {
>       "return": [
>       ]
>   }
>   { "execute": "query-tpm-types" }
>   {
>       "return": [
>       ]
>   }
>   { "execute": "query-tpm-models" }
>   {
>       "return": [
>       ]
>   }
> 
> To make it clearer by returning an error:
> - Make the TPM QAPI schema conditional
> - Adapt the HMP command
> - Remove stubs which became unnecessary
> 
> The management layer now gets a 'CommandNotFound' error:
> 
>   { "execute": "query-tpm" }
>   {
>       "error": {
>           "class": "CommandNotFound",
>           "desc": "The command query-tpm has not been found"
>       }
>   }
> 
> Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qapi/tpm.json      | 28 +++++++++++++++++++---------
>  monitor/hmp-cmds.c |  4 ++++
>  stubs/tpm.c        | 25 -------------------------
>  stubs/meson.build  |  1 -
>  4 files changed, 23 insertions(+), 35 deletions(-)
>  delete mode 100644 stubs/tpm.c

Grrrr I forgot to commit:

-- >8 --
diff --git a/MAINTAINERS b/MAINTAINERS
index 7d9cd290426..636bf2f5365 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2707,7 +2707,6 @@ TPM
 M: Stefan Berger <stefanb@linux.ibm.com>
 S: Maintained
 F: tpm.c
-F: stubs/tpm.c
 F: hw/tpm/*
 F: include/hw/acpi/tpm.h
 F: include/sysemu/tpm*
---


