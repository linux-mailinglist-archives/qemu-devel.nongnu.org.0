Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51003527C6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 11:02:40 +0200 (CEST)
Received: from localhost ([::1]:46656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSFhP-0003Cl-PI
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 05:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lSFgC-0002LV-6A
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 05:01:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lSFgA-0006pW-2h
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 05:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617354081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEp0LaoX1She8wbcy6ylY9p49/LnhC1u+i2aevncH+I=;
 b=DCHSdik+jP4+kU3hdyAMGJwpTAotxFuBy6JKRqZOAYZpDDnE99XdSyYHLCMq29hhM8aEU5
 fTR25b3+gPOgI576gCSiN8gbfSuPAQ6A2X2oFK/ytJZwI8WvhLqqYLnDTpMrccAyx+QCzi
 K9eoytI+p74B2a1zZvSfIjkmL2lxFsw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-VJ_JAW-qMvK5jQLIB42z2g-1; Fri, 02 Apr 2021 05:01:20 -0400
X-MC-Unique: VJ_JAW-qMvK5jQLIB42z2g-1
Received: by mail-wr1-f69.google.com with SMTP id n17so4102147wrq.5
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 02:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gEp0LaoX1She8wbcy6ylY9p49/LnhC1u+i2aevncH+I=;
 b=s7VJtvZaJCfkofNtEAwhER7sTSRuipUjlTzDGi7+vFFtnUVKRlqatlJpWvwRaNNd0y
 tPUL6EE8Vxv6Qp8qG3n5FMiGwswXQka47mpmfHa/W5pJCpdniqJL7ir73VDxtYMlYUhV
 rNxbIjoRbsMWI+LQyjkzV0CrSrwSNUch/akyt/ruGl2lYTiDl+OGLqL5t2nNDP2nxeLg
 NUUri+Q7ZQGN8E/xtuvhHoY3kojEoQtAXqrDhkjQL9b1qzmfZCSb8FaTwZwo+QDkl9MJ
 pklk1pXrAeW0gOWG83mBDlpstd9xrXyRKqbNfRiLY0YiFlN3QMSKciwj54Q+JkCSSyda
 RwRg==
X-Gm-Message-State: AOAM532d8CkHt05br/Tx1YFkoh6rBdeZtvP1l7OqRQ/NOwztIgFvTyUi
 slx3mvNhT1GlT5Wnu+uRDqFO1m2mEMKhsqgVueRO4F7qnD5pfyvODPzn71uMZIevdS53BXxOXWF
 xlwwZOdRnnkQ69wc=
X-Received: by 2002:a1c:4986:: with SMTP id w128mr11733015wma.37.1617354078844; 
 Fri, 02 Apr 2021 02:01:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyEE12hTdDYG8mnySlMzs33G38LJnApYJT0RNDVBsAxAjRm7UXPLJRPds9T7E4X7ZPFXzj0Q==
X-Received: by 2002:a1c:4986:: with SMTP id w128mr11732999wma.37.1617354078617; 
 Fri, 02 Apr 2021 02:01:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id o7sm14243434wrs.16.2021.04.02.02.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 02:01:18 -0700 (PDT)
Subject: Re: Bug: fstenv is wrongly implemented
To: Ziqiao Kong <ziqiaokong@gmail.com>
References: <CAM0BWNCTD_oe3BgKQUqG41fgFqGCXVh1gaiMqJpvXbR4Fh5vHg@mail.gmail.com>
 <7c63e938-2482-3150-7cfb-1459c132fda6@redhat.com>
 <CAM0BWNCYXywdDdr+b6R1uFBNOKdaWnotaoy=W2DLjpx9eshcrQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1498cabe-69dd-7855-541b-1f7ee6c6cace@redhat.com>
Date: Fri, 2 Apr 2021 11:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAM0BWNCYXywdDdr+b6R1uFBNOKdaWnotaoy=W2DLjpx9eshcrQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/04/21 10:56, Ziqiao Kong wrote:
> Hi!
> 
> Thanks for your reply.
> 
> I read the IA32 manual just now and indeed the patch is not correct.
> Is there any related patch for this bug?

No, there isn't.

Paolo


