Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9723D4BBDA1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 17:38:46 +0100 (CET)
Received: from localhost ([::1]:48956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL6HN-0003Za-Ne
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 11:38:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL6FB-0002e6-8l
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL6F9-0005w6-NA
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645202187;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=MmlqaK94ucmVjOfGVmlu+cLYtIHuSc74u3lVDu13T6Q=;
 b=bCMxiHAIQAONKViER3JKsc4Le2sZvXG6ac+8KJscnDpYn61JA5+vrl3myPL5q2N/3/UIAb
 9XFKJ5D4OoHTwlHGKIl/Uc5zHruxEuh1Q+kRIzC59J0m4gJ6qsezn6YXFaNt2TquCXvbCe
 UG03/2UFXa4ApBzG4Q6+h+VOsCifOCA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47--dtS8lUUPNiOJB4GEFq--g-1; Fri, 18 Feb 2022 11:36:25 -0500
X-MC-Unique: -dtS8lUUPNiOJB4GEFq--g-1
Received: by mail-wm1-f69.google.com with SMTP id
 k30-20020a05600c1c9e00b0037d1bee4847so6140373wms.9
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 08:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=MmlqaK94ucmVjOfGVmlu+cLYtIHuSc74u3lVDu13T6Q=;
 b=LuKvWL9pUspRVSPysH5CD2xwcXlbiLvhc3fAeeBpCNqaubK/dNzpeTadja3LmDwiof
 ZVmifWAU44o8xxwYDPfaFgin+D2aEblH9vjrS9vP2loJIlms5PMyl7CqoGVOaPB/qpK5
 3fdWvPzPJ0Zp4A9qw0hd/KgCtCBxNUwa1p02qBf3lOFkRcUdL3K460v0qSD5ZWgh5nPO
 i9YSWNpQsvb4kIcpPb/SHHUFrKG4fRrGI7QhN+HAJcCsnqn9s0gH5IMtA1RynVdu6QrJ
 d4BDHdN8mggbDJVChZ/f+8fcAj0MtRHb6bUmzncKmP17fW9ISJOHZ0LcB4fVdoDxX0+A
 l2Cg==
X-Gm-Message-State: AOAM531b6p7zpu05JTRRDTXdn/yOpOUHuGROz+4kzUBit3oadBUzNT+9
 059uRZjd4vwlXV9fjQiCdThn5igb+yoEu1ZXJm5kXAa+su8EkAn0fzRTPYI/x/SMoCiQD9QHpsQ
 DYgpEfXizeWRXLP4=
X-Received: by 2002:a1c:7704:0:b0:354:4d2b:9d5 with SMTP id
 t4-20020a1c7704000000b003544d2b09d5mr11281541wmi.155.1645202184708; 
 Fri, 18 Feb 2022 08:36:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6CTuvfICu6V5w2Fjz77mEO4kVl9PTXbsQplijqAnn6cChFrna8LtkMDbsMkCYh91sdnuk4A==
X-Received: by 2002:a1c:7704:0:b0:354:4d2b:9d5 with SMTP id
 t4-20020a1c7704000000b003544d2b09d5mr11281508wmi.155.1645202184438; 
 Fri, 18 Feb 2022 08:36:24 -0800 (PST)
Received: from localhost (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id g5sm4685441wmk.38.2022.02.18.08.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 08:36:24 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v8 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
In-Reply-To: <20220201062901.428838-2-leobras@redhat.com> (Leonardo Bras's
 message of "Tue, 1 Feb 2022 03:28:59 -0300")
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-2-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 18 Feb 2022 17:36:23 +0100
Message-ID: <87v8xccet4.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> wrote:
> Add flags to io_writev and introduce io_flush as optional callback to
> QIOChannelClass, allowing the implementation of zero copy writes by
> subclasses.
>
> How to use them:
> - Write data using qio_channel_writev*(...,QIO_CHANNEL_WRITE_FLAG_ZERO_COPY),
> - Wait write completion with qio_channel_flush().
>
> Notes:
> As some zero copy write implementations work asynchronously, it's
> recommended to keep the write buffer untouched until the return of
> qio_channel_flush(), to avoid the risk of sending an updated buffer
> instead of the buffer state during write.
>
> As io_flush callback is optional, if a subclass does not implement it, then:
> - io_flush will return 0 without changing anything.
>
> Also, some functions like qio_channel_writev_full_all() were adapted to
> receive a flag parameter. That allows shared code between zero copy and
> non-zero copy writev, and also an easier implementation on new flags.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

As everybody pointed out about the missing assertion...


