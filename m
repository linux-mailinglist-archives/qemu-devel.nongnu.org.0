Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059DB2F6237
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:42:28 +0100 (CET)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02tP-0007XP-2B
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02it-0004Jl-ER
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:31:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02iq-0003Gt-2S
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610631089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9vxcLQFeynTRDemy4gbjHRs6Ar5iTO3MQPDbqTvvXk=;
 b=jME+xkH+6WqdhL1vn5/V1/1HBPbtbnCdC87yHYQwV0Iw3zvc1vO6pUcStE31E9kwSNyX1V
 MMccnG2IzYCYzCx2/i2L0xSZ3DZsY8jd3agaaJCQP2mj1l5qyrjFno+4baqoe9AWAKDG+m
 jJ8BQaxWzDMjSXUBMOG8+joMQGl+dy4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-7WCsr2ngNi2hVkYccy-esg-1; Thu, 14 Jan 2021 08:31:26 -0500
X-MC-Unique: 7WCsr2ngNi2hVkYccy-esg-1
Received: by mail-wr1-f72.google.com with SMTP id q18so2601711wrc.20
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:31:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M9vxcLQFeynTRDemy4gbjHRs6Ar5iTO3MQPDbqTvvXk=;
 b=EACDPoF4uKhAp+9qEohc9GmX/w7A1f5H0qqxmw0dGHpqs210StyoUffRVm2ayCJD8f
 Ie4PayN6yxHjqlLjoJqUx1QBBFPK4jbPnWpXG64WIg9VghHb1WVoreiPx6uruwaAZiMw
 0lc/EMptu7L/SZVMdi2EqpSN4FGBPhSB8fgQBBdZFZ+23wVuj2d66hvkNi8B22v4ip4J
 dC+sAVTpDPAXrUUupgSGAYlpqRYJFb1itfDMtYO/4VdXekzSlGs3OzJzlEIVXE1Ynuem
 MPms7eFfpBzL7/OzRyjctMbuiLV/pw/l/hc9fiWdq8199nGHejF0EvyisHF9LTt+wz1D
 KnKw==
X-Gm-Message-State: AOAM533+RV8ynbLtQeIUtU6CGsOW2KPuYV1CQ6KdExuP2jU6hjvdgFH7
 vC/W1z+SAWOVrr5/V3jqJA2sNw3ONAcmdqUh1zzMerlaYSR8YWb3g1pobkD++KeB/g72aH6v3SK
 EIjPkwuyDGXkhabY=
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr4012480wml.106.1610631085216; 
 Thu, 14 Jan 2021 05:31:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFQyuOz4WgxhLTW9CezGfgtqCLOy2wrvwbzpqcgafKfHddH8wZKBDryxwex8Ym2Loqx5UGHg==
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr4012457wml.106.1610631085017; 
 Thu, 14 Jan 2021 05:31:25 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b132sm8940704wmh.21.2021.01.14.05.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:31:24 -0800 (PST)
Subject: Re: [PATCH v2 12/25] tests/docker: add script for automating
 container refresh
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-13-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9e05c09c-3e4d-edfb-e77a-3674a3edb67c@redhat.com>
Date: Thu, 14 Jan 2021 14:31:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-13-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 2:02 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/refresh | 53 ++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100755 tests/docker/dockerfiles/refresh
> 
> diff --git a/tests/docker/dockerfiles/refresh b/tests/docker/dockerfiles/refresh
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

This code would be easier to understand if you place this
patch before the "tests/docker: auto-generate ..." ones,
and add a comment (or directly add these 3 lines in the
first "auto-generate" patch).

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +except Exception as ex:
> +   print(str(ex), file=sys.stderr)
> 


