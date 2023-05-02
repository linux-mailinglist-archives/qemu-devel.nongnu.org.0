Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C86F4BB0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:58:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptx3p-0004nl-J8; Tue, 02 May 2023 16:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptx3h-0004lb-D3
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptx3f-000539-Sq
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683061030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Blq9fJ+TG4XXdxvb1jmQj3oI3Q0aAC00lMtY6O2neA=;
 b=XsNz+/d5SWVkXjfKQUOnGmAZazSBJqRRiDeX8WiXbalIMClg5SI1H13sA6MF/3V7EvhXpq
 JRWW4LMjGsCySv+5zBuHjA1019vHk4nne5zn0+S1o466lK4Q4bVlVjpZwBdsUbZvSpg/8q
 rpAdtlw4zPxybT4p1slUhRi+WRIgSn8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-9jWsZY3vM4G-9g0Qh0jvbw-1; Tue, 02 May 2023 16:57:09 -0400
X-MC-Unique: 9jWsZY3vM4G-9g0Qh0jvbw-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef4d54d84cso11218136d6.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 13:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683061029; x=1685653029;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Blq9fJ+TG4XXdxvb1jmQj3oI3Q0aAC00lMtY6O2neA=;
 b=aFb7wY96k5edpD0C6E856NzZrYfUbj7xMsQf2b2/lz8YxpLC7NPr/sDH5mBwbW+gRr
 lhdrOufDk41LNANs4xwehEOfwNQ2Mu8K1VilKxG6mjTgn+I80Bl2CSpgu8BVvlmSSNo0
 fAGg0PhlOrDCvKGHV0LVzW61SvJ4WJ16xPi4h0MsBIZNhUMZIzH2Xt9fdCimYInl+ydJ
 fFHGkj+SMYbM89RskH/OGTrI5qRWncf9jyagM0t/sXGjKAlSC8AlLskRCfC6usJxA/ow
 ZM+lZSzb3EKaxeb6nC7gm/s31/MBO+wqHqCu/tgjhAV01m3/GUGbNqM4JGRCm8JDO5A2
 /gCw==
X-Gm-Message-State: AC+VfDwuZPW0B2JM70U+NpP0//Sw2ERl6Khoi+3+ayNnSItI0+8Gh8/Y
 JOQeR7bS6jKEH2vPmc0AbJH9mMCR25hn1MjjOrVOnEQGht+pN1CX+8xZGbZEQTHoqkfajlCtPMo
 nRc9acAsV5FRKJ4k=
X-Received: by 2002:a05:622a:1819:b0:3ef:168:7833 with SMTP id
 t25-20020a05622a181900b003ef01687833mr6131761qtc.5.1683061028684; 
 Tue, 02 May 2023 13:57:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4v9qgjO0DAqWaC2lgSUzfPnmB97Lo/54prRNfth/lS2jV1Ptz3VII+rFbIdJaEEfkekTextg==
X-Received: by 2002:a05:622a:1819:b0:3ef:168:7833 with SMTP id
 t25-20020a05622a181900b003ef01687833mr6131744qtc.5.1683061028469; 
 Tue, 02 May 2023 13:57:08 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 c21-20020a05620a269500b0074fbc22f482sm6293808qkp.71.2023.05.02.13.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 13:57:07 -0700 (PDT)
Date: Tue, 2 May 2023 16:57:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de, quintela@redhat.com,
 chen.zhang@intel.com, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 09/10] migration: disallow change capabilities in COLO
 state
Message-ID: <ZFF5IsXDwJSL6puX@x1n>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-10-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230428194928.1426370-10-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Fri, Apr 28, 2023 at 10:49:27PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> COLO is not listed as running state in migrate_is_running(), so, it's
> theoretically possible to disable colo capability in COLO state and the
> unexpected error in migration_iteration_finish() is reachable.
> 
> Let's disallow that in qmp_migrate_set_capabilities. Than the error
> becomes absolutely unreachable: we can get into COLO state only with
> enabled capability and can't disable it while we are in COLO state. So
> substitute the error by simple assertion.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


