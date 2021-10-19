Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4884432C60
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 05:42:53 +0200 (CEST)
Received: from localhost ([::1]:51580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcg1c-0007S1-4x
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 23:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcfzp-0006IQ-Je
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 23:41:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcfzn-0001ty-AE
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 23:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634614858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWGToqfYKofAzmWBhOd25LAvyVI/vfymNyhXszVB4+E=;
 b=HWvbSxJ2QBy2EI7J57cnQye3wVmZwiJg09J8ftMkuxKD45K8EpQQRFbS0dT6pQLUY67wuN
 TAi0khhYSW8l9tsBqpo9ZmePDHfWusO7CDo6gKewlBaBy8rbqnBBlXIsa3eNIlTmxHih1s
 A4f9ndFivFkHBOYjJu/ZlJn1skzmEF8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-bsBtouFWNCe2mpk-cU-4Og-1; Mon, 18 Oct 2021 23:40:16 -0400
X-MC-Unique: bsBtouFWNCe2mpk-cU-4Og-1
Received: by mail-wr1-f70.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso9606677wrg.7
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 20:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uWGToqfYKofAzmWBhOd25LAvyVI/vfymNyhXszVB4+E=;
 b=51lhmUMDdqq+sU6dpt8T7HJEToXVmh2pyy+ZUubT4Bupk/L39SmrtWuynmdOYcRjkP
 QIvoPlA2a2zlTTMctz4QN7f3TUe6JFqOqWpncjruDB5Zh+THSkXOQfNb6B9c+a4iDI5N
 oKdDOhH/e2XJNgYjs0JKBHD3sZ9+XOOT28ZnidmkdErcI6cuCdii/6ZlSPL5co98UZ3H
 xr0xOWSic5KwFeXAcyYcyTO7xaB/Lv31TCdS2ODEJGJggV8QwZVc/T4D2CU9utSP0GT9
 fnjGEf2y3wcLaU7+ByqxurWe9ZKPH3pIOPI7DzrQRqfz/S6l7D8SU505Wa14bNQA0BuV
 8T3g==
X-Gm-Message-State: AOAM531tVIh6uaFr8w8KDMQzs2RwL+8l/Ma/EhkNLpy8H9soysn5UTbu
 yoddktxgAKWpfERGhqnJxZ6qrfMfzHSSkowb5YKpckAplHAlDzfLVqbCl+pvWQS3y4RGjis+1em
 u2Kw6vcEBpX4YjWc=
X-Received: by 2002:adf:aad0:: with SMTP id i16mr41245253wrc.128.1634614815801; 
 Mon, 18 Oct 2021 20:40:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwthRhn3Tnt8YRn21xR5f7KJtxQnBSnzzlnG5XpbDqfrgs13UO1SXNg7rPW85ACsMdB8v+/WA==
X-Received: by 2002:adf:aad0:: with SMTP id i16mr41245231wrc.128.1634614815541; 
 Mon, 18 Oct 2021 20:40:15 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id s9sm1016362wmj.39.2021.10.18.20.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 20:40:14 -0700 (PDT)
Message-ID: <3fee8956-34e5-435d-7a99-f3eb95c649f9@redhat.com>
Date: Tue, 19 Oct 2021 05:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] block/file-posix: Fix return value translation for AIO
 discards.
To: Ari Sundholm <ari@tuxera.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20211018180753.2436008-1-ari@tuxera.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211018180753.2436008-1-ari@tuxera.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Emil Karlson <jkarlson@tuxera.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Stefan

On 10/18/21 20:07, Ari Sundholm wrote:
> AIO discards regressed as a result of the following commit:
> 	0dfc7af2 block/file-posix: Optimize for macOS
> 
> When trying to run blkdiscard within a Linux guest, the request would
> fail, with some errors in dmesg:
> 
> ---- [ snip ] ----
> [    4.010070] sd 2:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK
> driverbyte=DRIVER_SENSE
> [    4.011061] sd 2:0:0:0: [sda] tag#0 Sense Key : Aborted Command
> [current]
> [    4.011061] sd 2:0:0:0: [sda] tag#0 Add. Sense: I/O process
> terminated
> [    4.011061] sd 2:0:0:0: [sda] tag#0 CDB: Unmap/Read sub-channel 42
> 00 00 00 00 00 00 00 18 00
> [    4.011061] blk_update_request: I/O error, dev sda, sector 0
> ---- [ snip ] ----
> 
> This turns out to be a result of a flaw in changes to the error value
> translation logic in handle_aiocb_discard(). The default return value
> may be left untranslated in some configurations, and the wrong variable
> is used in one translation.
> 
> Fix both issues.

Worth including:

Cc: qemu-stable@nongnu.org
Fixes: 0dfc7af2b28 ("block/file-posix: Optimize for macOS")

> Signed-off-by: Ari Sundholm <ari@tuxera.com>
> Signed-off-by: Emil Karlson <jkarlson@tuxera.com>
> ---
>  block/file-posix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 53be0bdc1b..6def2a4cba 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1807,7 +1807,7 @@ static int handle_aiocb_copy_range(void *opaque)
>  static int handle_aiocb_discard(void *opaque)
>  {
>      RawPosixAIOData *aiocb = opaque;
> -    int ret = -EOPNOTSUPP;
> +    int ret = -ENOTSUP;
>      BDRVRawState *s = aiocb->bs->opaque;
>  
>      if (!s->has_discard) {
> @@ -1829,7 +1829,7 @@ static int handle_aiocb_discard(void *opaque)
>  #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
>          ret = do_fallocate(s->fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
>                             aiocb->aio_offset, aiocb->aio_nbytes);
> -        ret = translate_err(-errno);
> +        ret = translate_err(ret);
>  #elif defined(__APPLE__) && (__MACH__)
>          fpunchhole_t fpunchhole;
>          fpunchhole.fp_flags = 0;
> 


