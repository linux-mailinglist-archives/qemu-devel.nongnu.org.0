Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0AD687AFD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:59:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXJC-00038M-7p; Thu, 02 Feb 2023 05:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXJA-00037q-5z
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:59:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXJ8-0006AT-Q8
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675335549;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=p/yULpUqm7NHQpcLbfwOkHDQ6f88+pI8LI4xx3r+yZA=;
 b=ESR+2LTm9Z6Oo3kfUnnnOkdov/NS+adQJW+xvlnREd6hijuX9Zrap1f2bUAgexmpkLYUnF
 L8wABRmbf82PmW6hVNlUvZ3faCXibUwsCvz2D5aFZEa4Vje1+3NfkiPdM6rEcYboeqBw+x
 gDz3qZJv/26F5iGvwR4KJ7c62X/3UD4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-FTp-trrpNyeMWJLTLS7AeA-1; Thu, 02 Feb 2023 05:59:07 -0500
X-MC-Unique: FTp-trrpNyeMWJLTLS7AeA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o42-20020a05600c512a00b003dc5341afbaso755059wms.7
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p/yULpUqm7NHQpcLbfwOkHDQ6f88+pI8LI4xx3r+yZA=;
 b=gEEsellNiJuuWvh74KNfIYA3Ub23C109NYnPRvHTxFsiJZ0QXaLyna3NgBzh7zkSa/
 sM1IkJzxKtRlNR0RWPCBCmNfckD0vHJRHKuXw8Cj9S/1XiAyA/DcwLTQ2UErQgmya9Ec
 zGdRd42jvA+BBsr1WqXXUfyA6du+Oj8Gbz9Ttup+ccjOu5TZ70seATlqHmA488W5YGCe
 DPNdw7gSh3ynLjALtRQH/zFPOWVwvwXxoXqUjOGk7AOnKlcL0lJqaCUusPe5lpQWkN87
 RxxYK4LITNxvYquDT3ecQmQL25xFRqGh9ik/gxxRFXvv2WtDz7YZBz9v7OGKYaLQ4Ep/
 hPRQ==
X-Gm-Message-State: AO0yUKXypepx6AvNViWMfA9UPpJKjOCcOJwRBBBQyUykXKFHtA4u7gUD
 vNch/vGt3sCkUNuZEJ6LRYEtmwt+q5wv3Yduez8No+3M1l1n5dcd9Hj5ge1V6MHV9mp1Q/UxzAN
 Euu90PesTA+NsE40=
X-Received: by 2002:adf:edd1:0:b0:2bd:dfbe:c17f with SMTP id
 v17-20020adfedd1000000b002bddfbec17fmr5510101wro.58.1675335546654; 
 Thu, 02 Feb 2023 02:59:06 -0800 (PST)
X-Google-Smtp-Source: AK7set++rgJEuApV+0Lmbzo3sJBy5DSoCbnZUui/uxsQEqjixG6ZtLew+2yKbjdx39f8XrI9sCHXVg==
X-Received: by 2002:adf:edd1:0:b0:2bd:dfbe:c17f with SMTP id
 v17-20020adfedd1000000b002bddfbec17fmr5510085wro.58.1675335546483; 
 Thu, 02 Feb 2023 02:59:06 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4482000000b002be063f6820sm21295417wrq.81.2023.02.02.02.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:59:05 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  pbonzini@redhat.com,
 peterx@redhat.com,  david@redhat.com,  philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v5 1/3] rcu: introduce rcu_read_is_locked()
In-Reply-To: <20230117115511.3215273-2-xuchuangxclwt@bytedance.com> (Chuang
 Xu's message of "Tue, 17 Jan 2023 19:55:09 +0800")
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <20230117115511.3215273-2-xuchuangxclwt@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 11:59:05 +0100
Message-ID: <87r0v8s58m.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Chuang Xu <xuchuangxclwt@bytedance.com> wrote:
> add rcu_read_is_locked() to detect holding of rcu lock.
>
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Althought I think that petting a review from Paolo or anyone that knows
more than RCU could be a good idea.

> ---
>  include/qemu/rcu.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
> index b063c6fde8..719916d9d3 100644
> --- a/include/qemu/rcu.h
> +++ b/include/qemu/rcu.h
> @@ -119,6 +119,13 @@ static inline void rcu_read_unlock(void)
>      }
>  }
>  
> +static inline bool rcu_read_is_locked(void)
> +{
> +    struct rcu_reader_data *p_rcu_reader = get_ptr_rcu_reader();
> +
> +    return p_rcu_reader->depth > 0;
> +}
> +
>  extern void synchronize_rcu(void);
>  
>  /*


