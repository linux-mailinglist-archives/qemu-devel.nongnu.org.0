Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639AD68F6AA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 19:11:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPouv-0000EO-2K; Wed, 08 Feb 2023 13:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPouq-000097-Uq
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:11:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPoup-0004Wx-4N
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675879890;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sGHPttrsyfvenysIor/GoFRFWdE4tV5wb4bIaCK1wak=;
 b=Qsk1xLsftFcoT/Myzx3IgfeMSBCdrJykCBXHWvcPASq7Wkzjzo/ZVI3/B7iCosNdzPBqnh
 5l12eV9n0FJf9kKO3EQWIPkpo0OXjLCURG4NyWdW529rUY9G9e5HW2SVCLWDn6iod7zzG+
 ukQvFlc0tM+EjpiSH9/yo1B7NxJR8G0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-CMxu0gmyO-CFl9E9eNCgrg-1; Wed, 08 Feb 2023 13:11:28 -0500
X-MC-Unique: CMxu0gmyO-CFl9E9eNCgrg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a20-20020a05600c349400b003dfecb98d38so1557016wmq.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 10:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sGHPttrsyfvenysIor/GoFRFWdE4tV5wb4bIaCK1wak=;
 b=ndQtkO3gYL4aLc7FdERQvFcXMVcON7T7+KX6KxG8JG7Olijc9SltGcoJSYlQMlBbPi
 WNPLXka6ovi+dM+6XbhAmMBfE9GJI8dzEJeXGfkrjXpnqWLBCibOtQNwTRbBpz+HC3gW
 yP6vJ7nqvswMytKa0ub5QYl0Mk3hIzvYTNMHCwzGLwPTz+vGst1y3BHdMfgbVKzq4hYJ
 alRL5fMGGbmoXM4fZHjclkC5mhcipuxJDV7qTHvdPmvF2tHJ8NIHKwKUiu50JqC8+bof
 IlsHZxq7HYc9DXGK7btt85GlgizphRXBshWSA+ICCr6aSTQUMsa8zLymUngyXasm6TZ3
 28iA==
X-Gm-Message-State: AO0yUKWFtdghdmu0fMgneUwCcVaLT+NdTddzPiyxBxdLvnOSQnTyTiEI
 Fd3ML9D2altiD+9gf8EPZjKi5aYtm0b3VaSE3ntywL+A2BrF+NTW5WFsxFvzp5M9vkvlp5S+O83
 pznYSINSfTRY1HZI=
X-Received: by 2002:adf:df84:0:b0:2bf:b7e3:6d62 with SMTP id
 z4-20020adfdf84000000b002bfb7e36d62mr8501687wrl.5.1675879887589; 
 Wed, 08 Feb 2023 10:11:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+Wl3uHrzojIHWBHoiygwhQAV3xW+rzeZrwJ5JXvE8W+JWNuewBcovEP14+EB3OocbgvrYu2w==
X-Received: by 2002:adf:df84:0:b0:2bf:b7e3:6d62 with SMTP id
 z4-20020adfdf84000000b002bfb7e36d62mr8501670wrl.5.1675879887360; 
 Wed, 08 Feb 2023 10:11:27 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 u36-20020a05600c4d2400b003de2fc8214esm2393834wmp.20.2023.02.08.10.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 10:11:26 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhang <lizhang@suse.de>
Cc: dgilbert@redhat.com,  cfontana@suse.de,  qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] multifd: cleanup the function multifd_send_thread
In-Reply-To: <20211222113049.9326-3-lizhang@suse.de> (Li Zhang's message of
 "Wed, 22 Dec 2021 12:30:49 +0100")
References: <20211222113049.9326-1-lizhang@suse.de>
 <20211222113049.9326-3-lizhang@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 19:11:25 +0100
Message-ID: <87o7q4hvsi.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Li Zhang <lizhang@suse.de> wrote:
> Cleanup multifd_send_thread
>
> Signed-off-by: Li Zhang <lizhang@suse.de>

Hi Zhang

First of all, sorry for the late review.

This other patch is wrong.

> ---
>  migration/multifd.c | 82 ++++++++++++++++++++++-----------------------
>  1 file changed, 41 insertions(+), 41 deletions(-)
>
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 4ec40739e0..7888d71bfe 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -649,58 +649,58 @@ static void *multifd_send_thread(void *opaque)
>              break;
>          }
>          qemu_mutex_lock(&p->mutex);
> -
> -        if (p->pending_job) {
> -            uint32_t used = p->pages->num;
> -            uint64_t packet_num = p->packet_num;
> -            uint32_t flags = p->flags;
> -
> -            if (used) {
> -                ret = multifd_send_state->ops->send_prepare(p, &local_err);
> -                if (ret != 0) {
> -                    qemu_mutex_unlock(&p->mutex);
> -                    break;
> -                }
> -            }
> -            multifd_send_fill_packet(p);
> -            p->flags = 0;
> -            p->num_packets++;
> -            p->num_pages += used;
> -            p->pages->num = 0;
> -            p->pages->block = NULL;
> +        if (!p->quit && !p->pending_job) {
> +            /* sometimes there are spurious wakeups */
> +            qemu_mutex_unlock(&p->mutex);
> +            continue;
> +        } else if (!p->pending_job) {

Here it should be
        } else if (p->quit) {

And in this case, I preffer the previous code, as the first case is the
common one.

I still have to see if we ever enter through the spurious case anymore.

Thanks, Juan.


