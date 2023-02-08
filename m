Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C33E68F643
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 19:00:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPojI-0003PK-Un; Wed, 08 Feb 2023 12:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPojG-0003Ov-Ca
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:59:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPojE-00059w-2s
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675879170;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iPj0Nwo10uPolMuV7HItJtuc1TXuJhDcKF0gyRSafuU=;
 b=hHAhrKE4VCQRgE28NktAsXD2f0lQpBpiAZ/B6sHfy8BJmmV9EeRhhyIPJv9ZOO+pHHL5j0
 UHiMi6t9dJbCLm9w5/NbJRZr6x1pGsU9uASQXVkQmjs8yqnmBsHI+FaQmjrKXQbjo8AV+d
 mq0WbDS7p4UkTl2Ct0bxIO9pEkuF5+4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-47r7wLMfP72Galx4r7up4A-1; Wed, 08 Feb 2023 12:59:29 -0500
X-MC-Unique: 47r7wLMfP72Galx4r7up4A-1
Received: by mail-wm1-f72.google.com with SMTP id
 j37-20020a05600c1c2500b003deaf780ab6so1406088wms.4
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iPj0Nwo10uPolMuV7HItJtuc1TXuJhDcKF0gyRSafuU=;
 b=Osg1CUqNSlwWcB51ismJ/IP/0xxgj9nhPpH3BcmDQK/2z0X/b5dfKBE2WXLvD7TALB
 1LqopIOmwIaAvhERcFaIj+vYQ9AR9y2vuHeE2Ip+Qohhe1od+LFZV9LruIQOvJ1aOTjw
 Tt/qX/e6yIcJ3+Y7WLzTBFj+1Vb4IGatZ8SrRnkrRaIpycBx5AMzvGXcQCBwVZavOyUo
 1FEWy/1B+xBMSTpcCLfhpJm8cEonDNWjjBcsftbmBDMeymJ9i9ALAUaPQICPuLzBhHgd
 mOpNnZ790IRzVDBwxH0vubeq73+y/ECHFTq45Y2YF0eKagsCdNl4oxEGjtE/Wzln//jR
 LuvQ==
X-Gm-Message-State: AO0yUKVpMbLCerwYYW6C8hTcjI8QCayV22RfXx2xuDMzoeCkYxsAegjB
 aJqTDUkJZp2nx4Gd4TKalyaJNltcDPnAu/i9muW2E7C72EGgh3JJjktbwdb2jBCfKacQZc4/O42
 aKLSLIiRgzTx5cWY=
X-Received: by 2002:a05:600c:4484:b0:3dd:1c45:d592 with SMTP id
 e4-20020a05600c448400b003dd1c45d592mr7461353wmo.19.1675879168197; 
 Wed, 08 Feb 2023 09:59:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+7AksuF/UC5iIZ/HyBJuvkypYFyCZZj68v/HYtHkZJ7lF2IXiMfTb8zJlBKpLyjd82JExLbQ==
X-Received: by 2002:a05:600c:4484:b0:3dd:1c45:d592 with SMTP id
 e4-20020a05600c448400b003dd1c45d592mr7461344wmo.19.1675879167964; 
 Wed, 08 Feb 2023 09:59:27 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600002c200b002bde537721dsm15094465wry.20.2023.02.08.09.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:59:27 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhang <lizhang@suse.de>
Cc: dgilbert@redhat.com,  cfontana@suse.de,  qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] multifd: cleanup the function multifd_channel_connect
In-Reply-To: <20211222113049.9326-2-lizhang@suse.de> (Li Zhang's message of
 "Wed, 22 Dec 2021 12:30:48 +0100")
References: <20211222113049.9326-1-lizhang@suse.de>
 <20211222113049.9326-2-lizhang@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 18:59:26 +0100
Message-ID: <87v8kchwch.fsf@secure.mitica>
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
> Cleanup multifd_channel_connect
>
> Signed-off-by: Li Zhang <lizhang@suse.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>
queued.

> ---
>  migration/multifd.c | 49 ++++++++++++++++++++++-----------------------
>  1 file changed, 24 insertions(+), 25 deletions(-)
>
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 212be1ed04..4ec40739e0 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -801,33 +801,32 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
>      trace_multifd_set_outgoing_channel(
>          ioc, object_get_typename(OBJECT(ioc)), p->tls_hostname, error);
>  
> -    if (!error) {
> -        if (s->parameters.tls_creds &&
> -            *s->parameters.tls_creds &&
> -            !object_dynamic_cast(OBJECT(ioc),
> -                                 TYPE_QIO_CHANNEL_TLS)) {
> -            multifd_tls_channel_connect(p, ioc, &error);
> -            if (!error) {
> -                /*
> -                 * tls_channel_connect will call back to this
> -                 * function after the TLS handshake,
> -                 * so we mustn't call multifd_send_thread until then
> -                 */
> -                return true;
> -            } else {
> -                return false;
> -            }
> -        } else {
> -            migration_ioc_register_yank(ioc);
> -            p->registered_yank = true;
> -            p->c = ioc;
> -            qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
> -                                   QEMU_THREAD_JOINABLE);
> -       }
> -       return true;
> +    if (error) {
> +        return false;
>      }
>  
> -    return false;
> +    if (s->parameters.tls_creds &&
> +        *s->parameters.tls_creds &&
> +        !object_dynamic_cast(OBJECT(ioc),
> +                             TYPE_QIO_CHANNEL_TLS)) {
> +        multifd_tls_channel_connect(p, ioc, &error);
> +        if (error) {
> +            return false;
> +        }
> +        /*
> +         * tls_channel_connect will call back to this
> +         * function after the TLS handshake,
> +         * so we mustn't call multifd_send_thread until then
> +         */
> +        return true;
> +    } else {
> +        migration_ioc_register_yank(ioc);
> +        p->registered_yank = true;
> +        p->c = ioc;
> +        qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
> +                               QEMU_THREAD_JOINABLE);
> +    }
> +    return true;
>  }
>  
>  static void multifd_new_send_channel_cleanup(MultiFDSendParams *p,


