Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB213C73DB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:08:45 +0200 (CEST)
Received: from localhost ([::1]:58606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Kxg-00045v-I6
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m3KwC-00033g-0N
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:07:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m3Kw8-0006he-Ns
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626192426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anoAiWxKSZcX7m4NLi2U5E7aMa/BD/RZWalWu03KJG4=;
 b=PoixUnRkgNi0EJD1WEXICWZYISDjy8HTNQJzJRO3+jzBg/kcNG1P7i/p0l7F0XM8njJu0P
 RIErYGH3Hv2MHQm/Xv/9yzMPnQzc84RWvV5UvfLq/jXRU0erQmtgBdBCbn6Rc/i7mdPDv6
 HHNFjT/lDqmQgEeDKGUOhJK7w9O8Ers=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-2M-9v1pAM0We_5btJlFvmw-1; Tue, 13 Jul 2021 12:07:02 -0400
X-MC-Unique: 2M-9v1pAM0We_5btJlFvmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B02DD804141;
 Tue, 13 Jul 2021 16:07:01 +0000 (UTC)
Received: from redhat.com (ovpn-113-49.phx2.redhat.com [10.3.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B5FA5D9CA;
 Tue, 13 Jul 2021 16:07:01 +0000 (UTC)
Date: Tue, 13 Jul 2021 11:06:59 -0500
From: Eric Blake <eblake@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 03/11] util/selfmap: Discard mapping on error
Message-ID: <20210713160659.kxrjl6nnswoguncv@redhat.com>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
 <20210712215535.1471256-4-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210712215535.1471256-4-richard.henderson@linaro.org>
User-Agent: NeoMutt/20210205-569-37ed14
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 02:55:27PM -0700, Richard Henderson wrote:
> From clang-13:
> util/selfmap.c:26:21: error: variable 'errors' set but not used \
>     [-Werror,-Wunused-but-set-variable]
> 
> Quite right of course, but there's no reason not to check errors.
> 
> First, incrementing errors is incorrect, because qemu_strtoul
> returns an errno not a count -- just or them together so that
> we have a non-zero value at the end.
> 
> Second, if we have an error, do not add the struct to the list,
> but free it instead.
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  util/selfmap.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)

> 
> diff --git a/util/selfmap.c b/util/selfmap.c
> index 2ec99dfdda..0178c2ff8b 100644
> --- a/util/selfmap.c
> +++ b/util/selfmap.c
> @@ -23,29 +23,33 @@ GSList *read_self_maps(void)
>              gchar **fields = g_strsplit(lines[i], " ", 6);
>              if (g_strv_length(fields) > 4) {
>                  MapInfo *e = g_new0(MapInfo, 1);
> -                int errors;
> +                int errors = 0;
>                  const char *end;
>  
> -                errors  = qemu_strtoul(fields[0], &end, 16, &e->start);
> -                errors += qemu_strtoul(end + 1, NULL, 16, &e->end);
> +                errors |= qemu_strtoul(fields[0], &end, 16, &e->start);
> +                errors |= qemu_strtoul(end + 1, NULL, 16, &e->end);
>  
>                  e->is_read  = fields[1][0] == 'r';
>                  e->is_write = fields[1][1] == 'w';
>                  e->is_exec  = fields[1][2] == 'x';
>                  e->is_priv  = fields[1][3] == 'p';
>  
> -                errors += qemu_strtoul(fields[2], NULL, 16, &e->offset);
> +                errors |= qemu_strtoul(fields[2], NULL, 16, &e->offset);
>                  e->dev = g_strdup(fields[3]);

e->dev now contains malloc'd memory...

> -                errors += qemu_strtou64(fields[4], NULL, 10, &e->inode);
> +                errors |= qemu_strtou64(fields[4], NULL, 10, &e->inode);

...and if this qemu_strtou64 fails...

>  
> -                /*
> -                 * The last field may have leading spaces which we
> -                 * need to strip.
> -                 */
> -                if (g_strv_length(fields) == 6) {
> -                    e->path = g_strdup(g_strchug(fields[5]));
> +                if (!errors) {
> +                    /*
> +                     * The last field may have leading spaces which we
> +                     * need to strip.
> +                     */
> +                    if (g_strv_length(fields) == 6) {
> +                        e->path = g_strdup(g_strchug(fields[5]));
> +                    }
> +                    map_info = g_slist_prepend(map_info, e);
> +                } else {
> +                    g_free(e);

...you've now leaked it.  Oops.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


