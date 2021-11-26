Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1BF45EA8F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 10:41:18 +0100 (CET)
Received: from localhost ([::1]:44972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqXjH-0002Q4-1z
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 04:41:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mqXi7-0001eT-Ao
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 04:40:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mqXi4-0006UB-7D
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 04:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637919599;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LXWJd+MffDKGB+GT/5OKQChfomsvsNFXXKh/N/l9bKg=;
 b=PRdxEj9BsOsRLXjGghd0jLPivWt0vSiba+q9WGPdt0nEUNtbcrlxm4hJY+xi0MZveU89EJ
 tn8sw4FUx7ApTWmRJNLA9Tpy8Jg9MWzxsIK3QxzxWJkioAs5Rh4tu69Il+AAhWBig03gcS
 zcFNUQz+lbR1sZuCWHbuKAekdeq73/I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-p8l9dNBDNTeTQpQ9sqLQbA-1; Fri, 26 Nov 2021 04:39:57 -0500
X-MC-Unique: p8l9dNBDNTeTQpQ9sqLQbA-1
Received: by mail-wm1-f69.google.com with SMTP id
 y141-20020a1c7d93000000b0033c2ae3583fso4730911wmc.5
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 01:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=LXWJd+MffDKGB+GT/5OKQChfomsvsNFXXKh/N/l9bKg=;
 b=U2GcMgbRItduFdqjGGtKzkOGspwhi9E7wNHehgBZrqVjTRV/WNOQXLpxHD4VcKbnK0
 /3JPvKTUcCfhz9OOdJ6taVUepnMZHtOluvpQ1Y6gh4KVSDZ3l/nNZYuf42xubdVKZ/O8
 Q8zTa5lKoGVaY+RuUQzaj1dIjwH8Pzij7rLTlYWEPPqqv/injzi3X6S6LHkybpg2B1ho
 YUOEAgLSfUqy0zvWPXwwz2hSbqwwC0+dYEp3bzVkfA94D0ATUI8Xfy5TfVzH8PrOZQhs
 z4fZWsu8VIIjmiUJ2AA2j6umBnmYffKRKyf8v7C363LcqMvdv7y3fvLyNsb5Jj8FwsxH
 am4w==
X-Gm-Message-State: AOAM533T42v8RlbWvAYV2aEDlkwusjdcbiIRISU1fqxXX1nCCp6SeU0M
 gNG3Jqp/kNAkRpanqkJKrSRu17Hi1rL+c8E2qDmQqsWjYyLSjJx1Z58C9P2IlHrGHe2hv5Fu4kN
 XmU+i6Da4ZxxJp+U=
X-Received: by 2002:a1c:7f43:: with SMTP id a64mr14106978wmd.133.1637919596584; 
 Fri, 26 Nov 2021 01:39:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFh6csf0xl3Sw9VWBaKp0KHuUS+/UTGQJi1GeBQX6ydXNe2s2e3w96gySDuLlZF5hDOm4DUA==
X-Received: by 2002:a1c:7f43:: with SMTP id a64mr14106948wmd.133.1637919596342; 
 Fri, 26 Nov 2021 01:39:56 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id e18sm5187141wrs.48.2021.11.26.01.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 01:39:55 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 01/23] multifd: Delete useless operation
In-Reply-To: <YZ/oBfd2TT3pGc1u@work-vm> (David Alan Gilbert's message of "Thu, 
 25 Nov 2021 19:46:13 +0000")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-2-quintela@redhat.com>
 <YZ6JCNdj0G4r3igs@work-vm> <87ilwgg0ks.fsf@secure.mitica>
 <YZ/oBfd2TT3pGc1u@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 26 Nov 2021 10:39:55 +0100
Message-ID: <87ilwf6ys4.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>> > * Juan Quintela (quintela@redhat.com) wrote:
>> >> We are divining by page_size to multiply again in the only use.
>> >              ^--- typo
>> >> Once there, impreve the comments.
>> >                   ^--- typo
>> >> 
>> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> >
>> > OK, with the typo's fixed:
>> 
>> Thanks.
>> 
>> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> >
>> > but, could you also explain the  x 2 (that's no worse than the current
>> > code); is this defined somewhere in zlib?  I thought there was a routine
>> > that told you the worst case?
>> 
>> Nowhere.
>> 
>> There are pathological cases where it can be worse.  Not clear at all
>> how much (ok, for zlib it appears that it is on the order of dozen of
>> bytes, because it marks it as uncompressed on the worst possible case),
>> For zstd, there is not a clear/fast answer when you google.
>
> For zlib:
>
> ZEXTERN uLong ZEXPORT compressBound OF((uLong sourceLen));
> /*
>      compressBound() returns an upper bound on the compressed size after
>    compress() or compress2() on sourceLen bytes.  It would be used before a
>    compress() or compress2() call to allocate the destination buffer.
> */

Aha, exaactly what I needed.

thanks.

zstd one is called:

ZSTD_compressBound()

Added to the series.

Thanks, Juan.


