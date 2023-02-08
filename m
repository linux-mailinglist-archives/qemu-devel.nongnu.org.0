Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E322168F17F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:58:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlt8-0002uq-OY; Wed, 08 Feb 2023 09:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPlt2-0002tH-HA
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:57:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPlsz-0001qa-Na
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675868244;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yvxuonNpP7l0sbzUnHEJP/GdQNQ9Hu0Csdj0l7z5CYs=;
 b=IUCBYGplLk3+Ah7+zNzmvvVYwRWO0yv1V40j6VSEuEpKZD258YCUHdjtnt9sxaqLhLuz4N
 VtIAeEOf8OqipXeBsD+/SdYsbwDHV+LEJlK9jAyLa8aNkuLVuUGF6E+xpvkMtXMNz1JJe/
 sew2I2bZ4Ml1DEYOaR3gb3yqYGWjss4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-IP2THIAOPguyq-5MW2qJdg-1; Wed, 08 Feb 2023 09:57:22 -0500
X-MC-Unique: IP2THIAOPguyq-5MW2qJdg-1
Received: by mail-wr1-f70.google.com with SMTP id
 f14-20020a0560001a8e00b002c3b562d76cso2951784wry.12
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 06:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yvxuonNpP7l0sbzUnHEJP/GdQNQ9Hu0Csdj0l7z5CYs=;
 b=I2fZtQC9FzMK0W8ASkZ3ZE0en9SNGSeJXbS8+mThHXBLDal40ppZn6E2PJ0ay8aQFx
 2OFsCQxkz+8zVTeYQ3vDjUh+OWEkrpvNFB5/oIJnT7+uPSpsU5+L/qH9MohYd9v9ww8H
 64hWUp6cZOgxFVr0HBUdWTn0e5/5ao3PHVIgOl1X/hZtLyzygJjNONLaK8GIqc0hDe1B
 haBy0X2mcSh0sz4bWb40OWkA+jQDGVADRmKWX1a239hvxaCgifx/vOFTBD8mfhw/La3K
 ktSErzm+JL+XXVLzW7PjMzyu00BDeWK7aKVvqYYipDPtGlcIMjOgv7zUGUX6zijU0YL5
 hS1Q==
X-Gm-Message-State: AO0yUKX8bSb9y1qJZyRYt/tV97QLTLRuMRCpZCfVkoIcQLS/hoKByLD/
 HKwxu5STay9F87VnGy0rc4+hgmr1RjPGjuqFDTNUowwQFBBTil9mMXfxoMlezTiJSvpG+lPb6YN
 gD3MIsc8DpZ6qGaeGCnwCE9s=
X-Received: by 2002:a05:600c:1613:b0:3dc:46e8:982 with SMTP id
 m19-20020a05600c161300b003dc46e80982mr6866637wmn.19.1675868240770; 
 Wed, 08 Feb 2023 06:57:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+Qixa5/Ot2Ejzf49/RBXRneLMRmsGKSDXpXOJjU8NQ9JSIJKkoAEdLEBIdNRyLGn1h4snxmQ==
X-Received: by 2002:a05:600c:1613:b0:3dc:46e8:982 with SMTP id
 m19-20020a05600c161300b003dc46e80982mr6866628wmn.19.1675868240618; 
 Wed, 08 Feb 2023 06:57:20 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bce01000000b003e0010a9f67sm2209801wmc.44.2023.02.08.06.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 06:57:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 1/2] migration: Split ram_bytes_total_common() in two
 functions
In-Reply-To: <64de90b1-cdb4-2b83-2a56-404afa4681ec@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 8 Feb 2023 15:54:01
 +0100")
References: <20230208141402.18865-1-quintela@redhat.com>
 <20230208141402.18865-2-quintela@redhat.com>
 <64de90b1-cdb4-2b83-2a56-404afa4681ec@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 15:57:18 +0100
Message-ID: <87mt5ojjch.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> On 8/2/23 15:14, Juan Quintela wrote:
>> It is just a big if in the middle of the function, and we need two
>> functions anways.
>
> Typo "anyways".
>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   migration/ram.c | 25 ++++++++++++++-----------
>>   1 file changed, 14 insertions(+), 11 deletions(-)
>> @@ -3222,7 +3224,8 @@ static int ram_save_setup(QEMUFile *f, void *opaqu=
e)
>>       (*rsp)->pss[RAM_CHANNEL_PRECOPY].pss_channel =3D f;
>>         WITH_RCU_READ_LOCK_GUARD() {
>> -        qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_M=
EM_SIZE);
>> +        qemu_put_be64(f, ram_bytes_total_with_ignored()
>> +                      | RAM_SAVE_FLAG_MEM_SIZE);
>
> Per CODING_STYLE the '|' should go under ram_bytes_total_with_ignored ;)

I thought so.  But emacs autoindent put it there.  And as proud follower
of the Emacs cult, emacs is never wrong O:-)

>            qemu_put_be64(f, ram_bytes_total_with_ignored()
>                             | RAM_SAVE_FLAG_MEM_SIZE);
>
>>           RAMBLOCK_FOREACH_MIGRATABLE(block) {
>>               qemu_put_byte(f, strlen(block->idstr));

I would have to see what I need to change in the indentation code to
make this correct.

BTW, nice catch.

Later, Juan.


