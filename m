Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6733175E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:34:26 +0100 (CET)
Received: from localhost ([::1]:43808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJLe5-0000HU-As
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJLcN-0007Yn-7y
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:32:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJLcK-0007ab-Pp
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615231953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98KrghltZkxUg3BM10/biGumshIZAPfNkeLodrkDsRk=;
 b=DyOiSEkWqD+mzmfkkvMbEsY8u14DXIzXeZZjDfCaej/Ym0wDgr6OYEP5LGUVnsj+yRzGE9
 rbQ5taTxgiPAdPLCX7XSmasTakmBMt/jNJ7OfnE+6Ke8cIT+J+pPaZLzj01CgJaUCzKS1x
 2cTBfSjhouXVa7DyxF4pmVgcNwMZflg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-ujqVKViYOgC536tmxa5Aig-1; Mon, 08 Mar 2021 14:32:31 -0500
X-MC-Unique: ujqVKViYOgC536tmxa5Aig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CD6180432F;
 Mon,  8 Mar 2021 19:32:30 +0000 (UTC)
Received: from [10.3.112.36] (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43B1260C16;
 Mon,  8 Mar 2021 19:32:22 +0000 (UTC)
Subject: Re: [PATCH v3 26/30] qemu-img: Use user_creatable_process_cmdline()
 for --object
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-27-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7ad6067c-ff65-2ca2-8073-5b184f1b4c39@redhat.com>
Date: Mon, 8 Mar 2021 13:32:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308165440.386489-27-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 10:54 AM, Kevin Wolf wrote:
> This switches qemu-img from a QemuOpts-based parser for --object to
> user_creatable_process_cmdline() which uses a keyval parser and enforces
> the QAPI schema.
> 
> Apart from being a cleanup, this makes non-scalar properties accessible.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Acked-by: Peter Krempa <pkrempa@redhat.com>
> ---
>  qemu-img.c | 251 ++++++++++-------------------------------------------
>  1 file changed, 45 insertions(+), 206 deletions(-)
> 

> @@ -1353,7 +1303,7 @@ static int check_empty_sectors(BlockBackend *blk, int64_t offset,
>  /*
>   * Compares two images. Exit codes:
>   *
> - * 0 - Images are identical
> + * 0 - Images are identical or the requested help was printed

Nice, but does the user-facing documentation need updating to match?

>   * 1 - Images differ
>   * >1 - Error occurred
>   */
> @@ -1423,15 +1373,21 @@ static int img_compare(int argc, char **argv)
>          case 'U':
>              force_share = true;
>              break;
> -        case OPTION_OBJECT: {
> -            QemuOpts *opts;
> -            opts = qemu_opts_parse_noisily(&qemu_object_opts,
> -                                           optarg, true);
> -            if (!opts) {
> -                ret = 2;
> -                goto out4;
> +        case OPTION_OBJECT:
> +            {
> +                Error *local_err = NULL;
> +
> +                if (!user_creatable_add_from_str(optarg, &local_err)) {
> +                    if (local_err) {
> +                        error_report_err(local_err);
> +                        exit(2);
> +                    } else {
> +                        /* Help was printed */
> +                        exit(EXIT_SUCCESS);
> +                    }

The commit message needs to be updated to call out that this bug fix was
intentional, preferably mentioning the commit where we broke it
(334c43e2c3).

The code is fine, though, so with an improved commit message (and maybe
some matching doc tweaks),

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


