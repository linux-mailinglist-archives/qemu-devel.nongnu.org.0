Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CE82D8059
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 22:02:59 +0100 (CET)
Received: from localhost ([::1]:58482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knpZ4-0006oz-RR
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 16:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knpSE-0004Gt-Qp
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:55:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knpS8-0000FO-Tp
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:55:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607720146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ENYzHI+dqrIqY00CWeFYbISsPHG9jV7MbwTls/Zx/rk=;
 b=LdOKst2qPj7GQTQ4C2FnroeuNJZj1ZNIzAdoHNvhbGtKy/UgSUZHbCBOGsxfvMDdB8cZ1j
 75MAMZq4NGnvbcJ5ABLWBnKeZI0cXt3V7oBwdpyADzvTvAg7ViCHXG89cGV+joLU2XhPkq
 Wfga6qsGXhoW44Kc3QNoUSzxH2ztppw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-Mmq1zCEwMRCn6dh5hyy5CA-1; Fri, 11 Dec 2020 15:55:44 -0500
X-MC-Unique: Mmq1zCEwMRCn6dh5hyy5CA-1
Received: by mail-wr1-f70.google.com with SMTP id o12so3742447wrq.13
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 12:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ENYzHI+dqrIqY00CWeFYbISsPHG9jV7MbwTls/Zx/rk=;
 b=T8oN0rqwhryjKWg6rrghJJubCfiYWqyLYicvUs+8oBoodh5Lrood2L2sCrTz4+RTsE
 FSxwK5c5VLGPsx3CNJhyhmcqp/fr59100fU2QD8vyyJ1qvqBrqlpCGE8TBhEosOFFAxe
 Vwg5H6QWUMQdF3s2UupwKDjnoXOJrvLYd3ep20ZbpgHs3pfZkq2kUzqgo0mFdFfEGhsK
 4N984qEANtY1oczNsf0mw0iQGzDetnq65Tv/abv3IYOqkZFLBRkhE5TyJU8fEFWuLUMy
 FjqUDTzkscBmu25Ox0FIOaDwMHoCU5ZF1QqDSH7r7pRCrKf5Q7Rz+getTj55czn/vDft
 sP0Q==
X-Gm-Message-State: AOAM531j5/mT4mhs8EKuVMFXS6e4Ya4w0cnZYaQsgdkxtKjN6VzJ5ZVQ
 DhCBz667OLmOzimLyClh/lMvV68Pmm98G61MiMYWZFpDIXe/pGcoJN1r9mQq97aHCd+99/II2Es
 bJHqDKRkobm13lYU=
X-Received: by 2002:a5d:4b4c:: with SMTP id w12mr15751656wrs.402.1607720143311; 
 Fri, 11 Dec 2020 12:55:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLxP6iut3vbLhrYavE555xpUNUxX9j1RsuswwnmJ/EVAUJQT2cYdfOGiks+xaSeRR5Thg7zg==
X-Received: by 2002:a5d:4b4c:: with SMTP id w12mr15751643wrs.402.1607720143088; 
 Fri, 11 Dec 2020 12:55:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b83sm15611651wmd.48.2020.12.11.12.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 12:55:42 -0800 (PST)
Subject: Re: [PATCH 1/1] scsi: fix device removal race vs IO restart callback
 on resume
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201210125929.1136390-1-mlevitsk@redhat.com>
 <20201210125929.1136390-2-mlevitsk@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2b98f2ef-cab0-3538-dfd9-96fa4ecab0a0@redhat.com>
Date: Fri, 11 Dec 2020 21:55:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210125929.1136390-2-mlevitsk@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 13:59, Maxim Levitsky wrote:
> There is (mostly theoretical) race between removal of a scsi device and
> scsi_dma_restart_bh.
> 
> It used to be easier to hit this race prior to my / Paulo's patch series
> that added rcu to scsi bus device handling code, but IMHO this race
> should still be possible to hit, at least in theory.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1854811
> 
> Fix it anyway with a patch that was proposed by Paulo in the above bugzilla.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   hw/scsi/scsi-bus.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index b901e701f0..edb5c3492a 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -170,6 +170,8 @@ static void scsi_dma_restart_bh(void *opaque)
>           scsi_req_unref(req);
>       }
>       aio_context_release(blk_get_aio_context(s->conf.blk));
> +    /* Drop the reference that was acquired in scsi_dma_restart_cb */
> +    object_unref(OBJECT(s));
>   }
>   
>   void scsi_req_retry(SCSIRequest *req)
> @@ -188,6 +190,8 @@ static void scsi_dma_restart_cb(void *opaque, int running, RunState state)
>       }
>       if (!s->bh) {
>           AioContext *ctx = blk_get_aio_context(s->conf.blk);
> +        /* The reference is dropped in scsi_dma_restart_bh.*/
> +        object_ref(OBJECT(s));
>           s->bh = aio_bh_new(ctx, scsi_dma_restart_bh, s);
>           qemu_bh_schedule(s->bh);
>       }
> 

Queued, thanks.

Paolo


