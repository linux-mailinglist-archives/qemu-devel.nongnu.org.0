Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B29245A61E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 15:58:26 +0100 (CET)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpXFZ-0007IQ-9d
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 09:58:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpXE3-0005cD-Sk
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:56:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpXE0-0006MZ-6L
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637679407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1wXlIKnqrZwNrEiUdfo6CLqBcjscZ2oVONL8lUtzIpI=;
 b=PEKBbVpWAK80ZlyY9mjMQqOr6Gt5Cc95xFwSGw5fX3ZM+T8wlcCmcQrI08nkgM4teDHUQY
 Fg+M1f7FvSXnD79oCAPALYqcmv28Mwpe5/Z4ZUm18TApEx9a2U5tj36qn+T6O5BES1YqEF
 McZ9qbmoK6SUbkav021A/J/pvmHwppg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-j0OfErjmPTqk3cOKojGtOQ-1; Tue, 23 Nov 2021 09:56:44 -0500
X-MC-Unique: j0OfErjmPTqk3cOKojGtOQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so3785521wrb.11
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 06:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=1wXlIKnqrZwNrEiUdfo6CLqBcjscZ2oVONL8lUtzIpI=;
 b=eILYsDMq/+HZuBOfomPXa192Bc2B4w7MFzcjlY/mPlTmb/LdZHoDAXGOD+sVcIPo3Y
 e3jLfcgpqveFHdnkzChY3W8uodPVZhqIHbbRgna6Vvf3TsKOOrVoBAa0NI1V6lHmSEm1
 XuvYQMSageG9MTxtvDZXQl8HnlZccKuAiCl84XO9rxnad1ghMuZ3fRMWmUJslcZxN8ct
 JKWEPbV2f1/6ERdpCObOB3UVE5v68MnczQFygS7QHaHFN2kYgZnJWt6oo2iqJF6MEFGq
 LwJluJq5E+qQQY5kcPKr8Ahlb6woRTDsKX1Hyjobfd2YQGNAE1GQLF0QNQ9oqirch5e3
 LiTg==
X-Gm-Message-State: AOAM532Wf6doPgR034v72O1qFLwm7svZRRzlc550taRSM/D5O2ZZXBdi
 NEfqL1xZ4hbUjTXKQYki3is0y2qjkM9wDjkZ3sp6vGCdRABYbkQ/fjv7U+Cj5+gMod2mvFHy0Zb
 bJvBe29T+1fk55b4=
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr7885221wri.134.1637679403237; 
 Tue, 23 Nov 2021 06:56:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7iR/C8zT6WsNfehUUIXkbpc/8gqPewOARvVTmL0X5UcEkuos3Cae5FHAQ4eoYQrdVQRQKeA==
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr7885181wri.134.1637679402976; 
 Tue, 23 Nov 2021 06:56:42 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id l4sm12139853wrv.94.2021.11.23.06.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 06:56:42 -0800 (PST)
Message-ID: <23f3d0e5-55a7-03d2-4163-5046d0517204@redhat.com>
Date: Tue, 23 Nov 2021 15:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20211028144822.jjbw7ypkkman7sow@mozz.bu.edu>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Possible reward for fuzzer bug fixes? Secure Open Source Rewards
 Program
In-Reply-To: <20211028144822.jjbw7ypkkman7sow@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/10/2021 16.48, Alexander Bulekov wrote:
> Recently a pilot for the Secure Open Source Rewards program was
> announced [1]. Currently this program is run by the Linux Foundation and
> sponsored by the Google Open Source Security Team.
> 
> The page mentions that patches for issues discovered by OSS-Fuzz may be
> eligible for rewards. This seems like it could be a good incentive for
> fixing fuzzer bugs.
> 
> A couple notes:
>   * The program also rewards contributions besides fuzzer-bug fixes.
>     Check out the page for full details.
>   * It seems that QEMU would qualify for this program. The page mentions
>     that the project should have a greater than 0.6 OpenSSF Criticality
>     Score [2]. This score factors in statistics collected from github
>     (sic!). QEMU's score is currently 0.81078
>   * Not limited to individual contributors. Vendors can also qualify for
>     rewards.
>   * Work completed before Oct 1, 2021 does not qualify.
>   * Individuals in some sanctioned countries are not eligible.
>   * The process seems to be:
>      1. Send a fix upstream
>      2. Get it accepted
>      3. Fill out a form to apply for a reward
> 
> Any thoughts about this? Should this be something we document/advertise
> somewhere, so developers are aware of this opportunity?

Sorry for the late reply ... That sounds interesting, indeed!

Would it make sense to publish this as a blog entry on www.qemu.org? ... it 
would then get automatically mirrored to https://planet.virt-tools.org/ , too.

I think most issues are tagged with "fuzzer" in the issue tracker already, 
so it should be possible to easily find the issue to work on.

So if you like, clone https://gitlab.com/qemu-project/qemu-web.git and add a 
new entry in the _posts directory. Once done send the patch for review to 
qemu-devel with Paolo and myself on CC:

  Thomas


