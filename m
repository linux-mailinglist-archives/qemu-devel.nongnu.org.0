Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D86F84D6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 16:27:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwO5-0007q8-MI; Fri, 05 May 2023 10:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puwO1-0007py-MI
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puwNz-0004bl-UE
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683296773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zIzRbzkK0yZElJIaqAzAqZgxTsRXydhnyZplmG6eNP4=;
 b=ZXXftiunaPjGHs5y/XrbWvP2OjczLHnG0M3recrloo1uTxIY6VeothdiVrZ3LkCJ+zXGdn
 AIRFTpz8xFWhwbnlj9bSQEs2vbMwMJmUoJ+Kd6F4Hl9D4yzJp6QBfffSuAq9183X5M0Gcr
 pg9b8D6zDnXLqeJ+l37aTC5eevE23/E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-badf_mCIONm6MY-fow-7Rg-1; Fri, 05 May 2023 10:26:12 -0400
X-MC-Unique: badf_mCIONm6MY-fow-7Rg-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-74d96c33de9so16113185a.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 07:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683296771; x=1685888771;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIzRbzkK0yZElJIaqAzAqZgxTsRXydhnyZplmG6eNP4=;
 b=hIPp8njURkrQyli/JtqaMG96Jj8Us/wR7s2GEdAyna5hgSMp4xWX5OGFc3mSzBahhA
 IZmSL8NGUibhLIl9Gk3x6ygJkEn0cyptLA1WmHI+9PPOEemkQEr291ebeXzsHF+FAl0u
 0qu44SDUzbCd9PS7EDyxVLH5piGwLpQw4OJ43MnqHzteGlRAiUqzU6aUMH3uHbBhwbyY
 qfBuiD7JS7JW6cEsFKmsMy+g1r28Wh8kvOXR1rXJha1hr1/U3OCy1n2V8h4bPWzGbD5q
 l0WdqiDQ25Yqa+fk5C45w90RzqBFPr6V7ORaM5KN3BnwHAGUPIFWAHFFTBL8jqM+VmO3
 8sgQ==
X-Gm-Message-State: AC+VfDx6N7H5ABoyJfzBHbjvaS/UwzM8eo06y1f7nj3K+e+Bq13R37tU
 n+HgnVR0pTkZTXZwQSJtVvPv2rTeCqLAywKgkPHpB5to6v5jMEGEbb5VmkTk1qaduPjdPrECfBZ
 lZWchxNulSCBadhI=
X-Received: by 2002:ad4:5ecf:0:b0:616:73d9:b9d8 with SMTP id
 jm15-20020ad45ecf000000b0061673d9b9d8mr2164578qvb.3.1683296771618; 
 Fri, 05 May 2023 07:26:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5xJ9EPKLCVwLr0TUHPYPKGrwsDer+QXv+zZIfk51g2jFSiD2/g9DGVcn6llAtiCT3f0/OKxw==
X-Received: by 2002:ad4:5ecf:0:b0:616:73d9:b9d8 with SMTP id
 jm15-20020ad45ecf000000b0061673d9b9d8mr2164556qvb.3.1683296771339; 
 Fri, 05 May 2023 07:26:11 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 z19-20020a0cda93000000b0061eaef8ff84sm634598qvj.28.2023.05.05.07.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 07:26:10 -0700 (PDT)
Date: Fri, 5 May 2023 10:26:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Lidong Chen <lidongchen@tencent.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: migration/rdma.c's macro ERROR()
Message-ID: <ZFUSAXDMHztKGdlO@x1n>
References: <87sfcbuk3i.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sfcbuk3i.fsf@pond.sub.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 05, 2023 at 12:51:45PM +0200, Markus Armbruster wrote:
> migration/rdma.c has
> 
>     /*
>      * Print and error on both the Monitor and the Log file.
>      */
>     #define ERROR(errp, fmt, ...) \
>         do { \
>             fprintf(stderr, "RDMA ERROR: " fmt "\n", ## __VA_ARGS__); \
>             if (errp && (*(errp) == NULL)) { \
>                 error_setg(errp, "RDMA ERROR: " fmt, ## __VA_ARGS__); \
>             } \
>         } while (0)
> 
> This is problematic.  The point of error_setg() & friends is detectin
> errors from handling them.  error.h:
> 
>  * - Separation of concerns: the function is responsible for detecting
>  *   errors and failing cleanly; handling the error is its caller's
>  *   job.  [...]
> 
> Reporting the error to stderr violates this principle.  Consequences
> include
> 
> * When the caller reports the error to stderr, it gets reported there
>   twice, possibly in slightly different form.
> 
> * When the caller recovers from the error cleanly without reporting it,
>   it is reported to stderr anyway, even though it is not actually an
>   error.
> 
> Mind if I kill the macro?

Makes sense to me.

/me copies the most recent (in past two years) active developers on rdma so
they're aware.

-- 
Peter Xu


