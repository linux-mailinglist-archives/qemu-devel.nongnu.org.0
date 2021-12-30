Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC60481DDD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 16:54:50 +0100 (CET)
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2xlR-0006vw-P3
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 10:54:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xk6-0005tC-87
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:53:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xk3-0002Vb-MY
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640879602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+xQzUDGzb0MolPND4VvhcVJx75/srsMeDe7eFZTqdI=;
 b=B6n0CWdvRK7Qxq4RFlaHu/BNEN4Uogxf0YJZem6kVd0KVhtPeeISIxNEuG6Tr0UjZv67fx
 unq62I8JXZrSG7owcR+0RImgsjOUZhj/k5OkrlYwqqvTi2mSJUjVMcZt63Hp5E/JD4xXBZ
 ID8oz7eliFTvm4sZFprmKV0a/rHkJAc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-bAmXX8wiNNeYbEkvm2eiBg-1; Thu, 30 Dec 2021 10:53:21 -0500
X-MC-Unique: bAmXX8wiNNeYbEkvm2eiBg-1
Received: by mail-wr1-f72.google.com with SMTP id
 s30-20020adfa29e000000b001a25caee635so6345658wra.19
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 07:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o+xQzUDGzb0MolPND4VvhcVJx75/srsMeDe7eFZTqdI=;
 b=oiKgwpwKmr0NLdiYeMRByEB//kBegQ6EsrGnwBRrI13/xvhBFHcxgi9HyXS1npdFtw
 Q587Brhpr4Lnz7JiQD3NjhJQQx2DZOheLeWVyxs/jSVN9Q50oSSWypx/sZJq3VIJAmqn
 3QgbAIc6xNgXzIs91mf/pMr7/c9SmOJx+3+kC+CZ78ziJ3b7LB3tpOASpVcaXaK17lVF
 MULrSMuIam82IENKDbd1Wd8LjhHIvxn2HXLydS7FrVdkc0QqyeYvNLnu9OpNcsljjTYq
 ivq0sidYVELvOzaUOIHlpAJ8j60NfPRr8L7uqb+ZA9QmGf3gJHPbze5gWKu6FTzihwX+
 AJLQ==
X-Gm-Message-State: AOAM530FwWni8UvDX0qju8SogLQPycoEU2Dg5pF4njsuLiQtB+6TUMZC
 yPKxj4ERX+q1IxalhGkkNXko+gk9x34rsu7lbsKk7ebvyMb7OGZJ3BunNZwkpojEXHv2QuV6/S2
 M4TVk1mNgg75Rs4I=
X-Received: by 2002:a05:600c:4f8d:: with SMTP id
 n13mr26172892wmq.43.1640879600581; 
 Thu, 30 Dec 2021 07:53:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOraSTEZvH1/KhH74sTewN+vXLXruBUQMsu+Td0x0icmanS6TCEUo3iRTI29pExgDnnUoNcQ==
X-Received: by 2002:a05:600c:4f8d:: with SMTP id
 n13mr26172882wmq.43.1640879600422; 
 Thu, 30 Dec 2021 07:53:20 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id d22sm24331944wmq.17.2021.12.30.07.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 07:53:19 -0800 (PST)
Message-ID: <fe54ebdc-ba45-7e69-0869-b8de62f71a2b@redhat.com>
Date: Thu, 30 Dec 2021 16:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 2/8] migration: Don't return for
 postcopy_chunk_hostpages()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211224065000.97572-1-peterx@redhat.com>
 <20211224065000.97572-3-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211224065000.97572-3-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/21 07:49, Peter Xu wrote:
> It always return zero, because it just can't go wrong so far.  Simplify the
> code with no functional change.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/ram.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


