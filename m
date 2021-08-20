Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126D53F3553
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 22:33:29 +0200 (CEST)
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHBCh-00061d-LY
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 16:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mHBB9-0005LL-TD
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 16:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mHBB6-0000QI-LG
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 16:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629491507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XaR3Kya71jdBdzscAhxpuw60SJZHv+qtDvIRYnjqsoQ=;
 b=bhA0d6PFNSzff4GWswpph1MJVSX9yC+HkdZPl6F/aRX/0q0djTtiIbjDW0ccdpwSbsaxZi
 FWG9AN6//KszyxVhSeZGsJ85dTEw+ZQ60MV0neDeG1PZ57f9tlaRzkXIYsXIxWAWaPN2wz
 uK9DGpMQjwBL5YgShcpOgqS+xm01K9s=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-Z5xYP9aIOh-8fuO3sjRPCw-1; Fri, 20 Aug 2021 16:31:45 -0400
X-MC-Unique: Z5xYP9aIOh-8fuO3sjRPCw-1
Received: by mail-qt1-f198.google.com with SMTP id
 z18-20020a05622a029200b0029c338949c1so1973177qtw.8
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 13:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XaR3Kya71jdBdzscAhxpuw60SJZHv+qtDvIRYnjqsoQ=;
 b=GfdONqWA+9dwEj0ZOC5G/S1mVyhxZeBknzpofenwr3RqxFEE4874Z9wI3agOw7Fgp4
 J4ADCE90SYvtZ/Kj68VQRSt3JupAGIczkSQBkm4CGBX1xxo2rba3PR38kGrfJXDtJ3Jv
 UMUypM6YeW/zRyAAEWPfHButJr0LM+vUFu6/XUckYlzZJKS7M7AHnvS31uy41G80ijix
 f/xqMj7NYZI1QzsNkcKA+hqnBG8KLAB/kjFxD5ok+4aQ38iLjssWdGRcPo+pWDWSvFnt
 PfbfOowIT+h6djlQ1/kuesPLZN+wnMc708zOnug5FhdzXGqqsMWmMcLFGhVM0JiqlvtI
 yG0A==
X-Gm-Message-State: AOAM533UkhQfy026Ya4COThZkrKiN3st/mueYL3AO6fpUDXtjdxmrVBB
 BePPVhrK3GiNkIwrEaqNi/zDg/APFyQODvejot5yXq4lAwA2OKrs1jkeGM8EBXTlO6B65ZMspjP
 KzLrl6vYm+fzA2mo=
X-Received: by 2002:ad4:438e:: with SMTP id s14mr22035921qvr.26.1629491505473; 
 Fri, 20 Aug 2021 13:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUPPMXeGOwWNOpR6MYn40W44pQTIlC8ObqqGUXVNZ/shDD330ve2yCD+rqdYR3n90zfZIeMg==
X-Received: by 2002:ad4:438e:: with SMTP id s14mr22035898qvr.26.1629491505313; 
 Fri, 20 Aug 2021 13:31:45 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id q14sm3576496qkl.44.2021.08.20.13.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 13:31:44 -0700 (PDT)
Date: Fri, 20 Aug 2021 16:31:43 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
Message-ID: <YSARLwcmNZ4vgjB1@t490s>
References: <20210820155211.3153137-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210820155211.3153137-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 20, 2021 at 05:52:11PM +0200, Philippe Mathieu-Daudé wrote:
> When Linux refuses to overcommit a seriously wild allocation we get:
> 
>   $ qemu-system-i386 -m 40000000
>   qemu-system-i386: cannot set up guest memory 'pc.ram': Cannot allocate memory
> 
> Slighly improve the error message, displaying the memory size
> requested (in case the user didn't expect unspecified memory size
> unit is in MiB):
> 
>   $ qemu-system-i386 -m 40000000
>   qemu-system-i386: Cannot set up 38.1 TiB of guest memory 'pc.ram': Cannot allocate memory
> 
> Reported-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


