Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348DC341A40
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:41:30 +0100 (CET)
Received: from localhost ([::1]:48450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCZN-0001UU-9a
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNCXf-0000cF-Rp
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:39:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNCXd-0007tE-Nx
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616150380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QRV9/eVFB89Zg05BsodBwTU8Ehr1hRVMUw3++dIfvA=;
 b=hWBwHAf2aJwWta3+MkH56HxHcev7zFjbIvfhTgBbm9dUcpTT2YnZZWd9E7PteoA9UZU2te
 SL4fwSOB4N1sGhtli7CP3R/DbJaPexopW3bEe5djwOvNBpWPvfl3A0PPjiWGvF+UEnGvsG
 0EMQINqj5IsZoW0fJNK1+bJ2uabzTyo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-SkFHTlQhMc-WqNbzl-yhzw-1; Fri, 19 Mar 2021 06:39:38 -0400
X-MC-Unique: SkFHTlQhMc-WqNbzl-yhzw-1
Received: by mail-wm1-f72.google.com with SMTP id b20so7042451wmj.3
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3QRV9/eVFB89Zg05BsodBwTU8Ehr1hRVMUw3++dIfvA=;
 b=D7Pj9DQ56IfJaKNyJQmBTAqwGLhs0pQ7yB+SQrtF/iF4FVTeAPQuk+R6APQ19jqiyg
 g/8VxGjxw7A1M/Bd8+MVOz6g4y6SMhWtLvl6KNCfS95D/VN9dJC23YOYd6Q/GhWGPbRi
 qce/288K5SF8djaSVpI8V4IvZSA86yyd5fFwwWZXkkEWD0swqSc+1C65xcu03ZEIsf7Z
 6F1Xd9N31pK2ZUk/yPjQXGvv8Bf7u2+FWQ9EVVqXDbYSklskdbIpXCgEBsIyJNkb30Wx
 MJgV13SuVn5j+0pX6cxyhVfzZC5LyVVW9HOND1NlwVwbY6cmSg7qPTUSzbocRmcr94tj
 ILPw==
X-Gm-Message-State: AOAM5327wH/RR3DE8tWNSEgLo4en65WXFhTeouoBuD2Y5994mxAp/zk3
 qjFeoQwIVAaR4JQsSnLtJMD3u0yqs9fNKdoncNIK7og2/roVzEfZCYgIpRbHCVWcEWoYihV50fB
 f+miWfLMzubr3k6I=
X-Received: by 2002:a5d:534b:: with SMTP id t11mr3808411wrv.186.1616150377734; 
 Fri, 19 Mar 2021 03:39:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3fSIn3jfaf4sG8zfPvs3OUmGM5G8bT7ve6VYxS0BVsyI3rbCIsaNaneU8dJj0ZOvDGWA3MA==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr3808391wrv.186.1616150377556; 
 Fri, 19 Mar 2021 03:39:37 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 1sm5895615wmj.2.2021.03.19.03.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 03:39:36 -0700 (PDT)
Subject: Re: [PATCH 2/4] iotests: Revert "iotests: use -ccw on s390x for 040, 
 139, and 182"
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210318223907.1344870-1-laurent@vivier.eu>
 <20210318223907.1344870-3-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2acfce7b-9b53-f376-4ba6-1d74882e0f68@redhat.com>
Date: Fri, 19 Mar 2021 11:39:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318223907.1344870-3-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:39 PM, Laurent Vivier wrote:
> Commit f1d5516ab583 introduces a test in some iotests to check if
> the machine is a s390-ssw-virtio and to select virtio-*-ccw rather
> than virtio-*-pci.
> 
> We don't need that because QEMU already provides aliases to use the correct
> virtio interface according to the machine type.
> 
> This patch removes all virtio-*-pci and virtio-*-ccw to use virtio-*
> instead.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> cc: Cornelia Huck <cohuck@redhat.com>
> ---
>  blockdev.c                    |  6 +-----
>  tests/qemu-iotests/040        |  2 +-
>  tests/qemu-iotests/051        | 12 +-----------
>  tests/qemu-iotests/068        |  4 +---
>  tests/qemu-iotests/093        |  3 +--
>  tests/qemu-iotests/139        |  9 ++-------
>  tests/qemu-iotests/182        | 13 ++-----------
>  tests/qemu-iotests/238        |  4 +---
>  tests/qemu-iotests/240        | 10 +++++-----
>  tests/qemu-iotests/257        |  4 ++--
>  tests/qemu-iotests/307        |  4 +---
>  tests/qemu-iotests/iotests.py |  5 -----
>  12 files changed, 18 insertions(+), 58 deletions(-)

> diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
> index 7cbd1415ce7b..00382cc55e25 100755
> --- a/tests/qemu-iotests/051
> +++ b/tests/qemu-iotests/051
> @@ -119,17 +119,7 @@ echo
>  echo === Device without drive ===
>  echo
>  
> -case "$QEMU_DEFAULT_MACHINE" in
> -  s390-ccw-virtio)
> -      virtio_scsi=virtio-scsi-ccw
> -      ;;
> -  *)
> -      virtio_scsi=virtio-scsi-pci
> -      ;;
> -esac
> -
> -run_qemu -device $virtio_scsi -device scsi-hd |
> -    sed -e "s/$virtio_scsi/VIRTIO_SCSI/"
> +run_qemu -device virtio-scsi -device scsi-hd
>  
>  echo
>  echo === Overriding backing file ===

This one failed (but the fix is trivial):

051   fail       [05:49:47] [05:50:01]   13.3s                output
mismatch (see 051.out.bad)
--- /builds/philmd/qemu2/tests/qemu-iotests/051.pc.out
+++ 051.out.bad
@@ -72,7 +72,7 @@
 === Device without drive ===
-Testing: -device VIRTIO_SCSI -device scsi-hd
+Testing: -device virtio-scsi -device scsi-hd
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -device scsi-hd: drive property not set

Failures: 051
Failed 1 of 56 iotests


