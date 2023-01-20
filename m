Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D44B6755F5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:37:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrYo-000740-Ja; Fri, 20 Jan 2023 08:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pIrYh-00071W-Qj
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:35:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pIrYg-0005cI-4r
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674221752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/o9ii5+NdZzLQa3C823Spyijlzl1VCcSfgi3ciG+JI=;
 b=O4mlMJjbJB9ZEleUF0bG0BENv95k8ijwTtROkehVVMqj8fvuvFqUu1QpgyIooppuRjPQ3t
 S5YIzIa0lBN0ulgtu9AMtdGwtSTvV08mWUc3+PpEM6xO+wlEEHoEDYYFzqaLBUhvtOM8nq
 dwrXRvG/V0ouMEtUko8MuXhGLh92Vmo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-7XFIcAjWM4KF04ztZk2aDw-1; Fri, 20 Jan 2023 08:35:51 -0500
X-MC-Unique: 7XFIcAjWM4KF04ztZk2aDw-1
Received: by mail-ej1-f69.google.com with SMTP id
 sa32-20020a1709076d2000b0084d4593797eso3819224ejc.16
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w/o9ii5+NdZzLQa3C823Spyijlzl1VCcSfgi3ciG+JI=;
 b=0SngpZ5V7uI+ancNNTlL3M80Tw20PN20lo3JCI01vHRhs1+3K/ARG60xwSbaPRYfOo
 NJXNK2cIbECFEYFT4T6UNNphQkeyZnn06aZ7r55hk0c5KY2wmkUYMclXtJmmreKw49nX
 Zn2w0jDLNJDQ6HA1Ct5mIHx+GDjXjRcBD+gxRtFtKdd+2g2cPhV34LbSgBSADVJADGIc
 C++rmicsschGZ8JA1TsP7xNo5Yrl6rnYJ6riatBsAUDI5waUHMDKQ/LIRLQDKu3v19xQ
 aZ+Hth7cB1ySiyLRYOBqxYjOY/Q41otjNsiFrm0qWRNgrEq9RQoxroDPINTA5XAuzTrt
 1abQ==
X-Gm-Message-State: AFqh2kqZV64/3DpetGuOMkYeIMWolBxjbr1DVpydPESW6SmPcldHXBwu
 DuQve/TuK10cKl3lUB8Pu3ypiHbPxBprkhaKOU29dy6/8AhVWGjM2bKKXGK2Wb15Anjq2haZ/Yh
 /IU41LWkai/nCROY=
X-Received: by 2002:a05:6402:1770:b0:48e:9afd:de66 with SMTP id
 da16-20020a056402177000b0048e9afdde66mr14724445edb.34.1674221750096; 
 Fri, 20 Jan 2023 05:35:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu0capD1RslNoYItkk7Z4Qbc15GnMm218tAemBzA4v8SbE5FLCJNg25I5IqH2xo0rhWi/ujhA==
X-Received: by 2002:a05:6402:1770:b0:48e:9afd:de66 with SMTP id
 da16-20020a056402177000b0048e9afdde66mr14724428edb.34.1674221749888; 
 Fri, 20 Jan 2023 05:35:49 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a05640214c500b00487fc51c532sm610134edx.33.2023.01.20.05.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 05:35:49 -0800 (PST)
Message-ID: <758f3547-f727-28b8-48d3-a44306897d13@redhat.com>
Date: Fri, 20 Jan 2023 14:35:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/12] block: Improve empty format-specific info dump
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
 <20220620162704.80987-2-hreitz@redhat.com> <Y8lNGgogFfitt7kr@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <Y8lNGgogFfitt7kr@redhat.com>
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

On 19.01.23 15:00, Kevin Wolf wrote:
> Am 20.06.2022 um 18:26 hat Hanna Reitz geschrieben:
>> When a block driver supports obtaining format-specific information, but
>> that object only contains optional fields, it is possible that none of
>> them are present, so that dump_qobject() (called by
>> bdrv_image_info_specific_dump()) will not print anything.
>>
>> The callers of bdrv_image_info_specific_dump() put a header above this
>> information ("Format specific information:\n"), which will look strange
>> when there is nothing below.  Modify bdrv_image_info_specific_dump() to
>> print this header instead of its callers, and only if there is indeed
>> something to be printed.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
>> index 2f0d8ac25a..084ec44d3b 100644
>> --- a/qemu-io-cmds.c
>> +++ b/qemu-io-cmds.c
>> @@ -1819,8 +1819,8 @@ static int info_f(BlockBackend *blk, int argc, char **argv)
>>           return -EIO;
>>       }
>>       if (spec_info) {
>> -        printf("Format specific information:\n");
>> -        bdrv_image_info_specific_dump(spec_info);
>> +        bdrv_image_info_specific_dump(spec_info,
>> +                                      "Format specific information:\n");
>>           qapi_free_ImageInfoSpecific(spec_info);
>>       }
> Interesting observation here: That qemu-io uses printf() instead of
> qemu_printf() for the top level, but then dump_qobject() (which results
> in qemu_printf()) for the format specific information, means that if you
> use the 'qemu-io' HMP command, you'll get half of the output on stdout
> and the other half in the monitor.

Hu.  I can’t find a single instance of qemu_printf() in qemu-io-cmds.c, 
but then I assume all printf()s there should really be qemu_printf()?

Hanna

> This series doesn't fix this, but the split makes a little more sense
> after this patch at least...
>
> Kevin


