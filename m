Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB6C483EF5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:17:21 +0100 (CET)
Received: from localhost ([::1]:45404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fwW-0001eW-KX
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:17:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n4fud-00008m-R2
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:15:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n4fub-0006TR-BE
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641287720;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AfxLYaMv9MOI5oGnZPXOOjKzxlJsDSfeFMuD1ZhQKM4=;
 b=NzKmoDV+KTGzs8TeqltKbmI/vXfFx4+Vbhrnfw7O5VmRuN6bW+mVtVqCue3RVgANCsP0TE
 GG9o3ix9qJ7DJ4H7EKrAJtK5FkUftbya0CEvfyFoSXzeaMd3kePq5J6pZx8JQJMKl2TfUL
 bb+HlT14V1umqRA2DewgWX8GbL1beBA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338--1tf0k4yNhyT5t-6oGblDg-1; Tue, 04 Jan 2022 04:15:19 -0500
X-MC-Unique: -1tf0k4yNhyT5t-6oGblDg-1
Received: by mail-wm1-f70.google.com with SMTP id
 a69-20020a1c7f48000000b00345d3d135caso8066498wmd.7
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 01:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lM0h9S7jTd6TS6LioRKqHE88mC30cLTombUICMwikOk=;
 b=dRWvFyrKfyHT/UNNoHCxsKaqoWQ9F3XI91BwvdQYUHIA83Pa2yJoa7Jj39xNpWHwAO
 2K5/gDqi1JU8lJi74H9BJKDg6KilvMAWKLo+fVvV5etugGgZNYSmjO28eOEqO9tpK5O0
 QEuO9Q+jdhm/NwUwlC/tsww8jn6+CLwyEn75st5s3TiRLpUwyLKBLlYETdwBoT2TLjJ2
 er20EqQMHIjiF9q556D6ppai8T4lT7TkXu5kzknzoldmrYP5DXZnbJ5ygQKAjz4a9+Az
 LwOrTuPtWVrgD2QR/CzRZUHNgd8W7rORReOPjr7c2/pLcfqyXAba9pQ76osUt2LHAR8Y
 Cr1A==
X-Gm-Message-State: AOAM5333OYOBH9+wfk8u7ZyZW9xHsAC/nkXW9W/ONwVE1Pd1aIykUF1t
 DZ8gFTQJMbk0IuF1wYYs4EbCeLcWDqBXQzLPNamRnM9Jv/zPlATT9PNTNxFd3dikRbIaPt6q7q1
 8bFFTlyfAvqKQeo0=
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr41180695wrp.226.1641287717958; 
 Tue, 04 Jan 2022 01:15:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCI1QelPqDIyQv54wk/3Re1oQbCpONORO79hM6SlEHlMIkAFkyLUF4LKgI6EqyJaDmLyQSAA==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr41180682wrp.226.1641287717723; 
 Tue, 04 Jan 2022 01:15:17 -0800 (PST)
Received: from localhost (static-174-144-85-188.ipcom.comunitel.net.
 [188.85.144.174])
 by smtp.gmail.com with ESMTPSA id h204sm37516945wmh.33.2022.01.04.01.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 01:15:17 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] migration: Don't return for postcopy_send_discard_bm_ram()
In-Reply-To: <20211230160525.462185-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 30 Dec 2021 17:05:25
 +0100")
References: <20211230160525.462185-1-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 04 Jan 2022 10:15:16 +0100
Message-ID: <871r1n7tgb.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> postcopy_send_discard_bm_ram() always return zero. Since it can't
> fail, simplify and do not return anything.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Based-on: <20211224065000.97572-1-peterx@redhat.com>
> ---
>  migration/ram.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 5234d1ece11..e241ce98461 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2433,14 +2433,12 @@ void ram_postcopy_migrated_memory_release(Migrati=
onState *ms)
>  /**
>   * postcopy_send_discard_bm_ram: discard a RAMBlock
>   *
> - * Returns zero on success
> - *
>   * Callback from postcopy_each_ram_send_discard for each RAMBlock
>   *
>   * @ms: current migration state
>   * @block: RAMBlock to discard
>   */
> -static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *bl=
ock)
> +static void postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *b=
lock)
>  {
>      unsigned long end =3D block->used_length >> TARGET_PAGE_BITS;
>      unsigned long current;
> @@ -2464,8 +2462,6 @@ static int postcopy_send_discard_bm_ram(MigrationSt=
ate *ms, RAMBlock *block)
>          postcopy_discard_send_range(ms, one, discard_length);
>          current =3D one + discard_length;
>      }
> -
> -    return 0;
>  }
> =20
>  static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *=
block);

Nack.

You need to change the only caller (postcopy_each_send_discard) also.

        ret =3D postcopy_send_discard_bm_ram(ms, block);
        postcopy_discard_send_finish(ms);
        if (ret) {
            return ret;
        }

Not sure if doing the same operation with
postcopy_each_send_discard/ram_postcopy_send_discard_bitmap() and
postcopy_chunk_hugepages makes sense.

Later, Juan.



