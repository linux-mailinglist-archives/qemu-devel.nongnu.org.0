Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E547ECD5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 08:50:09 +0100 (CET)
Received: from localhost ([::1]:38872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0fL6-0008H5-MU
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 02:50:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0f0e-0003iR-NY
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 02:29:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0f0b-0004sf-2h
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 02:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640330936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bo/a2ToHV29+WytTQpiydRN9EhpCrh9xOIB+mHFUGYQ=;
 b=HU6zy6uKGsIA8xfSoNRB6Lo/oW4hPrLgx/c5YUGj2luGk59ASrXFIqeEMFVSVVZdjh8Ttm
 3v1/F5owIuL8HvOrzQ94aWI6jv+3B7IdD+TC/uvXM+8m/Rts6qOfdFYWEO0kztwdSzUDhK
 IA1M+OJ2ExPmAMsn5u2tv62vwT3TeT4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-rH84uzgKPESHfj2lotXfbg-1; Fri, 24 Dec 2021 02:28:54 -0500
X-MC-Unique: rH84uzgKPESHfj2lotXfbg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v23-20020a05600c215700b0034566adb612so2932254wml.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 23:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Bo/a2ToHV29+WytTQpiydRN9EhpCrh9xOIB+mHFUGYQ=;
 b=7/RMQzHrIUoICSJfCdzTX1A3vsMtc+zn6J0CCz3248TQk+xUp4IAKOUJkHvsYo2hRO
 3CKe209qI73vmu5cgnjnTZnzqyuSMB6M7czibJ1iuplbTgKl4W8N8vviFqCeTWCR2RNx
 6+neE4vBUtcNEQQa5ahUteVAWfth8OxKK+KbR7grElRSiwPMkXa1VyYvveer7XXIH8ez
 VMYO5l/D5g3TcYjQuftd9wDezPH3xp7AGVosbzid0yrSefrpM3wk3Lge8ACM4umeoC9g
 sTD9WLYiIRXwn5XpFqH4k8wi7hQmUrZDu34HHOyaex2ZoxNho2pCFlwgwSGEj9BFRPi/
 es2A==
X-Gm-Message-State: AOAM530fi9cfMjg760okg594bH044YlPYNRJDGxmx9cv1EgFSFNCcnFD
 0r27LdXYL/B0T3hJe3CZHAFPcyc1We4KIoFZqsk5V56/DGzVLaNWCuIogvwMCJhBjo6/XyCzwWP
 d3iwVUMFG0RfGpRg=
X-Received: by 2002:a7b:c448:: with SMTP id l8mr3982257wmi.173.1640330933721; 
 Thu, 23 Dec 2021 23:28:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtEif+3lP2huW48GIXC0FfJ8MmuTy9Zn4+Pu6rMmvxN+2HmjnkvtuBvrLrzgkQ83Z+Nmbeww==
X-Received: by 2002:a7b:c448:: with SMTP id l8mr3982243wmi.173.1640330933489; 
 Thu, 23 Dec 2021 23:28:53 -0800 (PST)
Received: from xz-m1.local ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id g5sm8088236wrd.100.2021.12.23.23.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 23:28:53 -0800 (PST)
Date: Fri, 24 Dec 2021 15:28:48 +0800
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 5/6] migration: simplify do_compress_ram_page
Message-ID: <YcV2sGhLvH6M+VYy@xz-m1.local>
References: <20211221125235.67414-1-quintela@redhat.com>
 <20211221125235.67414-6-quintela@redhat.com>
 <e14ccd62-e9b1-3d2b-5eaf-421dc03be94e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e14ccd62-e9b1-3d2b-5eaf-421dc03be94e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 02:29:13PM +0100, Philippe Mathieu-Daudé wrote:
> On 12/21/21 13:52, Juan Quintela wrote:
> > The goto is not needed at all.
> > 
> > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > ---
> >  migration/ram.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 4ee0369d6f..eddc85ffb0 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -1341,12 +1341,11 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
> >  {
> >      RAMState *rs = ram_state;
> >      uint8_t *p = block->host + (offset & TARGET_PAGE_MASK);
> > -    bool zero_page = false;
> >      int ret;
> >  
> >      if (save_zero_page_to_file(rs, f, block, offset)) {
> > -        zero_page = true;
> > -        goto exit;
> > +        ram_release_page(block->idstr, offset & TARGET_PAGE_MASK);
> 
> We don't want TARGET_PAGE_MASK anymore here, right?

I suggest we simply do:

  offset &= TARGET_PAGE_MASK;

At the entry, then yes here. Meanwhile squash previous patch into this one;
that one smells half-done anyway..

Thanks,

> 
> > +        return true;
> >      }
> >  
> >      save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
> > @@ -1361,12 +1360,8 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
> >      if (ret < 0) {
> >          qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> >          error_report("compressed data failed!");
> > -        return false;
> >      }
> > -
> > -exit:
> > -    ram_release_page(block->idstr, offset);
> > -    return zero_page;
> > +    return false;
> >  }
> >  
> >  static void
> 

-- 
Peter Xu


