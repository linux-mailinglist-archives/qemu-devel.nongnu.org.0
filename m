Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4AC337FC9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 22:39:32 +0100 (CET)
Received: from localhost ([::1]:47236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKT1m-00046q-KC
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 16:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKT0R-0003Oq-Qs
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:38:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lKT0O-0001mv-PP
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615498683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kZrF/yQsMXm77PiXx1P+0D1I3GZC7MxcJm8SALcL6AU=;
 b=f+pShEY6xQOugH5lxWbRl5TXf8Elf1HwkNDiz8swLVTEfSDIla196M5VupbFJQcpLs6kcs
 62rTI+amq2qnUh/IATFRRNHR8HHE6crjKw0UANW98YjxxZXEcxnC6Ap6UUzQz52AV5Wd2I
 U3lPIMzFg9fkdBswEi77XVVpnaA4H68=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-NiPskGXzOJagRrQ7KE9LRQ-1; Thu, 11 Mar 2021 16:37:59 -0500
X-MC-Unique: NiPskGXzOJagRrQ7KE9LRQ-1
Received: by mail-qt1-f198.google.com with SMTP id l13so5306442qtu.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 13:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kZrF/yQsMXm77PiXx1P+0D1I3GZC7MxcJm8SALcL6AU=;
 b=ZS+mwxN0ug1w6HQ6/aKWwMFY+z3P74TgWEGatbQvzOYF1bZqyNni0pDTqE7pnf5qb2
 ZRm4Gb7ijPRkRS5mq/QiAS439RcLhRZgT+CzLo4kzquXpE0Xevbdq2dvmrQYYz+ZQ52T
 ksFVmAWnwakHtvXWdoK6lloTHuBKTF+1PrG49DjU+3O4jHnfvBR/p+gE+8d64nM7yfYB
 Wec9r51sOcLQYZ7RLh6l5wKAB4gZqijLwpPb+3AaFDMV3DeuVzojJEb73CYJZui43/HH
 CdhLI2YeSY4zlOoZWBEidhImPDPg1Jny/zl890bIQ5JVbIblCIdalAmyEw0BfXx7kjI8
 D6PQ==
X-Gm-Message-State: AOAM532mNcnrOt0oPt1U976teUbed4dCA7ul4IchH4jVHWHV7QJDGFFv
 zVEYng49QqtCAtMP/VqKm/TTUL5kxX/9ALn8gaPxoWfmA5YQ7F+JcctP3Wtcih2mmE4lsYQByGs
 zmSUp0CjYLKM94PY=
X-Received: by 2002:ae9:df46:: with SMTP id t67mr9712419qkf.269.1615498678929; 
 Thu, 11 Mar 2021 13:37:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzk8F5sAa0ODlfPqw065h+75qA59f5F93azcxZn+clFkMLmwBnLoqMnsG17TZH9oferSHAZw==
X-Received: by 2002:ae9:df46:: with SMTP id t67mr9712396qkf.269.1615498678736; 
 Thu, 11 Mar 2021 13:37:58 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id l129sm2878892qkd.76.2021.03.11.13.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 13:37:58 -0800 (PST)
Date: Thu, 11 Mar 2021 16:37:56 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 02/12] softmmu/physmem: Fix ram_block_discard_range()
 to handle shared anonymous memory
Message-ID: <20210311213756.GL194839@xz-x1>
References: <20210308150600.14440-1-david@redhat.com>
 <20210308150600.14440-3-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210308150600.14440-3-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 04:05:50PM +0100, David Hildenbrand wrote:
> We can create shared anonymous memory via
>     "-object memory-backend-ram,share=on,..."
> which is, for example, required by PVRDMA for mremap() to work.
> 
> Shared anonymous memory is weird, though. Instead of MADV_DONTNEED, we
> have to use MADV_REMOVE. MADV_DONTNEED fails silently and does nothing.
> 
> Fixes: 06329ccecfa0 ("mem: add share parameter to memory-backend-ram")

I'm thinking whether we should keep this fixes - it's valid, however it could
unveil issues if those remapped ranges didn't get unmapped in time.  After all
"not releasing some memory existed" seems not a huge deal for stable.  No
strong opinion, just raise it up as a pure question.

> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


