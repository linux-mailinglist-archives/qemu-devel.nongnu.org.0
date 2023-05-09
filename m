Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495AB6FCD95
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 20:18:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwRuR-0002RP-Qe; Tue, 09 May 2023 14:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwRuO-0002RE-UU
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:17:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwRuN-0003x8-Eg
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:17:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683656274;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zw1WtHfmEgp5Fle92UDhoUzB+HPrQRBZD/8q4ZXqGt0=;
 b=gpyA25/XnMuiCZz2FnrEuboK8WE+b4XxEMrzn9wBi7f7Q8FUHo1MJIh16b9n2uT1o1DDq+
 bCVFvc9Bck368UFTCFt3pQ2c0nryrlgv4QeWSfkHaIksDqHEuFJ606N4nzeUbzZMshruMf
 GOMAyXCIpiGaVUE5GiA38CP7xNaeIlE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-eCydGrFdNDKu0hc5XH_DWA-1; Tue, 09 May 2023 14:17:53 -0400
X-MC-Unique: eCydGrFdNDKu0hc5XH_DWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f171d38db3so39575635e9.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 11:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683656272; x=1686248272;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zw1WtHfmEgp5Fle92UDhoUzB+HPrQRBZD/8q4ZXqGt0=;
 b=g/2myVdDYSOdVQZd3H06lCh/OHzwe7yHt0PG+sEMVJrmQ9ticN0zPRGHtui66caHRp
 XV+RSQs1KbCiXjZf+yU5pJ7hpKNE/JVflxxD1S3QB1b5cVNiGZu0+WXtiwF/z5S8kqiT
 PX0uBy6qLDL7eXPJZrxXEJeA3m9abuTMuw1gNmNUUceVD1Q04y5dYSm4iWHs4zr2ONIG
 GF0yoYg45cyX6SPMRxNNAVKfcORHKBpemDGwaCTI9HolNNOTC6zQV72s3Gmkw4Qn8i5x
 9MrFbKkQ3IK0cyRpSQ4ubPb+CTPOJo7pWwBpMK7tt552OnzmHXD5tQdZG2i7tH1fVXJ7
 QHTg==
X-Gm-Message-State: AC+VfDwvCvvzb5XqzHF0KTGPEosLqhDqwVzOtfzrije7hVeynbhb46av
 zAUbYqibm9qScmF3mGNpDWWoPVcK0CdO9ClyVOuQQ7yjUezPYk8gG/KolTxld8kPYk/caieviiO
 av08xbu6KSX9j2QY=
X-Received: by 2002:a05:600c:cf:b0:3f4:29c2:61e6 with SMTP id
 u15-20020a05600c00cf00b003f429c261e6mr3081235wmm.34.1683656272198; 
 Tue, 09 May 2023 11:17:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6eABGDkIPj2b46u6lmBvxZx3EW5Q2i7ysl3IidOjMmGpOaAtOHszf6fxT0ed4Qj8S0iQDUBg==
X-Received: by 2002:a05:600c:cf:b0:3f4:29c2:61e6 with SMTP id
 u15-20020a05600c00cf00b003f429c261e6mr3081224wmm.34.1683656271884; 
 Tue, 09 May 2023 11:17:51 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c020700b003f42e008c8dsm956020wmi.44.2023.05.09.11.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 11:17:51 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  lukasstraub2@web.de,  chen.zhang@intel.com,  "Dr
 . David Alan Gilbert" <dave@treblig.org>,  Hailiang Zhang
 <zhanghailiang@xfusion.com>,  Peter Xu <peterx@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>,  Eric Blake <eblake@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 03/10] build: move COLO under CONFIG_REPLICATION
In-Reply-To: <20230428194928.1426370-4-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 28 Apr 2023 22:49:21 +0300")
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-4-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 20:17:49 +0200
Message-ID: <87zg6dbc8i.fsf@secure.mitica>
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> We don't allow to use x-colo capability when replication is not
> configured. So, no reason to build COLO when replication is disabled,
> it's unusable in this case.
>
> Note also that the check in migrate_caps_check() is not the only
> restriction: some functions in migration/colo.c will just abort if
> called with not defined CONFIG_REPLICATION, for example:
>
>     migration_iteration_finish()
>        case MIGRATION_STATUS_COLO:
>            migrate_start_colo_process()
>                colo_process_checkpoint()
>                    abort()
>
> It could probably make sense to have possibility to enable COLO without
> REPLICATION, but this requires deeper audit of colo & replication code,
> which may be done later if needed.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Acked-by: Dr. David Alan Gilbert <dave@treblig.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


