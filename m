Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37F35CEC2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 18:56:19 +0200 (CEST)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVzrG-0000G0-7Q
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 12:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lVzp9-0007nY-Fo
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 12:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lVzp6-00028Q-Fk
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 12:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618246442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0JyjOzxiCYDdprwn1Q6He4ocrUkGwtG/ewke/s26xY=;
 b=f3y8c5PfHEtHBR7sRAiRobCYRkNr86qo46/gk4Pu1MvPS+FIIMDia0vjAcZMbxml/UYB55
 yu/rqqMR3Ux0IPBNVEqdY1FLdoU3wH1Uys/V6FOQv94GdxWlskkDMj3lcCcHUAYm/0wfpu
 aTKg8Fh/5txFKa84cM+pnAuZqbjAJuQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-n-ZbcP1xNBG3XESmFkXPZA-1; Mon, 12 Apr 2021 12:54:00 -0400
X-MC-Unique: n-ZbcP1xNBG3XESmFkXPZA-1
Received: by mail-wr1-f70.google.com with SMTP id h30so6280217wrh.10
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 09:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=W0JyjOzxiCYDdprwn1Q6He4ocrUkGwtG/ewke/s26xY=;
 b=r1hTcDKFsZzXNZBlUYJjsBLfZb0lphtE/mqmx96pwzNxC9VAk3UGyx5O1T/cEsxYUE
 pNp5Vi50R8BJgMEhCzsB/VnOO9zyG0T2XVg/d7YzrEicAAxfn7tumfZmDxQzzTBgwzWs
 t70F61qIHKD5Br7z2Pn+oURPprEuM5oXIQrdF+cyDf7ppOUo1E6XyqQ5yTrx4Y+ti1bN
 rCRk+jZWJzaIqeoapsFVaozqYBFbWr/WPExgbZdDZEUw/MrKwhTR3fcUbIaJVnPC2uMv
 fPTrnsfnWuZMg/xOHQZvnFVZHWQemWl91upMhdY+AzmmdHc0CotAeLCdGWmgC1qW7vHM
 frKg==
X-Gm-Message-State: AOAM531tDAzUlu6mCWgMqKBpEOFu91vmlXOxEPfckarbmisLWyEP1OZk
 0pZEo1r33QvzGZgz2lDrMn5kdXGSgFcPI4nFp1lYCGCNPY8fbwDyLqrRMVj5ioagXzTJ84/0Sw+
 YPwiFZofEb60EkN4=
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr81670wmz.38.1618246439166;
 Mon, 12 Apr 2021 09:53:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3Lh0QWfuFJyl9e7JRXlpkZEcZx1+8A6ZEzzSoRcxBllSllXEeEY4uAjtZzYYC+9jUZUv8mw==
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr81654wmz.38.1618246438950;
 Mon, 12 Apr 2021 09:53:58 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c66cb.dip0.t-ipconnect.de. [91.12.102.203])
 by smtp.gmail.com with ESMTPSA id r5sm15885485wmr.15.2021.04.12.09.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 09:53:58 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210312173547.1283477-1-pbonzini@redhat.com>
 <20210312173547.1283477-3-pbonzini@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 2/3] qom: move user_creatable_add_opts logic to vl.c
 and QAPIfy it
Message-ID: <f0ea67d8-9641-104d-f8ec-5fc343256cc9@redhat.com>
Date: Mon, 12 Apr 2021 18:53:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210312173547.1283477-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.03.21 18:35, Paolo Bonzini wrote:
> Emulators are currently using OptsVisitor (via user_creatable_add_opts)
> to parse the -object command line option.  This has one extra feature,
> compared to keyval, which is automatic conversion of integers to lists
> as well as support for lists as repeated options:
> 
>    -object memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind
> 
> So we cannot replace OptsVisitor with keyval right now.  Still, this
> patch moves the user_creatable_add_opts logic to vl.c since it is
> not needed anywhere else, and makes it go through user_creatable_add_qapi.
> 
> In order to minimize code changes, the predicate still takes a string.
> This can be changed later to use the ObjectType QAPI enum directly.
> 

Rebasing my "noreserve"[1] series on this, I get weird errors from QEMU 
when specifying the new "reserve=off" option for a memory-backend-ram:

"Invalid parameter 'reserve'"

And it looks like this is the case for any new properties. Poking 
around, I fail to find what's causing this -- or how to unlock new 
properties. What is the magic toggle to make it work?

Thanks!

[1] https://lkml.kernel.org/r/20210319101230.21531-1-david@redhat.com

-- 
Thanks,

David / dhildenb


