Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3DA4ABE2D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 13:07:48 +0100 (CET)
Received: from localhost ([::1]:40248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2o7-0004bY-5b
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 07:07:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nH2ho-0001dB-2e
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:01:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nH2hh-0005zj-Cz
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644235250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8AUd4rwei61qxG7QGW8LB5yHxH+C4DBdKn3EsaOdCQ=;
 b=PkZUjgGvu66Ht/6ST+gRNut2m6HynfdrB20BwdUYkFDk4p6RbH1HNzS2pdugztmRBbgk0t
 9OmqhEZ9jXceCvJDJbj+IJ3Jd+x9TdlWD9nNQwB6vOzj9FesYmigYIWTj0pvLW58ELLhrv
 qzB5v2Ao7wwO3XtpxtujKut4QRqABqI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459--FRrAXIaO9CzJmBZe-RGiQ-1; Mon, 07 Feb 2022 07:00:49 -0500
X-MC-Unique: -FRrAXIaO9CzJmBZe-RGiQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f26-20020a7bc8da000000b0037bd7f39dbbso80408wml.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 04:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=b8AUd4rwei61qxG7QGW8LB5yHxH+C4DBdKn3EsaOdCQ=;
 b=0hAp8QmLW4At5IeHkWne+ASWuSHpiQzoImrDtnzFnw0UGyig0+3TsCW857Pvyad8Py
 4ih2tgj2upSJrCxuctrpttwhAl2j2AkyR2+k02crcGWTusHTC2IvJa/+fnlm01UBzEfZ
 Jdganu6csVWHOVaZNBoskqRWrUx2Or2xYLdOyj8Yb5B6RjPkSR2qVLrrPGJNWaDTe1em
 1la8Jz0wn82xTiXCLV4GEDRv5gtLinVbBg6rnmJHfg/8LMb1i0dpzkzGBs96cJ57JLV9
 yW+2Q7uJ3Vy/Svb31jRb44kbTJBlUjQIO+qsBn4jF5Wbd3XNivkPyUMGQMDdUP/dz9CN
 670w==
X-Gm-Message-State: AOAM530E/nNoDMyo3N4UdjNz6ps7U0Wa14DqslA8h3vMA4OQE7CZf2h0
 l5xPiTnO1c0gHwEXIkPCS9wS8Jinndu51ORKRtwQKcmqdK5g5Cgb3iy7JVDiZwoXclNT1lFYDse
 f7Lrd4z8v3daTZ1k=
X-Received: by 2002:a05:600c:4195:: with SMTP id
 p21mr1636978wmh.130.1644235247980; 
 Mon, 07 Feb 2022 04:00:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxziTCBdbD4flrNnmgg1B6G96VLXH29VhBzeX0Fe9144R1feoqIoGVE/zPXiynTmHA10k6iew==
X-Received: by 2002:a05:600c:4195:: with SMTP id
 p21mr1636950wmh.130.1644235247663; 
 Mon, 07 Feb 2022 04:00:47 -0800 (PST)
Received: from ?IPv6:2a0c:5a80:1204:1500:37e7:8150:d9df:36f?
 ([2a0c:5a80:1204:1500:37e7:8150:d9df:36f])
 by smtp.gmail.com with ESMTPSA id m5sm9224915wrs.22.2022.02.07.04.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 04:00:47 -0800 (PST)
Message-ID: <aca18563999f3bf4b8c6bfee5f073f54beaacda4.camel@redhat.com>
Subject: Re: [RFC] thread-pool: Add option to fix the pool size
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 07 Feb 2022 13:00:46 +0100
In-Reply-To: <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain>
References: <20220202175234.656711-1-nsaenzju@redhat.com>
 <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain>
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mtosatti@redhat.com,
 qemu-devel@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan, thanks for the review. I took note of your comments.

On Thu, 2022-02-03 at 10:53 +0000, Stefan Hajnoczi wrote:
> > Some background on my workload: I'm using IDE emulation, the guest is an
> > old RTOS that doesn't support virtio, using 'aio=native' isn't possible
> > either (unaligned IO accesses).
> 
> I thought QEMU's block layer creates bounce buffers for unaligned
> accesses, handling both memory buffer alignment and LBA alignment
> necessary for aio=native,cache=none?

See block/file-posix.c:raw_co_prw() {

    /*
     * When using O_DIRECT, the request must be aligned to be able to use
     * either libaio or io_uring interface. If not fail back to regular thread
     * pool read/write code which emulates this for us if we set
     * QEMU_AIO_MISALIGNED.
     */
    if (s->needs_alignment && !bdrv_qiov_is_aligned(bs, qiov))
	type |= QEMU_AIO_MISALIGNED;
    else if (s->use_linux_io_uring)
        return luring_co_submit(...);
    else if (s->use_linux_aio)
        return laio_co_submit(...);

    return raw_thread_pool_submit(..., handle_aiocb_rw, ...);
}

bdrv_qiov_is_aligned() returns 'false' on my use-case.

I believe what you're referring to happens in handle_aiocb_rw(), but it's too
late then.

Thanks,

-- 
Nicolás Sáenz


