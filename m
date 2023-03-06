Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9DA6AB8FF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 09:59:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ6fd-0005wm-93; Mon, 06 Mar 2023 03:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZ6fa-0005vx-Ht
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:58:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZ6fZ-0001OF-5Q
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678093088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7YtnBpvBKl377KqxvNv9VDwfLhjo+E2/WSynndvQhA=;
 b=PUE16JTEf8e6j5tYp1ceXqRK2FWIL3JnVaN8e18QHIOgL9T9fLdV/ZuTg6I+1GPwS1CmCI
 EntEMlUiZHVZMZ5xK1o4wVZrEbIqkwG0OxaGMnXTWVL11Fel8dtItUsand9IZk91/XIVTL
 Fi+L3tG/oP+MsNwwexrLymWZ3CpyOMg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-4sOyvpNlM9CeGx3W-HsnEw-1; Mon, 06 Mar 2023 03:58:06 -0500
X-MC-Unique: 4sOyvpNlM9CeGx3W-HsnEw-1
Received: by mail-qt1-f198.google.com with SMTP id
 w16-20020ac843d0000000b003bfe50a4105so4840776qtn.10
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 00:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n7YtnBpvBKl377KqxvNv9VDwfLhjo+E2/WSynndvQhA=;
 b=aiTN1Kswe0D2k4k0vmD3d0mEmsuqcHJzmyuuX9AD0o/l4siHfGNx1VgVhdEASqpWku
 ZB0GiSLvfj+Lo8t6w4SNt3KxU3187zyllopPUFssPUMXqfYwmuGh26pDjHoeb6z/M7Wt
 tzHcsn2Xb6++n0iswfE7NDAYh4ScDQFgScxHQwnvxZomQkww2hf94/jrgYu3xP5Asd/P
 900K50Zg2yD/noAG3qhSS2OWMOlvKdlF7/7iR3umKMP2fjvZ432Ec0qJ4VzljZ+WMMv8
 lIp1hY1BiMk721IzXLWXJqav4KbANxRYRon3/m31vfCJV13TFhG1YiipKC1xiGcv0YSS
 D+1g==
X-Gm-Message-State: AO0yUKWl2pi9IUcS3xcj7xUSp7VNi/mMRJ2ON26yDCsv0vA4nqjh592+
 MnnFyQB3BoLl1fIJ4yGazCFr/abrb6745miWi2q05CAj6ERa4Umrh2us8B4P8fRbKjt0CicYk3/
 pPpl1Fu+KUu6phEQ=
X-Received: by 2002:ac8:5c4a:0:b0:3bf:d0ac:5ba9 with SMTP id
 j10-20020ac85c4a000000b003bfd0ac5ba9mr17852448qtj.7.1678093086513; 
 Mon, 06 Mar 2023 00:58:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/qIAuTXrC3VgHPeaWSGQgZGCNxYf0eRKhFIPLWyFH1dZKk5o98na0ckx8kqOxjr4Gs1vDB1g==
X-Received: by 2002:ac8:5c4a:0:b0:3bf:d0ac:5ba9 with SMTP id
 j10-20020ac85c4a000000b003bfd0ac5ba9mr17852433qtj.7.1678093086222; 
 Mon, 06 Mar 2023 00:58:06 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de.
 [109.43.177.59]) by smtp.gmail.com with ESMTPSA id
 x22-20020a05620a0b5600b006ee8874f5fasm6927706qkg.53.2023.03.06.00.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 00:58:05 -0800 (PST)
Message-ID: <0d2a9e13-850e-d140-d63e-a940148bdccc@redhat.com>
Date: Mon, 6 Mar 2023 09:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers
 <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org
References: <69963eba-d001-150c-71d4-b2b23bfed4d1@msgid.tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: stable releases
In-Reply-To: <69963eba-d001-150c-71d4-b2b23bfed4d1@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 05/03/2023 11.27, Michael Tokarev wrote:
> Hi!
> 
> For a few qemu major releases already, we did not have any stable minor 
> releases.
> I'd love to change that, in order to consolidate efforts and to make better
> software in the end.  But I need some (hopefully minor) help here.
> 
> I collected changes from qemu/master which apparently should go to -stable.
> Published at git://isrv.corpit.ru/qemu.git , branch stable-7.2-staging
> (probably should publish it on github or gitlab).
> This contains stuff which I use on Debian in qemu package, which is based
> on 7.2 version now.  The last 18 patches are not in Debian package yet,
> going to push it today or tomorrow.
> 
> If nothing, this can be used as a base for actual 7.2.1 stable release,
> maybe with more changes added (or some changes removed).
> 
> The help which I need is to be able to run some wider testing. Debian is
> a relatively good testbed, and it is used by qemu already in terms of
> bullseye-backports to run other tests, so it should be good, but I'd
> love to have wider coverage still. Maybe some CI stuff which qemu has
> for master, if not only just before actual release.

I'd suggest to get a gitlab.com account, and fork the qemu repository there. 
Then you can run the CI on your own by pushing your patch to your forked 
repository.

You can also get some test additional coverage by running the avocado tests 
with "make check-avocado" ... but beware that this downloads quite some 
hundreds of MBs from the internet. And some tests are known to fail, so it's 
maybe best to run them on the plain 7.2.0 tag first to see what works for 
you and what does not work properly.

> And as usual, this needs help in picking up changes which should go to
> stable. But this is something which is always needed anyway.
> 
> Let's resurrect qemu-stable :)

Please make sure to CC: qemu-stable and Michael Roth - I hope he can give 
some directions for this effort.

  Thomas


