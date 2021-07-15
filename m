Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124743C9EFC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 14:55:41 +0200 (CEST)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m40tw-0007i3-16
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 08:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m40sy-0006u4-Ju
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 08:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m40sv-0005YJ-54
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 08:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626353674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6rOiGjKtU1WMOln+e0ovilJmZii59hbb8kB09mOgb0=;
 b=F630lM1d1FGqp+BBl/qw2chtKudnhOoZdygk3eAeXPuaC9YuG7LRMJK782sTuHvPU9YBRa
 VlSH927fudh6NvcPfSr6hydsfWfVBYxsx5qhNFG2+s6i3e7Pl/0OsLrT2sU/YSocTEpsGz
 JeUMgHiJmHzdQPq3b6i5oiLJaVnLbuY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-E0uWxL0eMVe2CU7sGhTRUQ-1; Thu, 15 Jul 2021 08:54:33 -0400
X-MC-Unique: E0uWxL0eMVe2CU7sGhTRUQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 j6-20020adff5460000b029013c7749ad05so3322409wrp.8
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 05:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=l6rOiGjKtU1WMOln+e0ovilJmZii59hbb8kB09mOgb0=;
 b=AfQyeU1AgyLtnxvMqcVAqLyWzoHqpcGpwJnlBMtJrVVHIT330Z7ZeGpx/6F1vawS6R
 sSlLOWZBn65NoX14tBmgnd3BP3AaCJDYu3t0oKqo6bvYNchM2MMIgJk81hKs4of7fju3
 2cj9/zAMwq2C+UaUsKiLE6OnFCvs++8RCXZMAAbl3RrZhzRVN5PCJlmlyvYcS7H49Tk3
 usoVAXStmPH69DTM6viMlbJWZp6849HbmmQUItEXKC7DEW3evPSgIsmQU1qFnBMCb/Gq
 QPTskcnlCZ12598hszGXUyBA3ldyWvC8tRNL1EjHR5fBA+FqvCA974Jx4f0rYrkMkYav
 Gkrg==
X-Gm-Message-State: AOAM530bIOewH0PYugb5TYbvTvOhsnEW0PXG5WayMDqTIbFNu3Zd6Nct
 P4KDYC2Pnbk55Mdefya6zxotWjdocq41UcWbcEvgsvDEKkAMptD6+yQ2SoviRbPUJg9k71PP+zr
 t8sHjM7g+TCYUL3SFoobMWVwkZ5gJbplupIl2Hfh31bB8IuwC/CK4Ix+6McUQuc0G
X-Received: by 2002:a1c:2782:: with SMTP id
 n124mr10587586wmn.114.1626353672478; 
 Thu, 15 Jul 2021 05:54:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLMbIxaXLgSKnenFuC7qZmEhC6o9yflXWth6ORLyaFYvDOYJw8hsICiWAdb+3ytU60HhnnUQ==
X-Received: by 2002:a1c:2782:: with SMTP id
 n124mr10587554wmn.114.1626353672150; 
 Thu, 15 Jul 2021 05:54:32 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 l24sm8109626wmi.30.2021.07.15.05.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 05:54:31 -0700 (PDT)
Subject: Re: [PATCH v8 08/16] qemu-iotests: add gdbserver option to script
 tests too
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210705065711.127119-1-eesposit@redhat.com>
 <20210705065711.127119-9-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <647d146b-96dc-48f0-054b-97fc6fb181a4@redhat.com>
Date: Thu, 15 Jul 2021 14:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705065711.127119-9-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 08:57, Emanuele Giuseppe Esposito wrote:
> Remove read timer in test script when GDB_OPTIONS are set,
> so that the bash tests won't timeout while running gdb.
>
> The only limitation here is that running a script with gdbserver
> will make the test output mismatch with the expected
> results, making the test fail.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/common.qemu | 7 ++++++-
>   tests/qemu-iotests/common.rc   | 8 +++++++-
>   2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.qemu
> index 0fc52d20d7..cbca757b49 100644
> --- a/tests/qemu-iotests/common.qemu
> +++ b/tests/qemu-iotests/common.qemu
> @@ -85,7 +85,12 @@ _timed_wait_for()
>       timeout=yes
>   
>       QEMU_STATUS[$h]=0
> -    while IFS= read -t ${QEMU_COMM_TIMEOUT} resp <&${QEMU_OUT[$h]}
> +    read_timeout="-t ${QEMU_COMM_TIMEOUT}"
> +    if [ ! -z ${GDB_OPTIONS} ]; then

Shouldn’t we quote "${GDB_OPTIONS}" so that `test` won’t interpret it as 
its own parameters (if something in there starts with `--`, which I 
don’t think is the intended usage for $GDB_OPTIONS, but, well...)?

(Also, `! -z` is the same as `-n`, but I suppose choosing between the 
two can be a matter of style.)

> +        read_timeout=
> +    fi
> +
> +    while IFS= read ${read_timeout} resp <&${QEMU_OUT[$h]}
>       do
>           if [ -n "$capture_events" ]; then
>               capture=0
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index cbbf6d7c7f..a1ef2b5c2f 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -166,8 +166,14 @@ _qemu_wrapper()
>           if [ -n "${QEMU_NEED_PID}" ]; then
>               echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid"
>           fi
> +
> +        GDB=""
> +        if [ ! -z ${GDB_OPTIONS} ]; then

Here, too.  (Sorry for not noticing in v3 already...)

Max

> +            GDB="gdbserver ${GDB_OPTIONS}"
> +        fi
> +
>           VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec "${VALGRIND_LOGFILE}" \
> -            "$QEMU_PROG" $QEMU_OPTIONS "$@"
> +            $GDB "$QEMU_PROG" $QEMU_OPTIONS "$@"
>       )
>       RETVAL=$?
>       _qemu_proc_valgrind_log "${VALGRIND_LOGFILE}" $RETVAL


