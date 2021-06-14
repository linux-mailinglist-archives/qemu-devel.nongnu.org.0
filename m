Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C815E3A6C48
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:44:45 +0200 (CEST)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsphc-0005qE-DF
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lspg8-00053X-1d
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:43:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lspg4-0006SA-Ch
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623688984;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqqzIIAEg1D4TrMNWDJvMwilYF7tGHqzgnEVr+KhyAM=;
 b=KET+P0x4igVt7wh9xBgakWBzd1sHI98RYXw+GP27lhVeRW8T12QjoPhhKoV0p3OzUa25Bv
 UFajFMyFsYNmP3VKAdnGw/mg46AJsp7aZdpTXBNuf4plQz3LZ72okQR4MfTvHejVMyhLRc
 LcZZ4S2mcwvAA58gDwno+eoxv8e/SY4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-Uy2cepSdMHuGVN-FUtSDFg-1; Mon, 14 Jun 2021 12:43:03 -0400
X-MC-Unique: Uy2cepSdMHuGVN-FUtSDFg-1
Received: by mail-wr1-f72.google.com with SMTP id
 m27-20020a056000025bb0290114d19822edso7276491wrz.21
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 09:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lqqzIIAEg1D4TrMNWDJvMwilYF7tGHqzgnEVr+KhyAM=;
 b=MPDpUXfd2luoIj8OyzDyhXCB4JbgGN53Dkoz6IZJGZLjvq2Uep9EbBN5cj0huv3TaE
 GyotPpjF3J3hLinAs5Lt0yiFGx667MLkX9zs5HUzgksAGcMMkrlRzXJBINiXwcTHTxMw
 HL/J/ahKDQDkHHadsw0mAeikadsWSfjza9k/rF0U5E2Lm1IA+Pgnl95GM/581usOyg3Z
 BoVizb3iiaVKj3j82fnQEU5c9BOhYZryPKqbftgUpOkJY4c5fMMZ7p+77vQScEj3upXK
 BeoGuTh9wNVPM2jl1NFD2vb2vLIpxm1JOLUuHNJRDZV9R3vi2Tl0ApGDbnYMVJGhBh2f
 XctA==
X-Gm-Message-State: AOAM530k6pAwuRQE+eccxbstn5IsNJ0tacd1NzIryjr0d/FpcSeu0Uf8
 /T1VNyyvX80wXYTiUrygSrSLxQdwmOC+4oqPwbzZX/z/xWWA587ektz5E+n5wutbty0xCXZkI6D
 slEWiJkUQwuH0gM0=
X-Received: by 2002:a5d:4744:: with SMTP id o4mr13662157wrs.354.1623688982315; 
 Mon, 14 Jun 2021 09:43:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZgBFsj8TSgyQ+o/vpeetQ44fWb1ZKyfqkrQHrWmtXfVA8qr3mxvgqVmH5DWY8YxACld7Y1Q==
X-Received: by 2002:a5d:4744:: with SMTP id o4mr13662129wrs.354.1623688982158; 
 Mon, 14 Jun 2021 09:43:02 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id r6sm16440384wrz.91.2021.06.14.09.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 09:43:01 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 3/7] net/rocker: use GDateTime for formatting timestamp
 in debug messages
In-Reply-To: <YMOPM87ZdWWQOUsR@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 11 Jun 2021 17:28:35 +0100")
References: <20210505103702.521457-1-berrange@redhat.com>
 <20210505103702.521457-4-berrange@redhat.com>
 <YMOPM87ZdWWQOUsR@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Mon, 14 Jun 2021 18:43:00 +0200
Message-ID: <87a6nsgzxn.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, virtio-fs@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> ping: anyone willing to give a review of this one
>
> On Wed, May 05, 2021 at 11:36:58AM +0100, Daniel P. Berrang=C3=A9 wrote:
>> The GDateTime APIs provided by GLib avoid portability pitfalls, such
>> as some platforms where 'struct timeval.tv_sec' field is still 'long'
>> instead of 'time_t'. When combined with automatic cleanup, GDateTime
>> often results in simpler code too.
>>=20
>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> ---
>>  hw/net/rocker/rocker.h | 11 +++--------
>>  1 file changed, 3 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/hw/net/rocker/rocker.h b/hw/net/rocker/rocker.h
>> index 941c932265..412fa44d01 100644
>> --- a/hw/net/rocker/rocker.h
>> +++ b/hw/net/rocker/rocker.h
>> @@ -25,14 +25,9 @@
>>  #if defined(DEBUG_ROCKER)
>>  #  define DPRINTF(fmt, ...) \
>>      do {                                                           \
>> -        struct timeval tv;                                         \
>> -        char timestr[64];                                          \
>> -        time_t now;                                                \
>> -        gettimeofday(&tv, NULL);                                   \
>> -        now =3D tv.tv_sec;                                           \
>> -        strftime(timestr, sizeof(timestr), "%T", localtime(&now)); \
>> -        fprintf(stderr, "%s.%06ld ", timestr, tv.tv_usec);         \
>> -        fprintf(stderr, "ROCKER: " fmt, ## __VA_ARGS__);           \
>> +        g_autoptr(GDateTime) now =3D g_date_time_new_now_local();    \
>> +        g_autofree char *nowstr =3D g_date_time_format(now, "%T.%f");\
>> +        fprintf(stderr, "%s ROCKER: " fmt, nowstr, ## __VA_ARGS__);\
>>      } while (0)
>>  #else
>>  static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)

Reviewed-by: Juan Quintela <quintela@redhat.com>


