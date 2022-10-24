Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515EC60B1BA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:34:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyhJ-0000rt-5E; Mon, 24 Oct 2022 10:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1omyhE-0000qJ-OA
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1omyhD-0000t1-6E
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666622692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cz3Jfd5kNIAi7a93tdDJMtwW1LkwNbzXlCNUquMJle0=;
 b=Wdh+N2pOlDACYtnKGQ3p+zBq7k2PGw2bhcxU+Ns+DLhU4M7LeDstpsSAbLoA/SxYHpo0ea
 dPrmE5j61BrD8+O0RoC0Cor0MoRRSmD1vLvuqI4w0JFb4lL4q6auJIs2NAs6lN1I5WyPgT
 QLdWsM/ADQVJr/v+g5mG106fXTzaJFM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-385-FVR0IlBvO2W484A57OCfyQ-1; Mon, 24 Oct 2022 10:44:50 -0400
X-MC-Unique: FVR0IlBvO2W484A57OCfyQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 x5-20020ad44585000000b004bb6c687f47so1213655qvu.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cz3Jfd5kNIAi7a93tdDJMtwW1LkwNbzXlCNUquMJle0=;
 b=gfz2J6xNtSYYQ0ZWBkXsxMynW8+QWy/i+XCYcWPmi0sZ6TTAuHbJFHqMhCWviLoP3U
 RaPslnspEy9mvwQW7qcdPid2Eu+JiEWybkEFdQhOTw0pQ3w9FrBERhNPlkr0l64p3pRR
 J38VxCj2eMg0UWhg425TKFEa1Za5TLDhiV5BD6mYAk40hzA275zhS9t+Ht/Ffw+w3fCC
 fnhJvs3ojH4iqaFn2a6Dyo3bgSAViXxW5GhZSdlNgImkfH3algWleJt86QCNB76tNpSH
 OprqtQyr7i/CEHgQCRf/zH9O54aSNxy4b9JTzGahOHtUNJhp3ueiUdguxX75/gyTuoEk
 f3yQ==
X-Gm-Message-State: ACrzQf34BNpzMNsEkaOvsDe1+XXNet11GH9pYZGgGzPC/k1yOLXDblcr
 M4NlP1lZkVx7vMRe1Z7F/mdizxdv9nDIr9WSVQ6Y+4RylaPY+B4ZevGJISExCr2agF28Iww7AT9
 e+v9WKcwZeowOobo=
X-Received: by 2002:a05:620a:2409:b0:6ec:5325:340c with SMTP id
 d9-20020a05620a240900b006ec5325340cmr23259495qkn.300.1666622689926; 
 Mon, 24 Oct 2022 07:44:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6uVzYy58sNwWcnGPFlhpfZKoLo4UwScdTA7lxuh+cTxlK6zJh9NLnffWAx96PYjBWULqEWoA==
X-Received: by 2002:a05:620a:2409:b0:6ec:5325:340c with SMTP id
 d9-20020a05620a240900b006ec5325340cmr23259480qkn.300.1666622689712; 
 Mon, 24 Oct 2022 07:44:49 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05622a015100b0035cf0f50d7csm47980qtw.52.2022.10.24.07.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:44:48 -0700 (PDT)
Message-ID: <d6971f95-4789-1b24-306a-ed20892116f8@redhat.com>
Date: Mon, 24 Oct 2022 16:44:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 02/11] block: use transactions as a replacement of
 ->{can_}set_aio_context()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220725122120.309236-1-eesposit@redhat.com>
 <20220725122120.309236-3-eesposit@redhat.com> <Y0BKfBCKOr8Rk99f@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Y0BKfBCKOr8Rk99f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


> So this looks good under two conditions that I haven't checked yet: That
> bdrv_detach_aio_context() is actually safe when called with the "wrong"
> AioContext lock held, and that the .change_aio_context() callbacks are
> implemented correctly in a later patch.

So regarding bdrv_detach_aio_context(), I added a
aio_context_lock_acquire/release pair around that function in commit().
The callbacks should be implemented correctly, as you didn't point out
anything later on :)

> 
> To reiterate my initial point, reviewing this took me some effort to
> match the new functions with the existing ones they duplicate and then
> manual diffing of each, which is kind of error prone. I feel the better
> approach would have been adding a tran parameter (with empty commit and
> abort) to the existing functions in a first patch and then change stuff
> in a second patch (in the real code, not dead code to be enabled later),
> so that you would actually see the real changes instead of having to
> find them between lots of unchanged copied code.
> 

Yes, I see what you mean. I'll change my approach on the next series,
thanks for the suggestion!

Thank you,
Emanuele


