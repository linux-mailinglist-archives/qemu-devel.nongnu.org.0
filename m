Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C230F137
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:51:48 +0100 (CET)
Received: from localhost ([::1]:44932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cEm-0004DK-3d
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7cC3-0002mm-NR
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:48:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7cC1-0005hm-Rw
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612435737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZxQAQis5dFNxAqeYv+4Zb0wHF4hVRlwdgsC30yD+VBM=;
 b=bq4Ev3uGaj/FclYZO9vmk5pPoisqmIa9GLYwqAA3lWYMM0g8RfTrMdm1U1tuHxFbjvd0ya
 rZ7e/Tuu157MDqf5+4AzarribRK24dKKddLoq6yDXxRft51Ynegenz6mmq9qHtZFg5mTXV
 cy0RPypdCS9bVJoa4he+g/flI6XMCec=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-nnm5ssIpN1iiZqKvxqYa9w-1; Thu, 04 Feb 2021 05:48:53 -0500
X-MC-Unique: nnm5ssIpN1iiZqKvxqYa9w-1
Received: by mail-qt1-f200.google.com with SMTP id p20so2200257qtn.23
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 02:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZxQAQis5dFNxAqeYv+4Zb0wHF4hVRlwdgsC30yD+VBM=;
 b=ObmUw28Q+GMYhus7bhWHIhZtLNKtPmYtHa/mwWVinyMo1S4Im/qt4gPdlkIte9gmHb
 ByNjv61VYFzsPqwES0VNl/L3OpsLEsTK8BvF2iHM9POEY4TCx+sakBblCL/QpA83hZqZ
 B0vuKmLBuyOXGK5xSKe5XmbpNkikYIx/5Bd+/VojMhzwC7E69IWiq9kGR8I1j7fgOT5/
 oTqsCLc1GUN8aMvcDWOCLOmMT+7SNjM5+Ceukf849rdqrW/6CgDoMOeB5KCbV4iYbj2b
 KAJahk83Zvms4sGYABnbC5qexOG4CZsd65DPyDpMy1tMf8jXE7DRkdEWC2BLQBrZni+q
 oXHQ==
X-Gm-Message-State: AOAM531nf4+74dD1Y939adgwUQpiHrqBJwKVcnkaGc1gLfYuryoAsnzR
 4jAoJdzoRdHyCeX/qufxsUKjoIJI4x+XKU2mMfu3/lCzo2TxSTF+W4E464CJ88J/yfbqyQfCASR
 hiUiLIU5qSTRgzP4=
X-Received: by 2002:a37:a955:: with SMTP id s82mr6908704qke.121.1612435732713; 
 Thu, 04 Feb 2021 02:48:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdZTgtAtIBA3iDJCv7LkjdJKI0EC0g3sQfBPGuhm87Ui5TFz0M++1pIZqDKKszONvJOkvtLw==
X-Received: by 2002:a37:a955:: with SMTP id s82mr6908691qke.121.1612435732542; 
 Thu, 04 Feb 2021 02:48:52 -0800 (PST)
Received: from localhost ([181.191.236.144])
 by smtp.gmail.com with ESMTPSA id u126sm4817085qkc.107.2021.02.04.02.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 02:48:51 -0800 (PST)
Date: Thu, 4 Feb 2021 07:48:49 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 02/22] tests/acceptance/boot_linux.py: rename misleading
 cloudinit method
Message-ID: <20210204104849.q4okebk6uxr73x7o@laptop.redhat>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-3-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-3-crosa@redhat.com>
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

On Wed, Feb 03, 2021 at 12:23:37PM -0500, Cleber Rosa wrote:
> There's no downloading happening on that method, so let's call it
> "prepare" instead.  While at it, and because of it, the current
> "prepare_boot" and "prepare_cloudinit" are also renamed.
> 
> The reasoning here is that "prepare_" methods will just work on the
> images, while "set_up_" will make them effective to the VM that will
> be launched.  Inspiration comes from the "virtiofs_submounts.py"
> tests, which this expects to converge more into.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_linux.py | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
> index 2ac3e57587..bcd923bb4a 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -57,7 +57,7 @@ class BootLinuxBase(Test):
>              self.cancel('Failed to download/prepare boot image')
>          return boot.path
>  
> -    def download_cloudinit(self, ssh_pubkey=None):
> +    def prepare_cloudinit(self, ssh_pubkey=None):
>          self.log.info('Preparing cloudinit image')
>          try:
>              cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
> @@ -85,15 +85,15 @@ class BootLinux(BootLinuxBase):
>          super(BootLinux, self).setUp()
>          self.vm.add_args('-smp', '2')
>          self.vm.add_args('-m', '1024')
> -        self.prepare_boot()
> -        self.prepare_cloudinit(ssh_pubkey)
> +        self.set_up_boot()
> +        self.set_up_cloudinit(ssh_pubkey)
>  
> -    def prepare_boot(self):
> +    def set_up_boot(self):
>          path = self.download_boot()
>          self.vm.add_args('-drive', 'file=%s' % path)
>  
> -    def prepare_cloudinit(self, ssh_pubkey=None):
> -        cloudinit_iso = self.download_cloudinit(ssh_pubkey)
> +    def set_up_cloudinit(self, ssh_pubkey=None):
> +        cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
>          self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
>  
>      def launch_and_wait(self):
> -- 
> 2.25.4
>

Reviewed-by: Beraldo Leal <bleal@redhat.com>


