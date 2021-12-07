Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2515746B091
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 03:25:54 +0100 (CET)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muQAy-0000o5-N8
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 21:25:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muQ9r-00008B-6J
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 21:24:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muQ9o-0000IO-8g
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 21:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638843878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hw4CxKmSgJy+fI4Z9XCt3EwFDbp0O+zaEuGF6jIJ8Yg=;
 b=Zxu5xK91OZP87EPyfXFPrzEz2qawcyI91BxHz4tUl25hyrDz3qFtt6/usym5GOeaApHwQq
 1J5SHDQ+cfGt5e+5HlHHbXfGyMlnYpm/yYQowEedjrukAsh0La3E6GuMGfdbtdcGKyyCpE
 xZb5dB3Xqce/M+j1+NiFx+tQ5rgPSlM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-pb-DSCsqMLurFSh_YSL4bw-1; Mon, 06 Dec 2021 21:24:37 -0500
X-MC-Unique: pb-DSCsqMLurFSh_YSL4bw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso661761wms.1
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 18:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hw4CxKmSgJy+fI4Z9XCt3EwFDbp0O+zaEuGF6jIJ8Yg=;
 b=6aL/lALlNpH2AXAcae8w+TqdbahmHIYf8cbM9Ov/19wWzSTj2q1515En2tJBd4CRLP
 XvNBw19zsMrYamVSFJRHQEVSogBPgOIMzlZ24+FE/n6bsoOTGHtDweZLAWphgGub8Z/z
 DJvhR4nwYHnwbGFZO3ep+xCf2RZZblJpSE2cJqWUPQGWStKNyrSXawt2gU9hcIg9+sbq
 +7G4Pxbw7bLJUk0IufG1jeJfvWp8YN9+fHqUW2x1EizONixY/5K0LcYV2sMhhCSSfOZC
 NeuUqlCZLsBn525SD/VEGGCu1JXKuQmPRPSLabL3tF9GtPMLi7G/IM1nMRQTm22hVvpc
 2GKg==
X-Gm-Message-State: AOAM531ZfLLbK/cn39pOx/g9i+idxnA3YJwQTLXAVXeVkQZDUdtRbBW9
 QHBiFljfHhpxt3+8DWDoD+fWDcg62KOk9Rg+FTpJ7Re0jbV0PfnQY7hBOtF0naHnfHVsnI54WOq
 x217BpfCuuYdvlG4=
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr3143553wms.103.1638843876595; 
 Mon, 06 Dec 2021 18:24:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBZ3TUDTA7grNMZavoYLEkBwcLFPjFA3x9OLzfu4i+wkjvr+o/P1c8wZnEIVnL/2jne8Anvw==
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr3143524wms.103.1638843876385; 
 Mon, 06 Dec 2021 18:24:36 -0800 (PST)
Received: from xz-m1.local ([85.203.46.174])
 by smtp.gmail.com with ESMTPSA id e7sm16284698wrg.31.2021.12.06.18.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 18:24:35 -0800 (PST)
Date: Tue, 7 Dec 2021 10:24:28 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v9 3/3] cpus-common: implement dirty page limit on vCPU
Message-ID: <Ya7F3BtHw4mFBKfT@xz-m1.local>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <cover.1638495274.git.huangy81@chinatelecom.cn>
 <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
 <87tufpyiij.fsf@dusky.pond.sub.org>
 <65a49c9f-9287-b950-8fde-40fa9a4a28fe@chinatelecom.cn>
 <Ya3Jy1nWVRz12NHv@xz-m1.local>
 <9446cb24-c132-64e7-d696-ac959327d861@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <9446cb24-c132-64e7-d696-ac959327d861@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 06, 2021 at 10:56:00PM +0800, Hyman wrote:
> > I found that it'll be challenging for any human being to identify "whether
> > he/she has turned throttle off for all vcpus"..  I think that could be useful
> > when we finally decided to cancel current migration.
> That's question, how about adding an optional argument "global" and making
> "cpu-index", "enable", "dirty-rate" all optional in "vcpu-dirty-limit",
> keeping the "cpu-index" and "global" options mutually exclusive?
> { 'command': 'vcpu-dirty-limit',
>   'data': { '*cpu-index': 'int',
>             '*global': 'bool'
>             '*enable': 'bool',
>             '*dirty-rate': 'uint64'} }
> In the case of enabling all vcpu throttle:
> Either use "global=true,enable=true,dirty-rate=XXX" or
> "global=true,dirty-rate=XXX"
> 
> In the case of disabling all vcpu throttle:
> use "global=true,enable=false,dirty-rate=XXX"
> 
> In other case, we pass the same option just like what we did for specified
> vcpu throttle before.

Could we merge "cpu-index" and "global" somehow?  They're mutual exclusive.

For example, merge them into one "vcpu" parameter, "vcpu=all" means global,
"vcpu=1" means vcpu 1.  But then we'll need to make it a string.

-- 
Peter Xu


