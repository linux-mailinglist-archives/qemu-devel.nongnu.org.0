Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9379F455F52
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:23:22 +0100 (CET)
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnjFx-0001JX-OZ
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnjEt-0000OF-Mq
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:22:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnjEr-0004Nq-0W
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637248932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20outFq6Gic5MariZpal8nhRyj49tE7+frLJgXkB92A=;
 b=WTFS4xTxrti1DQUx6X0F9GP3czf/l/G7z0QfO8JWuZ8QfUcy3+k2H9Npf7D214X5Iv8d4z
 ZkKYpLLSbCspo9Ft5BK8txs4bPWQTukZ+VwIRNtRtpp6IsfquxqZw7l4u1Z7Y/FGZuyFn2
 s9UMsGhcpNCPFq2hIdPaLpuHupL4vdw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-gbwsjkypNGKUUlwPyCK5BQ-1; Thu, 18 Nov 2021 10:22:11 -0500
X-MC-Unique: gbwsjkypNGKUUlwPyCK5BQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 z5-20020a5d6405000000b00182083d7d2aso1166500wru.13
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 07:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=20outFq6Gic5MariZpal8nhRyj49tE7+frLJgXkB92A=;
 b=41sd+qz1KgwbOuRm4ed1vUtWOVgPNesrNjoErEy9Mp3x+6ey82f5ZUbm3Yox0vtWGh
 qoB/bP9+4YJVtVw4FgvuzWt+4dVF+MIGvS/NzJT0uC2MYFYtfMm+QMW4MoTJA7Fx0o21
 1zDuZHxxRqfhLZ/UHTbaCyXRbBib4MmqnW1MHvXxCBBK8TxCIxrNeRVX3Fk+EyB3b1yJ
 OoPBov+3+jz7Y9zY9V+rBo1LBwDwUaPKND4vdYTKByM/kGvfbNQFBJ/ZqcKOS8+LAxES
 tCqms6vyhHPkusjI1lktsQOS3sqXC0509hN3P55zUqBrZLeGjAsusMi6no5EtHT/tueQ
 pUVA==
X-Gm-Message-State: AOAM530dHil6/Gxdgkzn2bogkNXZfhZzNvzPiaEQOHS5J4DeFGy299Wk
 K4V29cthYOOAOER1nzIugln/ByUmwot1l9KmACbQSsWmkToblpnH+ITVi0rtqgF520zsp4FBUaH
 m5/AVo0/V5pw5Yvw=
X-Received: by 2002:a1c:7405:: with SMTP id p5mr10556965wmc.152.1637248929835; 
 Thu, 18 Nov 2021 07:22:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxP2pR1bQZ7aBqrz3GNarIqp4D42Cadn7JLMdCDYfWt70cxNEkMlmTUxYHNz4ReXsxfRX6SOQ==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr10556925wmc.152.1637248929598; 
 Thu, 18 Nov 2021 07:22:09 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id z6sm115139wrm.93.2021.11.18.07.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 07:22:09 -0800 (PST)
Message-ID: <5ece8cb2-4e53-2aed-a583-7273b261f85c@redhat.com>
Date: Thu, 18 Nov 2021 16:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 00/25] block layer: split block APIs in global state
 and I/O
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <93821bd8-2ac0-a19e-7029-900e6a6d9be1@redhat.com>
 <86f27763-60d0-0549-9d5e-25107d1da4bd@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <86f27763-60d0-0549-9d5e-25107d1da4bd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.21 15:04, Paolo Bonzini wrote:
> On 11/15/21 17:03, Hanna Reitz wrote:
>> and second fuse_do_truncate(), which calls blk_set_perm().
>
> Here it seems that a non-growable export is still growable as long as 
> nobody is watching. :)  Is this the desired behavior?

Yes, absolutely.  “Growable” is documented to mean that writes after the 
end of the exported file will grow it to fit.  Explicit truncating is 
something else, and I believe we should allow it on all writable 
exports.  (Of course only when other potential users of the block node 
in question allow it to be resized, but that’s what the permission is for.)

Hanna


