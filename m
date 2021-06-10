Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EDA3A284E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:32:13 +0200 (CEST)
Received: from localhost ([::1]:59414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrH2q-0007em-TU
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lrH0T-0005TQ-2f
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lrH0P-0005Hh-Gi
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623317380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0gNvtmbbb7KNE1PLgn1t0NbsyPs5daRuSHxqgJsDyQ=;
 b=UKdRPgTJDKjvWSCMJRwQWdONHKw/0jxODeV7TB24vB+cjzGGpIArMWt7pNIli81hCSB0WH
 qui7xWx1a1hlRr+N1nP/MKMEE6DhjhTAYJCgLd2O1jMSnrMFPsUnhT11ogXokW+DkCdJqf
 McW6DPzDtYHDhTZtQj3gbj0FUP91omc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-oE5x40NRMfCFZbR2GmdVtA-1; Thu, 10 Jun 2021 05:29:39 -0400
X-MC-Unique: oE5x40NRMfCFZbR2GmdVtA-1
Received: by mail-wr1-f71.google.com with SMTP id
 n4-20020a5d42040000b0290119fef97609so594858wrq.18
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 02:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H0gNvtmbbb7KNE1PLgn1t0NbsyPs5daRuSHxqgJsDyQ=;
 b=fXnEw4XqCoDFFpELmQhFG831krdHJkTa5uOlp7bVJY7vKCy40AAbv4Q7KE2gbRqFQG
 OrhizY2n490yy6NPjbWWiiOXa3hUywKqB/QG3AgoCJlFCLbDQZvllpPnyIhNBB++9zTD
 1yT3DUV8ifPRVrHMKGSNnk0Z6BmI0vLdK9NyizScFt/5G3oR0RD7gDEQahtQQLuPDEZn
 gHR96H1qqwKo5NtBKgaFK++BmIa8OuMKTeNLYjXWZvRf1oDFckG63fDcSaXxGW6GER9i
 wBGh+eIC/uJjzBILaUgwqOXEvtvs1CyjSnzbH67H4ivVeDmq1hkBlJtqDRAEyXgVllQr
 kYdA==
X-Gm-Message-State: AOAM5300hMFw2es6yW9LB6Z4TyDsMcKgxiD+Vbk01he9qq4X8pf37bHz
 sJFTkj5V+hCT5lWHMv6FBL8O+fO+OzneaGvzDMmIAHFmLr3yi3CDLo4xvWXELBOH8slj+vVYqMx
 1NXfMb/H9IpsybZM=
X-Received: by 2002:a5d:570d:: with SMTP id a13mr4177392wrv.239.1623317377924; 
 Thu, 10 Jun 2021 02:29:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2RSpLCf/6Cf4P1G2e8+PIP0viLz7BcgSRo7xSDErJAW1NFyM4bSCOJuqQFECY1T01E7IMZA==
X-Received: by 2002:a5d:570d:: with SMTP id a13mr4177374wrv.239.1623317377725; 
 Thu, 10 Jun 2021 02:29:37 -0700 (PDT)
Received: from thuth.remote.csb (pd9e839fb.dip0.t-ipconnect.de.
 [217.232.57.251])
 by smtp.gmail.com with ESMTPSA id x18sm2835183wrw.19.2021.06.10.02.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 02:29:37 -0700 (PDT)
Subject: Re: [PATCH] qemu-option: Drop dead assertion
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210610085026.436081-1-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <deea178f-ea30-e2ca-4d0e-61a8c02b3b67@redhat.com>
Date: Thu, 10 Jun 2021 11:29:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210610085026.436081-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/06/2021 10.50, Markus Armbruster wrote:
> Commit c6ecec43b2 "qemu-option: Check return value instead of @err
> where convenient" simplified
> 
>      opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1,
>                              &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return NULL;
>      }
> 
> to
> 
>      opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1, errp);
>      if (!opts) {
>          return NULL;
>      }
> 
> but neglected to delete
> 
>      assert(opts != NULL);
> 
> Do that now.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   util/qemu-option.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/util/qemu-option.c b/util/qemu-option.c
> index 4944015a25..3fa0b13378 100644
> --- a/util/qemu-option.c
> +++ b/util/qemu-option.c
> @@ -1028,8 +1028,6 @@ QemuOpts *qemu_opts_from_qdict(QemuOptsList *list, const QDict *qdict,
>           return NULL;
>       }
>   
> -    assert(opts != NULL);
> -
>       for (entry = qdict_first(qdict);
>            entry;
>            entry = qdict_next(qdict, entry)) {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


