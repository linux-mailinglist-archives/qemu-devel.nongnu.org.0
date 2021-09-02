Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2853FEEA3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:27:31 +0200 (CEST)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmkc-0005nG-5q
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLmVk-0001nK-KZ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLmVf-0004Ax-RJ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630588323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNNgasbepCYbGxNfRe14qgkgMFppq1GNhlY4zgeRB40=;
 b=Kz3fombTU8MF5VSxMak8cbzAMUq144N0ruLOjSqYBxl9wDEAKv49+krG49bqtIab8YlqUQ
 Nr6VYHzeboxYZm0yGz4WmomNaR3YV3QucsBkBM5GHQ9D35gY3eU23zr9YggNNpmFIPde4+
 U2jCx3OjoKgXiltaab2a2QllGen4VDM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-96auf2smOsu-upTOWUs0FA-1; Thu, 02 Sep 2021 09:11:59 -0400
X-MC-Unique: 96auf2smOsu-upTOWUs0FA-1
Received: by mail-wm1-f70.google.com with SMTP id
 y24-20020a7bcd98000000b002eb50db2b62so675556wmj.5
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 06:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MNNgasbepCYbGxNfRe14qgkgMFppq1GNhlY4zgeRB40=;
 b=o+rB+kcIvZftNnuRlkNeru1suR8/PiCkXCNFBnOxvLDbgniXh8EIv79p+1/XSsdidb
 1T4hUVBeguUQa9SFhV1jZMoKmbzXvNIhLko42eDzISBKxyNGm7eCwr20mjeMZIkccMWN
 3msVs8pDHi1lu0L0gwVenQqvTFKUgz2NevzNrtgDUQkS8NZpzuI1twD6hJjqWPeZGhbm
 FXoTom0JlbR1DR+SuAHldctKH3gPGJ4lJ5eG1LescV7Rsai+4hbQPvsm7xWb7L/tGW5j
 8HM6tOJkittK+2uCQNmaHCes/nP7uz7te9b8Sj/gnCFvG99bPsRpekOnpDF+x62UI5t/
 5dYQ==
X-Gm-Message-State: AOAM5302le2TplRdBz151+CBg5MozkjMVeBP+/crG/FYCdAop2aUZZ1M
 tyNkEobIe0pvXKsnGfaEVWgSvP0Vv3uFIePMYcxigzM8noOM6qsDqdvxWMNNo/6EvIUso9lFkw3
 kCC/0sva01F1EGTo=
X-Received: by 2002:a1c:80d7:: with SMTP id b206mr3242199wmd.36.1630588318401; 
 Thu, 02 Sep 2021 06:11:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdA9NdMFj72rIfLhdHk1X6ceHZ/ovq4HtkubBZBa9lA9VqFi93l5j4sWxG0ivkdzmMAZciEw==
X-Received: by 2002:a1c:80d7:: with SMTP id b206mr3242185wmd.36.1630588318225; 
 Thu, 02 Sep 2021 06:11:58 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id u17sm1549959wmm.33.2021.09.02.06.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:11:57 -0700 (PDT)
Subject: Re: Guest Agent issue with 'guest-get-osinfo' command on Windows
To: Konstantin Kostiuk <konstantin@daynix.com>,
 Developers <qemu-devel@nongnu.org>
References: <CAJ28CFSFEatxgfvUE3gvnFBVX7GrqMwk0+t1foFfNzDu7bwv3A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b09b85ed-1c7a-72fc-b4fa-7930f8c44c9f@redhat.com>
Date: Thu, 2 Sep 2021 15:11:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJ28CFSFEatxgfvUE3gvnFBVX7GrqMwk0+t1foFfNzDu7bwv3A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Michael Roth <michael.roth@amd.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Tomas Golembiovsky <tgolembi@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:36 PM, Konstantin Kostiuk wrote:
> Hi Team,
> 
> We have several bugs related to 'guest-get-osinfo' command in Windows
> Guest Agent:
> https://bugzilla.redhat.com/show_bug.cgi?id=1998919
> <https://bugzilla.redhat.com/show_bug.cgi?id=1998919>
> https://bugzilla.redhat.com/show_bug.cgi?id=1972070
> <https://bugzilla.redhat.com/show_bug.cgi?id=1972070>
> 
> This command returns the following data:
> {
> "name": "Microsoft Windows",
> "kernel-release": "20344",
> "version": "N/A",
> "variant": "server",
> "pretty-name": "Windows Server 2022 Datacenter",
> "version-id": "N/A",
> "variant-id": "server",
> "kernel-version": "10.0",
> "machine": "x86_64",
> "id": "mswindows"
> }
> 
> The problem is with "version" and "pretty-name". Windows Server
> 2016/2019/2022 and Windows 11 have the same MajorVersion
> ("kernel-version") = 10, so to get pretty-name the guest agent uses a
> conversion matrix between Windows build and name
> (https://github.com/qemu/qemu/blob/59a89510b62ec23dbeab8b02fa4e3526e353d8b6/qga/commands-win32.c#L2170
> <https://github.com/qemu/qemu/blob/59a89510b62ec23dbeab8b02fa4e3526e353d8b6/qga/commands-win32.c#L2170>).
> 
> This solution has several problems: need to update the conversion matrix
> for each Windows build, one Windows name can have different build
> numbers. For example, Windows Server 2022 (preview) build number is
> 20344, Windows Server 2022 build number is 20348.
> 
> There are two possible solutions:
> 1. Use build number range instead of one number. Known implementation
> issue: Microsoft provides a table
> (https://docs.microsoft.com/en-Us/windows-server/get-started/windows-server-release-info
> <https://docs.microsoft.com/en-Us/windows-server/get-started/windows-server-release-info>)
> only with stable build numbers. So, we exactly don't know the build
> number range.

Sounds good, start with low=high limit then if someone reports
out-of-range we adapt the limit.

BTW instead of burying this in C, I'd store this information in a JSON
file to ease updates.

> 2. We can read this string from the registry
> (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion). Known
> implementation issues: ProductName value is localized (in a Russian
> version of Windows, the word "Microsoft' is translated), so we should
> ignore it. ReleaseId value does not equal to Windows Server version (for
> Windows Server 2019, ReleaseId is 1809)

Could this work?

  if ReleaseId:
    return ProductName[ReleaseId];
  else:
    return ProductName[release_id_by_buildnumber(BuildNumber)];

> In conclusion, I have the next questions:
> What solution we should implement to get the Windows release name?
> Does someone know how end-users use this information? Should it be
> English only or it can be localized? Should we have exactly the same
> output as now?
> What should we do with the 'Standard' server edition? Currently, the
> guest agent always returns 'Datacenter'.
> 
> Best wishes,
> Kostiantyn Kostiuk


