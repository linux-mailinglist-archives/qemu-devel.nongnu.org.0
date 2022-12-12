Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8948649E9F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:26:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4htL-0001fT-06; Mon, 12 Dec 2022 07:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4htJ-0001ci-3D
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:26:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4htG-0000et-H7
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670847997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0J1iA4fZ1+9C1Q06Cyz4wKoCHdmzpabHHru3fMT6Ys8=;
 b=UUmciSO5AL25BVC+IhKkkpPN4bekuFXv8rA6yqr4MYS0KsWJ97V3cPNnolkFYLfAkIfRl1
 dXNJRESWUnksGbqeMUgvS8mlakl2Rls/g4e2juFYiI2jxKkWOWpFyZ8ZnUeC4XepicRXQY
 Nxfn4HmgfQvfBCS2b+4V827ReMO1n24=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-312-Yv17MUaZMQmYyyaCpqr-kA-1; Mon, 12 Dec 2022 07:26:36 -0500
X-MC-Unique: Yv17MUaZMQmYyyaCpqr-kA-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so4098351wmb.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0J1iA4fZ1+9C1Q06Cyz4wKoCHdmzpabHHru3fMT6Ys8=;
 b=UPEfkyOXGIfGfzbd3eM5djLECJ31zWwxak/+icn79Vx4rhkQhXcYI7PMeR9EjqpQnE
 rPyX0CnzYLfVDM7Y7fPJ8aCO12avVts2XbHON3eUTSxCAUXmI1hIA6/538SiXJX/5RRN
 NMLB0yz13zZ21YJ1T+682eJhdibxG1Vu+yFeyErD/9PloFAC0Wr0P9eTxMcvC0McEP/e
 ZIZ+b1PX5au8Lm0y91koGrBMW6kWIv8Jpm/PBtta25v4i7wjY/bISQctsYp2OmhxtOcx
 FQmnJ453u0cliUA6x8HYUk+IDz6ZPdTvxH06hNWizzsyBD3ilB8imedGoGSJdyVsQnAx
 9OpA==
X-Gm-Message-State: ANoB5pmxxZEonsaXMW2xG+8KFY22MAERQvdOkELb2QEUUeFIs8Ki4h09
 DjDrm2cYrC2jylCXVeZ/0HUG5onbbcf1I67PyWK7BtUTFXF160d9UjzuIuq3iL/ZiwgBt0+DvJp
 6+dsNoWvTGgpoJYE=
X-Received: by 2002:a05:6000:16c2:b0:24d:58b3:e543 with SMTP id
 h2-20020a05600016c200b0024d58b3e543mr5222881wrf.20.1670847995008; 
 Mon, 12 Dec 2022 04:26:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5jiN4MfF1TWPdEVckkHoagCO3yEuvejDthjAMOpCZ0x0h41Wuw3SeZdol7sYqLj2iAOxsyeg==
X-Received: by 2002:a05:6000:16c2:b0:24d:58b3:e543 with SMTP id
 h2-20020a05600016c200b0024d58b3e543mr5222866wrf.20.1670847994770; 
 Mon, 12 Dec 2022 04:26:34 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 az13-20020adfe18d000000b0024228b0b932sm10847471wrb.27.2022.12.12.04.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 04:26:34 -0800 (PST)
Message-ID: <fd07821c-70d7-17cc-4420-0ae28954ad9a@redhat.com>
Date: Mon, 12 Dec 2022 13:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] FreeBSD: Upgrade to 12.4 release
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>
Cc: qemu-devel@nongnu.org
References: <Y5GJpW/1s+NEah98@humpty.home.comstyle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y5GJpW/1s+NEah98@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08/12/2022 07.52, Brad Smith wrote:
> FreeBSD: Upgrade to 12.4 release
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>   .gitlab-ci.d/cirrus.yml | 2 +-
>   tests/vm/freebsd        | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, queued to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas



