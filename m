Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7183D8D55
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 13:59:17 +0200 (CEST)
Received: from localhost ([::1]:43342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8iDU-00085k-R9
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 07:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8iBy-0007KS-Mo
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8iBx-0006xE-8b
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627473460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahqVeH/5hwzIQPmoqIiC5C85UwcIq1U0g6ysFFkYubs=;
 b=VlspgN8vaAha5KG/lTTXZYAF/49gMYvyvVgg14JiSe5zgP3xhJgtC/zNU8gLRIcxD194CQ
 8KrXHKRcIIptRqFYs9eEXfGZSvPc4xG6Oq9IG8ecKhofp5EBzem+QNRiIR+4JXT0hVkZ1r
 /Rua38IAAVayZK7VA1uzrMoG1vLKuYY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-KJwS-aBaMBS9F-LFzNcqEg-1; Wed, 28 Jul 2021 07:57:39 -0400
X-MC-Unique: KJwS-aBaMBS9F-LFzNcqEg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adfc3cd0000b02901531b0b7c89so853447wrg.23
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 04:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ahqVeH/5hwzIQPmoqIiC5C85UwcIq1U0g6ysFFkYubs=;
 b=hIIwBXsji4VTqIepJ8StBYNmg05GP+ci7VR+CPKvIm9QntUx6OZzzcDcJyn9o3mTtO
 r+kcmNahbg4z/RflGZvoKmKTl9/q3UBxF5aVei6uQfzMuSDJIFmnxhydeZfes7+k6Qp+
 PjdMti8s3V/1LS71GdyHjgykWQXL6hYARSvf8gAd50oYij0rm0DGj5sfDtxgxuGBk64o
 7LmIxaMM01tsyudEl5ZCEKJQ+ZUdNdSI0CvBNpVdKip1C7NpAjYXc+ShdaR2FKUuAFQq
 kIAMtPmb8toPmYQAYl28ReFKbLlZWcI3L6zm/HwPlkBcaa40lcF+hEZzdKEejqXyElFG
 sYgA==
X-Gm-Message-State: AOAM530gQLP39JYl7BAu58nQRX6O9XoRiiz4ukneLtaMndr7L6sDtwCX
 8mvzTjSBxjqT5ZNkwv0X+f6Pv7WvlIEO28l+guNdJkyjw4wwDwaiVx8zBtALtPgTJ7b9Q43JZcb
 0skL3rXfkH5FjwZ0=
X-Received: by 2002:adf:b305:: with SMTP id j5mr29080603wrd.11.1627473457984; 
 Wed, 28 Jul 2021 04:57:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBgiXNH0jvxbYb/aZLkT1Nnf0pW5aYN6nbrsKu8lTkXNVOVErjCvbLjO/qvgtPMGJ/BwGHig==
X-Received: by 2002:adf:b305:: with SMTP id j5mr29080586wrd.11.1627473457765; 
 Wed, 28 Jul 2021 04:57:37 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id f15sm6474908wre.66.2021.07.28.04.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 04:57:37 -0700 (PDT)
Subject: Re: [PATCH] qga-win: Add support of Windows Server 2022 in get-osinfo
 command
To: Konstantin Kostiuk <konstantin@daynix.com>,
 Developers <qemu-devel@nongnu.org>
References: <20210621125017.113989-1-konstantin@daynix.com>
 <CAJ28CFSxqVawommAhzH+Fu++Xf4gtQdBQCZ6mHGVpTi6qUK2MA@mail.gmail.com>
 <CAJ28CFS4qBccGOd+e2rSN0dL2k5ROb5NJgcKe2CyzR2RZ+CF3Q@mail.gmail.com>
 <CAJ28CFSuag9RjOfdDHOOtccoGxLUc63EKhkd5F52S5=gFJ_8kw@mail.gmail.com>
 <CAJ28CFQsv7HN5HemsiXByz0zPAPfpuYYyzkNBUN6cyV22vW6qQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2ca6c79c-ab03-e361-0efb-e1d232e89835@redhat.com>
Date: Wed, 28 Jul 2021 13:57:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJ28CFQsv7HN5HemsiXByz0zPAPfpuYYyzkNBUN6cyV22vW6qQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 9:53 AM, Konstantin Kostiuk wrote:
> ping

Seems merged:

commit c141814d4f495bd9efdabb1229ce0a5b5a239bf3
Author: Kostiantyn Kostiuk <konstantin@daynix.com>
Date:   Mon Jun 21 15:50:17 2021 +0300

    qga-win: Add support of Windows Server 2022 in get-osinfo command

    Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
    Signed-off-by: Michael Roth <michael.roth@amd.com>

> On Wed, Jul 14, 2021 at 10:25 AM Konstantin Kostiuk
> <konstantin@daynix.com <mailto:konstantin@daynix.com>> wrote:
> 
> 
>     ping
> 
> 
>     On Sun, Jul 11, 2021 at 8:18 PM Konstantin Kostiuk
>     <konstantin@daynix.com <mailto:konstantin@daynix.com>> wrote:
> 
>         ping
> 
>         On Sun, Jul 4, 2021 at 8:51 AM Konstantin Kostiuk
>         <konstantin@daynix.com <mailto:konstantin@daynix.com>> wrote:
> 
>             ping
> 
>             On Mon, Jun 21, 2021 at 3:50 PM Kostiantyn Kostiuk
>             <konstantin@daynix.com <mailto:konstantin@daynix.com>> wrote:
> 
>                 Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com
>                 <mailto:konstantin@daynix.com>>
>                 ---
>                  qga/commands-win32.c | 3 ++-
>                  1 file changed, 2 insertions(+), 1 deletion(-)
> 
>                 diff --git a/qga/commands-win32.c b/qga/commands-win32.c
>                 index 300b87c859..93b08fd4b5 100644
>                 --- a/qga/commands-win32.c
>                 +++ b/qga/commands-win32.c
>                 @@ -2209,9 +2209,10 @@ typedef struct
>                 _ga_win_10_0_server_t {
>                      char const *version_id;
>                  } ga_win_10_0_server_t;
> 
>                 -static ga_win_10_0_server_t const
>                 WIN_10_0_SERVER_VERSION_MATRIX[3] = {
>                 +static ga_win_10_0_server_t const
>                 WIN_10_0_SERVER_VERSION_MATRIX[4] = {
>                      {14393, "Microsoft Windows Server 2016",    "2016"},
>                      {17763, "Microsoft Windows Server 2019",    "2019"},
>                 +    {20344, "Microsoft Windows Server 2022",    "2022"},
>                      {0, 0}
>                  };
> 
>                 --
>                 2.25.1
> 


