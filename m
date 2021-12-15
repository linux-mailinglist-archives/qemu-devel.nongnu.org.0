Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23CC476538
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 23:05:57 +0100 (CET)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxcPM-0002oW-Di
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 17:05:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxcOE-00025Y-LP
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:04:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxcOB-0006mp-KM
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639605882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uU9Im938XZWgLm3rxr20OpDmuWlGaSflCyxUQit7kTA=;
 b=P4kQ478MfB5qXZrbYZjnNWP7fGrFsco1qttRvmrDlcsapOyyTHyVWnOeS6zad6wAC6oJgk
 ZxWQWo1ZQCX28NOrxRHjM5mTrgVHQZcvznkhq+YsxX4TMmu7LhsGlf9yC32m1ADZGLXCCQ
 /EyVCMu9GUGA0AKsWCdDrIn3pwz55Us=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-j8laWlnaN4a7xrCln7zVbQ-1; Wed, 15 Dec 2021 17:04:40 -0500
X-MC-Unique: j8laWlnaN4a7xrCln7zVbQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 s6-20020a05622a018600b002b2d93b9c73so31492285qtw.9
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 14:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uU9Im938XZWgLm3rxr20OpDmuWlGaSflCyxUQit7kTA=;
 b=w8lIhSWwIjQrzZUgZDXd19Rddu3FR+Qnz1IYdo1Vgd5uzpqI3Yws/SWmJINnPYXGXU
 tpVRECzy+mk72gf3r+Rc8HnatR4xbDdoa5TV+ThgEam5EAgvmk7m8oIsX/NeaWVVXLxj
 WtsTIEOaV+t3CfSrzHmMYSzdRpZ+QLQdwkOoUzgxEaLS/goLp5gDVtyrhvYiRRHV8bsK
 vbwi6/tI2zKnwg2fN0QuxsIvctMkgYFhH/raFYdMmbgED5y8k28C6HfPQZE1adZWVvtd
 DCndrZhkdKNWqhbQSE/H+1SN3czE5Qdp0P8li2ivQB4hSbRq2GN0kGW2zyR8Wis+pDhz
 p4EQ==
X-Gm-Message-State: AOAM531BGh03tIJLSQ3fk2JCbVP0/OM1nFjaU4NLnKrnVz0pFoND/Vrj
 jAHwLuzM6YbTf38DTgiuc69Wm6f0lPQRGDrXvq7FyGA+K8Adiz2w3bhTGPaDcWPSrUeo5bHkNPS
 4tHN6enQ9clRaBWI=
X-Received: by 2002:a05:6214:260c:: with SMTP id
 gu12mr13550532qvb.87.1639605880413; 
 Wed, 15 Dec 2021 14:04:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjQ+AEZOyOh9uyV8Usmu38gu2yNMyJFEOx0VnQJifETh7oCMW0+HVWSnDqSIa1m7WUWWOpVA==
X-Received: by 2002:a05:6214:260c:: with SMTP id
 gu12mr13550491qvb.87.1639605880191; 
 Wed, 15 Dec 2021 14:04:40 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id r16sm2414892qta.46.2021.12.15.14.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 14:04:39 -0800 (PST)
Date: Wed, 15 Dec 2021 19:04:31 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 02/14] tests/avocado: Specify target VM argument to
 helper routines
Message-ID: <20211215220431.ggp5fjccaunj55mf@laptop.redhat>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <31a4b3bb6a48f291890641ab348e7749c70a2d06.1639549843.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <31a4b3bb6a48f291890641ab348e7749c70a2d06.1639549843.git.jag.raman@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.bennee@linaro.org,
 qemu-devel@nongnu.org, wainersm@redhat.com, alex.williamson@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@gmail.com, stefanha@redhat.com,
 crosa@redhat.com, thanos.makatos@nutanix.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 10:35:26AM -0500, Jagannathan Raman wrote:
> Specify target VM for exec_command and
> exec_command_and_wait_for_pattern routines
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  tests/avocado/avocado_qemu/__init__.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index 75063c0c30..26ac782f53 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -198,7 +198,7 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
>      """
>      _console_interaction(test, success_message, failure_message, None, vm=vm)
>  
> -def exec_command(test, command):
> +def exec_command(test, command, vm=None):

nitpick: if possible, it would be nice to update the docstring, by
adding this new argument.

>      """
>      Send a command to a console (appending CRLF characters), while logging
>      the content.
> @@ -208,10 +208,11 @@ def exec_command(test, command):
>      :param command: the command to send
>      :type command: str
>      """
> -    _console_interaction(test, None, None, command + '\r')
> +    _console_interaction(test, None, None, command + '\r', vm=vm)
>  
>  def exec_command_and_wait_for_pattern(test, command,
> -                                      success_message, failure_message=None):
> +                                      success_message, failure_message=None,
> +                                      vm=None):

Same here.

Other than that, lgtm.

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


