Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450664E69ED
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 21:42:17 +0100 (CET)
Received: from localhost ([::1]:38398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUHg-00062L-4n
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 16:42:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUFs-0005Fd-96
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:40:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUFp-0005OS-J7
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648154419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9f0UxGtZleLCYEszBE1VHQGMtjvW8dQd/8JsSR+sX30=;
 b=AtQ3wkKkY8beakoPDmDfYNAeIwV68FvrY7t9PViclCLUHEI5KZ7E8ZenYzsj1ONsXuOqSv
 XFl0EmkCf0rvRaFA8gZz4CaVp0IO9TwOtT0DJRifesqF2GlkHktjld6tByn8GIs9OLy+S0
 0H6tbGgxB1GDxfoszazsuRgiObeLLgU=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-59HKYTxmO--WlBYp2Nvb9A-1; Thu, 24 Mar 2022 16:40:18 -0400
X-MC-Unique: 59HKYTxmO--WlBYp2Nvb9A-1
Received: by mail-vs1-f70.google.com with SMTP id
 w5-20020a67c905000000b00324c7bafd3aso1221978vsk.16
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9f0UxGtZleLCYEszBE1VHQGMtjvW8dQd/8JsSR+sX30=;
 b=jicfpPbnuft6EW5F73X/dHe5pAwN1/nuVuL2OV1kXFaByPULeQccwtpPle/dtCdM4w
 ekvKzldXjK+KMjn9iOEEUNVoHN0+BfHOVK9xrzyZDbr9TD827ZWDaf6vNTbGp9NdY+as
 eawhK2DElp3l/czNFh+xjGeh/sWsc072Jv2gXMuHyW5o7laZcwMDXioz1h1Rlfx+1MG2
 ySjQyW6KG8eOswWWNgZBEtjKxBw4k1MM1FGvRLWoNmJt/EVrfdX4LEnAd5dmQzFb7eUr
 7M24GnLs9hkNTNKOgUK1+qAT/vMeuspnbvNh35uxgmTzf7BV6/bjboYBxLdbGgCN2gtU
 BSMQ==
X-Gm-Message-State: AOAM532x9EQMRQU/hV4Lscq6/BzDk/9cqNhzb+gBc1bb+GDYZR8KeDhf
 tPRP8McLK/3z73CozFhuq5pEtomLSrjtyCMaCZqptRkZ8sKxdkZ0zuTo80PlRQhkM52jALLsZuv
 5lzazSus+p9YZ30cNV3lE0hx3gaih9fY=
X-Received: by 2002:a05:6122:9a6:b0:33f:f23e:bde9 with SMTP id
 g38-20020a05612209a600b0033ff23ebde9mr419426vkd.3.1648154417489; 
 Thu, 24 Mar 2022 13:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2UNAfH/9D/Nr54a0qKuk28BA2ZXQPCYjkM5fUsxWCz6YdUfT8gsI7zarH+yf52GE/8hw5eyflFRZI86hqk6A=
X-Received: by 2002:a05:6122:9a6:b0:33f:f23e:bde9 with SMTP id
 g38-20020a05612209a600b0033ff23ebde9mr419416vkd.3.1648154417321; Thu, 24 Mar
 2022 13:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-3-victortoso@redhat.com>
 <CAFn=p-bXtNoJ=WpYk6s3Wkkq6QCoQ4YjbLKegAB6xgMxCO+CDg@mail.gmail.com>
In-Reply-To: <CAFn=p-bXtNoJ=WpYk6s3Wkkq6QCoQ4YjbLKegAB6xgMxCO+CDg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 16:40:06 -0400
Message-ID: <CAFn=p-bMTFpikwR5JMQWCP1rPSnn55JPpfy-QuREO91MD6jKmg@mail.gmail.com>
Subject: Re: [PATCH 02/14] qapi: fix example of BLOCK_IMAGE_CORRUPTED event
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 3:15 PM John Snow <jsnow@redhat.com> wrote:
>
>
>
> On Thu, Mar 24, 2022, 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
>>
>> Fatal is not optional.
>>
>> Signed-off-by: Victor Toso <victortoso@redhat.com>
>> ---
>>  qapi/block-core.json | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index e89f2dfb5b..585a9e020e 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -5008,7 +5008,7 @@
>>  # <- { "event": "BLOCK_IMAGE_CORRUPTED",
>>  #      "data": { "device": "ide0-hd0", "node-name": "node0",
>>  #                "msg": "Prevented active L1 table overwrite", "offset": 196608,
>> -#                "size": 65536 },
>> +#                "size": 65536, "fatal": false },
>>  #      "timestamp": { "seconds": 1378126126, "microseconds": 966463 } }
>>  #
>>  # Since: 1.7
>> --
>> 2.35.1
>
>
> Is this the correct fatality setting for this particular case? Default is implied to be true.

(1) We don't seem to actually emit this particular message anymore. I
don't think it exists in the tree.

(2) The only fatal=False messages I can see is
"Cannot free unaligned cluster %#llx"

(Try grepping for qcow2_signal_corruption)

so maybe we should pick a new example that might really exist. iotest
060 seems to test this, so that can be used as a guide.

--js


