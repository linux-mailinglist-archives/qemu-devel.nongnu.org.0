Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E63633D8
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 07:34:23 +0200 (CEST)
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lY04c-0004pR-Me
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 01:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lY02P-0003mb-FJ
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lY02K-0003uO-4r
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618723917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbtXFmG7YZtPQsMEyXkX7OJnUCKHy+ZXegoPcAo9/ug=;
 b=aNBjvvTu60W8jw6HkFneP5k/HXZHFvf0w6bNI/qKx0v7o5ukDfnNCvI6TJY54x2PqKUVzj
 jUDvTzJNi49TyKKoTDF9+p1D4rGG6rNPZ7/Ac4ZguRCXFjAT7yfidvi7+62i1X/FL5mBsI
 3/QO1PIyVyBDArdJYLMFkESKignQQsQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-bN2xsmaoMdiVKZyHqLYXtA-1; Sun, 18 Apr 2021 01:31:55 -0400
X-MC-Unique: bN2xsmaoMdiVKZyHqLYXtA-1
Received: by mail-wr1-f71.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso3575545wrf.11
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 22:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UbtXFmG7YZtPQsMEyXkX7OJnUCKHy+ZXegoPcAo9/ug=;
 b=FBOKJUCBAu7fxpB4MeyWULA4mpf4NH21o2xSsG7THWNa1SO5m2h4jEEUcNaoYvTFjT
 cfcPe9xymPQEXQvVOnIywPlX4Jmy8A2YJ5ZTBUNaBPham9X103qk1Kgdh9fI5hrbXcoc
 siqWo5/BZOthO4jpleIVqhO5R9bVSuvRC3Z3yC9MXCwvkJVYh93W+2HHZ0LC0mCkKspd
 qi1IrSJJG/jDJ6RKCn0Hri/GO3vA6WBXLulnE6tqfQwd78NXiwJVuTcwfDnDKDvILOD2
 WPpOhxZpAZyOeAQuqSFoOyl/dal8sFgParSsyt3Ego84m5LxJZwCH5MyzQfG8khGB5UR
 dWVA==
X-Gm-Message-State: AOAM532L3zi9gRPXrhGuBhhvRXrEoRhuOqfmFC97TpDHQpV6Kcbtygrs
 Vhc/3/X71aoU3HvKR/jv+Qn1nUkHV+5LkaQ3zzvCAmS2Ds6/0UVa/TgB28pboVttrJa8gm5/azF
 ovvfCMX5OPfux2go=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr7471820wrg.165.1618723914373; 
 Sat, 17 Apr 2021 22:31:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxur0K8zzhrAWZSf4bAgiYi+7p8c0DNQ4M1KXJHW+B7o9NH6ZSBo7WfB63tKqduJhlWzNy7zQ==
X-Received: by 2002:adf:c70b:: with SMTP id k11mr7471797wrg.165.1618723914193; 
 Sat, 17 Apr 2021 22:31:54 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d133sm15170750wmf.9.2021.04.17.22.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Apr 2021 22:31:53 -0700 (PDT)
Subject: Re: [PATCH-for-6.0? v2] mptsas: Remove unused MPTSASState 'pending'
 field (CVE-2021-3392)
To: qemu-devel@nongnu.org
References: <20210418053039.811996-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2ba91070-0396-57bf-ee08-987bc4e02473@redhat.com>
Date: Sun, 18 Apr 2021 07:31:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210418053039.811996-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Don Slutz <Don@CloudSwitch.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Cheolwoo Myung <cwmyung@snu.ac.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 7:30 AM, Philippe Mathieu-Daudé wrote:
> From: Michael Tokarev <mjt@tls.msk.ru>
> 
> While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
> the Megaraid emulator appends new MPTSASRequest object 'req' to
> the 's->pending' queue. In case of an error, this same object gets
> dequeued in mptsas_free_request() only if SCSIRequest object
> 'req->sreq' is initialised. This may lead to a use-after-free issue.
> 
> Since s->pending is actually not used, simply remove it from
> MPTSASState.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-Id: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>

> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
> Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")
> [PMD: Reworded description, added more tags]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Supersedes: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
> 
> MJT patch:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg799236.html
> 
> Since rc4 is soon, I'm directly respining his patch with my comments
> addressed.
> 
> This is not a new regression (present since QEMU v2.6.0) but is a
> CVE...
> 
> PJP first patch:
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg02660.html
> ---
>  hw/scsi/mptsas.h | 1 -
>  hw/scsi/mptsas.c | 4 ----
>  2 files changed, 5 deletions(-)
> 
> diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
> index b85ac1a5fcc..c046497db71 100644
> --- a/hw/scsi/mptsas.h
> +++ b/hw/scsi/mptsas.h
> @@ -79,7 +79,6 @@ struct MPTSASState {
>      uint16_t reply_frame_size;
>  
>      SCSIBus bus;
> -    QTAILQ_HEAD(, MPTSASRequest) pending;
>  };
>  
>  void mptsas_fix_scsi_io_endianness(MPIMsgSCSIIORequest *req);
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index 7416e787061..5abbc742aaf 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -257,7 +257,6 @@ static void mptsas_free_request(MPTSASRequest *req)
>          req->sreq->hba_private = NULL;
>          scsi_req_unref(req->sreq);
>          req->sreq = NULL;
> -        QTAILQ_REMOVE(&s->pending, req, next);
>      }
>      qemu_sglist_destroy(&req->qsg);
>      g_free(req);
> @@ -303,7 +302,6 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
>      }
>  
>      req = g_new0(MPTSASRequest, 1);
> -    QTAILQ_INSERT_TAIL(&s->pending, req, next);
>      req->scsi_io = *scsi_io;
>      req->dev = s;
>  
> @@ -1319,8 +1317,6 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
>  
>      s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
>  
> -    QTAILQ_INIT(&s->pending);
> -
>      scsi_bus_new(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info, NULL);
>  }
>  
> 


