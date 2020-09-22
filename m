Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7574E273EBA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 11:42:20 +0200 (CEST)
Received: from localhost ([::1]:36530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKeoV-0007CX-IU
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 05:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKek4-00048X-J4
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 05:37:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKek2-0007hC-AS
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 05:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600767461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TUQRbNBbwJI/KEIXA3+ABsyT8KxGQMxVnKfeAJ87PVg=;
 b=Dnn64ybNFkxKrP+9BVamnzVfJ+EjRf48I1mCIwgPbUagTs5epf+8mBWxiUqGDtfpp4kQoB
 r9u75T9a1WQ8HiZqjYjB73nodSjDgetQQjG/QCiHVN59UTIvZ6GVtAh7DQEiYQXR8Apw4D
 CkejaJ1jRmsTw5M3zNuTFlpXJdqzeJA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-LaXNg8b4P0KsXNXUgSKfGw-1; Tue, 22 Sep 2020 05:37:36 -0400
X-MC-Unique: LaXNg8b4P0KsXNXUgSKfGw-1
Received: by mail-wr1-f69.google.com with SMTP id a10so7106041wrw.22
 for <qemu-devel@nongnu.org>; Tue, 22 Sep 2020 02:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TUQRbNBbwJI/KEIXA3+ABsyT8KxGQMxVnKfeAJ87PVg=;
 b=Jp8Qy5TAhQjw15UrSQIkM6uB6Uq2mV9rTuMnOgMFsh3pXkZdrVDATC/azaeVLw+NTH
 vwwVCbdKhtt40iEReAnpkZZUOmfMarB1+PrG+Lt2I93Ddb0C5UtuOTZFGR8dTnGAacOz
 4BV6djQjTNcBi1ivdEITMB2mw3OuMZZqOp3yF20jZJv/ASBd+GmS89oU+ga4meiJ7Ohg
 AdJEf/MQw96hyeRVUfZiDvJby4iyOuv8jCHoXaSBHGwuyXyRrDwDz5eTmSeH0IXmRnRP
 Y5PGeYUI4nqSFmL1539KtFLt8QBzYd020Zgq9sjkXJCGsybwXgDEbhiXPg2+soyogVcT
 ZQvQ==
X-Gm-Message-State: AOAM533vLm8mbreFlZPi4v0nKIC9pD7/jdI9uXGpW2wKkC4ilf+valkb
 xSoBbudJ0ScyM6rvMGLskNpeS2dSVzwrywm0OBycY5wlZwiPT7qNI7lJerupkxESjjitLT5xldJ
 YyFVdmgnM/hYrNcw=
X-Received: by 2002:a1c:f612:: with SMTP id w18mr16032wmc.47.1600767455608;
 Tue, 22 Sep 2020 02:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpZAyhisLGV3J/wtNyb29WZ2YaCd/Z8yHGecpiMZ8HjsfGSXB2Wc1gWdxiTXT2nRR454fKsQ==
X-Received: by 2002:a1c:f612:: with SMTP id w18mr16018wmc.47.1600767455389;
 Tue, 22 Sep 2020 02:37:35 -0700 (PDT)
Received: from [192.168.10.165] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id l10sm23958875wru.59.2020.09.22.02.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 02:37:34 -0700 (PDT)
Subject: Re: [PATCH] char: fix logging when chardev write fails
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200914103109.1327875-1-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eccf3c12-3285-2d63-533d-873b2a16ace3@redhat.com>
Date: Tue, 22 Sep 2020 11:37:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200914103109.1327875-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/20 12:31, Daniel P. Berrangé wrote:
> The qemu_chr_write_buffer() method sends data to the chardev backend for
> writing, and then also writes to the log file. In case the chardev
> backend only writes part of the data buffer, we need to make sure we
> only log the same subset. qemu_chr_write_buffer() will be invoked again
> later to write the rest of the buffer.
> 
> In the case the chardev backend returns an error though, no further
> attempts to likely to be made to write the data. We must therefore write
> the entire buffer to the log immediately.
> 
> An example where this is important is with the socket backend. This will
> return -1 for all writes if no client is currently connected. We still
> wish to write data to the log file when no client is present though.
> This used to work because the chardev would return "len" to pretend it
> had written all data when no client is connected, but this changed to
> return an error in
> 
>   commit 271094474b65de1ad7aaf729938de3d9b9d0d36f
>   Author: Dima Stepanov <dimastep@yandex-team.ru>
>   Date: Thu May 28 12:11:18 2020 +0300
> 
>     char-socket: return -1 in case of disconnect during tcp_chr_write
> 
> and this broke the logging, resulting in all data being discarded when
> no client is present.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1893691
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  chardev/char.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/chardev/char.c b/chardev/char.c
> index 77e7ec814f..e30cd025f5 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -138,7 +138,20 @@ static int qemu_chr_write_buffer(Chardev *s,
>          }
>      }
>      if (*offset > 0) {
> +        /*
> +         * If some data was written by backend, we should
> +         * only log what was actually written. This method
> +         * may be invoked again to write the remaining
> +         * method, thus we'll log the remainder at that time.
> +         */
>          qemu_chr_write_log(s, buf, *offset);
> +    } else if (res < 0) {
> +        /*
> +         * If a fatal error was reported by the backend,
> +         * assume this method won't be invoked again with
> +         * this buffer, so log it all right away.
> +         */
> +        qemu_chr_write_log(s, buf, len);
>      }
>      qemu_mutex_unlock(&s->chr_write_lock);
>  
> 

Queued, thanks.

Paolo


