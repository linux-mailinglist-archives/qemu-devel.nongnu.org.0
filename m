Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BE6F716D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:47:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucvI-0004LI-Bg; Thu, 04 May 2023 13:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pucv9-00044v-CK
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pucv7-0007HP-UX
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683221949;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ba2TVGaHXQ90NDaFHSmE2yErdXMQ5h26exg97LZRv8w=;
 b=PBjwi8SmBwRv+ehLVSauVslDYGkYI9N+gc5NTcohgYYPMS26PX8vpeotcL0cLXW6jUuPnN
 ozUrilupO0QCUV6NAuI9PPBlc437Xn0G7GvGiNr++uoIvlW40FptoIrfltdRsE+FZIQoDm
 V1yaP5/o/ncEKb5r8Zpc6JzIZpSE0Ew=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-HJxV8UGEOkip83lG07G1aQ-1; Thu, 04 May 2023 13:39:07 -0400
X-MC-Unique: HJxV8UGEOkip83lG07G1aQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f195129aa4so5335345e9.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 10:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683221945; x=1685813945;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ba2TVGaHXQ90NDaFHSmE2yErdXMQ5h26exg97LZRv8w=;
 b=kIYbM1FcM4ZiutxnpGzeu8n3H4gHCHY3xU2tPldf0DO5Hphinb6qEDi5ux/IgHdn28
 0DyNl42pxAK+cXIlQQ3kZuZ28Q+d9wJ4YfooiogcBPE/tZVgarHgWMxpGFo9Jtfno0Ab
 P0d9E8gmtEf+FyDAjAypKpu8/ZoOPNSN2ICmSTso6m8pjCIt7bCIwrPuVqOeJsltTIYm
 yrZkYldbBIpwLlw1HqYBh/90LtKAXFQK6vk3GD0F+esDEWKZmOwBviWrwgFDbVYHGn1t
 RdUcy29/GCoYF3N0dXHQNx9PtfUKrkIYFi5YYjTFBpuZ/GiJpVxSIe6u82DzSfbRMm0T
 tULA==
X-Gm-Message-State: AC+VfDxO+TSkUmFH7TxYDNDX+yByTJ19h4KPBeBF/ghNN7dbRqIRiJ6i
 ftt9PvWtdE55mhBoEd/8XqGO9hd7k97WhxLoH+2dIbsID/WCxp8+1EOGCaUgD+iC2YwioooHfb3
 k90qbfkVkxLRZoQ4=
X-Received: by 2002:a1c:c914:0:b0:3f1:73ca:7807 with SMTP id
 f20-20020a1cc914000000b003f173ca7807mr320767wmb.37.1683221945822; 
 Thu, 04 May 2023 10:39:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5iYCmgs+Qs9PGAsLiJKgVlIPfsIwSenMx2HL47xXWMHUNl0DroULNopEIYObW52tkpIV3V1w==
X-Received: by 2002:a1c:c914:0:b0:3f1:73ca:7807 with SMTP id
 f20-20020a1cc914000000b003f173ca7807mr320753wmb.37.1683221945551; 
 Thu, 04 May 2023 10:39:05 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003f1733feb3dsm5638130wmc.0.2023.05.04.10.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 10:39:05 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Peter Xu
 <peterx@redhat.com>
Subject: Re: [PATCH 1/2] migration: Document all migration_stats
In-Reply-To: <ZFPhmrCnF8Rdkkxq@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 4 May 2023 17:47:22 +0100")
References: <20230504103357.22130-1-quintela@redhat.com>
 <20230504103357.22130-2-quintela@redhat.com>
 <ZFPhmrCnF8Rdkkxq@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 04 May 2023 19:39:04 +0200
Message-ID: <877ctoov2f.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Thu, May 04, 2023 at 12:33:56PM +0200, Juan Quintela wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/migration-stats.h | 43 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>=20
>> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
>> index 149af932d7..0e49c236fa 100644
>> --- a/migration/migration-stats.h
>> +++ b/migration/migration-stats.h
>> @@ -22,17 +22,60 @@
>>   * one thread).
>>   */
>>  typedef struct {
>> +    /*
>> +     * number of bytes that were dirty last time that we sync with the
>
>  s/sync/synced/
>
>> +     * guest memory.  We use that to calculate the downtime.  As the
>> +     * remaining dirty amounts to what we know that is still dirty
>> +     * since last iteration, not counting what the guest has dirtied
>> +     * sync we synchronize bitmaps.
>
>   s/synchronize/synchronized/
>
>> +     */
>>      Stat64 dirty_bytes_last_sync;
>> +    /*
>> +     * number of pages dirtied by second.
>
>  s/by/per/
>
>> +     */
>>      Stat64 dirty_pages_rate;
>> +    /*
>> +     * number of times we have synchronize guest bitmaps.
>
>   s/synchronize/synchronized/
>
>>      Stat64 postcopy_bytes;
>> +    /*
>> +     * number of postcopy page faults that we have handled during
>> +     * postocpy stage.
>
> s/postocpy/postcopy/

Integrated all of them.

>
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Thanks.

>
> With regards,
> Daniel


