Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12353A024D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:21:08 +0200 (CEST)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhHf-00081T-PK
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lqhGW-0007Mw-Iq
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:19:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lqhGT-0003Lj-S7
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623179992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xB7OGw12dwQY2leDwaHQySTfcbRthqn3lqdYJN9foBw=;
 b=dnpoGblsWtAJKV4xJ3R8Wedi3HV15EsrOdsjasBPiFwHSa7GUelYueCj9EELHmo5+e4/aS
 PArS+v9Zii6VYMVlZLtnkfWB7JSHI2vsu9cSww5ck8UFYTeJ/DRwsfY4Z9IRQvnbmj+25T
 tQaF9oh1oNnz6d+dlrGfZwQnLdFCCG8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182--LJYT1M_O82KRmNwqFUf8A-1; Tue, 08 Jun 2021 15:19:50 -0400
X-MC-Unique: -LJYT1M_O82KRmNwqFUf8A-1
Received: by mail-qk1-f197.google.com with SMTP id
 t131-20020a37aa890000b02903a9f6c1e8bfso13216543qke.10
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xB7OGw12dwQY2leDwaHQySTfcbRthqn3lqdYJN9foBw=;
 b=b8loBzKf99fDP6oLMvs5rmRNm6Lc/Sov5BR+ihrFYxwEbjPvmyZAZqGwBfSVSIFT+C
 83kW4wdCecgF3CM+/hxzuvkDSW9GwXRG21CM9FLaMYgtPqE+jZDRE4oU0UMeH6YMg3oC
 7bOXJ71Kgf78s6M2cc0TF6Q5iIOnELBjlw/mEgjku6LGqIlvNEzrujFMwA6I8vyw3RWi
 VcWLkXVFO6RV3lgSuD/W9Dg5gmWKpk+JaKI246BUKk1ZkIb8CaaJMXZfA8GpjJyZ23tQ
 d/kCmQfIBhzf2cxc+2qfSAwvjWpmXvuR+6MXbCr8XaDKKiWLRjF7syCV620lAFCUoT62
 I7lg==
X-Gm-Message-State: AOAM532uGJzuzoBW9oSRSpKLTzYeaPWSbNqEZVvT+advskk8DGPiDm6C
 2srfpE8jZHX/Hg4Z2Dg6c2c1ID7LYSyIUOvwH8HY2Jmz/fQ4VrfwF0NC7t+VZOwEJVD8GCtPsPE
 i9kH5ijRDFNaAcIw=
X-Received: by 2002:a37:684c:: with SMTP id d73mr6875328qkc.35.1623179989624; 
 Tue, 08 Jun 2021 12:19:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/jNQZrFQzCngMXagUQzqpnk9F3Gl5ql+Uwz2VlFn3FwU6EKFV0NaaYq6JGCziZNMc0Z43qw==
X-Received: by 2002:a37:684c:: with SMTP id d73mr6875306qkc.35.1623179989397; 
 Tue, 08 Jun 2021 12:19:49 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id v28sm9370579qkg.22.2021.06.08.12.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 12:19:48 -0700 (PDT)
Date: Tue, 8 Jun 2021 15:19:47 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
Message-ID: <YL/C00m4LDZ9EVnY@t490s>
References: <20210601005708.189888-1-peterx@redhat.com>
 <YL+71C9cteDVYJum@work-vm>
MIME-Version: 1.0
In-Reply-To: <YL+71C9cteDVYJum@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chuan Zheng <zhengchuan@huawei.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, huangy81@chinatelecom.cn,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 07:49:56PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > These two commands are missing when adding the QMP sister commands.  Add them,
> > so developers can play with them easier.
> > 
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Cc: Juan Quintela <quintela@redhat.com>
> > Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> > Cc: Chuan Zheng <zhengchuan@huawei.com>
> > Cc: huangy81@chinatelecom.cn
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> > ---
> > PS: I really doubt whether this is working as expected... I ran one 200MB/s
> > workload inside, what I measured is 20MB/s with current algorithm...  Sampling
> > 512 pages out of 1G mem is not wise enough I guess, especially that assumes
> > dirty workload is spread across the memories while it's normally not the case..
> 
> What size of address space did you dirty - was it 20MB?

IIRC it was either 200M or 500M, based on a 1G small VM.

-- 
Peter Xu


