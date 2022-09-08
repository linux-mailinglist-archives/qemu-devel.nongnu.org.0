Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BD65B1B3C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 13:20:03 +0200 (CEST)
Received: from localhost ([::1]:53606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWFZi-0004hH-8x
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 07:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oWFVE-0001LX-IF
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:15:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oWFVA-00032B-QC
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662635717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZMz+R5TIEtFBDk3fFlNXMSTZlh3kNLQjPT98YibGCo=;
 b=CY/vYKgjzcn0QwYsn2JbVhibUNgKcb8DgtaNd9o2+AIFpWeRh2OyONT3Wr/FFbR8ZhECVP
 SVHsSwOW92XEdvrYyjcZ9e1A9cEkxAzLWWswqPjEzIaDvvSutFuMdhQIW+4QV68dDTzKnN
 38RSrtYlPUp6aBLBvKu5AFxFoVPVtR4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-NfE5RLh8MKyhd0Gk0KJwEw-1; Thu, 08 Sep 2022 07:15:16 -0400
X-MC-Unique: NfE5RLh8MKyhd0Gk0KJwEw-1
Received: by mail-qk1-f200.google.com with SMTP id
 bj2-20020a05620a190200b006bba055ab6eso14290698qkb.12
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 04:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=TZMz+R5TIEtFBDk3fFlNXMSTZlh3kNLQjPT98YibGCo=;
 b=Vce7O8i1SBGGfyYoXCNclVt0BTIBWwtMimd3CEJyiAg9xPVE/7j6Uul5SdWRxawnaK
 FfgM9rdLxCKpL9oP5C0P7d23FqDrM5Oxvjj6uNsg2RVx66lHbCZt9/w325h0OHgUDeCl
 a8J7fVgJbNP7nq75mE3aguxwRvh5aGHDGccloV+rBUzAAWl4D/y9rsv9XIUlod8HkaRv
 U5aQkaQuZXLA6rwszimwpDA2a33ReyV2TD5GGcwWe0yGt0wBMvZvpz85qu4GRGgmWF6z
 HBvrf+l2077KXpxcCmdrqeX+pheakicsKkS5icEvSDZ9KdS5U+mgXmE3QnH8nQ5roii3
 lwAw==
X-Gm-Message-State: ACgBeo2KQu5Pj8pRy2Oady3b91IfDezQ/cAKDHnOPJcSFsYs5fDp0Lmw
 vc9l1DiekfcS1J9BVjJQ44kiWnIsqKv2Mw4h2ZXAO/q1bKhvnWwuBA2IYy17+hoOrs+uYnrnKvW
 WqPZHgDbHEPa3lAQ=
X-Received: by 2002:a05:620a:1404:b0:6ba:c2c2:5eca with SMTP id
 d4-20020a05620a140400b006bac2c25ecamr5955430qkj.220.1662635716410; 
 Thu, 08 Sep 2022 04:15:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7kDIMLoIjg1yRd1NuTNDjt5SihoeSyUglNe5WljrUV3ovIiOPiQlLh5WaZtZg4d4JEcfR+2w==
X-Received: by 2002:a05:620a:1404:b0:6ba:c2c2:5eca with SMTP id
 d4-20020a05620a140400b006bac2c25ecamr5955415qkj.220.1662635716194; 
 Thu, 08 Sep 2022 04:15:16 -0700 (PDT)
Received: from redhat.com ([45.144.113.243]) by smtp.gmail.com with ESMTPSA id
 x11-20020ac87ecb000000b0031ee918e9f9sm14528579qtj.39.2022.09.08.04.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 04:15:15 -0700 (PDT)
Date: Thu, 8 Sep 2022 07:15:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: Arwed Meyer <arwed.meyer@gmx.de>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/4] serial: Allow unaligned i/o access
Message-ID: <20220908071424-mutt-send-email-mst@kernel.org>
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
 <20220906194755.98090-5-arwed.meyer@gmx.de>
 <CAJ+F1CLX8gTZ_MsDB+nK7Gp4mBe5UDnaEmKYvfsyjNzKzcQw8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CLX8gTZ_MsDB+nK7Gp4mBe5UDnaEmKYvfsyjNzKzcQw8g@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Sep 08, 2022 at 02:11:28PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Sep 7, 2022 at 2:03 AM Arwed Meyer <arwed.meyer@gmx.de> wrote:
> 
>     Unaligned i/o access on serial UART works on real PCs.
>     This is used for example by FreeDOS CTMouse driver. Without this it
>     can't reset and detect serial mice.
> 
>     Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
>     Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
>     ---
>      hw/char/serial.c | 3 +++
>      1 file changed, 3 insertions(+)
> 
>     diff --git a/hw/char/serial.c b/hw/char/serial.c
>     index 7061aacbce..41b5e61977 100644
>     --- a/hw/char/serial.c
>     +++ b/hw/char/serial.c
>     @@ -961,6 +961,9 @@ void serial_set_frequency(SerialState *s, uint32_t
>     frequency)
>      const MemoryRegionOps serial_io_ops = {
>          .read = serial_ioport_read,
>          .write = serial_ioport_write,
>     +    .valid = {
>     +        .unaligned = 1,
>     +    },
> 
> 
> I don't get how this can help if both min_access_size & max_access_size are 1.
>  
> 
>          .impl = {
>              .min_access_size = 1,
>              .max_access_size = 1,
>     --
>     2.34.1


Because that's .impl. If access is invalid we don't get as far
as breaking it up to chunks.

> 
> 
> 
> 
> --
> Marc-André Lureau


