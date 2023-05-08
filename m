Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA936FB37F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:14:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2Y5-00041Y-Sm; Mon, 08 May 2023 11:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw2Y1-00041P-C2
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:13:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw2Xz-0000fm-Pq
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683558787;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8QA2ynUlT64v7+dZcyYkXqjCsj0rVaSprSSpMRt3QZc=;
 b=RjyvSW0l7ElKvo2Cfw1Ws92jLxUMqb09+Qj/DhhXYqMag1QQUYIsxY0ALqUnfpu4g0bsnh
 DRALI7GoKeJqQejOSO7YlLsvlFu59ShMYAo3RZTS1aNKNYDoUfvNQCx4QskqX9jDIoh+YT
 0cjvoAAYNco+8Nc7XWOC/eZYZwhvkfg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-HUsLp35-MCuvXNJhyRCfhg-1; Mon, 08 May 2023 11:13:05 -0400
X-MC-Unique: HUsLp35-MCuvXNJhyRCfhg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f315735edeso114506795e9.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 08:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683558784; x=1686150784;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8QA2ynUlT64v7+dZcyYkXqjCsj0rVaSprSSpMRt3QZc=;
 b=Rh6HuwUHksf3IwyOWRsunFXkBYvKnMudvmqe7lqeIitKEgqyAdNCWVlV4dEJLfTkWO
 Y+Ca+c/GPXnUQlVCfI9alvRP1G28US7viCxWlkIcP9AcqTD6ndR9ldbVXx3pzIcnbBAb
 Shu2/h2jzbAz/A0d7b8nCP0ySGJ2PjWidRVOIVPfdzTVVxZ0afneoVkq+X7GVPvMYTnv
 B9Q6TqmBvH9dlwV3qf50VCkg46/Cy373OM/54xZrrwSt7zPU2EByNvrgj51TVLULyZRm
 V05287fXV80J3sl3f/4orvIyL9EH8AHLQGHhpt69kN2RD97Eo1Clf65C7nBVZTYPY1aj
 H/Xg==
X-Gm-Message-State: AC+VfDwpSOCuY2ezOxJTMtfmA+5CiK/G6sh9XJHb66BhNDviUGjjFjKE
 WJymDwvXsqRWgm7Bz+462u3WgAwhDdmtMaBb5slNmRUEs93TCC/uSOUjZvYA9SLy4htVWzy3skO
 5xWCNfgeET0j0g8g=
X-Received: by 2002:a1c:f719:0:b0:3f1:70d5:1be8 with SMTP id
 v25-20020a1cf719000000b003f170d51be8mr8605705wmh.15.1683558784480; 
 Mon, 08 May 2023 08:13:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5s16xVgXKeSZCdBaNmEnbXD1d68Th0RqueUHVsFDt72CIqKfm/0I9ybDU+sCUmqGurr9PN4Q==
X-Received: by 2002:a1c:f719:0:b0:3f1:70d5:1be8 with SMTP id
 v25-20020a1cf719000000b003f170d51be8mr8605688wmh.15.1683558784182; 
 Mon, 08 May 2023 08:13:04 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 l9-20020a7bc449000000b003f2390bdd0csm17003756wmi.32.2023.05.08.08.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 08:13:03 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH 5/5] multifd: Add colo support
In-Reply-To: <6461809211524b24210fd4ac2ea6b2593fc7538f.1683506133.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Mon, 8 May 2023 02:52:59 +0200")
References: <cover.1683506133.git.lukasstraub2@web.de>
 <6461809211524b24210fd4ac2ea6b2593fc7538f.1683506133.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 08 May 2023 17:13:01 +0200
Message-ID: <878rdy6ema.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Lukas Straub <lukasstraub2@web.de> wrote:
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---

Please, split the move the creation of the p->block and the rest of the patch.



> diff --git a/migration/multifd.c b/migration/multifd.c
> index fb5e8859de..fddbf86596 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -284,7 +284,6 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>  {
>      MultiFDPacket_t *packet = p->packet;
> -    RAMBlock *block;
>      int i;
>  
>      packet->magic = be32_to_cpu(packet->magic);
> @@ -334,21 +333,21 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>  
>      /* make sure that ramblock is 0 terminated */
>      packet->ramblock[255] = 0;
> -    block = qemu_ram_block_by_name(packet->ramblock);
> -    if (!block) {
> +    p->block = qemu_ram_block_by_name(packet->ramblock);
> +    if (!p->block) {
>          error_setg(errp, "multifd: unknown ram block %s",
>                     packet->ramblock);
>          return -1;
>      }
>  
> -    p->host = block->host;
> +    p->host = p->block->host;
>      for (i = 0; i < p->normal_num; i++) {
>          uint64_t offset = be64_to_cpu(packet->offset[i]);
>  
> -        if (offset > (block->used_length - p->page_size)) {
> +        if (offset > (p->block->used_length - p->page_size)) {
>              error_setg(errp, "multifd: offset too long %" PRIu64
>                         " (max " RAM_ADDR_FMT ")",
> -                       offset, block->used_length);
> +                       offset, p->block->used_length);
>              return -1;
>          }
>          p->normal[i] = offset;
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 7cfc265148..a835643b48 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -175,6 +175,8 @@ typedef struct {
>      uint32_t next_packet_size;
>      /* packets sent through this channel */
>      uint64_t num_packets;
> +    /* ramblock */
> +    RAMBlock *block;
>      /* ramblock host address */
>      uint8_t *host;
>      /* non zero pages recv through this channel */


