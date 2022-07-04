Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ACC565C76
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 18:52:46 +0200 (CEST)
Received: from localhost ([::1]:53580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8PJV-0006yv-AJ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 12:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8PI6-0006Hk-Rc
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o8PI3-000888-Ge
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656953474;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bXFRPyPzvNVxZq7PPbSLP3PcY9iyABIRa1ACBq3WEqg=;
 b=Y52wDhqOj61mnY7ChsEAqGCHvvt7oVnxDPFOgav+y68veHdcAIHt+AhZBrdRQhXTzcv98u
 oUKa9g6OKl2cjqXPj2Skmgj229Q9AioOLMi1Rh8ZkVU6LXfd1rekKXZM7ZeBWqpdxCkoEP
 9l3Q6tyQvu548G7EPng2OJLLoxmfiNs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-2E4hNPGwNySCywHr4JBGNA-1; Mon, 04 Jul 2022 12:51:13 -0400
X-MC-Unique: 2E4hNPGwNySCywHr4JBGNA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j19-20020a05600c191300b003a048196712so5601966wmq.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 09:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=bXFRPyPzvNVxZq7PPbSLP3PcY9iyABIRa1ACBq3WEqg=;
 b=xnVx9j0Dzc2sT9sxuu9j75DvRz5a/mWJKN6YWDIWWIUFUrdMDvX55DPJ32FAxKQEro
 BuOgy2JczOM9Fzvx6nkqHG4a28BfJ8FGxPxnoBRznDyJlaSoiY8eEO0U43dHCBX1kiry
 hd6mHJKZsysA5xfR/lKJLTWDHoknPRg46Rxkj8Mtbf4cpSyFmVfoECzs+HiN6IUllKD7
 Ur4Hbdl8tpIhpFy5eMl2OKK/poNYONPwle/OF6fMxCNsFB7DQZfDt5Da9QeSODPc3B25
 wEqpnLFKVi3sf6U59n8mNkDueIVNS9vxuDsXf8v5cDjJahxHYdTCDcdoMhVf6OLKBNCj
 3d1A==
X-Gm-Message-State: AJIora8loqBqsVkJv+DXDEVby4t2AMF6HAuXA7tnElsdbhiEbekWU0Gh
 DfXNhAKECAMgqhEhqr7Cbj3y6WVPlvVlkIEEO1nit584aqc96DtzpYu/nbt9rKUD0rsIomxISrH
 uIUsmfGhC4PMtUAI=
X-Received: by 2002:a05:600c:3544:b0:3a1:88e1:3a3 with SMTP id
 i4-20020a05600c354400b003a188e103a3mr22061260wmq.107.1656953472217; 
 Mon, 04 Jul 2022 09:51:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1un9MO4YHzeXDWmo9MOpXn/ZKDgco/8Ppp2NtnwwlciLqaxkSBxEc5lM6X6h2MHUpR+Rt6mIw==
X-Received: by 2002:a05:600c:3544:b0:3a1:88e1:3a3 with SMTP id
 i4-20020a05600c354400b003a188e103a3mr22061235wmq.107.1656953471935; 
 Mon, 04 Jul 2022 09:51:11 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c4f8f00b003a1980d55c4sm8600380wmq.47.2022.07.04.09.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 09:51:11 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
In-Reply-To: <20220704164112.2890137-1-iii@linux.ibm.com> (Ilya Leoshkevich's
 message of "Mon, 4 Jul 2022 18:41:12 +0200")
References: <20220704164112.2890137-1-iii@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 04 Jul 2022 18:51:10 +0200
Message-ID: <878rp8254x.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> zlib_send_prepare() compresses pages of a running VM. zlib does not
> make any thread-safety guarantees with respect to changing deflate()
> input concurrently with deflate() [1].
>
> One can observe problems due to this with the IBM zEnterprise Data
> Compression accelerator capable zlib [2]. When the hardware
> acceleration is enabled, migration/multifd/tcp/plain/zlib test fails
> intermittently [3] due to sliding window corruption. The accelerator's
> architecture explicitly discourages concurrent accesses [4]:
>
>     Page 26-57, "Other Conditions":
>
>     As observed by this CPU, other CPUs, and channel
>     programs, references to the parameter block, first,
>     second, and third operands may be multiple-access
>     references, accesses to these storage locations are
>     not necessarily block-concurrent, and the sequence
>     of these accesses or references is undefined.
>
> Mark Adler pointed out that vanilla zlib performs double fetches under
> certain circumstances as well [5], therefore we need to copy data
> before passing it to deflate().
>
> [1] https://zlib.net/manual.html
> [2] https://github.com/madler/zlib/pull/410
> [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
> [4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
> [5] https://gitlab.com/qemu-project/qemu/-/issues/1099
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

And now I wonder if we need this for zstd.

Once told that, compression (not multifd one) has always operated the
other way, sniff.


