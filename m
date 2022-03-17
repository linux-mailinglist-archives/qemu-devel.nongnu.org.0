Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11BF4DC292
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 10:25:14 +0100 (CET)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUmNd-0008Ve-9p
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 05:25:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUmLu-0007Uw-HE
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 05:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUmLs-0005yg-03
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 05:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647509001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mNPmX3g8h0387A+8q6+xWVb+ePEc1eDlDnhoA2Pc/PM=;
 b=FbWwZVrQmr6C9OkYgWaJ+ondCe4Qn+VWau0U5ho9pPI8aZXeO3jIg8YljSj+6EUPcXDAXr
 t0Ve/pOPp5VssdSXnzoDAfmRpkuPcfKBUYrOavn7g+vug+tNsRULdVcUMEZ90HQNcGq/Lv
 R02KkPa9ez6EKEbC81ZiDN4Ka8XdCPM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-flibXcLnPb-DZxKXgGCmUg-1; Thu, 17 Mar 2022 05:23:19 -0400
X-MC-Unique: flibXcLnPb-DZxKXgGCmUg-1
Received: by mail-ej1-f69.google.com with SMTP id
 hr26-20020a1709073f9a00b006d6d1ee8cf8so2553530ejc.19
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 02:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mNPmX3g8h0387A+8q6+xWVb+ePEc1eDlDnhoA2Pc/PM=;
 b=0HrO//BzWLrG5ZMqu2PXImkwbe3Vv/duloJD9d6qozNtVQIXxkAN5Spo0/8I0egsCg
 hluTreNPz0krFPrbanqUXu/xEPXJPlezsBAcL3xIF5Na0gPRf4EEI00RzhyVaypYHoTn
 UE1C+DUm1TGvMknFWzDjheG46bJRRoxXmpVXt8roV8hiWCFlklNFuRfi2Nw5gYaczQEp
 69iPq9MYMtY/YQNb8xJGMwzvDGWs7h+4DSQFDwxs2V8NaZq0OtpSoquzKidsxWExO+rl
 8kf/1c0qDV20nhA1BysxpyDa6ygx0Ski1WCjEz/BCkVbyq7p1uI+AT9+y/OUflYBhnJM
 41hg==
X-Gm-Message-State: AOAM533z7D3oCOcY8m277q/VNTBZS2jcvCeDiuxBuUWBXz/P5aYz0SgG
 qc0V9Qoxqw7WnLjfPMa6N9LVa1gMFkVINgj6RYspao9q6c8BSBefT1/tF3AldVmt0Y0DxdO9vC2
 xONqSJLOMjJjL1Fc=
X-Received: by 2002:a05:6402:190a:b0:416:c2f8:ad22 with SMTP id
 e10-20020a056402190a00b00416c2f8ad22mr3434343edz.144.1647508998070; 
 Thu, 17 Mar 2022 02:23:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPtHkNeo4itlHvOUZOq7yFhgJ2TqCzTuuCDRiMLhSzQwG2HbhHQnfkfajZsYs23TioxeeO9A==
X-Received: by 2002:a05:6402:190a:b0:416:c2f8:ad22 with SMTP id
 e10-20020a056402190a00b00416c2f8ad22mr3434314edz.144.1647508997699; 
 Thu, 17 Mar 2022 02:23:17 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a17090664d600b006df6790a519sm2161914ejn.116.2022.03.17.02.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 02:23:17 -0700 (PDT)
Message-ID: <1cf78366-7daa-79bb-60ad-8b7d0b03197e@redhat.com>
Date: Thu, 17 Mar 2022 10:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/5] python/utils: add VerboseProcessError
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-3-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220308015728.1269649-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:57, John Snow wrote:
> This adds an Exception that extends the Python stdlib
> subprocess.CalledProcessError.
>
> The difference is that the str() method of this exception also adds the
> stdout/stderr logs. In effect, if this exception goes unhandled, Python
> will print the output in a visually distinct wrapper to the terminal so
> that it's easy to spot in a sea of traceback information.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   python/qemu/utils/__init__.py | 36 +++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
> index 5babf40df2..355ac550bc 100644
> --- a/python/qemu/utils/__init__.py
> +++ b/python/qemu/utils/__init__.py
> @@ -18,6 +18,7 @@
>   import os
>   import re
>   import shutil
> +from subprocess import CalledProcessError
>   import textwrap
>   from typing import Optional
>   
> @@ -26,6 +27,7 @@
>   
>   
>   __all__ = (
> +    'VerboseProcessError',
>       'add_visual_margin',
>       'get_info_usernet_hostfwd_port',
>       'kvm_available',
> @@ -121,3 +123,37 @@ def _wrap(line: str) -> str:
>           os.linesep.join(_wrap(line) for line in content.splitlines()),
>           _bar(None, top=False),
>       ))
> +
> +
> +class VerboseProcessError(CalledProcessError):
> +    """
> +    The same as CalledProcessError, but more verbose.
> +
> +    This is useful for debugging failed calls during test executions.
> +    The return code, signal (if any), and terminal output will be displayed
> +    on unhandled exceptions.
> +    """
> +    def summary(self) -> str:
> +        """Return the normal CalledProcessError str() output."""
> +        return super().__str__()
> +
> +    def __str__(self) -> str:
> +        lmargin = '  '
> +        width = -len(lmargin)
> +        sections = []
> +
> +        name = 'output' if self.stderr is None else 'stdout'
> +        if self.stdout:
> +            sections.append(add_visual_margin(self.stdout, width, name))
> +        else:
> +            sections.append(f"{name}: N/A")
> +
> +        if self.stderr:
> +            sections.append(add_visual_margin(self.stderr, width, 'stderr'))
> +        elif self.stderr is not None:

What exactly is this condition for?  I would’ve understood if it was 
`self.stdout` (because the stdout section then is called just “output”, 
so it would make sense to omit the stderr block), but this way it looks 
like we’ll only go here if `self.stderr` is an empty string (which 
doesn’t make much sense to me, and I don’t understand why we wouldn’t 
have the same in the `self.stdout` part above).

(tl;dr: should this be `self.stdout`?)

Hanna

> +            sections.append("stderr: N/A")
> +
> +        return os.linesep.join((
> +            self.summary(),
> +            textwrap.indent(os.linesep.join(sections), prefix=lmargin),
> +        ))


