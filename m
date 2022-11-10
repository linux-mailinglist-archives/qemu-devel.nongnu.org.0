Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E6662491B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 19:09:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otBxt-0001wS-BO; Thu, 10 Nov 2022 13:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1otBxp-0001w5-DB
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 13:07:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1otBxk-0002jA-9h
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 13:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668103658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=NATTiY5JkNUlFpnoELFcAgBoLttCQDg+A1fg5xd3voE=;
 b=DdkkxeH+ZQQHNZdATqVtHs+HiOMQlrHi7jum/rUYYr1I2nDK6n5/ArsPpha3LrgXBANOfP
 oQgX1H08Kjo4OmdPrfCivDK5oOvdUHEPrivd7EuTKlcObeaL9zBUImzcXsVMm2N/tUOMei
 YYq8rAObgS5RmcODvgaVmsd7HLi+1nw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-sMZFzhCxMmKaCuyZclLy0w-1; Thu, 10 Nov 2022 13:07:34 -0500
X-MC-Unique: sMZFzhCxMmKaCuyZclLy0w-1
Received: by mail-lf1-f69.google.com with SMTP id
 be20-20020a056512251400b004aa9aadf60cso799974lfb.20
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 10:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NATTiY5JkNUlFpnoELFcAgBoLttCQDg+A1fg5xd3voE=;
 b=657qn8ee9BpjtX/v7jbehDNwdHnOxZo7uwWGvhUslBzHx/8lr9vysBvsjBmSjj8vjO
 TpvNR/VOaCWWBh0updvj2dwsQSmUEVpQpDoipkU0b+DihSwLAu+bvmT3Ft5HXawd9pOu
 ly5p8F/SYlASkhCAtFb0BxBfceea5EtGolXjwVi+8jTxXgfKwrNGxMkBrwrWuLPHBtpQ
 KaUv3MVb9pUyHDcDettRZTSYdbKPw5kMvi6KJN6xcweZkmYU4wjF+xFtt1h8rT72fC6J
 vkDUSWhIJL4C7K1/nrEbKeDrhV6yxiwZRw3IHKUk2rRrTnJ6YVllRsl0p2ZXYZ9bNr8x
 Xu7Q==
X-Gm-Message-State: ACrzQf3WmjndS61lYGu+uvFBUZhByk0shxeA8ZAAnYra1G4yH5/2Igll
 0+eRNEQLfaXYii/NEX+i4FCQfglrK6GEjKup6z7los9WF8edK1c8mLz6WSk5krO8vFYtDfRue6g
 Q9eYstip8a2OuzZIODw/PpuVE8znK8J8=
X-Received: by 2002:a2e:597:0:b0:26d:fc06:b7a9 with SMTP id
 145-20020a2e0597000000b0026dfc06b7a9mr9186634ljf.354.1668103653212; 
 Thu, 10 Nov 2022 10:07:33 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7W/9Y/CRmJOGKnj3PVqunC0VNakt9GAlmrNpYED/mge7DnxdViMn0+WvvwvJlbX+AfYGaF/GfwgkqwFwKQhkI=
X-Received: by 2002:a2e:597:0:b0:26d:fc06:b7a9 with SMTP id
 145-20020a2e0597000000b0026dfc06b7a9mr9186628ljf.354.1668103652973; Thu, 10
 Nov 2022 10:07:32 -0800 (PST)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Thu, 10 Nov 2022 13:07:20 -0500
Message-ID: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
Subject: biosbits test failing on origin/master
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hiya, on today's origin/master
(2ccad61746ca7de5dd3e25146062264387e43bd4) I'm finding that "make
check-avocado" is failing on the new biosbits test on my local
development machine:

 (001/193) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
FAIL: True is not false : The VM seems to have failed to shutdown in
time (83.65 s)

Is this a known issue, or should I begin to investigate it?

--js


