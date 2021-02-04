Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7720D30F148
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:56:12 +0100 (CET)
Received: from localhost ([::1]:56386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cJ1-0000fM-Fc
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7cDF-0003VE-P0
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:50:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7cDC-0006Ce-PJ
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612435809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jpRVwayDJ4FjqnLpYYJhc2IWDN1w5alL8z1sZmyq/vE=;
 b=JDGLFdN0rw9AUtExLgbabMLkqx5FB1dwdt1In5eRD2t7Npia63+WC1hek02Gc9Q/Rcu+uf
 BWL/c7fHcFp/hpXcr5qNx2JJrH7sBw4CRvmJlcmGjB+k1F5vwcoPcsT+P51Yp6Gb/quU+o
 MVsURD8zLcSk0Kf2XZrpFn/JgD8lDN8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-mlZ-vqwyMgmFoOzqg0EmNw-1; Thu, 04 Feb 2021 05:50:06 -0500
X-MC-Unique: mlZ-vqwyMgmFoOzqg0EmNw-1
Received: by mail-qt1-f198.google.com with SMTP id d10so2228972qtx.8
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 02:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jpRVwayDJ4FjqnLpYYJhc2IWDN1w5alL8z1sZmyq/vE=;
 b=R0bUUhzlacA1cyJUHoLilNY6MxOzIwDsmrHP4XJeYJIcm3uax6Ce6Zo+1zTv0v41oG
 Th80Iz2ZtDwqIClEJG/Hr6WZ4ZvUfVAJah2Je848Uxh5shryvpgcnUAJsy5yvxTTLBHb
 WsrsGP5pLnLs2kefoQtJW26OkyGPfCauGm2Nzng32Kwxup719pZ22lf0Z8kAbx/B8ObA
 phQtJ8EqfTQKqIqH316z8w5f/mYkW6bW8COoLQdTrazbWfMlSO1KqJEl6k8xwRZyjYkY
 qmXtyY7jCfOkCyqACVO9K6SctsCFhcSOLIh2e1yP+QaUr/Tkoc4czOLi6GI+5UhahJp7
 Ph5Q==
X-Gm-Message-State: AOAM5303VR6kjASbHrPXnwwH+Pnu2wI8QxNkfhOTX61DNNv4sM0ZcuSe
 tpWbwPGIYXCfmMkbO3W5nu4mDFjHjQCTPwPhZd78zZfoVejQyoBCiaycbFuiZY2HaaoDTWQHpQy
 zXKLNUO+FUoK5U/c=
X-Received: by 2002:ac8:4412:: with SMTP id j18mr6575854qtn.350.1612435805913; 
 Thu, 04 Feb 2021 02:50:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8T3+Vs0mBUvX0kvKcEs+sIC8YdU3FNIPXYl/myzWQSkl4JfHIjLqJc8c9n7pEP1IqWqtpGQ==
X-Received: by 2002:ac8:4412:: with SMTP id j18mr6575844qtn.350.1612435805731; 
 Thu, 04 Feb 2021 02:50:05 -0800 (PST)
Received: from localhost ([181.191.236.144])
 by smtp.gmail.com with ESMTPSA id d10sm4323374qto.81.2021.02.04.02.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 02:50:05 -0800 (PST)
Date: Thu, 4 Feb 2021 07:50:03 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 04/22] tests/acceptance/virtiofs_submounts.py: use
 workdir property
Message-ID: <20210204105003.nnqrjsopv7bb5wjh@laptop.redhat>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-5-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-5-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 12:23:39PM -0500, Cleber Rosa wrote:
> For Avocado Instrumented based tests, it's a better idea to just use
> the property.  The environment variable is a fall back for tests not
> written using that Python API.
> 
> Reference: https://avocado-framework.readthedocs.io/en/84.0/api/test/avocado.html#avocado.Test.workdir
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index 361e5990b6..68d3cd6869 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -136,8 +136,7 @@ class VirtiofsSubmountsTest(BootLinux):
>          return (stdout, stderr, ret)
>  
>      def set_up_shared_dir(self):
> -        atwd = os.getenv('AVOCADO_TEST_WORKDIR')
> -        self.shared_dir = os.path.join(atwd, 'virtiofs-shared')
> +        self.shared_dir = os.path.join(self.workdir, 'virtiofs-shared')
>  
>          os.mkdir(self.shared_dir)
>  
> @@ -234,8 +233,7 @@ class VirtiofsSubmountsTest(BootLinux):
>  
>          self.seed = self.params.get('seed')
>  
> -        atwd = os.getenv('AVOCADO_TEST_WORKDIR')
> -        self.ssh_key = os.path.join(atwd, 'id_ed25519')
> +        self.ssh_key = os.path.join(self.workdir, 'id_ed25519')
>  
>          self.run(('ssh-keygen', '-t', 'ed25519', '-f', self.ssh_key))
>  
> -- 
> 2.25.4
>

Reviewed-by: Beraldo Leal <bleal@redhat.com>


