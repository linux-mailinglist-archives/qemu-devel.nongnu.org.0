Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E8653A0BF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 11:38:57 +0200 (CEST)
Received: from localhost ([::1]:59522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwKoZ-000646-Ol
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 05:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1nwKn9-0005Ly-Fy
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:37:29 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1nwKn3-0000qr-UC
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:37:23 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so5675721pjo.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 02:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=RsbBD6m15cJe855feEJ2yqJRavWT5r6hrUEfuNoGcu0=;
 b=pCYknecvtVndvdzfnFaHlP9L1dwrNVF16c9t8jb/FJvAEWKNiGe3nTemEjpusJvFm2
 YmWfX5kAZ8zHM10PdaocAOAr4c6iuiFyKO6DCvtQqSVrxwJdN+2gE3Yyk40nbkXyjQzi
 4zaZjjULDuvitZvowbSHwHDF90LysD+lq/02AzIkOdgKH6VGDfj+SjIQXHCc3tAWKIBu
 1NXLqPsDWluWDtb/wEcZOtZkbVfUR+lBrxOVpvi3EHJ0rtrvFGElazSSYecUrs3gqLwN
 iwlzo0pITeji7SXV92VnWpj7yKJcFCFujJ/ahVB9hw5xbIJ42K3vhJOJ8s5WJI8V0TyO
 NnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RsbBD6m15cJe855feEJ2yqJRavWT5r6hrUEfuNoGcu0=;
 b=4kxyC2EkXw0Z9/bgSQqW52PMxcLTvhEXmw1zNJUQne8aNYAlVs3EvN1pOw2bwuQqhH
 pF4ICXQSNGZ4fNfdP0h4umTunJjWoHYdAhnvSxVPQRZBDTQcf6UzUEEzU3wUT7eOohRg
 AoLrw/fPdBFSfuVj1HMP5vH0q6aP/bgDlySp011oNjbvUfz1aH1FCHzT2nDJdgH161x+
 ohB6nK/UgfQMjkDzcSjywGPZ9zZovReKWtstvPbZr6atbR6GkQnORGczG7TcCM16lUEY
 0wFFE+mEiy8zG+lpquR6jVyB2WlInE1mPTZfLUyCV3f+SgOPgOxLBrqh8JeMflf9lqbc
 lJMg==
X-Gm-Message-State: AOAM532kaceFF97yVZCMUcxwZ/ahFeLNnW5RptzMRAuRP/AIMuwELiyl
 cFqsGgxxOQKe+RiAbXZfu8wuiw==
X-Google-Smtp-Source: ABdhPJzgIU0jWFG9lLQ1b7sc5XBF+5bOXQrC8cZHw74YIfhdG4uRngMIu604K+SBmQ5k2l4j7nRWKg==
X-Received: by 2002:a17:902:db06:b0:163:e89d:622c with SMTP id
 m6-20020a170902db0600b00163e89d622cmr12411075plx.143.1654076239498; 
 Wed, 01 Jun 2022 02:37:19 -0700 (PDT)
Received: from [10.94.53.13] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 iw4-20020a170903044400b0015e8d4eb20esm1060648plb.88.2022.06.01.02.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 02:37:19 -0700 (PDT)
Message-ID: <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
Date: Wed, 1 Jun 2022 17:37:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
To: Leonardo Bras <leobras@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Peter Xu
 <peterx@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
From: =?UTF-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>
In-Reply-To: <20220513062836.965425-4-leobras@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/5/13 下午2:28, Leonardo Bras wrote:
> For CONFIG_LINUX, implement the new zero copy flag and the optional callback
> io_flush on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> feature is available in the host kernel, which is checked on
> qio_channel_socket_connect_sync()
>
> qio_channel_socket_flush() was implemented by counting how many times
> sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
> socket's error queue, in order to find how many of them finished sending.
> Flush will loop until those counters are the same, or until some error occurs.
>
> Notes on using writev() with QIO_CHANNEL_WRITE_FLAG_ZERO_COPY:
> 1: Buffer
> - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> some caution is necessary to avoid overwriting any buffer before it's sent.
> If something like this happen, a newer version of the buffer may be sent instead.
> - If this is a problem, it's recommended to call qio_channel_flush() before freeing
> or re-using the buffer.
>
> 2: Locked memory
> - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
> unlocked after it's sent.
> - Depending on the size of each buffer, and how often it's sent, it may require
> a larger amount of locked memory than usually available to non-root user.
> - If the required amount of locked memory is not available, writev_zero_copy
> will return an error, which can abort an operation like migration,
> - Because of this, when an user code wants to add zero copy as a feature, it
> requires a mechanism to disable it, so it can still be accessible to less
> privileged users.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> ---
>   include/io/channel-socket.h |   2 +
>   io/channel-socket.c         | 116 ++++++++++++++++++++++++++++++++++--
>   2 files changed, 114 insertions(+), 4 deletions(-)
>
> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> index e747e63514..513c428fe4 100644
> --- a/include/io/channel-socket.h
> +++ b/include/io/channel-socket.h
> @@ -47,6 +47,8 @@ struct QIOChannelSocket {
>       socklen_t localAddrLen;
>       struct sockaddr_storage remoteAddr;
>       socklen_t remoteAddrLen;
> +    ssize_t zero_copy_queued;
> +    ssize_t zero_copy_sent;
>   };
>   
Hi, Leonardo. I'm also paying attention to the application of 
MSG_ZEROCOPY in live migration recently. I noticed that you defined a 
member `zero_copy_queued` in the struct QIOChannelSocket, but I can't 
find out where the value of this member has been changed in your patch. 
Can you answer it for me?

