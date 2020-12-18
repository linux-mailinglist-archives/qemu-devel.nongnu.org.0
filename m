Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB23F2DE1DA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:17:30 +0100 (CET)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDlJ-0004br-NY
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqDNm-0008Qi-48
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:53:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqDNh-0008LW-H0
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7g/d8LhUjtUNaX+IBN6d3rxyMuiuxh2KwFy/YVGvIg0=;
 b=VZ9SPsus8SsMB5EkejUc0BhEidenVY/uhxr3IPfiEsujrfnS5bNFnAkZ8L04Ktg0ndgQlp
 QQkO0QjYyGx3QYZb7iZEjFEhY6C3mMp9TbPQbFD+l2lE3HCX/uSxBVKaEDfI4dePb6bAIs
 elv7EHVDi9JolhT/pooJaSt3q8uU5oM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-OxCKKoajOF2HEnI9wh2uaA-1; Fri, 18 Dec 2020 05:53:02 -0500
X-MC-Unique: OxCKKoajOF2HEnI9wh2uaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F272107ACE8;
 Fri, 18 Dec 2020 10:53:01 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-84.ams2.redhat.com
 [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64E4E18993;
 Fri, 18 Dec 2020 10:53:00 +0000 (UTC)
Subject: Re: [PATCH 3/9] block/vpc: Don't abuse the footer buffer for dynamic
 header
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201217162003.1102738-1-armbru@redhat.com>
 <20201217162003.1102738-4-armbru@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <7de13ad8-ab0c-3350-7bd0-c8d0fd0c7403@redhat.com>
Date: Fri, 18 Dec 2020 11:52:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217162003.1102738-4-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.20 17:19, Markus Armbruster wrote:
> create_dynamic_disk() takes a buffer holding the footer as first
> argument.  It writes out the footer (512 bytes), then reuses the
> buffer to initialize and write out the dynamic header (1024 bytes).
> 
> Works, because the caller passes a buffer that is large enough for
> both purposes.  I hate that.
> 
> Use a separate buffer for the dynamic header, and adjust the caller's
> buffer.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   block/vpc.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/block/vpc.c b/block/vpc.c
> index d18ecc3da1..34186640ee 100644
> --- a/block/vpc.c
> +++ b/block/vpc.c
> @@ -822,8 +822,9 @@ static int calculate_geometry(int64_t total_sectors, uint16_t *cyls,
>   static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
>                                  int64_t total_sectors)
>   {
> +    uint8_t dyndisk_header_buf[1024];
>       VHDDynDiskHeader *dyndisk_header =
> -        (VHDDynDiskHeader *) buf;
> +        (VHDDynDiskHeader *)dyndisk_header_buf;
>       uint8_t bat_sector[512];
>       size_t block_size, num_bat_entries;
>       int i;
> @@ -858,7 +859,7 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
>       }
>   
>       /* Prepare the Dynamic Disk Header */
> -    memset(buf, 0, 1024);
> +    memset(dyndisk_header_buf, 0, 1024);
>   
>       memcpy(dyndisk_header->magic, "cxsparse", 8);

I’d prefer something like

*dyndisk_header = (VHDDynDiskHeader){
     ...
};

but that isn’t possible before patch 5.  (And can be done on top now 
anyway, especially given that Kevin probably wants to send a pull 
request today.)

[...]

> @@ -972,8 +974,8 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
>       BlockBackend *blk = NULL;
>       BlockDriverState *bs = NULL;
>   
> -    uint8_t buf[1024];
> -    VHDFooter *footer = (VHDFooter *) buf;
> +    uint8_t footer_buf[HEADER_SIZE];
> +    VHDFooter *footer = (VHDFooter *)footer_buf;
>       uint16_t cyls = 0;
>       uint8_t heads = 0;
>       uint8_t secs_per_cyl = 0;
> @@ -1036,7 +1038,7 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
>       }
>   
>       /* Prepare the Hard Disk Footer */
> -    memset(buf, 0, 1024);
> +    memset(footer_buf, 0, HEADER_SIZE);
>   
>       memcpy(footer->creator, "conectix", 8);

Same here, except here it’s patch 7.

Reviewed-by: Max Reitz <mreitz@redhat.com>


