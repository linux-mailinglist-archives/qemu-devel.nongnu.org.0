Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584CD42BEAB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 13:09:04 +0200 (CEST)
Received: from localhost ([::1]:33336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mac87-0005JB-F6
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 07:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mac74-0004NX-45
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:07:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mac72-0004Lr-GC
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:07:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634123275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLI75Es+Hnf20SOV0HZriu+xcyft3ZUJXsV39+7AhC0=;
 b=R2jeYNN3tiA+E07VtTTLqmcdguwZvjZAg3hOya7q4/rzLJ3qPk+TLZksam1RpKdo0Gs/1+
 TuOlSE6CGy1RD+SeDT3k1OT2AOwkHDoeUPJfn3i6BGzZ0TrD+cjR8qx6++ZrGt/hi/tGTd
 Z6wv2PUQwlFGD7pAuehNCiq1MK8JTnI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-VQSVWVdJMnS8XYjZn8kG3g-1; Wed, 13 Oct 2021 07:07:54 -0400
X-MC-Unique: VQSVWVdJMnS8XYjZn8kG3g-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so1654737wrv.19
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 04:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XLI75Es+Hnf20SOV0HZriu+xcyft3ZUJXsV39+7AhC0=;
 b=3Q+m95Oa4d4S7PBeaRWM15qEhR9Xb+6Qr6/MeFn9oHqi/VvS18Mp/kXjbfrUNTs0tr
 FENxxi421Xs+bayYXBbZTVnRbz0ZPlP02ctfGWo20wCFgZQpyOrYKKvYL+WtOoZdm+4W
 TNu/jRMlAOZvlODJKu3zQKgtIFUA5uF5RXCXilwfO0Nx9I9nXurySGwp5H5afPEY1J5K
 DpnYefaO0VMLXba+ncVgizl57d7yYJprhM+yc1X2tWWbKz6OApxUX38RhXztq0AYyym2
 +oCxJNzXRfwhq+e1JJlNjzNfZJG74UK197yckbpfTia6NWhXSxzMOsxU4y4KDIYHh/s2
 6F5g==
X-Gm-Message-State: AOAM5313Aw0Vv1TtVB5zAHs4EvifdD8C97rjIPS2wwPJBnaHgkEVStpO
 i8w0nSTMMCQmVhV0H/kblfib39KBU8q1Q5k8vONQdSBut5D8TMy3UeOaA0v0hlG77OEG/gc8aNs
 NldeKC4QPQluOPL0=
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr39352148wrd.264.1634123273481; 
 Wed, 13 Oct 2021 04:07:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySIJOKm/t0vuTSl4hJDttS97zpmqz/VudyISHPNSvBmLDJXS2E2MTc7XglEGzgco2Pp3G/YA==
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr39352131wrd.264.1634123273316; 
 Wed, 13 Oct 2021 04:07:53 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id k10sm4982543wmr.32.2021.10.13.04.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 04:07:53 -0700 (PDT)
Message-ID: <6d900b3c-ed8d-650a-7cf7-b3d25fd029ae@redhat.com>
Date: Wed, 13 Oct 2021 13:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 06/13] iotests/297: Separate environment setup from test
 execution
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-7-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-7-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 23:04, John Snow wrote:
> Move environment setup into main(), leaving pure test execution behind
> in run_linters().
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297 | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


