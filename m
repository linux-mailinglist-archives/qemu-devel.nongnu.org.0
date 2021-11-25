Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB945D56F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:28:29 +0100 (CET)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9BE-0002hm-DI
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:28:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mq975-0008Us-F5
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:24:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mq973-00070y-1d
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637825047;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=neM2EVsggLDQxwbswzVUVzh6kv3qJKCLce+jBgJrbYI=;
 b=QA4E3WI0R0rnS9lCzzxLz7FDccVNMOOWK8Oq9SEZdmCu90K6rotXNC9CXslsr9+3JMLIkB
 pBcPwgpuk9gVHEM1m0f5heOg9pFQ4Prplerr48mzD+y55Vd5+iOG7zKYBOKfrkNufBm+AH
 /fijklUqn0On2nrwgkctPcladHGnzFc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-Wnxki7k6Nh-Ev9_MghMARQ-1; Thu, 25 Nov 2021 02:24:06 -0500
X-MC-Unique: Wnxki7k6Nh-Ev9_MghMARQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso2354919wms.1
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 23:24:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=neM2EVsggLDQxwbswzVUVzh6kv3qJKCLce+jBgJrbYI=;
 b=DWqUtmzYgZMNO2GHkIFSWjEJDDOgT8hiZscV8wRwY/D/nqHsBreSClEAJM9FJlec6q
 ZgTOOxK1p9mTb5efop++TmfRgskHMRfoxEf8inxtOFARpelNGnQ3GUCbv0bDFvE2tPh3
 SlEWA035hYdESvf0yQSJ65EqG1oDbgRQRMJdCrPfwjdCfYgiwCiX5yD/YzqZCdFWtWOV
 EG1986mdDvxhY/Jt0oPgw8oBzgIkvRYLLyQGZEn9e5LGoPwegrJoWIDlEVOpLuVj2+gf
 n0WtF9K6CV5ragN1NEogzGsxva2BsjCGFMsA7FUVNHzce60BlGXDuON3Aem8L2EDxp54
 cZ7g==
X-Gm-Message-State: AOAM530q3pustY7lMCym55K6nVhgW0jb6XanUWY+SYC85eE/Un2h6T8i
 djo5idFGGkn57FgD8Zh1sRjmBEydRO+OTfcDXq7HnGzyjLYTJWTFYDGAfruUzUr/XBYeY20SNMO
 ZJbKTAEZqavhLvWA=
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr4281971wrs.136.1637825045254; 
 Wed, 24 Nov 2021 23:24:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyy536Vj41geEdmXSB89MMCDnqGaRqmWZOv1AREotV5wBUbJsCdv9YuLnTNTrT4eL1JocGvw==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr4281955wrs.136.1637825045097; 
 Wed, 24 Nov 2021 23:24:05 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id d6sm1962242wrx.60.2021.11.24.23.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 23:24:04 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 01/23] multifd: Delete useless operation
In-Reply-To: <YZ6JCNdj0G4r3igs@work-vm> (David Alan Gilbert's message of "Wed, 
 24 Nov 2021 18:48:40 +0000")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-2-quintela@redhat.com>
 <YZ6JCNdj0G4r3igs@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 25 Nov 2021 08:24:03 +0100
Message-ID: <87ilwgg0ks.fsf@secure.mitica>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
>> We are divining by page_size to multiply again in the only use.
>              ^--- typo
>> Once there, impreve the comments.
>                   ^--- typo
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> OK, with the typo's fixed:

Thanks.

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> but, could you also explain the  x 2 (that's no worse than the current
> code); is this defined somewhere in zlib?  I thought there was a routine
> that told you the worst case?

Nowhere.

There are pathological cases where it can be worse.  Not clear at all
how much (ok, for zlib it appears that it is on the order of dozen of
bytes, because it marks it as uncompressed on the worst possible case),
For zstd, there is not a clear/fast answer when you google.

As this buffer is held for the whole migration, it is one for thread,
this looked safe to me.  Notice that we are compressing 128 pages at a
time, so for it not to compress anything looks very pathological.

But as one says, better safe than sorry.

If anyone that knows more about zlib/zstd give me different values, I
will change that in an additional patch.

Later, Juan.


