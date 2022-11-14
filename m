Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5DD628DD6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinR-0007fW-5D; Mon, 14 Nov 2022 18:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifD-0004o9-IU
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oua5I-0003iN-2r
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 09:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668434711;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=U71c3z8K8Db3X+cou7P5QmMRyJft39xYE6Fkua1C0ks=;
 b=Ftz18WKcbagEGc3F4mCFUmrmSrMuIouwQ5A0ypZY6l8uDL/SrZFdf2Qe+smUuwIlp9LVi9
 uWxapZt1I8NNZdiJKVtjhfcdQAWcH1A+SZ+65Tr2Hh/cFodHM9WXhXpZIvt2M9tAc1/qrN
 CbTbCEkkUs6bfBGqmLHvCn6GKlR5AGk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-228-yBV0ltzHM3ucV4PNKgJw0Q-1; Mon, 14 Nov 2022 09:05:06 -0500
X-MC-Unique: yBV0ltzHM3ucV4PNKgJw0Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 h9-20020a1c2109000000b003cfd37aec58so4254670wmh.1
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 06:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U71c3z8K8Db3X+cou7P5QmMRyJft39xYE6Fkua1C0ks=;
 b=evV1dS397UHtdO4L82HIgdiSk/4Y+22HdB90m+yangrl9Akk1P24fAn+ur7A4gO7CM
 nEt/AdCv5EeizftAX8h5sSvArVviBn8Q7i/9F2sjiI+t8sBhh1Rcw6JRIkYNn/RchSgs
 HnviUkpuXkyngSZd3L8DrtO4IOzJDktTuuadj3j7sbPj0mLdpJSEPjvnQ0N1WFGLO/2j
 blcfJkUXOdWmYUJyhGaXe8zuiYvr/XYnsAFn8PLRy6RG//veoq9PYFYC5Vh4mbmWmmaJ
 j3R8QiR5dyL2MJaRyet0CZhDuRspBwwJ7fqS0FLW8qEjcToqoLkk9KYdmWWjzWA2EE1y
 3Bxg==
X-Gm-Message-State: ANoB5pljURBhirMrXI3DehtnCp8+iZwnFLN4xdJUI7LtpbC3Mf5W9epJ
 hyLy+A5BumgbB1rSYBtuFhN0uw2tmLtmW3nRvQx4CkuES7++SGjluyUmCShZTshvWJyLttdjMAj
 9hmmtkDGyeBAgibA=
X-Received: by 2002:a5d:69cc:0:b0:236:8cc6:b76b with SMTP id
 s12-20020a5d69cc000000b002368cc6b76bmr8040317wrw.339.1668434697486; 
 Mon, 14 Nov 2022 06:04:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf40tdPlL3G/eKPfd93Wwt9PrV+DCjavU7J47keeiK/r5VCN47ga45QEz+bLMnru+KQVBV1vHg==
X-Received: by 2002:a5d:69cc:0:b0:236:8cc6:b76b with SMTP id
 s12-20020a5d69cc000000b002368cc6b76bmr8039826wrw.339.1668434689082; 
 Mon, 14 Nov 2022 06:04:49 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b003b47e8a5d22sm21112779wmq.23.2022.11.14.06.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 06:04:48 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,  "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 5/5] migration: Disable multifd explicitly with
 compression
In-Reply-To: <20221004182430.97638-6-peterx@redhat.com> (Peter Xu's message of
 "Tue, 4 Oct 2022 14:24:30 -0400")
References: <20221004182430.97638-1-peterx@redhat.com>
 <20221004182430.97638-6-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 15:04:47 +0100
Message-ID: <87iljhbpj4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> Multifd thread model does not work for compression, explicitly disable it.
>
> Note that previuosly even we can enable both of them, nothing will go
> wrong, because the compression code has higher priority so multifd feature
> will just be ignored.  Now we'll fail even earlier at config time so the
> user should be aware of the consequence better.
>
> Note that there can be a slight chance of breaking existing users, but
> let's assume they're not majority and not serious users, or they should
> have found that multifd is not working already.
>
> With that, we can safely drop the check in ram_save_target_page() for using
> multifd, because when multifd=on then compression=off, then the removed
> check on save_page_use_compression() will also always return false too.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


