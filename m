Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29DC6F4BAA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:55:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptx14-0003O1-D1; Tue, 02 May 2023 16:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptx12-0003NY-Cm
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:54:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptx10-0001sZ-Vo
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683060866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B6sP1kI4BYFT5+85/zghuTKRod4ZH1TwX4uAOn2fwtk=;
 b=QvyLVyx55oXeKU7xFu2sNxPFlmlyClZeyMPyLm0N87hx0VF8Ta0OK9A1edkAxKmFgwrs1t
 /IwGBHBMekkpVIjDNuZxl/5cljTZGA6mkcJvSKjzRWa9ka8jhiO83nm9dO9T8EWQQic3Z1
 OfRjGedJq5mf0iqGiV/7QxzTrJtzCiA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-dW25YFgkPBOIbmkMrvG2JA-1; Tue, 02 May 2023 16:54:24 -0400
X-MC-Unique: dW25YFgkPBOIbmkMrvG2JA-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-61b6f717b6eso782686d6.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 13:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683060864; x=1685652864;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B6sP1kI4BYFT5+85/zghuTKRod4ZH1TwX4uAOn2fwtk=;
 b=Y+zMo8PP74QphfFgEj6py7WhvJ6JfYfGwLx5EDz1DOBRO0Pa0TvL/YTps42twXUnU2
 0HBS7P+PITDA6W70IWAPe6yPSNh+5F6F+T6Fs/KSGNq3+pm2PrTVhPnnj24bRNSQd/e7
 Sbko866h31WPe2K/URgeqkNBp0e1Gn8VqIL3/YUnsXPPQtTCmKIMXMgEr310wOwG+32a
 Krc7M7Ucm/ZLh6nfi2MdVeB9tjSeBcNpkHx6CSgTCBlzyKiOMPj2+7wSIWI6a8nwBlES
 z3E22I//eyrr6NPgTJ06wjfebkARXKfXhX44KZDnThAJqqiNuZK7MVthfZSUjC2cZ4Uu
 dKdA==
X-Gm-Message-State: AC+VfDyNHNfCnNisGonY3PMYee4WsFDeCyZT52A77LtD4Ww7El4RM5yU
 qI9NY7XgplTSiOHDqLEu4sHMhaAMLUDBsRz+3bAVRKLt+4tFLNPbLaX4faYFjNKBstJWwOg9D7L
 HUj/K5J6puLp0VcA=
X-Received: by 2002:a05:6214:400d:b0:5ef:5132:7ad7 with SMTP id
 kd13-20020a056214400d00b005ef51327ad7mr5837277qvb.2.1683060863911; 
 Tue, 02 May 2023 13:54:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ42ZewVNqUAW2ACr2G+FLM3pAmmxoVzIXQTtxR9Yxj2Jr3X9i/2gRQSuobXnF/oweLvAdAdgQ==
X-Received: by 2002:a05:6214:400d:b0:5ef:5132:7ad7 with SMTP id
 kd13-20020a056214400d00b005ef51327ad7mr5837257qvb.2.1683060863608; 
 Tue, 02 May 2023 13:54:23 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 z20-20020a05620a08d400b0074683c45f6csm9979665qkz.1.2023.05.02.13.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 13:54:23 -0700 (PDT)
Date: Tue, 2 May 2023 16:54:21 -0400
From: Peter Xu <peterx@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de, quintela@redhat.com,
 chen.zhang@intel.com, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 08/10] migration: process_incoming_migration_co():
 move colo part to colo
Message-ID: <ZFF4fV3rwUkSdEVP@x1n>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-9-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230428194928.1426370-9-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 28, 2023 at 10:49:26PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> +int coroutine_fn colo_incoming_co(void)
> +{
> +    MigrationIncomingState *mis = migration_incoming_get_current();
> +    Error *local_err = NULL;
> +    QemuThread th;
> +
> +    assert(!qemu_mutex_iothread_locked());

Is this assert reverted?  I assume it wants to guarantee BQL held rather
than not..

> +
> +    if (!migration_incoming_colo_enabled()) {
> +        return 0;
> +    }
> +
> +    /* Make sure all file formats throw away their mutable metadata */
> +    bdrv_activate_all(&local_err);
> +    if (local_err) {
> +        error_report_err(local_err);
> +        return -EINVAL;
> +    }
> +
> +    qemu_thread_create(&th, "COLO incoming", colo_process_incoming_thread,
> +                       mis, QEMU_THREAD_JOINABLE);
> +
> +    mis->colo_incoming_co = qemu_coroutine_self();
> +    qemu_coroutine_yield();
> +    mis->colo_incoming_co = NULL;
> +
> +    qemu_mutex_unlock_iothread();
> +    /* Wait checkpoint incoming thread exit before free resource */
> +    qemu_thread_join(&th);
> +    qemu_mutex_lock_iothread();
> +
> +    /* We hold the global iothread lock, so it is safe here */
> +    colo_release_ram_cache();
> +
> +    return 0;
> +}

-- 
Peter Xu


