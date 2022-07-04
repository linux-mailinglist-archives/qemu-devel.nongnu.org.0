Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CFD56542F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:56:28 +0200 (CEST)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Kgl-0000Tg-As
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KZO-0007Ci-LS
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KZM-0002iB-W6
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656935328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1UIXGCPZp15cL+zW4DmyJ+F0xLUfUCbi6LkjJM8HZnc=;
 b=ELQlPA9AoUSZ6Vn5+NHe3W0kbroh3EudCw77MBs3qVP8Nkchfo63IvQ7E9MzGywVUmeBos
 ywIK9enHeuuNJA0BXnOVSwNT58OiRBycsu2m7M9iIa4Lmsz9rmCVItbqQTNkdwOvfBKZEi
 lJLk7ouvGL4EKpkpTccHPZBlqd9dBYk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-YaY44zQPMqeLxmr2m-dblw-1; Mon, 04 Jul 2022 07:48:47 -0400
X-MC-Unique: YaY44zQPMqeLxmr2m-dblw-1
Received: by mail-ej1-f72.google.com with SMTP id
 oz40-20020a1709077da800b00722ef1e93bdso1936817ejc.17
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 04:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1UIXGCPZp15cL+zW4DmyJ+F0xLUfUCbi6LkjJM8HZnc=;
 b=mQRdYnlHMiyvQwRYrnjIMorhHwbrK2FqyICXMhSBkAe/nHZZKU5c9R58cO1ZValLXv
 TTBtTOpnFx+kB9nWKBc8SdYo8ff6m1zu6STYhvIscLiNoexfGjkMPMwE1u19kXu63iq6
 gu0olWJMMhzRTFOdg2l83BArA9DG6+0gxdBXFwen286UkwrYFF5itM40mH9SiCgF1dyV
 6PYmyqczxKhPhmMqTQaZEl9WY6SvxEEB6owIS/cPxC8eyQmwN6OcD87sa2Yi3zzqNvoP
 K40kxO/BcxKkowijDZa1bXwBT4m8EApcBhysEQR28Lfo0HhQWhdk+TL9TNd4bHZZ9M/7
 Qhdw==
X-Gm-Message-State: AJIora8yOJnVmGO+gs9LLGJOnsh21J1MSYBv1geSKl3d7+jFsFnoMkzr
 FJcIbHXmyyk5rjkKiCBZKotZFnRRbp/uIA29Tzl32TTTkxsfZtchVtoDXB3uzm+RlWEtYKqXz5n
 FXpm0h+mYjOhSaeY=
X-Received: by 2002:a17:907:9725:b0:726:c820:7653 with SMTP id
 jg37-20020a170907972500b00726c8207653mr29010675ejc.633.1656935326025; 
 Mon, 04 Jul 2022 04:48:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uBj8ErmNDi3Vs+TsTxbObWLOTU9vhGc94VSgeUyT92ewxp9HXdkNeu3V9QeFjl1yuYMX+cWw==
X-Received: by 2002:a17:907:9725:b0:726:c820:7653 with SMTP id
 jg37-20020a170907972500b00726c8207653mr29010654ejc.633.1656935325854; 
 Mon, 04 Jul 2022 04:48:45 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 z10-20020aa7c64a000000b0043a21e3b4a5sm3166793edr.40.2022.07.04.04.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 04:48:45 -0700 (PDT)
Message-ID: <03a7c859-e3ff-1b7e-a977-8ecd445da2ff@redhat.com>
Date: Mon, 4 Jul 2022 13:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 03/10] block: Make bdrv_{pread,pwrite}() return 0 on
 success
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-4-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609152744.3891847-4-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 09.06.22 17:27, Alberto Faria wrote:
> They currently return the value of their 'bytes' parameter on success.
>
> Make them return 0 instead, for consistency with other I/O functions and
> in preparation to implement them using generated_co_wrapper. This also
> makes it clear that short reads/writes are not possible.
>
> The few callers that rely on the previous behavior are adjusted
> accordingly by hand.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/cloop.c                    |  2 +-
>   block/crypto.c                   |  4 ++--
>   block/dmg.c                      | 10 +++++-----
>   block/io.c                       | 10 ++--------
>   block/qcow.c                     |  2 +-
>   block/qcow2.c                    |  4 ++--
>   block/qed.c                      |  7 +------
>   block/vdi.c                      |  2 +-
>   block/vmdk.c                     |  5 ++---
>   tests/unit/test-block-iothread.c |  4 ++--
>   10 files changed, 19 insertions(+), 31 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


