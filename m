Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB065659EA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:34:45 +0200 (CEST)
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8O5z-0000hS-8H
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8NxI-0001Rc-Da
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:25:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8NxH-0002pX-2w
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdwV0i3pp/O5D1ueTaHXCkIXBIZUnDG/PtXrT8rgM0I=;
 b=iVfV9K5BH02FNPDuZG/QtV0Mhkb9GkJEeORk2ODPK7CdZgI1Bu7xTqUXsJ74R5DWZt1KJh
 adC+Mb1SfhAu4jVPwtIR9VnaOjUDf8jEny7MYVstAzi5i/AodL2lRs60GDVCRitWsYSqoI
 fPfa8aOvk+SSm7DY1dn96Pw6FpMcQ1U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-vqpvRZ0JMp-oSdWjyW9hAA-1; Mon, 04 Jul 2022 11:25:41 -0400
X-MC-Unique: vqpvRZ0JMp-oSdWjyW9hAA-1
Received: by mail-ed1-f69.google.com with SMTP id
 f13-20020a0564021e8d00b00437a2acb543so7361650edf.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vdwV0i3pp/O5D1ueTaHXCkIXBIZUnDG/PtXrT8rgM0I=;
 b=LnhCWIysCxrvuJR/R1ls0/4+KIhBG0rx22F5hECJU2ZOlYwsvvMPnVoQrKUt6ZprsQ
 BaTtAjv65c66SUOWpw9Q+1Dq4EYtF3OzmcJS9WkCAasYohqXnpYwxgz1cbill3q5vGt2
 SxNWQjj5PTEfgC3Gv+Cv6ebVDhG22Y4Y1Ef7Sqc8dm/OlcCOsF8sD+O6wElJeVdIye5W
 6MKPQLIylXIQWFcudbvWgYNOi96AIKJ+bSfh6s9Q3nje8v8Lt4W8ThvJJLLUufZ/U2Ya
 WnNOsauw6nXORZnQGu7/uRKdJAS5lZiypOBHVIVA7WYwUuzhkpaTVja+RZwHmzxZasK9
 bWYA==
X-Gm-Message-State: AJIora8qSYvf9gx9YTImhziofDWUevPv9ebBf3FaBRcSlKYcCt7EVdrM
 6d7sq/aa8RlLuFcBuE/63d2oYpSd5VaZwNHJivj91uA84U9ckONoYwmspJ/e0a/SuReCwxxhE3+
 VbfGTZN0Rtryn1f8=
X-Received: by 2002:a05:6402:1e95:b0:437:ce7f:e17a with SMTP id
 f21-20020a0564021e9500b00437ce7fe17amr39005487edf.169.1656948340396; 
 Mon, 04 Jul 2022 08:25:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t/CtHX0WL84wvfAd2rKH3bVD8U9hPm5E4HVe7CSHGV7lBhIorCENZ3EUt6/1uIGfSq1oqu/g==
X-Received: by 2002:a05:6402:1e95:b0:437:ce7f:e17a with SMTP id
 f21-20020a0564021e9500b00437ce7fe17amr39005467edf.169.1656948340206; 
 Mon, 04 Jul 2022 08:25:40 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 ek5-20020a056402370500b0043a253973aasm3270566edb.10.2022.07.04.08.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 08:25:39 -0700 (PDT)
Message-ID: <9f766113-d72d-b666-ad83-cc1e6669d757@redhat.com>
Date: Mon, 4 Jul 2022 17:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 05/18] block: Make blk_co_pwrite() take a const buffer
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-1-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113837.199696-1-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17.05.22 13:38, Alberto Faria wrote:
> It does not mutate the buffer.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   include/sysemu/block-backend-io.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


