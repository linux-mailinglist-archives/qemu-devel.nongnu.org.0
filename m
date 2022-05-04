Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF8C519EE2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 14:06:02 +0200 (CEST)
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDlZ-0006lY-To
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 08:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nmD9a-0002nw-Eh
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:26:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nmD9Y-0001mB-RT
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651663603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rCxb6LaQtYmXMKbSBdR1N+94Zw05H4PpmZfhRAk6FW4=;
 b=Y0LAz8YMxH98tzocSPgEp0ZBUMcu4MprmVvhM6WOkBsCDrNgvX/kywXIY9wqjZYnnTbZaf
 gYIqkcAy1yfMpdZPfL4k2C11pnjEPcMEbvxdEbZT/jm34NbzUGyF7ORyGJrX4uLKJTn/LO
 oWeA8Gd9dH0XA5d/w856J54Lw9/3hrk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-9Zb2SHsUMg-4hFXb1zIehw-1; Wed, 04 May 2022 07:26:42 -0400
X-MC-Unique: 9Zb2SHsUMg-4hFXb1zIehw-1
Received: by mail-ej1-f69.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso669908ejs.12
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 04:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rCxb6LaQtYmXMKbSBdR1N+94Zw05H4PpmZfhRAk6FW4=;
 b=uCKQQm8uCVPN+wUZ0H7KEe+H0xIHFiueTNtJGDnzL2SZV9Jq6BsAJvRAjNCQNbSHff
 TMuly9LHCIXa1gnbvFVyvW8Cb6NWL8P11Xo/VQGVahUrJLVjotxVbTlfhkm+ADs+8HK/
 6NnaOK6aFujac+x21+IfaZMDaz5IxE/7OrvnhK/399R17W7qwOdXdJQBoCiLvYEtRddY
 55Q9gdmO7qCLVDEYYWmCbZ+7BSL2pJEKmj8BsRpGbV7j5TG+G4s33sDBK9hsAVgVgq/E
 T1Sxp/hmhWEYN3C2gxXJAqpZ8Uo5Ts+4RSAJjRQ36snSaAD7ALYCRad9IPOQLf8GXOGW
 N8YA==
X-Gm-Message-State: AOAM530e0eDK0bQEHLqW3TMgSvLeukD/EDnvaK7armFfbnsDhMYKE/vi
 pokkqie7UowbzNv2YjIy1K3PZdL6tGCXWryCjxwuQ+wM3pdr2yOzB+0rOUTwci6y1a4zBCmjatv
 E0NtpK0y6wRmSOk8=
X-Received: by 2002:a17:907:7f1a:b0:6f4:6b52:adfd with SMTP id
 qf26-20020a1709077f1a00b006f46b52adfdmr10287196ejc.203.1651663601468; 
 Wed, 04 May 2022 04:26:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwedFYff3M8eXdGT17KX2iFS50MmWsMRJaLYeFUv1MpQFOAxHw7qj3XcNFWYf+L4bvhPX2J0g==
X-Received: by 2002:a17:907:7f1a:b0:6f4:6b52:adfd with SMTP id
 qf26-20020a1709077f1a00b006f46b52adfdmr10287172ejc.203.1651663601233; 
 Wed, 04 May 2022 04:26:41 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 zd7-20020a17090698c700b006f3ef214dfesm5653838ejb.100.2022.05.04.04.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 04:26:40 -0700 (PDT)
Message-ID: <f305dcbe-84a2-83e0-40f9-7f77b4324a3b@redhat.com>
Date: Wed, 4 May 2022 13:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] block/file: Add file-specific image info
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
 <20220503145529.37070-5-hreitz@redhat.com> <YnI9XZkxiNNJX3dC@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YnI9XZkxiNNJX3dC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.05.22 10:46, Kevin Wolf wrote:
> Am 03.05.2022 um 16:55 hat Hanna Reitz geschrieben:
>> Add some (optional) information that the file driver can provide for
>> image files, namely the extent size.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   qapi/block-core.json | 26 ++++++++++++++++++++++++--
>>   block/file-posix.c   | 30 ++++++++++++++++++++++++++++++
>>   2 files changed, 54 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index e7d6c2e0cc..728da051ae 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -139,16 +139,29 @@
>>         '*encryption-format': 'RbdImageEncryptionFormat'
>>     } }
>>   
>> +##
>> +# @ImageInfoSpecificFile:
>> +#
>> +# @extent-size: Extent size (if available)
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'ImageInfoSpecificFile',
>> +  'data': {
>> +      '*extent-size': 'size'
>> +  } }
> It's not "the extent size" (the whole point of extents is that they
> don't have a fixed size like blocks), but an extent size *hint* that
> tells the filesystem the minimum size to allocate for an extent. The
> xfs_io man page calls it the preferred extent size for allocatino, which
> works for the documentation if you prefer, but BlockdevCreateOptionsFile
> has 'extent-size-hint', so I'd prefer consistency on the wire at least.

Got it.


