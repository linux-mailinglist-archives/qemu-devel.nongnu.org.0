Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344F847BBF7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:38:21 +0100 (CET)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzaf6-0004ar-1g
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:38:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzady-0003vt-7J
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:37:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzadw-0004TU-Po
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640075828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6HGe2iHzKLJq0WSa6S9ZAjcDctXFSBqUyHHxuZkkhM=;
 b=K3Wn4zi5qf4On1p913S7LsPsfsd7wAs/Y5NKRSc0DouBOvsgWuYxr74iUDaYjxsujTT5Bi
 q/PIPpfhuJonqk9tXfOGBKi1XlUU4lfo427xg4Qky2H7fv/2hWVs3vfMFf1/rBzeODpNDh
 fu2hzJxFbSjz8F/DG2E8dgfyKfIvsxs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-sgjN0HONN6G1pKljSWZI9w-1; Tue, 21 Dec 2021 03:37:05 -0500
X-MC-Unique: sgjN0HONN6G1pKljSWZI9w-1
Received: by mail-wm1-f69.google.com with SMTP id
 b75-20020a1c804e000000b0034569bde713so921289wmd.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 00:37:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k6HGe2iHzKLJq0WSa6S9ZAjcDctXFSBqUyHHxuZkkhM=;
 b=ZPota2duMvHSA7z6sORvKvbyLTE0TTBMkX/umxNnROQTSEhrTQxxrqxxwomzYYIEvp
 EMM/YyBe+1hjqcd1q7g5wTmdaLvtEDUUckkSVtWGjSmeOSFXLV7gY+WpFrhf3WZpUNet
 CEiOW0OlYSYX3dEjZRGxk/7wjXrHZ3eg6FvQ2Ooy5J2dG7ySJNMijBEKC2wXv7QiT4ek
 VnlhVnh7kYSq9ZOM16vWDCJuoLB9eVbMbs88IdUvqHtcNeXnhMy0uyvmnFCm83ud3Pia
 Vct4EYXAuiasSYi9vrUNihFmP9bmgdmBclbU+Ez2KiSh6BidzJdsWI/a5NZbaznSvIWV
 BCuQ==
X-Gm-Message-State: AOAM532vGzdigzPBgNqWM91VBOIeFDShJCY+nHOnNVt1qvxngFbUSOml
 5B4sjtvqpySUO58hwYAdIHWGoaj/7BkUZ08JySaltGzb3ah2KiRfx2CuomOH7aTOFBfpkLmJxGr
 gx7/ogHAUW+W0khs=
X-Received: by 2002:a5d:548a:: with SMTP id h10mr1708332wrv.221.1640075823157; 
 Tue, 21 Dec 2021 00:37:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeYrcEtRmaYzvtvuJiWwjlsyyfRvgmm6e04G/KvBp6cVESBUQFLDn6+TVPF/2d+3It0yOcMQ==
X-Received: by 2002:a5d:548a:: with SMTP id h10mr1708315wrv.221.1640075822939; 
 Tue, 21 Dec 2021 00:37:02 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id e4sm17091592wrh.56.2021.12.21.00.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 00:37:02 -0800 (PST)
Message-ID: <3a5ead42-0dbb-2dd0-7a71-9daa9e1aaa80@redhat.com>
Date: Tue, 21 Dec 2021 09:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC v2 1/2] migration: Introduce ram_transferred_add()
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20211220093413.1383190-1-david.edmondson@oracle.com>
 <20211220093413.1383190-2-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211220093413.1383190-2-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 10:34, David Edmondson wrote:
> ...and use it.

FYI Not all mails readers / git tools display subject along
with content, so it is more helpful to rewrite the subject.

> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  migration/ram.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 57efa67f20..bd53e50a7f 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -386,6 +386,11 @@ uint64_t ram_bytes_remaining(void)
>  
>  MigrationStats ram_counters;
>  
> +static void ram_transferred_add(uint64_t bytes)
> +{
> +    ram_counters.transferred += bytes;
> +}

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


