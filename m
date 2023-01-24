Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D0F67A3E8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 21:29:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKPtx-00076Q-CB; Tue, 24 Jan 2023 15:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKPtt-00075t-Ii
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:28:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKPtr-00077U-S8
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674592090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P6O9ziD6M+nRfagCD7gJ/A4YS6F445TzLKY9iWMkVvI=;
 b=ZBTB8puUYfTDBr/Y8hX0NK6HrRxuZrNIyMqtLFQD0Zl0++AcU6akhlc9BfQuQXg3KMJPn3
 jMifptX5eIzfdtXiiLzkMtPDl7hG1OyAtB7VnKR8od05QUj72A89TxnRBoi8hMXuJ0r9gw
 ElHQ3C8kcpem19DHkxmwUV7XKUQCrZU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-150-P3YXQ5M8OgG5AcrU4YDqlA-1; Tue, 24 Jan 2023 15:28:07 -0500
X-MC-Unique: P3YXQ5M8OgG5AcrU4YDqlA-1
Received: by mail-qk1-f198.google.com with SMTP id
 az16-20020a05620a171000b00709129a745eso9352526qkb.8
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 12:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6O9ziD6M+nRfagCD7gJ/A4YS6F445TzLKY9iWMkVvI=;
 b=fmE972zKHRyr3f6R138SE66ukVa14pir9imQv9kYkOjUFzRQVfGOxZ8kfhOcuhQVwy
 Y0QiDpmUv6+9q1CNkruB95iPd7QvpwZXesr20hJJ0uw0FU2Fm67Vhe7Prum8JFrWJbxN
 KnXfa/MMSSqzclXBbNZFfMbSxgHLUCsCb9leQu9wYRHs1DXU/PzyDdOdvrAIxE2nvU7g
 LJphbGx7nhw0roee8TRNZVHFNrYPfxR5g+iIhgx/wYSqw4PHmGldGMXTu6HskpMo5iyQ
 xE8JpL/9eGA059vqD9LUs8jLD5RsVUZu4t2ZV1mKVKjswp+UzRiPBanMkrBNZPLdgbFu
 8oGA==
X-Gm-Message-State: AFqh2kpW5kvQ6tprT/TJv5DS17R5BpCyW11Q+CGM4R9TyROnL74RGmy2
 LrM6XR2cEo85yN5Vassc6JihwAvjeTbZfczxCnTBa9W5bR3KKNQCceZnqv1nvn9GSfPj65I1kuR
 fE9D03hsdjoH7g1Q=
X-Received: by 2002:ac8:4888:0:b0:3b6:393a:e4a5 with SMTP id
 i8-20020ac84888000000b003b6393ae4a5mr39511419qtq.5.1674592086931; 
 Tue, 24 Jan 2023 12:28:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs8NfOsxFwXS8gM5lSva4RvbpIuh8ziaeZEnH3Otxyn702458xNvvgvpbXMROVTHaN+BnEd3A==
X-Received: by 2002:ac8:4888:0:b0:3b6:393a:e4a5 with SMTP id
 i8-20020ac84888000000b003b6393ae4a5mr39511401qtq.5.1674592086699; 
 Tue, 24 Jan 2023 12:28:06 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 cx15-20020a05620a51cf00b006e16dcf99c8sm2014187qkb.71.2023.01.24.12.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:28:06 -0800 (PST)
Date: Tue, 24 Jan 2023 15:28:05 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 08/21] ramblock: Cache the length to do file mmap()
 on ramblocks
Message-ID: <Y9A/VaGu9sl0Qklp@x1n>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-9-peterx@redhat.com>
 <Y87XR8U1FaQVVJO+@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y87XR8U1FaQVVJO+@work-vm>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 23, 2023 at 06:51:51PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > We do proper page size alignment for file backed mmap()s for ramblocks.
> > Even if it's as simple as that, cache the value because it'll be used in
> > multiple places.
> > 
> > Since at it, drop size for file_ram_alloc() and just use max_length because
> > that's always true for file-backed ramblocks.
> 
> Having a length previously called 'memory' was a bit odd!

:-D

> 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks,

-- 
Peter Xu


