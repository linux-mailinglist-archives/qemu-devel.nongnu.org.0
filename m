Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39B60E23D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:36:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ongUw-0004W2-5U; Wed, 26 Oct 2022 09:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ongUu-0004Vm-Ge
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ongUl-0007ZL-VG
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666791058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSFnPaNWRvv/sgchMHLcXk2YE74QAFtqk3SVpS/lT54=;
 b=CTUI5XLofqM/6DKrs8Ug04ho9p0ilCU8BNm4UiVPGIndwIX6uEVWf2Qn9+DeXg5k+Wfet2
 x6TvHwXQn93GWY+3e4r0gzHflvR5patnP2TvIJ4mVaBPbI1b3Io6ieJYTR0m9/xldejS75
 3Eo/0M3ZWJ0oa5T/ytU1DDm3oeE2xcU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-ajYQgccJNfer_e08Yf4iJA-1; Wed, 26 Oct 2022 09:30:57 -0400
X-MC-Unique: ajYQgccJNfer_e08Yf4iJA-1
Received: by mail-ej1-f71.google.com with SMTP id
 ho8-20020a1709070e8800b0078db5e53032so4536072ejc.9
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 06:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oSFnPaNWRvv/sgchMHLcXk2YE74QAFtqk3SVpS/lT54=;
 b=LjgolQi/erAbw5ggYDbIJcfSlq+olfur6QiIraYMKuFoz6IXdKMRJv3IR54rvJlXJy
 2LZHrdDYUKs4dMYlxrqGREQIQ0RC8OEUbsFajkivjFSTBeBCDiNKe5JPKq10flMiJRMU
 XXEVD5v8V29G+y8QIIVsNwx6S3MMoZ7GISPazPVnlyEVB1UJPKx/sLXsYgTJTWHWYxTf
 S0RFoKdU922qv6o1ejKQ+B/UJ2qFfU0Luox+BJjTLEWmg1bUPedODJGmfM7MBfqtN+uh
 ghTurhZnVhIR7eaCRy/rzDpPHL1KZKGxa0CkSNkRF+kQ1B69Kpnjruc44QDeOkmXxFvW
 XiYg==
X-Gm-Message-State: ACrzQf2aV2AXQd5pla5hjvDo0nQ4iE8EjUETUT05QhK0Ie6f2X/DC0Rs
 nGG2rZZznRPgDS+VpAFN4X0uvu3KP5oC/3Cbqapy5B1BQyvylw+L1fm5ZvFAcOQ6/7N1xzYzyKK
 4nlrkFmSZRfMYWLc=
X-Received: by 2002:a05:6402:11cc:b0:462:76cd:1215 with SMTP id
 j12-20020a05640211cc00b0046276cd1215mr1311342edw.318.1666791056067; 
 Wed, 26 Oct 2022 06:30:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7u47gy8bnPWRiYV+d51cNdCB4GQjNRFpZK7HcYN48xo9397SpHLYEOLI8RA1xnS0YyiPBqjg==
X-Received: by 2002:a05:6402:11cc:b0:462:76cd:1215 with SMTP id
 j12-20020a05640211cc00b0046276cd1215mr1311306edw.318.1666791055679; 
 Wed, 26 Oct 2022 06:30:55 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a1709063d2a00b00741a0c3f4cdsm2945240ejf.189.2022.10.26.06.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 06:30:55 -0700 (PDT)
Message-ID: <81bd7016-70e7-b3de-2181-5610724f55d8@redhat.com>
Date: Wed, 26 Oct 2022 15:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] iotests: Test qemu-img checksum
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-3-nsoffer@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220901143223.201295-3-nsoffer@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01.09.22 16:32, Nir Soffer wrote:
> Add simple tests creating an image with all kinds of extents, different
> formats, different backing chain, different protocol, and different
> image options. Since all images have the same guest visible content they
> must have the same checksum.
>
> To help debugging in case of failures, the output includes a json map of
> every test image.
>
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>   tests/qemu-iotests/tests/qemu-img-checksum    | 149 ++++++++++++++++++
>   .../qemu-iotests/tests/qemu-img-checksum.out  |  74 +++++++++
>   2 files changed, 223 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum
>   create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out
>
> diff --git a/tests/qemu-iotests/tests/qemu-img-checksum b/tests/qemu-iotests/tests/qemu-img-checksum
> new file mode 100755
> index 0000000000..3a85ba33f2
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/qemu-img-checksum
> @@ -0,0 +1,149 @@
> +#!/usr/bin/env python3
> +# group: rw auto quick
> +#
> +# Test cases for qemu-img checksum.
> +#
> +# Copyright (C) 2022 Red Hat, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +
> +import re
> +
> +import iotests
> +
> +from iotests import (
> +    filter_testfiles,
> +    qemu_img,
> +    qemu_img_log,
> +    qemu_io,
> +    qemu_nbd_popen,
> +)
> +
> +
> +def checksum_available():
> +    out = qemu_img("--help").stdout
> +    return re.search(r"\bchecksum .+ filename\b", out) is not None
> +
> +
> +if not checksum_available():
> +    iotests.notrun("checksum command not available")
> +
> +iotests.script_initialize(
> +    supported_fmts=["raw", "qcow2"],
> +    supported_cache_modes=["none", "writeback"],

It doesn’t work with writeback, though, because it uses -T none below.

Which by the way is a heavy cost, because I usually run tests in tmpfs, 
where this won’t work.  Is there any way of not doing the -T none below?

> +    supported_protocols=["file", "nbd"],
> +    required_fmts=["raw", "qcow2"],
> +)
> +
> +print()
> +print("=== Test images ===")
> +print()
> +
> +disk_raw = iotests.file_path('raw')
> +qemu_img("create", "-f", "raw", disk_raw, "10m")
> +qemu_io("-f", "raw",
> +        "-c", "write -P 0x1 0 2m",      # data
> +        "-c", "write -P 0x0 2m 2m",     # data with zeroes
> +        "-c", "write -z 4m 2m",         # zero allocated
> +        "-c", "write -z -u 6m 2m",      # zero hole
> +                                        # unallocated
> +        disk_raw)
> +print(filter_testfiles(disk_raw))
> +qemu_img_log("map", "--output", "json", disk_raw)
> +
> +disk_qcow2 = iotests.file_path('qcow2')
> +qemu_img("create", "-f", "qcow2", disk_qcow2, "10m")
> +qemu_io("-f", "qcow2",
> +        "-c", "write -P 0x1 0 2m",      # data
> +        "-c", "write -P 0x0 2m 2m",     # data with zeroes
> +        "-c", "write -z 4m 2m",         # zero allocated
> +        "-c", "write -z -u 6m 2m",      # zero hole
> +                                        # unallocated
> +        disk_qcow2)
> +print(filter_testfiles(disk_qcow2))
> +qemu_img_log("map", "--output", "json", disk_qcow2)

This isn’t how iotests work, generally.  When run with -qcow2 -file, it 
should only test qcow2 on file, not raw on file, not raw on nbd. Perhaps 
this way this test could even support other formats than qcow2 and raw.

Hanna


