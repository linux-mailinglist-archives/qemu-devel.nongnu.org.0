Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769E830F194
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:08:49 +0100 (CET)
Received: from localhost ([::1]:39290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cVE-0000LM-IR
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7cSK-0006PA-JN
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:05:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7cSH-0004eP-OF
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e8UfluCzlswWvC8wI/eN4o2ish7qvVzZ4Oj5278fGUQ=;
 b=YNoX85W7itkqdX2HUQFk+FIvmgrHuOQguPFp3y9GeQ+RATj7kWA/RNIVEuXe1TOWpVh/We
 f+xreDoTlk/cK0oSGamtThuvRUyhEnnENXuGMiEBeDm774yI+G9u2OSxuvmPrLE+6AO5sJ
 yglNYAPfbIH2bXargmP6jNomrQuaypg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-w3fhYSMBN7GfbP_RJ2H5tw-1; Thu, 04 Feb 2021 06:05:41 -0500
X-MC-Unique: w3fhYSMBN7GfbP_RJ2H5tw-1
Received: by mail-qv1-f72.google.com with SMTP id v13so1878237qvm.10
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 03:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e8UfluCzlswWvC8wI/eN4o2ish7qvVzZ4Oj5278fGUQ=;
 b=uEpM7BgmG8ZLL3K6hjQDxk5sKxO3rBqpSM5u9E8JgcdBIBnzr3hQzV5ZOYpOMlFqp+
 I14hOel7u1SAOUaxaajv6syo2+2T6VpY6gnQ4v86yJxYeizMZny235YeTxm2eXE3OnKa
 XR4bXanv7HgF4iR+pPdikJ1+JWc/CBqdPjKsm5C91pHEYaxlla0x1c+nEH4rgs3kTSwm
 XHJ+rD4Y3VrGVB/ve8RdKuIPrWpiEGxPTRAF9hIfVDTGsOFFbgqmoorWsgZkXjbW3dUq
 zbENhm5FC2wYvLGY6/ynM176BAnq+4NKrKX5egwlrze3VNLQu9NVpHcHdHee8LR23+IH
 dSsw==
X-Gm-Message-State: AOAM530/EZHXbSI9pp8xlfhRSrOdSVKYoZwXYHY6Cl/SrCS4aOkF0IDr
 0EqF9RUJ20iLsBplTGFXB3KunpNLUXZkRhLpWFSYYhbwbbFmn030BrU3Ega+6i2HoppjOtcc0uo
 kHuZ2jsnwXwIJ9jA=
X-Received: by 2002:a37:9ca:: with SMTP id 193mr6844243qkj.241.1612436740753; 
 Thu, 04 Feb 2021 03:05:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzLarTUfFTNHUPSm0tmiA8HuVtMzr+vnfntOkTaPT+qhUfeBtDiVJmwr8tM1qxs1MAjJcPHw==
X-Received: by 2002:a37:9ca:: with SMTP id 193mr6844219qkj.241.1612436740595; 
 Thu, 04 Feb 2021 03:05:40 -0800 (PST)
Received: from localhost ([181.191.236.144])
 by smtp.gmail.com with ESMTPSA id i17sm4400832qtg.77.2021.02.04.03.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:05:39 -0800 (PST)
Date: Thu, 4 Feb 2021 08:05:37 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 05/22] tests/acceptance/virtiofs_submounts.py: do not ask
 for ssh key password
Message-ID: <20210204110537.ltk66jw2zm5tzdis@laptop.redhat>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-6-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-6-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Feb 03, 2021 at 12:23:40PM -0500, Cleber Rosa wrote:
> Tests are supposed to be non-interactive, and ssh-keygen is asking for
> a password when creating a key.  Let's set an empty key, which prevents
> ssh-keygen for asking for a password.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
> index 68d3cd6869..3b5a242385 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -235,7 +235,7 @@ class VirtiofsSubmountsTest(BootLinux):
>  
>          self.ssh_key = os.path.join(self.workdir, 'id_ed25519')
>  
> -        self.run(('ssh-keygen', '-t', 'ed25519', '-f', self.ssh_key))
> +        self.run(('ssh-keygen', '-N', '', '-t', 'ed25519', '-f', self.ssh_key))
>  
>          pubkey = open(self.ssh_key + '.pub').read()
>  
> -- 
> 2.25.4
> 

Reviewed-by: Beraldo Leal <bleal@redhat.com>


