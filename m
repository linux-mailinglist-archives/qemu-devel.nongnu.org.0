Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAADF544AF8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:49:46 +0200 (CEST)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGfZ-0002E3-Dn
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzETo-0002JY-LE
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:29:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzETn-0000ht-41
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654766966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jQ0VmWBsd3RxZJh4Pv6U4VZnF1pDKUJuNMwtbBiONU=;
 b=dwUn2pLD0ZpRZiNTl/qrmQh4Pqm92Cr2Rg6+sOxLxnDTLx+ltkDEpJYAViaZizQttBM8qP
 nP0A1WuwgMOxn/20HolzJkJDcrE1PI+u2ALoR8TWourOhvWJo1mPodaRqWbofeD2wUtB45
 7jzpM06tq08noOQr/KhW42bhpIXtxXs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-86NalRaaOpmFyov-oZHD6Q-1; Thu, 09 Jun 2022 05:29:17 -0400
X-MC-Unique: 86NalRaaOpmFyov-oZHD6Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 az7-20020a05600c600700b0039c3ed7fa89so9952198wmb.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+jQ0VmWBsd3RxZJh4Pv6U4VZnF1pDKUJuNMwtbBiONU=;
 b=U0poTm8BaQUQJPtLCt4Ssz8dNKbwvUGhdc1SNWp8eyAwUfFwbCTe/y+pqdn6mTEQHV
 MwJhDdvV0wbij0gji6uWh1fac4dXCcv5H/4y82gL+nl/q3ljmDkiyon8/AnhrbR2zrwP
 KeEvVVBLiNz7iTfe97VlQlhIZD06hihtbB3kkknhI1J+6heiA0DaAGYer0lxwljby+fV
 u6Se+bgUuWeyOjyUVea3RQUXerlqE85AVfGuvGQEO4Oxl0g1Dz9FmQJj7PodBYt9dzK9
 XhPlFfZ/KCta8v8dbZ77UG3wT1Z4s9E6Hbwalf9smDqJk8FA7xV3epLUidE7n3VduPuD
 8UEQ==
X-Gm-Message-State: AOAM533AglT5+9+46Mf6sOjzbsj8t0M6iyGN7dONri0IvNvP7Rtwmhv6
 MxUbw4CjquSfeB9d0GHmspwZKbijxT6/OcvLZsGcY8rko7rnbxkGUG4U/XKsipdb+Dq64AWoL1z
 scVhXyaB86hSK8oQ=
X-Received: by 2002:a7b:c04b:0:b0:39c:511e:2dd4 with SMTP id
 u11-20020a7bc04b000000b0039c511e2dd4mr2459398wmc.58.1654766955790; 
 Thu, 09 Jun 2022 02:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFc5zKGwZvksNxBfmtHQEn/TXipgSzUf588yFlHER/mqSqhowEpZr7W9RtF4Ys2JpWAAQUXQ==
X-Received: by 2002:a7b:c04b:0:b0:39c:511e:2dd4 with SMTP id
 u11-20020a7bc04b000000b0039c511e2dd4mr2459380wmc.58.1654766955551; 
 Thu, 09 Jun 2022 02:29:15 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bw1-20020a0560001f8100b002184280b3cbsm10174338wrb.91.2022.06.09.02.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:29:15 -0700 (PDT)
Date: Thu, 9 Jun 2022 10:29:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 04/20] migration: rename rate limiting fields in QEMUFile
Message-ID: <YqG9aAV00Kd3HhfA@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-5-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-5-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> This renames the following QEMUFile fields
> 
>  * bytes_xfer -> rate_limit_used
>  * xfer_limit -> rate_limit_max
> 
> The intent is to make it clear that 'bytes_xfer' is specifically related
> to rate limiting of data and applies to data queued, which need not have
> been transferred on the wire yet if a flush hasn't taken place.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


> ---
>  migration/qemu-file.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 1479cddad9..03f0b13a55 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -39,8 +39,16 @@ struct QEMUFile {
>      const QEMUFileHooks *hooks;
>      void *opaque;
>  
> -    int64_t bytes_xfer;
> -    int64_t xfer_limit;
> +    /*
> +     * Maximum amount of data in bytes to transfer during one
> +     * rate limiting time window
> +     */
> +    int64_t rate_limit_max;
> +    /*
> +     * Total amount of data in bytes queued for transfer
> +     * during this rate limiting time window
> +     */
> +    int64_t rate_limit_used;
>  
>      int64_t pos; /* start of buffer when writing, end of buffer
>                      when reading */
> @@ -304,7 +312,7 @@ size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
>          int ret = f->hooks->save_page(f, f->opaque, block_offset,
>                                        offset, size, bytes_sent);
>          if (ret != RAM_SAVE_CONTROL_NOT_SUPP) {
> -            f->bytes_xfer += size;
> +            f->rate_limit_used += size;
>          }
>  
>          if (ret != RAM_SAVE_CONTROL_DELAYED &&
> @@ -457,7 +465,7 @@ void qemu_put_buffer_async(QEMUFile *f, const uint8_t *buf, size_t size,
>          return;
>      }
>  
> -    f->bytes_xfer += size;
> +    f->rate_limit_used += size;
>      add_to_iovec(f, buf, size, may_free);
>  }
>  
> @@ -475,7 +483,7 @@ void qemu_put_buffer(QEMUFile *f, const uint8_t *buf, size_t size)
>              l = size;
>          }
>          memcpy(f->buf + f->buf_index, buf, l);
> -        f->bytes_xfer += l;
> +        f->rate_limit_used += l;
>          add_buf_to_iovec(f, l);
>          if (qemu_file_get_error(f)) {
>              break;
> @@ -492,7 +500,7 @@ void qemu_put_byte(QEMUFile *f, int v)
>      }
>  
>      f->buf[f->buf_index] = v;
> -    f->bytes_xfer++;
> +    f->rate_limit_used++;
>      add_buf_to_iovec(f, 1);
>  }
>  
> @@ -674,7 +682,7 @@ int qemu_file_rate_limit(QEMUFile *f)
>      if (qemu_file_get_error(f)) {
>          return 1;
>      }
> -    if (f->xfer_limit > 0 && f->bytes_xfer > f->xfer_limit) {
> +    if (f->rate_limit_max > 0 && f->rate_limit_used > f->rate_limit_max) {
>          return 1;
>      }
>      return 0;
> @@ -682,22 +690,22 @@ int qemu_file_rate_limit(QEMUFile *f)
>  
>  int64_t qemu_file_get_rate_limit(QEMUFile *f)
>  {
> -    return f->xfer_limit;
> +    return f->rate_limit_max;
>  }
>  
>  void qemu_file_set_rate_limit(QEMUFile *f, int64_t limit)
>  {
> -    f->xfer_limit = limit;
> +    f->rate_limit_max = limit;
>  }
>  
>  void qemu_file_reset_rate_limit(QEMUFile *f)
>  {
> -    f->bytes_xfer = 0;
> +    f->rate_limit_used = 0;
>  }
>  
>  void qemu_file_update_transfer(QEMUFile *f, int64_t len)
>  {
> -    f->bytes_xfer += len;
> +    f->rate_limit_used += len;
>  }
>  
>  void qemu_put_be16(QEMUFile *f, unsigned int v)
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


