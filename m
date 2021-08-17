Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852613EEFF6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 18:09:48 +0200 (CEST)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1et-0001gM-IE
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 12:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mG1bG-0005uu-HQ
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mG1bC-0005h2-Dy
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629216356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5w4B2uibwZnfAhsj3IwI9Ayq8OqviXIF3J69dg32oE=;
 b=TiwiGPKoGPk/K+tYADYSLfT0bFuMPQywelS2ZM0RozPIng1e+St8wyBuQMdkxaPzOCUJkj
 zjXG3y5J2B3TZp/12sjeeXoG/WZvRHYg9e3mavnNkdD6/4/2RynG2M9sqCvLLgeS398QIz
 qXPGatNUbcBv1Xcc9VWHkUlY7rNc8M8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-jjgjxFmIPc-ZcL8TtxuU8g-1; Tue, 17 Aug 2021 12:05:55 -0400
X-MC-Unique: jjgjxFmIPc-ZcL8TtxuU8g-1
Received: by mail-qk1-f198.google.com with SMTP id
 p16-20020a05620a22b0b02903ca40d6cc81so2084027qkh.13
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 09:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u5w4B2uibwZnfAhsj3IwI9Ayq8OqviXIF3J69dg32oE=;
 b=sdl8TciLeP+wIU2vD/38FWZXmQJiSM2goWIqQsc/vBjeeEykvJQ2Ah230S7eiP/5hB
 C/eP1TtvmbMwUpu6XTIo6gU6/9m8V8xUlIi08DksPbnUiV04KS2Fun4bvopr1MoA1Vn9
 jS5305u47tLpGWnAkHeBFB/p/q+YPivxCR0oEeTOCExyzSKZAoPY99Kl/hjYWXSYPUJV
 ygdEtIfaLlqRjw7QEVt1grEdbScWPrRwHDVOxRurKBZKNEukI/bDxvosHdsLk7Xm5TuE
 WfNuCbeI/lS7k04bg/57iwp6kYiE9e3aUj+p35qpMLBhs1i9dtLw6ayK9zqeR+9tfM1c
 nKIQ==
X-Gm-Message-State: AOAM533e2AzCzWFLIAQXtYCzci6352hgoSFBAtR9kgGyKIWiEthknJdH
 PB6Wn/2thl7ynr3C0Q4GcrOv+0c+YpP8lvBJsdKR5eMIMr6+HwA2/1d4l3amgby99Y8duRLK8LB
 S5vd27wJMZ7OYVD0=
X-Received: by 2002:a37:a04e:: with SMTP id j75mr4638791qke.98.1629216352637; 
 Tue, 17 Aug 2021 09:05:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuHYR6DQswI06XTiW/xw/DEGJ+JV9RhFrRnoyJlbt3tjRKROxKZC+Xo9N/T4Ykh/Z2ioetPg==
X-Received: by 2002:a37:a04e:: with SMTP id j75mr4638768qke.98.1629216352365; 
 Tue, 17 Aug 2021 09:05:52 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id g12sm1184125qtq.92.2021.08.17.09.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 09:05:51 -0700 (PDT)
Date: Tue, 17 Aug 2021 12:05:50 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RESEND 2/2] memory: Add tracepoint for dirty sync
Message-ID: <YRveXqqR+DELQVSe@t490s>
References: <20210817013553.30584-1-peterx@redhat.com>
 <20210817013706.30986-1-peterx@redhat.com>
 <43b42f6e-f2a2-6341-0c53-bcf1586fb191@redhat.com>
MIME-Version: 1.0
In-Reply-To: <43b42f6e-f2a2-6341-0c53-bcf1586fb191@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 09:25:56AM +0200, David Hildenbrand wrote:
> On 17.08.21 03:37, Peter Xu wrote:
> > Trace at memory_region_sync_dirty_bitmap() for log_sync() or global_log_sync()
> > on memory regions.  One trace line should suffice when it finishes, so as to
> > estimate the time used for each log sync process.
> 
> I wonder if a start/finish would be even nicer. At least it wouldn't really
> result in significantly more code changes :)

Note that the "name"s I added is not only for not using start/end, it's about
knowing which memory listener is slow.  Start/end won't achieve that if we
don't have a name for them.  So far I just wanted to identify majorly kvm,
vhost and kvm-smram, however it'll always be good when some log_sync is missed
when tracing.

I'm also wondering whether kvm-smram needs a whole bitmap as I don't know what
RAM would be touched within system manager mode (as I thought it should only
touch a very limited range and should be defined somewhere), but that's
off-topic.

If we want to make it start/end pair, I can do that too.  But the 1st patch
will still be wanted.

Thanks,

-- 
Peter Xu


