Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1343140FABA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:48:40 +0200 (CEST)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFAN-00029b-1V
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRF2e-0005d9-2B
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRF2c-0006m4-GR
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SbXd+7fn5N1S5fh6iDb1Mhf6gwXtvBX/pH1mVAAGIGQ=;
 b=V/GpJ94ccOxgxk4MmxJ7mmnWwnhGfGALuRj5UQPv/itIwkszTmiVLYJ5SdYrwj9x+OGISi
 hiDFHcajIuXw1UPJtaUbPkVC9VOSe0XkQJ60W60rN2env8Zhg260piYsESxJ51ImS94fHg
 RqMn1YbbMfhBDsCNKDcMazpSOCHWLuQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-6R3VJJ6hNHGrJ1l7qTMPng-1; Fri, 17 Sep 2021 10:40:36 -0400
X-MC-Unique: 6R3VJJ6hNHGrJ1l7qTMPng-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so4728722wmj.8
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 07:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SbXd+7fn5N1S5fh6iDb1Mhf6gwXtvBX/pH1mVAAGIGQ=;
 b=D0KrjL4vYsHlERFiIboLf2BnDWMisaGuO7xDvpJirw1Za6DGeWuBspPPkxycJoPEI/
 LKzG1S4SVKIdqPZlfirnC2cc98WdawDwswbWhcTvzMCl9/bXhWSr5sWW/U91/VBX/VxH
 7tbd0duKU3mXOZ3qoFve7zxARZN31SywLrJnRydT1xLEuD6G498NfOZuMxaq3gmITneY
 TkAl/oj7Ava8rp3Mr4kVe7gBSHqK5gLm1D9VrQU9T7uxQ3xUJi5tpny7Jo8xUv907CuV
 hKbuJMOYZVh6BaM2/SrvW9xGAYYC1Eqq+F6ANz/HLfKFNEaItXH9+W0BitW4t/aSzEUw
 gYXA==
X-Gm-Message-State: AOAM5307pvf4mfDy/ilwFMhgM+3n3w5TBCFG9/INna3meHPDohvLZRj3
 fzD1tzElJnr6vK7dJ1i2GTcTgD8ikcKKxTgNQ+LDoNRCEZ+InJO8I0RF0Nnw5FIlLSolF2aipuV
 FAui6qho6yE8bQBo=
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr12474815wrw.122.1631889635053; 
 Fri, 17 Sep 2021 07:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjX8TL5SvvE86dWvuVliR0mh/GA0xglAndLwHI/7ubaP3vXRNimW7rjr9hb7Nr90dBvQbMLA==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr12474793wrw.122.1631889634846; 
 Fri, 17 Sep 2021 07:40:34 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id y197sm7697187wmc.18.2021.09.17.07.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:40:34 -0700 (PDT)
Subject: Re: [PATCH 15/15] python, iotests: replace qmp with aqmp
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-16-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <c5c66550-8e12-8aa2-1af3-b778aa399b10@redhat.com>
Date: Fri, 17 Sep 2021 16:40:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917054047.2042843-16-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.09.21 07:40, John Snow wrote:
> Swap out the synchronous QEMUMonitorProtocol from qemu.qmp with the sync
> wrapper from qemu.aqmp instead.
>
> Add an escape hatch in the form of the environment variable
> QEMU_PYTHON_LEGACY_QMP which allows you to cajole QEMUMachine into using
> the old interface, proving that both implementations work concurrently.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine/machine.py | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 8f5a6649e5..6b005dd5d1 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -41,7 +41,6 @@
>   )
>   
>   from qemu.qmp import (  # pylint: disable=import-error
> -    QEMUMonitorProtocol,
>       QMPMessage,
>       QMPReturnValue,
>       SocketAddrT,
> @@ -50,6 +49,12 @@
>   from . import console_socket
>   
>   
> +if os.environ.get('QEMU_PYTHON_LEGACY_QMP'):
> +    from qemu.qmp import QEMUMonitorProtocol
> +else:
> +    from qemu.aqmp.legacy import QEMUMonitorProtocol
> +
> +
>   LOG = logging.getLogger(__name__)

Black magic.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Tested-by: Hanna Reitz <hreitz@redhat.com>


