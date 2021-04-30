Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA71036FB0D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:58:14 +0200 (CEST)
Received: from localhost ([::1]:42280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSij-00069u-T3
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcS5Y-0005pv-Ry
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcS5S-00079o-53
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619785055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JEL5+L278/vwo8gTfghBs+Z+QJdNRMv10JyrI1D7eAU=;
 b=S5B4IgoNr8UtpeiGKaPK/eir4eHjmZb3yU9K3jykm916L6AemG7H/Jejz6blARYu91i5oM
 0SwACbM84X9evRSBqE6uFX1FmOM6DWrcexcYNgPtAD6FH80UIa4RKvQEj19UrsCm8up+VQ
 1lnp0pKIWzNGh48B590mgfc/lnZq0fE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-1ZqgV2AVMsaFe3V2IHtvdw-1; Fri, 30 Apr 2021 08:17:33 -0400
X-MC-Unique: 1ZqgV2AVMsaFe3V2IHtvdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA8AD1898296;
 Fri, 30 Apr 2021 12:17:32 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 344682B0B3;
 Fri, 30 Apr 2021 12:17:31 +0000 (UTC)
Subject: Re: [PATCH v3 07/15] qemu-iotests: add gdbserver option to script
 tests too
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-8-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5bada3a2-5626-4f01-a5d9-e305a9c8d73e@redhat.com>
Date: Fri, 30 Apr 2021 14:17:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-8-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
> The only limitation here is that running a script with gdbserver
> will make the test output mismatch with the expected
> results, making the test fail.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/common.rc | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index 65cdba5723..53a3310fee 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -166,8 +166,14 @@ _qemu_wrapper()
>           if [ -n "${QEMU_NEED_PID}" ]; then
>               echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid"
>           fi
> +
> +        GDB="${QEMU_PROG}"
> +        if [ ! -z ${GDB_QEMU} ]; then
> +            GDB="gdbserver ${GDB_QEMU} ${GDB}"
> +        fi
> +
>           VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec "${VALGRIND_LOGFILE}" \
> -            "$QEMU_PROG" $QEMU_OPTIONS "$@"
> +           $GDB $QEMU_OPTIONS "$@"

This looks strange, because now there is no qemu here.

Why not just fill $GDB with the GDB options, keeping it empty if no gdb 
is to be used?  Then we’d have

VALGRIND_QEMU=... ... \
     $GDB "$QEMU_PROG" $QEMU_OPTIONS "$@"

here.

(Also, the indentation changed.  I’d keep it aligned to four spaces.)

Max

>       )
>       RETVAL=$?
>       _qemu_proc_valgrind_log "${VALGRIND_LOGFILE}" $RETVAL
> 


