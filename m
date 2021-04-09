Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684235A1F2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:25:20 +0200 (CEST)
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUt0Z-00017w-4T
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUszb-0000hI-NV
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:24:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUszY-0004mh-V5
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:24:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617981855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3GSm/s6Ieor/vxBHnLsYad39bA49meuPbaxJqqoJsI=;
 b=UYy3appys6s/Zb1S7W8AyMdIatOmXImEINcP31pIbX18XFYiOKs21EuBztalWQplredDWh
 XQaW6sJ1KuQqfHsHhsoJV+3uZK4MsLq3pyaeYKe2KiKIchZhawuNI8gIvYygg2GRYMWkpn
 7KSiesaX5mjb/DbzKsmkeoXtjzdZIiU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-RjUgaa6JM3e1U3W2xm1NSg-1; Fri, 09 Apr 2021 11:24:14 -0400
X-MC-Unique: RjUgaa6JM3e1U3W2xm1NSg-1
Received: by mail-ej1-f72.google.com with SMTP id jx20so2323493ejc.4
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 08:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s3GSm/s6Ieor/vxBHnLsYad39bA49meuPbaxJqqoJsI=;
 b=VD7i83dg+ddx34KPQ0Gg834e62S5g7u1vqwMLDjT2tNz5wKB7yeUesPFC1TdYJ7vSb
 Zdr3VdOPTybAyAkHD86J0K9V/VCIlaqDJsJPeDvmDc0k2k4BxW6jw1S2pVFWo4D2dzQO
 +45OSX4tmEbTz4ODEQOxfV+trOFAT2YlKarYaqFILqbIRyo1Zr0qdZpY5CZLBN/MaKOI
 1dyGI4qotpM1oSrPTDV/PGYj7A7KC3X7t8m4eZt+w+HV0pCIFXwgnxsgK/I+eclChU7A
 1vWLe3DKrAO8EfODcmyJyTpbSKpQg7FE4Zy4gZvE97PrtvP9Tb6nOscGy0JDkA5KbQj4
 tZrQ==
X-Gm-Message-State: AOAM530eb25wnI9tVvbTsc7ySmKtROmP4ZfnReR3oEe7Gd/FXM2N6JxX
 xnmO5BZ4TyPoS3d6AOamQO5b9GtBftKjQLQxtmwG5sUuCfgSPSPzRQ9wMEYgbwcTpvHeEqEThzw
 wvslGq4m31rgc99Q=
X-Received: by 2002:a05:6402:3487:: with SMTP id
 v7mr18124352edc.302.1617981851802; 
 Fri, 09 Apr 2021 08:24:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfaMEQ6SFhCe07Y4H83hc17KLfEc9nQxZG8GmO/LFfYkmg9hrcnMA2PBb1mVzfZmJTdLpllA==
X-Received: by 2002:a05:6402:3487:: with SMTP id
 v7mr18124327edc.302.1617981851586; 
 Fri, 09 Apr 2021 08:24:11 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v8sm1594275edc.30.2021.04.09.08.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 08:24:11 -0700 (PDT)
Subject: Re: [PATCH] virtiofsd: Fix side-effect in assert()
To: Stefan Weil <sw@weilnetz.de>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
References: <20210409100627.451573-1-groug@kaod.org>
 <daa895d8-7fbc-e4f5-3cfe-29cae4cd193a@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <94bab651-8514-3f16-b61e-0f33a8e2d248@redhat.com>
Date: Fri, 9 Apr 2021 17:24:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <daa895d8-7fbc-e4f5-3cfe-29cae4cd193a@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: virtio-fs@redhat.com, misono.tomohiro@jp.fujitsu.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 4/9/21 5:11 PM, Stefan Weil wrote:
> Am 09.04.21 um 12:06 schrieb Greg Kurz:
> 
>> It is bad practice to put an expression with a side-effect in
>> assert() because the side-effect won't happen if the code is
>> compiled with -DNDEBUG.
>>
>> Use an intermediate variable. Consolidate this in an macro to
>> have proper line numbers when the assertion is hit.
>>
>> virtiofsd: ../../tools/virtiofsd/passthrough_ll.c:2797: lo_getxattr:
>>   Assertion `fchdir_res == 0' failed.
>> Aborted
>>
>>    2796          /* fchdir should not fail here */
>> =>2797          FCHDIR_NOFAIL(lo->proc_self_fd);
>>    2798          ret = getxattr(procname, name, value, size);
>>    2799          FCHDIR_NOFAIL(lo->root.fd);
>>
>> Fixes: bdfd66788349 ("virtiofsd: Fix xattr operations")
>> Cc: misono.tomohiro@jp.fujitsu.com
>> Signed-off-by: Greg Kurz <groug@kaod.org>
>> ---
>>   tools/virtiofsd/passthrough_ll.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/tools/virtiofsd/passthrough_ll.c
>> b/tools/virtiofsd/passthrough_ll.c
>> index 1553d2ef454f..6592f96f685e 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -2723,6 +2723,11 @@ static int xattr_map_server(const struct lo_data 
> *lo, const char *server_name,
>>       return -ENODATA;
>>   }
>>   +#define FCHDIR_NOFAIL(fd) do {                         \
>> +        int fchdir_res = fchdir(fd);                   \
>> +        assert(fchdir_res == 0);                       \
>> +    } while (0)
>> +
>>   static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char
>> *in_name,
>>   
> 
> 
> I am afraid that this will raise a compiler warning (or error with
> -Werror) when NDEBUG is defined because the variable is unused in that
> case ([-Wunused-variable]).
> 
> I suggest to use different implementations of the macro depending on
> NDEBUG.

QEMU doesn't build with NDEBUG, see commit 262a69f4282
("osdep.h: Prohibit disabling assert() in supported builds").

Regards,

Phil.


