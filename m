Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91698675616
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:44:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrgx-0001iW-AP; Fri, 20 Jan 2023 08:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pIrgd-0001TR-OQ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:44:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pIrgb-0007bc-UJ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674222245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26GHsSlwqNT3KPrLDueI1UcE/5/gjksU9DsY0HFY+Sw=;
 b=QW177O1V4liRfdj2kkfC+m4p3LYUi1tbxuunZG/OAGzC+U3M+b8fuvQK+etEYIdI5LBvsh
 ldTuId5xnGJdtFpxTKWU45/LAHAMA5ShACufEC5G21Dh+35+5NnBdnRrOOMpT7ataAD1vZ
 5smltU2S0xuojfY7Qdig+9wGswqWLIE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-303-HP5CJNLROPKl8elcWzDn4w-1; Fri, 20 Jan 2023 08:44:03 -0500
X-MC-Unique: HP5CJNLROPKl8elcWzDn4w-1
Received: by mail-ed1-f70.google.com with SMTP id
 z20-20020a05640240d400b0049e1b5f6175so3894286edb.8
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=26GHsSlwqNT3KPrLDueI1UcE/5/gjksU9DsY0HFY+Sw=;
 b=xi2hNYbkgoC0OTu2az5opZy/TGL11KoaYtsuZsBAhDBP1kRkGqj7OwR8JO+xlOLmiH
 JfsFIspkKcnGbd8Ck5qkH62N5sKdqIKaqFfQ8QT1vx8JFvZR3NqikCNpGURt6XSGH9HS
 ENGyKpVjWUOqtJXp8HB69ENXBHibyVFAJ906deKjdiBsPmBsXe2LBeGCFqALBaV9KC8p
 n911GD7FKvll31MDaKZatrVEfw7XquBKDSvHQDvLYcOHJruSXuPmrfMe1rm5C2dcEMJ5
 pMRWgNlfhqlVEVqgfSs2X+WyFQB7xzrwMZQXqSJN+Zm/BbXf9+KA5cMEoFlQAEE3rfY9
 GotA==
X-Gm-Message-State: AFqh2koeRietHR64tkPkKun7SVAReF8HwlP8bh5nKXWtJLfp8c499YTJ
 fFVhLEzdO3o9s7050d1FmyDiwIifizKrFZ7WR8jh63kxjeLBVPtgSq+3oejQOg5vGEIuWT+ZZNx
 +24LSscdg7eaBYmc=
X-Received: by 2002:a17:906:d0c8:b0:84d:855:dd02 with SMTP id
 bq8-20020a170906d0c800b0084d0855dd02mr16582663ejb.46.1674222242725; 
 Fri, 20 Jan 2023 05:44:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu+5oH23Ol1GB/ASOHNGe+v+0sZE4/VUsEpsSbG0SeOBgNV09LqrD0PLb1Uxe9y2yyLB6q8CA==
X-Received: by 2002:a17:906:d0c8:b0:84d:855:dd02 with SMTP id
 bq8-20020a170906d0c800b0084d0855dd02mr16582654ejb.46.1674222242580; 
 Fri, 20 Jan 2023 05:44:02 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 hq15-20020a1709073f0f00b0084c4b87a69csm17921743ejc.153.2023.01.20.05.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 05:44:02 -0800 (PST)
Message-ID: <a657dc0f-1e90-09d5-f25d-a80474b8af52@redhat.com>
Date: Fri, 20 Jan 2023 14:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/12] qemu-img info: Show protocol-level information
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
 <7c2c9623-c865-91a3-01b7-0e7f90fde278@redhat.com>
 <Y8mkNvXmgKjSXZSt@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <Y8mkNvXmgKjSXZSt@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19.01.23 21:12, Kevin Wolf wrote:
> Am 08.12.2022 um 13:24 hat Hanna Reitz geschrieben:
>> On 20.06.22 18:26, Hanna Reitz wrote:
>>> Hi,
>>>
>>> This series is a v2 to:
>>>
>>> https://lists.nongnu.org/archive/html/qemu-block/2022-05/msg00042.html
>> Ping, it looks like this still applies (to the master branch and kevin’s
>> block-next branch at least).
> Not any more. :-)
>
> But the conflicts seemed obvious enough, so I rebased it (including
> changing the "Since: 7.1" occurrences to 8.0) and applied it to my block
> branch.

Ah, yes.  That I should have fixed.

> Thanks!

Thank you! :)

Hanna


