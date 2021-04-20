Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F536599D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 15:15:27 +0200 (CEST)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYqDu-00036l-N9
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 09:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYqAy-0001Dc-UC
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:12:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYqAv-0001W9-Ui
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618924340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0FSe9Jv/quV/gKjVFzle4nzLnukcBqd5whnLYc8Mzk=;
 b=ftJz2EVUR6bYTkF8zKRQzPIFkEy86yus1Rfe57CMVFav0ejIOpS26plfIWIqU0grs0RuRA
 PiJNq1YWqZCK5xHHpKwj0sfsnU1Z1pIK+f29kIUnTY5+VizQrZkhNmuCIICzTtqVHPF85P
 VzWHLRz6rw7tuvHdTfArnlVcxibs6Y0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-w1yLoXNPOES2zdOgOhz7QQ-1; Tue, 20 Apr 2021 09:12:18 -0400
X-MC-Unique: w1yLoXNPOES2zdOgOhz7QQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 j4-20020adfe5040000b0290102bb319b87so10857731wrm.23
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 06:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k0FSe9Jv/quV/gKjVFzle4nzLnukcBqd5whnLYc8Mzk=;
 b=VLQ8QqDKmXi6UjXjsCpnUq5GsQGwT4zJg1Wtyppc2l9IyS6LWEoyIl9JkWQuW2KAtr
 TwA7DPAw/Zrm9F3u7b/EspGcLq11pgfcCw0gG39rETTgg+vR5hKMaP80iAjNiAzp0Jz3
 bqGNpArsewWquDqy+zVuvIl4E0F0tGUEYdFwg0OUVh19/XauMlrSX+VnByIxEs3RyXFf
 DwCEaVkjqcgyql0N8yMR4zj+tP+XSp9g7YxhbqxfKqEKk1ijMvIlKlgmmGRVUIxWRM+F
 K+EGgLiWZeZ+gMea40Vfp83IaHtv5JrDnHHJyusDXwec83ItDjwWJog0Fi8u49z0NNJa
 Z9vQ==
X-Gm-Message-State: AOAM5335oE0qzjr0LBswIGFOHoaYeBgE6oIEA6ApBumAV0n2GboDkDuE
 hn0lNJKpiv7lyocmz42kWFA4nR0PKT5r3fHYa6yekCpKCWKFFX79vcPJd6oqxzyeVGxmk9NfBOc
 446FVGaw0W9U+Rd0=
X-Received: by 2002:a05:6000:180b:: with SMTP id
 m11mr20694630wrh.355.1618924336966; 
 Tue, 20 Apr 2021 06:12:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ0SusQkfib4NmKKObnRlGIHQtCt6Rg4NR82u7uPdqt5AJibmRdzG0enYcXhHOGnc4VWcCPQ==
X-Received: by 2002:a05:6000:180b:: with SMTP id
 m11mr20694599wrh.355.1618924336790; 
 Tue, 20 Apr 2021 06:12:16 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s10sm27211625wrt.23.2021.04.20.06.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 06:12:16 -0700 (PDT)
Subject: Re: [PATCH for-6.0?] qga: fix guest-get-disks regression
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210420125831.233092-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cc5b1a9f-dc68-b336-e281-41ca33e85286@redhat.com>
Date: Tue, 20 Apr 2021 15:12:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420125831.233092-1-marcandre.lureau@redhat.com>
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
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 2:58 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Commit 54aa3de72 ("qapi: Use QAPI_LIST_PREPEND() where possible")
> inadvertently removed the has_dependencies from the partition disk
> info, resulting in empty list being returned.
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1950833
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/commands-posix.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 4299ebd96f..75dbaab68e 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1376,6 +1376,7 @@ static GuestDiskInfoList *get_disk_partitions(
>          partition = g_new0(GuestDiskInfo, 1);
>          partition->name = dev_name;
>          partition->partition = true;
> +        partition->has_dependencies = true;
>          /* Add parent disk as dependent for easier tracking of hierarchy */
>          QAPI_LIST_PREPEND(partition->dependencies, g_strdup(disk_dev));
>  

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


