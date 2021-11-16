Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AE04535D0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:30:34 +0100 (CET)
Received: from localhost ([::1]:47878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0Pm-0001bD-2b
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:30:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn0O2-0000FZ-VO
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:28:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn0O0-0004E2-6z
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637076518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYQN9I70gjsFE5Naqa2HU/h8w6OlAwkKbYGsjtVq6nA=;
 b=R8p1twqzTE5iLARiqESHX3fIUTIP8adtUDlWe9ztw5DCV1jHty/jmDdNtpIGK6l/lF5nl5
 0yNEphXttKWBU2OgmB33y8TPrhgALM5wOW+rWrmtSYUTlfLOXHprkEfiD4rd/X6yypQV5I
 ZPiiP5GX7o7AgQEPmw4l0Tj/htOuUYE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-rIUPZ3Y6OeqcwxuJXmYkpg-1; Tue, 16 Nov 2021 10:28:37 -0500
X-MC-Unique: rIUPZ3Y6OeqcwxuJXmYkpg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r129-20020a1c4487000000b00333629ed22dso1360807wma.6
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 07:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UYQN9I70gjsFE5Naqa2HU/h8w6OlAwkKbYGsjtVq6nA=;
 b=B0NXOTcs9+EZYRwpbhvXWSf3h2fRY7I6MrQLtKt3hj+w+JSYffwuypeQvLRzwk9ioq
 evv+9LvG5rlVv9igcfSuzkQIBOwsN24dq2+vpP9gM7ZtOF7tkFuQhGKIV6e7zNvKski7
 H91w8+wOXm+NWMOH5Zc23FwdoVBz0URWsD+ajhh1kfEYkpXEDXgkQkmuIy9+fg6lzeb1
 eqBhq9nxeg46qCIyl0utIG5/ehyi2PbJKU7fzXNxV3KmElKa+ev9PXLSTQ6ryvLPOBit
 Rv5IfYxGiXPL2/doi6L8CMVEuB/ZVrHrKZXhcfjxaHfu4PqcHnWWVzUakHtbiO3j8S4S
 mRbg==
X-Gm-Message-State: AOAM533583Xv7Jsh5UuDKzq7ufNcJKDFdtwsdxKTl7S2P4G9zMF9Mr6E
 tYY8SB/7RDKKVbvQIRl6myLnykB0/j0RHZ1wUxe/diPcbMyK/ODlrcqU93k9U8GFepU7sZ4lSUU
 7t0iQ/aQVDz7mtFc=
X-Received: by 2002:adf:e2c5:: with SMTP id d5mr10551318wrj.338.1637076516111; 
 Tue, 16 Nov 2021 07:28:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyF815fmFuY8bG7dsEGyu346D4qU2PxLAXuM2xLKBP7NcVm/OObn1MwERjTAqvhG73N6sbKbg==
X-Received: by 2002:adf:e2c5:: with SMTP id d5mr10551281wrj.338.1637076515927; 
 Tue, 16 Nov 2021 07:28:35 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f12sm3586100wmq.0.2021.11.16.07.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 07:28:35 -0800 (PST)
Message-ID: <2ced2fae-2ffd-3a70-f02c-175662baf7bc@redhat.com>
Date: Tue, 16 Nov 2021 16:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] fw_cfg: Fix memory leak in fw_cfg_register_file
To: Miaoqian Lin <linmq006@gmail.com>, Qiushi Wu <wu000273@umn.edu>
References: <20211116114233.29462-1-linmq006@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211116114233.29462-1-linmq006@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gabriel Somlo <somlo@cmu.edu>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, linux-kernel@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 12:42, Miaoqian Lin wrote:
> When kobject_init_and_add() fails, entry should be freed just like
> when sysfs_create_bin_file() fails.
> 

Fixes: fe3c60684377 ("firmware: Fix a reference count leak.")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/firmware/qemu_fw_cfg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
> index 172c751a4f6c..0f404777f016 100644
> --- a/drivers/firmware/qemu_fw_cfg.c
> +++ b/drivers/firmware/qemu_fw_cfg.c
> @@ -608,6 +608,7 @@ static int fw_cfg_register_file(const struct fw_cfg_file *f)
>  				   fw_cfg_sel_ko, "%d", entry->select);
>  	if (err) {
>  		kobject_put(&entry->kobj);
> +		kfree(entry);
>  		return err;
>  	}
>  
> 


