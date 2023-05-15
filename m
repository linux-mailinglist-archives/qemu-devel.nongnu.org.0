Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15617702EDF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:57:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYhU-0004re-HK; Mon, 15 May 2023 09:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyYhP-0004rQ-Sg
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:57:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyYhO-0006IA-3u
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684159032;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JDzky7tH8pWfEVbI7PK8fdHZ49kS8Hcvy3LXt8kcxx8=;
 b=VLAZzFEmuyc4m9IcJpstbR9gvyXicOqKE0odbcZPk8TS2WWt8QPdM746VSElxgcTcNeNNB
 oCxbXA27JfbhERhEUE1PNIBkgkflA4IcHPrdkncsZuvY0tvg2h8yVGo1tBcRcvZUN/NHnE
 KVnk9aw3k9wvM9NzAYlYnYdC0rFuiSg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-_962eAc0PxCtD9mNlRupPQ-1; Mon, 15 May 2023 09:57:10 -0400
X-MC-Unique: _962eAc0PxCtD9mNlRupPQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f4231d7893so56516025e9.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684159029; x=1686751029;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JDzky7tH8pWfEVbI7PK8fdHZ49kS8Hcvy3LXt8kcxx8=;
 b=KSTEtz7Elp7RX6tMhaDT34eli+Qz0r8ZHW+KavML36EPuxNQgczQcRonsBoNlmD5Yg
 F56K7Mw1B9f6GLHnwhYVuLG5qTwkVpiSNyr6sNR7AjKlp2yAxv9E+2OcU09fzpORqY4j
 vel4qb6VKCvMpAjn/8kjKjl97ErPKmBT0grQiH5LHxXHT93SrM5A7IaoyndNxA8Wzfi0
 ev80XQbH0/OCP2CTxsdzBEBb7HLB9dUoRZrZXRkB3myU8Or6gy6oK06vQnBj7BcfUM+j
 Md0Dudn3i95QF8XqaUmoNNrVtTD9enW5boI9ZmfXo207CiSH+XeEuruuSC55QSlF0Yw2
 JdEg==
X-Gm-Message-State: AC+VfDzMCrG1pDHe0hmUHBFJ6J1Ps20cf9ZM2AaJNJtivYvJ1cMDllUS
 yNbI58E6pFLbW0jxKeMRllscqmB8pZ6omdw8xoGgmle2115P/5KDicLItvPxxTMIpRZ9iggty4m
 uiOjB4QuyIILA4jw=
X-Received: by 2002:a1c:f202:0:b0:3f1:75b0:dc47 with SMTP id
 s2-20020a1cf202000000b003f175b0dc47mr24466698wmc.15.1684159029019; 
 Mon, 15 May 2023 06:57:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7sABpvgRHHFznhyED886iL2+b3yvxMV7Fr3XcYRSHXCxDpMLik/X5K9rg6rzLzKXkuv1cNKQ==
X-Received: by 2002:a1c:f202:0:b0:3f1:75b0:dc47 with SMTP id
 s2-20020a1cf202000000b003f175b0dc47mr24466679wmc.15.1684159028669; 
 Mon, 15 May 2023 06:57:08 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f4fbd9cdb3sm8098830wma.34.2023.05.15.06.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 06:57:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  jasowang@redhat.com,  philmd@linaro.org,
 thuth@redhat.com,  berrange@redhat.com,  marcandre.lureau@redhat.com,
 pbonzini@redhat.com,  leobras@redhat.com,  peterx@redhat.com,
 zhanghailiang@xfusion.com,  chen.zhang@intel.com,  lukasstraub2@web.de
Subject: Re: [PATCH v5 2/3] migration: split migration_incoming_co
In-Reply-To: <20230515130640.46035-3-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 15 May 2023 16:06:39 +0300")
References: <20230515130640.46035-1-vsementsov@yandex-team.ru>
 <20230515130640.46035-3-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 15:57:07 +0200
Message-ID: <871qjhzoi4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Originally, migration_incoming_co was introduced by
> 25d0c16f625feb3b6
>    "migration: Switch to COLO process after finishing loadvm"
> to be able to enter from COLO code to one specific yield point, added
> by 25d0c16f625feb3b6.
>
> Later in 923709896b1b0
>  "migration: poll the cm event for destination qemu"
> we reused this variable to wake the migration incoming coroutine from
> RDMA code.
>
> That was doubtful idea. Entering coroutines is a very fragile thing:
> you should be absolutely sure which yield point you are going to enter.
>
> I don't know how much is it safe to enter during qemu_loadvm_state()
> which I think what RDMA want to do. But for sure RDMA shouldn't enter
> the special COLO-related yield-point. As well, COLO code doesn't want
> to enter during qemu_loadvm_state(), it want to enter it's own specific
> yield-point.
>
> As well, when in 8e48ac95865ac97d
>  "COLO: Add block replication into colo process" we added
> bdrv_invalidate_cache_all() call (now it's called activate_all())
> it became possible to enter the migration incoming coroutine during
> that call which is wrong too.
>
> So, let't make these things separate and disjoint: loadvm_co for RDMA,
> non-NULL during qemu_loadvm_state(), and colo_incoming_co for COLO,
> non-NULL only around specific yield.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Juan Quintela <quintela@redhat.com>


