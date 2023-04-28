Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AD06F1269
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 09:34:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psIcE-0006Y4-Ck; Fri, 28 Apr 2023 03:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psIc5-0006Xd-4V
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 03:33:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psIc3-00032X-KK
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 03:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682667230;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iRzaZRtRL7lEqtB5HOi/WtDnFRHORqqQCeoAtjXQPwc=;
 b=L9nFPlDaHbM7GJfMzcVvx8mf7eTh9rSFa//aK8HT2ACsfPI33D2j3LJJzbqQ6uMEOgZw1b
 twGCN2fsv8ztQJpUJ9VQ/CkcKrtPkuGsUuHP1AhPi4xGEyQrWbv8zcJnBrSRSZXgh/XokB
 7jE6Apde7nRsWQziP2XWiN/JRR+jxhs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-vSN4MxFoNyChsVHw0l_JTw-1; Fri, 28 Apr 2023 03:33:49 -0400
X-MC-Unique: vSN4MxFoNyChsVHw0l_JTw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f5382db4d1so3133690f8f.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 00:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682667228; x=1685259228;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iRzaZRtRL7lEqtB5HOi/WtDnFRHORqqQCeoAtjXQPwc=;
 b=Qsegv6ShLkhOBJ0wOhaOLyFfzy3xvKZqefgFwcueYqA3D0gniXy8KohS2t0whXOc13
 xjUtQ2deyJzbnOPnLUshvfPD/G4GUcK/HiZ7vsuFrKkQ18A9lWfn9x0xdr4vmyC9pbcW
 LkPVtw5oZqu8hf/pUirh5IySLf3LGrZmMsWI72nkO9By4qLGPPkAb7vHMGnU/eQ2emPD
 IZmx3fS+bcyL/zjzJVdBIVXtMEPTjjftCLNwYFjq/TKoQ6RwrftVBTiqCc8EO/Ls/fJV
 11OMoVKuu16MDnPgTBIP/xY50VwfSFdnIUkxYloFw5sB/hQ1Db71Ud2Whj1RTKc4uP+V
 kFbg==
X-Gm-Message-State: AC+VfDxuXXDOmuJClWEPQ8Hgp6/V/UGgzIjZ4JnOyojOBsgSOvGuor1h
 vnR6bT2KQrF6x2gTPWWyn7QMm4FxZJMzlvtyh7SLgYYoACIpLQwykeyLd4PH6ax/DsyppXO4yuv
 vXfK4yuKKgymoQf4=
X-Received: by 2002:a5d:620d:0:b0:2f5:3fa1:6226 with SMTP id
 y13-20020a5d620d000000b002f53fa16226mr3066357wru.14.1682667228374; 
 Fri, 28 Apr 2023 00:33:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6UFfgjHSt6LWFQQvJH6xaNgDiUrfXba+kkhNzGV0yWntg1WuCXm5ofGSsOXEIXhM8jRzctPg==
X-Received: by 2002:a5d:620d:0:b0:2f5:3fa1:6226 with SMTP id
 y13-20020a5d620d000000b002f53fa16226mr3066339wru.14.1682667228055; 
 Fri, 28 Apr 2023 00:33:48 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 f11-20020adffccb000000b002f90a75b843sm20388491wrs.117.2023.04.28.00.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 00:33:47 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  michael.roth@amd.com,
 armbru@redhat.com,  eblake@redhat.com,  jasowang@redhat.com,
 zhanghailiang@xfusion.com,  philmd@linaro.org,  thuth@redhat.com,
 berrange@redhat.com,  marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 dave@treblig.org,  hreitz@redhat.com,  kwolf@redhat.com,
 chen.zhang@intel.com,  lizhijian@fujitsu.com,  lukasstraub2@web.de
Subject: Re: [PATCH v3 4/4] configure: add --disable-colo-proxy option
In-Reply-To: <20230427202946.1007276-5-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 27 Apr 2023 23:29:46 +0300")
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
 <20230427202946.1007276-5-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 09:33:46 +0200
Message-ID: <87ildgbgv9.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> Add option to not build filter-mirror, filter-rewriter and
> colo-compare when they are not needed.
>
> There could be more agile configuration, for example add separate
> options for each filter, but that may be done in future on demand. The
> aim of this patch is to make possible to disable the whole COLO Proxy
> subsystem.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

As you have arrived to an agreement about what to do with
filter-rewriter, the rest of the patch is ok with me.

Reviewed-by: Juan Quintela <quintela@redhat.com>


