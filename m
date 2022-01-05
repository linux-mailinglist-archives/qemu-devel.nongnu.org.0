Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE646485340
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:10:01 +0100 (CET)
Received: from localhost ([::1]:51796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n563F-00077N-30
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:10:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55jM-0001QY-Ls
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:49:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55jH-0002j3-5h
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641386962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l54upy0xOuvwAUk+b5MHJujTtwZDYexksRC4Aw8uU8M=;
 b=ax3VRxNYFBWfqIHSffm43A4T+Jxlix7WTgxEI04ewCn4WeyuP1ZHwj50oP8yypE7xfUbLt
 fDwk/M7frSDVUwZOhLLh9uqQPXjhF/k5qQFvCDB3SSZPs2UYJucidJqdsK1LzeVuOHRkES
 OFkuWAJDPN6aV7Vp0MznY8Zbriqkks8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-AAFYaXuHMryeZ5UIHt4Q2w-1; Wed, 05 Jan 2022 07:49:19 -0500
X-MC-Unique: AAFYaXuHMryeZ5UIHt4Q2w-1
Received: by mail-wr1-f71.google.com with SMTP id
 q2-20020adfab02000000b001a3ed59eb96so488424wrc.20
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 04:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l54upy0xOuvwAUk+b5MHJujTtwZDYexksRC4Aw8uU8M=;
 b=TtrtW1L21zr/EIudjZvaFkwFon6fcZvcENCg5oy9h4KYv/ah6qMgw0h0ddm1rj/rxz
 3YmmpgEBpRvDqZAYWGdDDb+O4qm3h79UXGoSoTJvbxurae7WdbwrFHSwXR57eMSInWF+
 PvW6Ibv+jdP23DqItmNJ6xPVuUxkNCbR09l7HprnyRwlieYVUnvKUEUDT7pAI+cyj0tR
 SMSJvnwrY6ghmS0aRPX19DCB6Rw9H8CDWvVY5DkvH977eNjvnVTH+Z/qdxmm6uoLbGMc
 aJ/rpMjgqmmE6NeDfzdmxAmc+sPEX4ZJ9hrw7AeZ7+FNM8t8zcwXGxOCJwSLLbo8hJul
 86Og==
X-Gm-Message-State: AOAM531dkOaFFC1RQNeXSpI9A4aTQO4m86Pn3rXigRY1ajR27VDFwIvN
 /Dk46eqRvGFWsUsU6tL9+CbmDsdmP+f4deyf3y6S/w8oPh/uoArbJ2nnT8Ew/V4HSSpB3Kerdmr
 XnDJ0H3oHGcyIlP0=
X-Received: by 2002:adf:e291:: with SMTP id v17mr45599884wri.479.1641386958057; 
 Wed, 05 Jan 2022 04:49:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMjhBy9fLi+fWYAPu/oluJ18SrDqYuvdyV+nFGDS9J0NaXQxeuLn7l/CXTWzL95UZSog5dyw==
X-Received: by 2002:adf:e291:: with SMTP id v17mr45599868wri.479.1641386957832; 
 Wed, 05 Jan 2022 04:49:17 -0800 (PST)
Received: from [10.33.192.229] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id m35sm5601247wms.1.2022.01.05.04.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 04:49:17 -0800 (PST)
Message-ID: <eb6bd2ef-6291-5125-3edf-428d049d9d78@redhat.com>
Date: Wed, 5 Jan 2022 13:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/1] softmmu: fix device deletion events with -device JSON
 syntax
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220105123847.4047954-1-berrange@redhat.com>
 <20220105123847.4047954-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220105123847.4047954-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2022 13.38, Daniel P. Berrangé wrote:
> The -device JSON syntax impl leaks a reference on the created
> DeviceState instance. As a result when you hot-unplug the
> device, the device_finalize method won't be called and thus
> it will fail to emit the required DEVICE_DELETED event.
> 
> A 'json-cli' feature was previously added against the
> 'device_add' QMP command QAPI schema to indicated to mgmt
> apps that -device supported JSON syntax. Given the hotplug
> bug that feature flag is no unusable for its purpose, so
> we add a new 'json-cli-hotplug' feature to indicate the
> -device supports JSON without breaking hotplug.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/802

We're mostly using "Fixes:" to refer to previous commit IDs, and "Resolves:" 
for referring to bugs in the gitlab issue tracker, so in case you respin, 
I'd suggest to replace it (but both keywords should work to close issues, so 
it's just a cosmetical thing).

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   qapi/qdev.json                 |  5 ++++-
>   softmmu/vl.c                   |  4 +++-
>   tests/qtest/device-plug-test.c | 19 +++++++++++++++++++
>   3 files changed, 26 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


