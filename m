Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1FB21BA52
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 18:07:01 +0200 (CEST)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtvYC-000622-MO
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 12:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jtvX6-00054A-Sm
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 12:05:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27677
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jtvX4-0003dQ-8z
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 12:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594397149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZMjS9VahHy+svXZWBHGSPJl1zgai5DnSLIODjXfJfIE=;
 b=IWatbWSlwa04dmCBVrLL2/kL/n4sHeBUQmL4ocJ7j9XiM9FMOmVG5S1n0yU5bdsnRI5NnR
 u/OmMQahuylfSonjp3LG4txuxROF/NoIewO0vo67bgZniFMaiZv/pOXIme6ZvifK87DFFu
 MP11gQWObGMkffWoB+rWnx3O2mOyWD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-904Fk3lCP0m8GGSOmF47qg-1; Fri, 10 Jul 2020 12:05:47 -0400
X-MC-Unique: 904Fk3lCP0m8GGSOmF47qg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 483D98027E4;
 Fri, 10 Jul 2020 16:05:46 +0000 (UTC)
Received: from [10.3.112.178] (ovpn-112-178.phx2.redhat.com [10.3.112.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBBAC70101;
 Fri, 10 Jul 2020 16:05:45 +0000 (UTC)
Subject: Re: [PULL v2] Block layer patches
To: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20200709121713.283092-1-kwolf@redhat.com>
 <CAFEAcA-LwS=MhC9ewXrQht2GzLMa951uGP=8MNGsTPqzEO89GA@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ee21a2d5-0160-f95c-0eef-53d3266041ea@redhat.com>
Date: Fri, 10 Jul 2020 11:05:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-LwS=MhC9ewXrQht2GzLMa951uGP=8MNGsTPqzEO89GA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 04:36:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/10/20 10:41 AM, Peter Maydell wrote:

>>    qemu-img: Deprecate use of -b without -F (2020-07-09 14:14:55 +0200)
>>
>> ----------------------------------------------------------------
>> Block layer patches:
>>
>> - file-posix: Mitigate file fragmentation with extent size hints
>> - Tighten qemu-img rules on missing backing format
>> - qemu-img map: Don't limit block status request size
>>
> 
> iotest 114 fails on FreeBSD and OpenBSD (and probably NetBSD
> but that build hasn't reported back yet): looks like a
> non-portable use of 'truncate' ?
> 

> @@ -1,8 +1,11 @@
>   QA output created by 114
> -qemu-img: warning: Deprecated use of backing file without explicit
> backing format (detected format of raw)
> -Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
> backing_file=TEST_DIR/t.IMGFMT.orig
> +truncate: illegal option -- -
> +usage: truncate [-c] -s [+|-|%|/]size[K|k|M|m|G|g|T|t] file ...
> +       truncate [-c] -r rfile file ...
> +qemu-img: TEST_DIR/t.IMGFMT: Could not open 'TEST_DIR/t.IMGFMT.orig':

Yep, 'truncate' is not POSIX, but we've been lucky that most of our uses 
have been under '_supported_os Linux'; test 272 runs on BSD with 
'truncate -s' instead of 'truncate --size'.  The fix is obvious; I can 
post the followup to squash in if that will help.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


