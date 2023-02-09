Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964E56909E5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:28:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ6xc-0005He-Fs; Thu, 09 Feb 2023 08:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ6xa-0005HH-FT
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:27:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ6xY-0001KQ-Ug
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675949252;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=F0IvBRGu8R5hYs7m0GWSjTe61FbL5XWrlyy1FfSpMM8=;
 b=ENTksQ8aFHaEO45nu6xclYlsH7WxsaTuYoIFx+lrTHcEFumq20foncFSUC2VuyBFHyBK5k
 ZYF/vBfU9KuQvEnz1s6GnB8FR52qSRoi7L3xCSN83uyo4oMWWpPv7Ni9BottZOzlxo1H2f
 QbFkwjqTerLvM4benyAHDsyvEvpMQPw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-YvQQvgH1M3uWtPPuXnpKJQ-1; Thu, 09 Feb 2023 08:27:31 -0500
X-MC-Unique: YvQQvgH1M3uWtPPuXnpKJQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m3-20020a05600c3b0300b003dfdc6021bcso1065054wms.3
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 05:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F0IvBRGu8R5hYs7m0GWSjTe61FbL5XWrlyy1FfSpMM8=;
 b=Koi0BbgrH+Ic5DqNEV6g+t8DFOr5naBmD6imtmF1zIrgStHm9ldW43V+uL+pAh76QY
 TnNS4zZRxoatIPezaVyk5eGHvSdYBLkxdsfOq2yeP/mfx9xExjlJ9cEUfY2tT1pRxbyp
 /2X+UELKL4yd8p+1Y9eUOSVItKzR+m+/NMTTjOP62ohC1VazbJ5fKsjBMWo5pgDulY7z
 zbdP1WUevJ5Mclmk6pAG1DBUBUdSyXuXAlSm/yIdYK3j+WRpy2xzFWldwlq61q3lMuTY
 v1dHAhJHBKAqgIb3lFKTwpMLbxujFlnGOHuODpIP7O2uxyPA1LOjoSxgF0fTdSS67qiv
 Rbhg==
X-Gm-Message-State: AO0yUKV+3D0+jpl6QfRw8ZtVuyjpsJqv1oKtIQoFLJye10Ll7aEy4xWQ
 MgfZxwikdvekzayIKegwZIjlhL46VDyTgxQ9UTWo4TY918ookjTRUbdG82fgUwEVPEh9ZzG8DED
 7wysX3T1gUDEtDHQ=
X-Received: by 2002:a05:600c:907:b0:3dc:2af8:83c0 with SMTP id
 m7-20020a05600c090700b003dc2af883c0mr9835053wmp.31.1675949250067; 
 Thu, 09 Feb 2023 05:27:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+TLxl5rxXVqE39F1ar1oaBkQ0Jgp9cUumsHRQ2O3WGp2e/FVBRAJXTCoAl9jifTKaqBx/wwg==
X-Received: by 2002:a05:600c:907:b0:3dc:2af8:83c0 with SMTP id
 m7-20020a05600c090700b003dc2af883c0mr9835044wmp.31.1675949249906; 
 Thu, 09 Feb 2023 05:27:29 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003dc4b4dea31sm1821564wmb.27.2023.02.09.05.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 05:27:29 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Eduardo
 Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 6/6] ram: Document migration ram flags
In-Reply-To: <20230208202904.u7j3iu6ddsitg5zi@redhat.com> (Eric Blake's
 message of "Wed, 8 Feb 2023 14:29:04 -0600")
References: <20230208133010.17323-1-quintela@redhat.com>
 <20230208133010.17323-7-quintela@redhat.com>
 <20230208202904.u7j3iu6ddsitg5zi@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 14:27:28 +0100
Message-ID: <87pmaj3r5r.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Eric Blake <eblake@redhat.com> wrote:
> On Wed, Feb 08, 2023 at 02:30:10PM +0100, Juan Quintela wrote:
>> 0x80 is RAM_SAVE_FLAG_HOOK, it is in qemu-file now.
>> Bigger usable flag is 0x200, noticing that.
>> We can reuse RAM_SAVE_FLAG_FULL.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/ram.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>> 
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 7952d5f01c..d95e26c03c 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -73,16 +73,19 @@
>>   * RAM_SSAVE_FLAG_COMPRESS_PAGE just rename it.
>>   */
>>  
>> -#define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
>> +/* RAM_SAVE_FLAG_FULL has been obsoleted since at least 2009, we can
>> + * reuse it */
>
> How about:
>
> /* RAM_SAVE_FLAG_FULL was obsoleted in 2009, it can be reused now */

You win.

>
>> +#define RAM_SAVE_FLAG_FULL     0x01
>>  #define RAM_SAVE_FLAG_ZERO     0x02
>>  #define RAM_SAVE_FLAG_MEM_SIZE 0x04
>>  #define RAM_SAVE_FLAG_PAGE     0x08
>>  #define RAM_SAVE_FLAG_EOS      0x10
>>  #define RAM_SAVE_FLAG_CONTINUE 0x20
>>  #define RAM_SAVE_FLAG_XBZRLE   0x40
>> -/* 0x80 is reserved in migration.h start with 0x100 next */
>> +/* 0x80 is reserved in qemu-file.h for RAM_SAVE_FLAG_HOOK */
>>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
>>  #define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
>> +/* We can't use any flag that is bigger that 0x200 */
>
> s/that is bigger that/bigger than/

Another strike.

Thanks, Juan.


