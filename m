Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6AA42BFA2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:17:55 +0200 (CEST)
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1madCk-0007Jv-5s
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1madB2-0006N2-Q8
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:16:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1madAy-00012c-ML
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634127363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m00wcAHICVyWdkQvrQZd1+uvZFbtjJx9ZiEi0F4BNWM=;
 b=iAT1pFTZMCefbF1ke+AoI8Rzvqgon1i1wuHfhH2AYvuhQqA+ZT6ILJoM/R9JRLdRH4sTPf
 H6ZSjvFQMsJAZeIvRZi3ZqVtom4vhyppwYry1fFMuvLxVM0GpY9qS8vPLYC9vZKe+NmHtn
 6Ta6I9x9R8bXFF7D/S/blHhNkCXOYp0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-G1T7YSSTMJuoaXt6MXMz4g-1; Wed, 13 Oct 2021 08:16:00 -0400
X-MC-Unique: G1T7YSSTMJuoaXt6MXMz4g-1
Received: by mail-wr1-f71.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so1831271wrb.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m00wcAHICVyWdkQvrQZd1+uvZFbtjJx9ZiEi0F4BNWM=;
 b=sV9Bn5F5ChcMeh+BDoUq3R4f0J9KM6tFWh+VWr77zj2oOqBOARUVYrM3XqY7yR8kpw
 ol+TYBGZh75SOltVg3wjEVxrLEoXDRBRREZGfD3kjBYZ4dMN69UFydLbDpODWCItK1D6
 y5Cp0LNmjcIGm68JJIaxuC1fxMTvJOOaAkGwMYQxTOSfnyOWjz+cc6LjTkEIGZRasg5M
 DWlAyKKVvvokYQStqO8VzL6f2BMLNSIRUSgiC/SCl2T/n8fkiWfdZmpNb4ex//84XkVv
 61nl36elg7Tk6MTOk2shXJOWG2FwpGKrm8v6tpp6/l1BUeDAOswNs4hWRYUI8F1r3OSN
 O1dg==
X-Gm-Message-State: AOAM53288Sg0pmBvDw46SqhAPADDKzXb6aFCDClMpZCdyzU7h0IpSvlz
 ZgP/b9vktljyZEW0qe5gURe97bze+fsZqvY2K59psPZhcm4kZvcFswbyC4J7xBt1FR9sYjGJXC/
 /IMttUL/hpo1jdKQ=
X-Received: by 2002:a5d:4481:: with SMTP id j1mr40745907wrq.6.1634127359154;
 Wed, 13 Oct 2021 05:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLBeU+47WEBh8F6RgcDaNvgtHB0qe1hhLLluzW55Hsan5D/pk/sPGHCIITzvCemvbNSsJKEA==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr40745881wrq.6.1634127358981;
 Wed, 13 Oct 2021 05:15:58 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id a2sm13212603wrq.9.2021.10.13.05.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 05:15:58 -0700 (PDT)
Message-ID: <1b5e36c5-4d47-c4e4-9d39-6adb43a82537@redhat.com>
Date: Wed, 13 Oct 2021 14:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 11/13] iotests/linters: Add workaround for mypy bug #9852
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-12-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-12-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 23:05, John Snow wrote:
> This one is insidious: if you write an import as "from {namespace}
> import {subpackage}" as mirror-top-perms (now) does, mypy will fail on
> every-other invocation *if* the package being imported is a typed,
> installed, namespace-scoped package.
>
> Upsettingly, that's exactly what 'qemu.[aqmp|qmp|machine]' et al are in
> the context of Python CI tests.
>
> Now, I could just edit mirror-top-perms to avoid this invocation, but
> since I tripped on a landmine, I might as well head it off at the pass
> and make sure nobody else trips on that same landmine.
>
> It seems to have something to do with the order in which files are
> checked as well, meaning the random order in which set(os.listdir())
> produces the list of files to test will cause problems intermittently
> and not just strictly "every other run".
>
> This will be fixed in mypy >= 0.920, which is not released yet. The
> workaround for now is to disable incremental checking, which avoids the
> issue.
>
> Note: This workaround is not applied when running iotest 297 directly,
> because the bug does not surface there! Given the nature of CI jobs not
> starting with any stale cache to begin with, this really only has a
> half-second impact on manual runs of the Python test suite when executed
> directly by a developer on their local machine. The workaround may be
> removed when the Python package requirements can stipulate mypy 0.920 or
> higher, which can happen as soon as it is released. (Barring any
> unforseen compatibility issues that 0.920 may bring with it.)
>
>
> See also:
>   https://github.com/python/mypy/issues/11010
>   https://github.com/python/mypy/issues/9852
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/linters.py | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


