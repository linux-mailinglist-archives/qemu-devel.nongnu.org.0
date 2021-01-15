Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CEC2F86CC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:36:39 +0100 (CET)
Received: from localhost ([::1]:59108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Vpm-0006ER-RI
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0Vol-0005j5-20
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:35:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0Voh-0001hs-12
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610742928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/gpJ4HJXObuNVe8lh+L7y+kd6HbgOiU75tRUQD0ffo=;
 b=iCEGh+WXZqpItM7/BTE88AnTVZ5r28fDmIulTpn4R0R5s4xEVFgacep43G2hPZxw249xsF
 LjZFsO8PsTDfZfXGKzRYTTMZna4da038NMd7fVJQN5pVrCSnjj3gKKyaW1xYL93hU0ru+B
 j/PrOqrMFhuBP0FPB0dFDqEoDatXAUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-3AIctEO8OzOhrr3_lmQPIQ-1; Fri, 15 Jan 2021 15:35:25 -0500
X-MC-Unique: 3AIctEO8OzOhrr3_lmQPIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E23C0100C69E;
 Fri, 15 Jan 2021 20:35:22 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1B6127CA1;
 Fri, 15 Jan 2021 20:35:13 +0000 (UTC)
Subject: Re: [PATCH v2 12/25] tests/docker: add script for automating
 container refresh
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-13-berrange@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <71896ff9-3b67-5d68-61da-695497cd19c8@redhat.com>
Date: Fri, 15 Jan 2021 17:35:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-13-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 1/14/21 10:02 AM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/docker/dockerfiles/refresh | 53 ++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100755 tests/docker/dockerfiles/refresh
>
> diff --git a/tests/docker/dockerfiles/refresh b/tests/docker/dockerfiles/refresh

My suggestion is to rename the file to gen_dockerfiles.py and move to 
the parent directory.

To the best of my knowledge this community isn't picky about the style 
of Python code but if you run pylint you gonna see some warns worth a 
fix (mostly about bad indentation).

> new file mode 100755
> index 0000000000..b1d99963e9
> --- /dev/null
> +++ b/tests/docker/dockerfiles/refresh
> @@ -0,0 +1,53 @@
> +#!/usr/bin/python3
> +#
> +# Re-generate container recipes
> +#
> +# This script uses the "lcitool" available from
> +#
> +#   https://gitlab.com/libvirt/libvirt-ci

Shouldn't we document somewhere else the use of this tool in QEMU? For 
those who don't know its purpose, how it can be installed/extended, 
etc... maybe having a README under tests/docker or just appending some 
words on "Docker based tests" section from docs/devel/testing.rst?

- Wainer

> +#
> +# Copyright (c) 2020 Red Hat Inc.
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2
> +# or (at your option) any later version. See the COPYING file in
> +# the top-level directory.
> +
> +import sys
> +import os
> +import subprocess
> +
> +if len(sys.argv) != 2:
> +   print("syntax: %s PATH-TO-LCITOOL" % sys.argv[0], file=sys.stderr)
> +   sys.exit(1)
> +
> +lcitool_path=sys.argv[1]
> +
> +def atomic_write(filename, content):
> +   try:
> +      with open(filename + ".tmp", "w") as fp:
> +         print(content, file=fp, end="")
> +         os.replace(filename + ".tmp", filename)
> +   except Exception as ex:
> +      os.unlink(filename + ".tmp")
> +      raise
> +
> +def generate_image(filename, host, cross=None, trailer=None):
> +   print("Generate %s" % filename)
> +   args = [lcitool_path, "dockerfile"]
> +   if cross is not None:
> +      args.extend(["--cross", cross])
> +   args.extend([host, "qemu"])
> +   lcitool=subprocess.run(args, capture_output=True)
> +
> +   if lcitool.returncode != 0:
> +      raise Exception("Failed to generate %s: %s" % (filename, lcitool.stderr))
> +
> +   content = lcitool.stdout.decode("utf8")
> +   if trailer is not None:
> +      content += trailer
> +   atomic_write(filename, content)
> +
> +try:
> +   pass
> +except Exception as ex:
> +   print(str(ex), file=sys.stderr)


