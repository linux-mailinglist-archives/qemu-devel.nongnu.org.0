Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A659642B940
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 09:34:40 +0200 (CEST)
Received: from localhost ([::1]:38008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maYmd-0000Ca-JQ
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 03:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maYlT-0007ps-3z
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1maYlP-0006VA-Kv
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634110403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xs0djs0BiXOqskvqsW1AZyddjTf2oXyQpGW60uYagZ4=;
 b=MC1UnDk16Zxu35J3MamdVMZCMO82JV5BeZl+VgFrnDHxTX+GnxJ8OCgEQcCI6cFOII1LZ7
 QGJI5jj7BEZSGDw7TllJlJTxrxgkT4EXpwSWIWaDeVBy2D9lXh9+5CrMFniLemLY9fUwiz
 gIMbrjOxlRqDTIW5mGu336xJV4Hcn9M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-1zbzu-1MNOma_zmev-Kt4w-1; Wed, 13 Oct 2021 03:33:21 -0400
X-MC-Unique: 1zbzu-1MNOma_zmev-Kt4w-1
Received: by mail-wr1-f72.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so1279600wrh.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 00:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xs0djs0BiXOqskvqsW1AZyddjTf2oXyQpGW60uYagZ4=;
 b=TFjd/icJ3ulznHMaYtrcN4bCV6avo1doGxn41yZp92z0bI7Kkp554oW/aJi1Z78L9d
 pf5rfzatLdH0ymvBIUT56efK8GeqfFOd5ejqGTrpKoz/0WEEDBPeZmfa1zYRBdk/ObUC
 pae1PfS2/Bjp1djCiZLuhmTdz7Pfrmh/kJw8HF8jt3Jk1soaKEtOD/DZjeUXtOPWBin4
 HnGyHJJLDNPtfKjQCF996eRvS1ClhqmRSIspF4hQKMusvJZtPCw/wsRJfATjRJZq9UM3
 bLSmMs6FozaZtCgQyyRkHgl8eZTcZ55KK6R3MKKTCp6qFnaHahJQYzmyo9biLiSz+uOn
 Du4A==
X-Gm-Message-State: AOAM532NyjDp3HM60asTrp48Me/Jx3EbI/exdalPecsyMsZdwpCEydzw
 1jmlSWHYG2/0j2vYmdiI5nBN8SEgWGzuj+OSi0qgp4hooyKyaBrwj0mYwEl57SpuhwPMv+yvuVq
 Neu4yukNOGLgnjt4=
X-Received: by 2002:a1c:c905:: with SMTP id f5mr11163150wmb.148.1634110400413; 
 Wed, 13 Oct 2021 00:33:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZjtc1cexTGSfr843zIwXG/tTUrhb4jeyRd1h9RjVfJIlw6Dy2kHE+bn6ciK8CMFojrps7aw==
X-Received: by 2002:a1c:c905:: with SMTP id f5mr11163133wmb.148.1634110400230; 
 Wed, 13 Oct 2021 00:33:20 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id r9sm9084350wrn.95.2021.10.13.00.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 00:33:20 -0700 (PDT)
Message-ID: <794eb663-9401-bec6-5536-3e6acd884b65@redhat.com>
Date: Wed, 13 Oct 2021 09:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 2/7] python/machine: Handle QMP errors on close more
 meticulously
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211012223445.1051101-1-jsnow@redhat.com>
 <20211012223445.1051101-3-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211012223445.1051101-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 00:34, John Snow wrote:
> To use the AQMP backend, Machine just needs to be a little more diligent
> about what happens when closing a QMP connection. The operation is no
> longer a freebie in the async world; it may return errors encountered in
> the async bottom half on incoming message receipt, etc.
>
> (AQMP's disconnect, ultimately, serves as the quiescence point where all
> async contexts are gathered together, and any final errors reported at
> that point.)
>
> Because async QMP continues to check for messages asynchronously, it's
> almost certainly likely that the loop will have exited due to EOF after
> issuing the last 'quit' command. That error will ultimately be bubbled
> up when attempting to close the QMP connection. The manager class here
> then is free to discard it -- if it was expected.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine/machine.py | 48 +++++++++++++++++++++++++++++-----
>   1 file changed, 42 insertions(+), 6 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


