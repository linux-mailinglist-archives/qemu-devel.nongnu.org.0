Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB577567F35
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:01:38 +0200 (CEST)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8z2V-0002Hu-MU
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8yrx-0002uz-DQ
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 02:50:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8yrr-0004Gg-EF
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 02:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657090233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKURHNN54r90cyFaxAqAgF5CKrEb9ORGLRIB7ZTQKPU=;
 b=V2mvyiogB3uhgH474tuXyToLkrAfdJpswhxKHO9IisS7H+BEX3L0WloYa+ISNF2THsKYGS
 YysWX1RdyjCMZDBW0BJruPOIC4PMjX/J4JoFtgcrpv5tCNI3qiL3u9A7X1Xxwb+NCRzlFq
 YrSBesux/SZzfdXcRQD75pMVUO8P6CI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-LigVEwB9PQi8cLhztdkC5Q-1; Wed, 06 Jul 2022 02:50:30 -0400
X-MC-Unique: LigVEwB9PQi8cLhztdkC5Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 m17-20020a05600c3b1100b003a04a2f4936so7664535wms.6
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 23:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vKURHNN54r90cyFaxAqAgF5CKrEb9ORGLRIB7ZTQKPU=;
 b=5lwRVMtClyrM1PikKCOr1DMKnlTukzZ22yyXDw4Qp8Nl3mW3kNfkDP/uYi3EhSYZHE
 E2um2w9yZOJpPb0fF8mgRx8P0hRCZtJjqNW10slZovAsSM+bEHpeJyuSmAzT0dq3P6ZC
 6XMnyjg0Ar9yJwfrFBKNhu0ca4nGRgnA+KnoPlAYX9JQoEquslS52/VQwvJe2K/A8uXq
 Iz9+9zrfL4JO4apk0oxUc1nFov1e1/4u9yQWyci4ZlP9TpLz862iroNh1r7NB+S2aBRk
 pjlpstv1kRHHVhHMd+wJhXH3eTHhv3dLvYwaa+znoktPPIfUsnnvCvCJe839E+51yT+c
 m0Gw==
X-Gm-Message-State: AJIora9RnQQi9YNkHqYWdGaEfzbppjQIfRu4mpspfjkokFKbx2oFeHuY
 LOcwoWK0dixarp7CJBEnr7X+mv159MY4o1QKhW5KAZuCfnou5DjiDIVOaHJ0KNk59pF6aL0DdFA
 +MSlgdDOr4MqUfjU=
X-Received: by 2002:adf:e786:0:b0:21d:6ec1:ee5c with SMTP id
 n6-20020adfe786000000b0021d6ec1ee5cmr9059730wrm.285.1657090229334; 
 Tue, 05 Jul 2022 23:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u2Ev/iuGG9nohbip+/UkuOjpgrjVH9gKOb59ly5aq60/LpTOg+m6jMc7ohzk1JuTXrwHSuNQ==
X-Received: by 2002:adf:e786:0:b0:21d:6ec1:ee5c with SMTP id
 n6-20020adfe786000000b0021d6ec1ee5cmr9059706wrm.285.1657090229016; 
 Tue, 05 Jul 2022 23:50:29 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 c3-20020adfef43000000b0021bab0ba755sm36127769wrp.106.2022.07.05.23.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 23:50:28 -0700 (PDT)
Message-ID: <d6c8a2e8-0db1-d541-3f06-bcf2e2938853@redhat.com>
Date: Wed, 6 Jul 2022 08:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
 (CVE-2022-0216)
Content-Language: en-US
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, fam@euphon.net, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220705200543.2366809-1-mcascell@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220705200543.2366809-1-mcascell@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2022 22.05, Mauro Matteo Cascella wrote:
> Set current_req->req to NULL to prevent reusing a free'd buffer in case of
> repeated SCSI cancel requests. Thanks to Thomas Huth for suggesting the patch.
> 
> Fixes: CVE-2022-0216
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>   hw/scsi/lsi53c895a.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index c8773f73f7..99ea42d49b 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -1028,8 +1028,9 @@ static void lsi_do_msgout(LSIState *s)
>           case 0x0d:
>               /* The ABORT TAG message clears the current I/O process only. */
>               trace_lsi_do_msgout_abort(current_tag);
> -            if (current_req) {
> +            if (current_req && current_req->req) {
>                   scsi_req_cancel(current_req->req);
> +                current_req->req = NULL;
>               }
>               lsi_disconnect(s);
>               break;

Let's hope that this will fix the issue for good...

Reviewed-by: Thomas Huth <thuth@redhat.com>


