Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62232313F75
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:48:26 +0100 (CET)
Received: from localhost ([::1]:58606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CWH-0005MN-43
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l94uV-0007GK-R6
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:40:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l94uM-0006Ax-0F
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612784442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQIagMiXjoclfNjUnWVkdnHA3CVN8Pg04lD9F1rUqiA=;
 b=ed4pKpVkh+r0iMEM3nhsqgXrvciVNMcfeB4FRBGBwXqBG6UvTK4hOjbK/pt1CBrFXGMYOy
 kvp/DO02rWnE+qp8QY1LDvP4VgGLpKi8T293M392yrEINRA6TIgGN+CMwkNdXMdoLfTOd3
 Of8TxZ2thSur5pMtjeAAqYrGKuLXLPs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-jGdI3pRCP_GdGqXjNXs4Fg-1; Mon, 08 Feb 2021 06:40:39 -0500
X-MC-Unique: jGdI3pRCP_GdGqXjNXs4Fg-1
Received: by mail-wm1-f71.google.com with SMTP id y9so8369538wmi.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:40:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CQIagMiXjoclfNjUnWVkdnHA3CVN8Pg04lD9F1rUqiA=;
 b=L8zNFQlvTbk23Mb4z43ow97+5lZUvZ2OsG/iX4ujlFIZEiIB6Y0vcGyAl0hJh9pq13
 jHGAe8qj5YGKfrdn/M1wmNzaYzEBRewTo2tk32E+UhRWlCW2Cl8Gy8ba+fbB3pH57Rir
 dBLTK7gMvNovI+6kuqtnlLwDr943+cllr7pxaP1jF6dtOPeUjEzOeSTsBF2FcbiRwf5B
 Nk0ortvwa12BbZmruMkTgleafPmJk4jHz8zDUhXKnql0pGQdYXbBtRsFg+70HPU+uGTE
 hTjzQfprFIeqh3f/uFnmmTR/krrRxTSML5RPNao4xkc/9JYG5lPvPKrbcLZaUAeC4BMC
 kNPw==
X-Gm-Message-State: AOAM5307aekHLLCcdyE1BkQI6h/12w0Ljk8j2n9mCMYmfBPQkkg2Pmwr
 H68yJJgJ3Ytino6YewSuAeKHBnQ5aD7TlaYCwWN7o0rOFJ1ECWExt+bW1jmtgDPprTGifNdc41q
 Z4p5o0RB+tVIjRZU=
X-Received: by 2002:a5d:6b87:: with SMTP id n7mr6650342wrx.222.1612784436539; 
 Mon, 08 Feb 2021 03:40:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycxs7vGb1Hf0QsOqMVMvKFeT1LlLNeY1jFRr+HMMPINoxa3u9+FZJbVv8TMfPC9TgfGWUNQw==
X-Received: by 2002:a5d:6b87:: with SMTP id n7mr6650323wrx.222.1612784436378; 
 Mon, 08 Feb 2021 03:40:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id x15sm11430781wro.66.2021.02.08.03.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 03:40:35 -0800 (PST)
Subject: Re: [PATCH] scsi: mptsas: dequeue request object in case of an error
 (CVE-2021-3392)
To: P J P <ppandit@redhat.com>
References: <20210202132103.1096654-1-ppandit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5d72e28a-c6fc-6cb3-d491-84d7dfed01b8@redhat.com>
Date: Mon, 8 Feb 2021 12:40:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202132103.1096654-1-ppandit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Cheolwoo Myung <cwmyung@snu.ac.kr>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/02/21 14:21, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
> the Megaraid emulator appends new MPTSASRequest object 'req' to
> the 's->pending' queue. In case of an error, this same object gets
> dequeued in mptsas_free_request() only if SCSIRequest object
> 'req->sreq' is initialised. This may lead to a use-after-free issue.
> Unconditionally dequeue 'req' object from 's->pending' to avoid it.
> 
> Fixes: CVE-2021-3392
> Buglink: https://bugs.launchpad.net/qemu/+bug/1914236
> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>   hw/scsi/mptsas.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index f86616544b..adff5b0bf2 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -257,8 +257,8 @@ static void mptsas_free_request(MPTSASRequest *req)
>           req->sreq->hba_private = NULL;
>           scsi_req_unref(req->sreq);
>           req->sreq = NULL;
> -        QTAILQ_REMOVE(&s->pending, req, next);
>       }
> +    QTAILQ_REMOVE(&s->pending, req, next);
>       qemu_sglist_destroy(&req->qsg);
>       g_free(req);
>   }
> 

s->pending is not used for anything, it can just be removed.

Paolo


