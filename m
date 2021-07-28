Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017973D956E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:43:27 +0200 (CEST)
Received: from localhost ([::1]:60340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oWd-0000h0-3B
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oSX-0003vH-Gu
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:39:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oSW-00037o-4w
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4hDT0CRrsYl/pGwnzBoVyu9T4I5XfT2BMsVsfeXCQAY=;
 b=VjOixa4yLV0J8A9/JC7nSVOFFke6SnW8mRn61VTUnnqAM/QjKOuF5zW/1HZIQkfIlhN1z2
 EXSlP1ouzXik7Yk9k7qZtSd0cspns03eRiQ6kIjpI3/lksmNzuZ0huJGeH8EPfNfYhIy+J
 EumsiyIokSb26YKdK0pC9U1h+rKEvUE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-JoeNm5pvOea1TDpZO5FPbw-1; Wed, 28 Jul 2021 14:39:10 -0400
X-MC-Unique: JoeNm5pvOea1TDpZO5FPbw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r14-20020a5d4e4e0000b029015409d80a01so1003261wrt.12
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4hDT0CRrsYl/pGwnzBoVyu9T4I5XfT2BMsVsfeXCQAY=;
 b=ZxM9I+LA9i3Lw1BLBV4AAbljwnA6xgNeL5oelGl4kYE9oGdtTs9W3oZywJsEMW9Pi3
 G+81tOlN4gr2jofQUqIsDkTogMNd2JgC7JQe6ua4t2g56AEngBwGucD7SggqGjyMyUtb
 ouHe7GoCMLuBsP8VUmzVZZUOZqxla+8wX9mZKl+APxjQZPc15vfqM5D9cGnw97I7rewL
 XE/ZlXn5e//XA+DWV1wZAqjEG8Kby2VX0ODqqD/w9UGqELEmwRUvHd372cFJVwf4k/xn
 +nNdvwcXV5loCPMjTXFUtwtMRNHvjC2QJyx1Whi6DQqEinSjXm9g5jOTjrRXYq8pNMg1
 jelg==
X-Gm-Message-State: AOAM531EdxYESDts5Qrfv1hBfNBkwTxUW4AK7sjfbEmw2HeKdnOF2g5M
 MkIromVr0/MbeYS9sJFm270K+CmIbGlqOITaThkJn4A0azLjIFZUe4WCNjNxLC230sOyyhS1mkQ
 KnMlXU9fiTmkCeJc=
X-Received: by 2002:a5d:530e:: with SMTP id e14mr754227wrv.392.1627497548934; 
 Wed, 28 Jul 2021 11:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEsqSQ6jgfrVyhTrHRssWnuwL9kmm3EavXoitEch38KRIpA5sWW+ecUrO779Vdfg2d2hqExg==
X-Received: by 2002:a5d:530e:: with SMTP id e14mr754207wrv.392.1627497548687; 
 Wed, 28 Jul 2021 11:39:08 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id r2sm610763wrq.15.2021.07.28.11.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 11:39:08 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] cpus: Remove the mutex parameter from
 do_run_on_cpu()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210728183151.195139-1-peterx@redhat.com>
 <20210728183151.195139-7-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bce51ec7-d218-408d-c9bc-7e5ce5f5ac75@redhat.com>
Date: Wed, 28 Jul 2021 20:39:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728183151.195139-7-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 8:31 PM, Peter Xu wrote:
> We must use the BQL for do_run_on_cpu() without much choice, it means the
> parameter is useless.  Remove it.  Meanwhile use the newly introduced
> qemu_cond_wait_iothread() in do_run_on_cpu().
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  softmmu/cpus.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


