Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7723C363E79
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:28:58 +0200 (CEST)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQDB-0004eZ-1h
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYQBP-0003jW-I3
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYQBM-0002PF-Bf
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618824421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wN7YUQUTvQjaxepjX4XgZ3QY22n5WY6FRo9R3KRL5Oc=;
 b=N8F240IMmuPrrWL+uMotXwWeta8JQGr5Dpw5VQdGDhaQgF0MoRt3gm5kZsqkS41wbcyPHL
 DbEiPBALBm3pC1dKXmWBo79/Y5z/IdHVW0QwlFylf8pwdDH/T67HOQViOPIq5STCfMfKOe
 /gWFyIaFeOYB9z/Vg5YjO6vDk35L1zE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88--BSwRkYmMg-qIfXQWAclwA-1; Mon, 19 Apr 2021 05:26:59 -0400
X-MC-Unique: -BSwRkYmMg-qIfXQWAclwA-1
Received: by mail-wr1-f71.google.com with SMTP id
 65-20020adf94c70000b0290106f90d4e1bso4459277wrr.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 02:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wN7YUQUTvQjaxepjX4XgZ3QY22n5WY6FRo9R3KRL5Oc=;
 b=bPJFryYWi5TzPahE4RE1b7dqEDrSFpA/3UAr4XzXZbDitIUgoBvUgOhLiHOgzxyiQe
 CEdkjCv9UpHkW+EFziYuPRM5ovJT5pOIrbr3bDCiFobatUWd6LvcMvWwO5y5gOBD3SHo
 /2wsaXKDPTv38qB/Jnk/XZvCbKRR2/p6kXsjIzzxbQrE8UNDogEVTYzGmW6VWK6Quc0N
 SN7R04KFsITEvZIMQva46GkZtunXaPFh2HI897zYwil9bveCBKoqlBRlicshyah+3rfu
 728TmEDzLfAYjx2eC4e2ELQRgU+wUCGrmKHBABpvWRDLDIUtYLIBMWHyz3V7vcQnoUs3
 TI+A==
X-Gm-Message-State: AOAM533K7//rcXPRe4mXIlVW3IN+i8OHPb4V9Bix8b4i37hXluiNGWL+
 bGik0egbL60916oqF8L0j0MyGR7B/DnlHYxrI0p5BypkXjruCZSFwJBHNpzIYiYjbaDgnbR77QO
 O0h24elPAxtn1eys=
X-Received: by 2002:adf:f787:: with SMTP id q7mr13367421wrp.351.1618824418745; 
 Mon, 19 Apr 2021 02:26:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp840VO6cj8XifHni/g5jbdz07bnjYwKG6IXTA4x4CqaJlY1eGYjGr1FzbpFCnHMQ4L2dF2A==
X-Received: by 2002:adf:f787:: with SMTP id q7mr13367408wrp.351.1618824418594; 
 Mon, 19 Apr 2021 02:26:58 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d133sm18834467wmf.9.2021.04.19.02.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 02:26:58 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 0/2] hw/block/pflash_cfi02: Do not create aliases
 when not necessary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210325120921.858993-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0e4a419a-fcab-5d29-9f34-38acb0ded8cd@redhat.com>
Date: Mon, 19 Apr 2021 11:26:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325120921.858993-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 1:09 PM, Philippe Mathieu-Daudé wrote:
> Simplify memory layout when no pflash_cfi02 mapping requested.

> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/block/pflash_cfi02: Set romd mode in pflash_cfi02_realize()
>   hw/block/pflash_cfi02: Do not create aliases when not necessary

Thanks, series applied to pflash-next tree.


