Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD356F0271
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:20:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwrJ-0007Qi-Pw; Thu, 27 Apr 2023 04:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwr9-0007PM-Sa
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:20:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwr3-0008FD-AW
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583577;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WIp78WUe7zqBUK9ECupb/u8IN9usbL9czk+8mihvMxU=;
 b=RIjcXaHP6jKMwfyno8imKDMlomTQG4bq2SKD1fq32XqPRBn5X6i79SLsj9N+dlkjy5BKX/
 dnrebXv08a+SKIofBRelU3qcGk6D/KwugXCLnZN+BP4hcbd+CtGFCbvc1BKMChmIvMV3+y
 kaIBFq1xCdZhSaGQaG6EXRja9P5ltXQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-mbDAmP5TNomyOKDZRwaljA-1; Thu, 27 Apr 2023 04:19:35 -0400
X-MC-Unique: mbDAmP5TNomyOKDZRwaljA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30479c17304so1661951f8f.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682583573; x=1685175573;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIp78WUe7zqBUK9ECupb/u8IN9usbL9czk+8mihvMxU=;
 b=YfuYiqMGelWple1qZSMDXwp6MqVjzGuMgK3RTAYoFpCyqpA17q/lWQDs5XdFDeEzPU
 nFvoq2T8wGeBAmcXTkdhd8be3igZHFwqgFJn6BC0M+5uKdB8tpA+TcfqddcKiYKdHYvD
 ut94ynvHLwl7W/9I+lKBsd2KlqXVhgXSXstWmlIPZ/BKPySafzfj1N7yzxFRUq78MNMS
 LcZ6b4u3jFSDteybId9aLAwNSFzyhjJgWGAtAEgFXPgTW7og8baDbJIA5SB5B81ZrAZA
 SZ6v+tZZfsm/PmnVOkQlB9jbQyzgnM7QFoz37oDhAQR4+FjBJpeBR2DWPXINy4f+ym75
 PBNQ==
X-Gm-Message-State: AC+VfDwphBCpegd53+kwbryFCk9S9N7NhSqettu73MKcKCLzsDW1JK/d
 Vx79cgkxD8gEoDB4GCJafVwDBFOEouWbCPgwIXg3GCc4v5Sq/c0wpYIGhS0/Y4ZktdHCJ35h9JZ
 qzftl/OV97xuiRi4=
X-Received: by 2002:adf:f78a:0:b0:2fa:98dc:b21c with SMTP id
 q10-20020adff78a000000b002fa98dcb21cmr658411wrp.18.1682583573065; 
 Thu, 27 Apr 2023 01:19:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40nBdN8plNbk2o2rn3TNObDWdJS72cf6BBgZC+SMdPs6aS97+cJU6AzoCU6dh9maWOxOT5Rg==
X-Received: by 2002:adf:f78a:0:b0:2fa:98dc:b21c with SMTP id
 q10-20020adff78a000000b002fa98dcb21cmr658390wrp.18.1682583572614; 
 Thu, 27 Apr 2023 01:19:32 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 z1-20020a5d44c1000000b00304a876c3c1sm2219036wrr.5.2023.04.27.01.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 01:19:32 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  Cleber Rosa
 <crosa@redhat.com>,  John Snow <jsnow@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PULL 0/7] Migration 20230426 patches
In-Reply-To: <5db4affa-d831-2ba1-7175-c5ba32182ef1@linaro.org> (Richard
 Henderson's message of "Thu, 27 Apr 2023 08:51:03 +0100")
References: <20230426181253.13286-1-quintela@redhat.com>
 <5db4affa-d831-2ba1-7175-c5ba32182ef1@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 27 Apr 2023 10:19:31 +0200
Message-ID: <87sfcld9f0.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 4/26/23 19:12, Juan Quintela wrote:
>> The following changes since commit 9c894df3a37d675652390f7dbbe2f65b7bad7efa:
>>    migration: Create migrate_max_bandwidth() function (2023-04-24
>> 15:01:47 +0200)
>> are available in the Git repository at:
>>    https://gitlab.com/juan.quintela/qemu.git
>> tags/migration-20230426-pull-request
>> for you to fetch changes up to
>> 7b5cd8ff519e9fe3df6cda65428a6f1aa28a6ced:
>>    vmstate-static-checker: Recognize "num" field (2023-04-26
>> 19:17:55 +0200)
>> ----------------------------------------------------------------
>> Migration Pull request
>> Hi
>> This PULL request is on top of migration-20230424 already queued by
>> Richard.
>> It contains:
>> - MAINTAINERS: make peter and leo reviewers for migration (juan)
>> - Disable postcopy + multifd together. It needs at least to call
>>    send_sync before it will work. (juan)
>> - Improve postcopy error messages (peter)
>> - vmstate checker: Compare sizes of arrays correctly (peter)
>> - Move more capability functions to options.c (juan)
>> Please, apply.
>
> Build failures:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/4187732684#L2303

Fixed.

Sorry about that.
It only fails on hosts that don't support userfaultd() (i.e. non-linux).

Will resend.

Sorry for the noise.

Later, Juan.


>
> ../migration/postcopy-ram.c:1368:6: error: conflicting types for
> 'postcopy_ram_supported_by_host'; have '_Bool(MigrationIncomingState
> *)'
>  1368 | bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from ../migration/migration.h:27,
>                  from ../migration/postcopy-ram.c:22:
> ../migration/postcopy-ram.h:17:6: note: previous declaration of
> 'postcopy_ram_supported_by_host' with type
> '_Bool(MigrationIncomingState *, Error **)'
>    17 | bool postcopy_ram_supported_by_host(MigrationIncomingState *mis,
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> r~


