Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F3496513
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:32:11 +0100 (CET)
Received: from localhost ([::1]:33746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyhm-00088j-Pn
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:32:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nAy7I-0005L9-Pi
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:54:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nAy7F-0002kn-8e
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642787663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mr2k6xJBTYCpo458NP7Ib8C2NsvPhctCQ+3pclJRg7k=;
 b=CvZIYEeaW/DPPj0CMgG45lO+wXsr/JLynbTvRVCsO94kDmn6vQ/YBi1HpI6HKd1putmrg7
 w4DAlniR+OUd/elnG8pgzfCiOSUCPns3ud6WK4VoYBtbFFljFqaeydbuvyvyJ/3poSYBKq
 TDD5Ea5iZRg+s/lmId1D8sJoKIiEcuk=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-k6Q7hm9kNHi-dzCp9GfhQQ-1; Fri, 21 Jan 2022 12:54:21 -0500
X-MC-Unique: k6Q7hm9kNHi-dzCp9GfhQQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 b17-20020a056830311100b0059a5c614267so5860706ots.15
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 09:54:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mr2k6xJBTYCpo458NP7Ib8C2NsvPhctCQ+3pclJRg7k=;
 b=UnTRf3UedSYIpV2o/lPtmXY7yTR0iPkEM5qLIzgQnmoxOvDEPxI35KDVVPSHPgqYdU
 CIz1yNDPqzMs8gAiWHmhE2QbRUx9cFYbc6jJzE4c453CwbgzvXt+CBYOheFNITreLlBw
 T1084iiPRRQ1k1Ny14USpTQX4wzdzgteCtDbjZdUl4ZJ0xT+tdHL02roS6suhjkchz47
 Wrs4vp686zNlajNYzkQ8610GZS0uB3vvu7jKnQ9kqHr0liTzV3GHMct/EzA33JWkRslN
 r37pb9EGTPl25X1w8m9xpz/a//fLtOB2R6G46Rl11KGKebP42+zWYxmsNKujVqG/GpAB
 Ot2A==
X-Gm-Message-State: AOAM531RsXDvW5DhDRu49ISC3Ut1GzZMvQSv0MXH6bIWKOWj8vH9eB6x
 ybXQttcRRAq28/BlmhGXdQUA39K9PzECQjml49fJsh+xk+rafDsjI1vAc1K2oUxta5SqTP77wFU
 2XElXt5PBMhGg8GU=
X-Received: by 2002:a9d:5908:: with SMTP id t8mr3493753oth.186.1642787659813; 
 Fri, 21 Jan 2022 09:54:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxa3I+0OGxSGRduNDOqdGB8+Dd+3j14OYEuEq6+50Id5uEdW/w3dhWFF/CSNH1dTWqXdciiw==
X-Received: by 2002:a9d:5908:: with SMTP id t8mr3493738oth.186.1642787659586; 
 Fri, 21 Jan 2022 09:54:19 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id a15sm1590899oil.13.2022.01.21.09.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 09:54:19 -0800 (PST)
Date: Fri, 21 Jan 2022 14:54:17 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] python: pin setuptools below v60.0.0
Message-ID: <20220121175417.rgaldqoqzdcw2igp@laptop.redhat>
References: <20220121005221.142236-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220121005221.142236-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 07:52:21PM -0500, John Snow wrote:
> setuptools is a package that replaces the python stdlib 'distutils'. It
> is generally installed by all venv-creating tools "by default". It isn't
> actually needed at runtime for the qemu package, so our own setup.cfg
> does not mention it as a dependency.
> 
> However, tox will create virtual environments that include it, and will
> upgrade it to the very latest version. the 'venv' tool will also include
> whichever version your host system happens to have.
> 
> Unfortunately, setuptools version 60.0.0 and above include a hack to
> forcibly overwrite python's built-in distutils. The pylint tool that we
> use to run code analysis checks on this package relies on distutils and
> suffers regressions when setuptools >= 60.0.0 is present at all, see
> https://github.com/PyCQA/pylint/issues/5704
> 
> Instruct tox and the 'check-dev' targets to avoid setuptools packages
> that are too new, for now. Pipenv is unaffected, because setuptools 60
> does not offer Python 3.6 support, and our pipenv config is pinned
> against Python 3.6.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Makefile  | 2 ++
>  python/setup.cfg | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/python/Makefile b/python/Makefile
> index 3334311362..949c472624 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -68,6 +68,8 @@ $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
>  		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
>  		. $(QEMU_VENV_DIR)/bin/activate;		\
>  		echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";	\
> +		pip install --disable-pip-version-check		\
> +			"setuptools<60.0.0" 1>/dev/null;	\
>  		make develop 1>/dev/null;			\
>  	)
>  	@touch $(QEMU_VENV_DIR)
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 417e937839..aa238d8bc9 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -163,6 +163,7 @@ deps =
>      .[devel]
>      .[fuse]  # Workaround to trigger tox venv rebuild
>      .[tui]   # Workaround to trigger tox venv rebuild
> +    setuptools < 60  # Workaround, please see commit msg.
>  commands =
>      make check
>  

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


