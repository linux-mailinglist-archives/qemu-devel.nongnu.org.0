Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B33F649ACF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:13:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4epa-00025p-Tc; Mon, 12 Dec 2022 04:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4eot-00021c-3N
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4eob-0000GK-A5
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670836175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1rCfddrQj3YOxnuhaHqdc6pBpsaCJF8SPqoQDCFTD4=;
 b=hNmHKElgavaBwHZQ37bjz6npSVJylZZ6DJVs6u6A3md77LemA8guIwWVAfIzjnyplwTrEY
 5Em8P6oLnjHLt7bKo6GiCr8LhxyCOV71IzwfQBtdkn0oGzI/Wm3G/R/4K2ShlqG9FCyqv8
 eRnoPes5A/7v7N0r9dw2XdYYetcpBoo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-S6N_Dc3HONu0jiGTWtzWiA-1; Mon, 12 Dec 2022 04:09:26 -0500
X-MC-Unique: S6N_Dc3HONu0jiGTWtzWiA-1
Received: by mail-wm1-f71.google.com with SMTP id
 i9-20020a1c3b09000000b003d21fa95c38so1075873wma.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 01:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U1rCfddrQj3YOxnuhaHqdc6pBpsaCJF8SPqoQDCFTD4=;
 b=dRe+m9trSSWYO1iztd6Snrf8JvxJSGl4KiQVjRJLQivWpNaLCGZMo+vQOKuUokQoVO
 e0CAuu/q+NJ8qsYIi9neWAPRrgwYqKy3KVPF5YkOuNEABgtA55OqzwzbMz7Zh7vDpssH
 rNWuFi4rVHEJ6d6afa35IhdqyvYUX26nx163APCRbYiZTf5Z6VZnUFG4XUrd5C0IV/NG
 KlRk+FF5jHR49DteJaiLwU/oajdKNAFlsQkrgiYtsGEvPeltErML7mNg+on3ohYMobV+
 uVvkTk8aVqXnuDG64qw9N81gmAI9OX1wyH8GcsJOWlOEcSuCX2N/l3JA5R96ygQAsuAs
 JDqA==
X-Gm-Message-State: ANoB5pn4mrz3fLwnwpKbHv+jxYD0Ydd5TAj3uFPKA3rQPMM4eBDIzCgC
 v1P2lildyoSvbXxqS0MeANoe0OKbAdb8evrhKuNOwQbHQeezvY+3JQH3g6T6QB7MJkbjuuRpjD1
 MFP2bICldNBll8g0=
X-Received: by 2002:adf:e801:0:b0:242:4f41:4da8 with SMTP id
 o1-20020adfe801000000b002424f414da8mr9327647wrm.9.1670836164208; 
 Mon, 12 Dec 2022 01:09:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7fmEH3AJcnV5zQufl4jr2xSyo47HIkdLIQjP9HXY2PkZJXbNMG+60uKXD0ju1jpW7cTHVJ0w==
X-Received: by 2002:adf:e801:0:b0:242:4f41:4da8 with SMTP id
 o1-20020adfe801000000b002424f414da8mr9327626wrm.9.1670836163769; 
 Mon, 12 Dec 2022 01:09:23 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 o11-20020a5d4a8b000000b002425be3c9e2sm8253500wrq.60.2022.12.12.01.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 01:09:23 -0800 (PST)
Message-ID: <3f099e9f-cdf6-6a2a-12d2-59349d4ca751@redhat.com>
Date: Mon, 12 Dec 2022 10:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru, qemu-devel@nongnu.org
References: <20221118174110.55183-1-kwolf@redhat.com>
 <20221118174110.55183-15-kwolf@redhat.com>
 <30eec378-779a-26ca-42f3-a7980a647ad7@redhat.com>
Subject: Re: [PATCH v2 14/15] block: Don't poll in bdrv_replace_child_noperm()
In-Reply-To: <30eec378-779a-26ca-42f3-a7980a647ad7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/9/22 17:53, Paolo Bonzini wrote:
> On 11/18/22 18:41, Kevin Wolf wrote:
>> In order to make sure that bdrv_replace_child_noperm() doesn't have to
>> poll any more, get rid of the bdrv_parent_drained_begin_single() call.
>>
>> This is possible now because we can require that the parent is already
>> drained through the child in question when the function is called and we
>> don't call the parent drain callbacks more than once.
>>
>> The additional drain calls needed in callers cause the test case to run
>> its code in the drain handler too early (bdrv_attach_child() drains
>> now), so modify it to only enable the code after the test setup has
>> completed.
>>
>> Signed-off-by: Kevin Wolf<kwolf@redhat.com>
> 
> I hate to bear bad news, but this breaks the Windows builds on github 
> (msys-32bit, msys-64bit) with an obscure but 100% reproducible
> 
> 51/88 qemu:unit / test-bdrv-drain ERROR           1.30s   (exit status 
> 3221225477 or signal 3221225349 SIGinvalid)
> 
> The exit status is 0xC0000005 aka a Windows SIGSEGV.  With some luck it 
> could be reproducible with Wine (but no gdb).

I am testing dropping this patch and squashing

diff --git a/block.c b/block.c
index 1a2a8d9de907..bb9c85222168 100644
--- a/block.c
+++ b/block.c
@@ -2870,7 +2870,9 @@ static void bdrv_replace_child_noperm(BdrvChild 
*child,
       */
      new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
      if (new_bs_quiesce_counter && !child->quiesced_parent) {
-        bdrv_parent_drained_begin_single(child, true);
+        bdrv_parent_drained_begin_single(child);
+        AIO_WAIT_WHILE(bdrv_child_get_parent_aio_context(child),
+                       bdrv_parent_drained_poll_single(c));
      }

      if (old_bs) {

in patch 15/15, which should at least allow me to keep a lot of the 
cleanups I had on top of this series.

Paolo


