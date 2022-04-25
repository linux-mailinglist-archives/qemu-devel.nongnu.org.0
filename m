Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADA250E069
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 14:34:15 +0200 (CEST)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nixuw-0001U3-9W
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 08:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nixsl-0000XY-8t
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 08:32:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nixsc-000161-PX
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 08:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650889909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PoiqvDm+iNQc26z/aVJL82Fdya/dMPVuWXphgrd7Kh0=;
 b=TV/+6N9u0u0bpEHEgVOJEM9gctPxN/ODT8pVlqEwHpr24oezc5fbj9AjuK7QBngQGot/2V
 s04CymbUiWpsm4pT1fB2a+4KNPyeFN7Odz3XFa8aYo/e3M2h1+HZLi68aAVfl4bwP/3KWJ
 R8ZRV9qEXHF/ACqs1EQXmUaMx7k2PBk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-2S7gfy5RPlSdNL2Y_eEDQg-1; Mon, 25 Apr 2022 08:31:48 -0400
X-MC-Unique: 2S7gfy5RPlSdNL2Y_eEDQg-1
Received: by mail-ej1-f72.google.com with SMTP id
 dp12-20020a170906c14c00b006e7e8234ae2so7242088ejc.2
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 05:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PoiqvDm+iNQc26z/aVJL82Fdya/dMPVuWXphgrd7Kh0=;
 b=7YVSl6XWTrw+GCM02TWVDqmrobTCf5FRSFnKzAPZDm31FBt/Ib8wp/9wQPGUuLBdN5
 mQXK97vFHlZN9lKv0jlaQsAJq1IaLvqW3eKro7LUAQScs5WoYSEZ/G0i5IXy8owW5lQ4
 XH7sLs99D0ycVaLm4aQXkZLI3SZebaN6cTpgxVwSEHxiLfNTrmQZ4b82sPg907HvEopD
 f0YycvmlxqxMf7GCSV17B0sW0DcacyZscZnakSTBzrVbdzDYDq3wM/Ue/7LR+VfzmltS
 4Tqc0qYL46CUk0gTlAEWef1FErRMEeuYFaKjVIjh31K7dRcmTG/RzLzwuFh1IQYxoDCT
 QQDQ==
X-Gm-Message-State: AOAM533BxR9JcRPzrAJ2vRIcdA5IakWT8646yXkOFNV4Nl1iH+59AWeN
 8Lq4bCzeS1kC2ANVEXpStD8o8WaLrcOdWta5KPHHG8I+Sd8iOQrFn2yE0m41fDcxukSWoTvsQnr
 wSV7B4n2QaRKYj0k=
X-Received: by 2002:a17:907:7296:b0:6e8:97c1:a7ef with SMTP id
 dt22-20020a170907729600b006e897c1a7efmr15953646ejc.262.1650889907341; 
 Mon, 25 Apr 2022 05:31:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEQhmuJsit2Q0nJmM8Nq2hsl6LPiyv1zP3LAwof3D5a3H/gM8wDCWLNiEMfELY7Izz914MUw==
X-Received: by 2002:a17:907:7296:b0:6e8:97c1:a7ef with SMTP id
 dt22-20020a170907729600b006e897c1a7efmr15953627ejc.262.1650889907060; 
 Mon, 25 Apr 2022 05:31:47 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a170906858d00b006f3a4a34612sm257654ejx.192.2022.04.25.05.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 05:31:46 -0700 (PDT)
Message-ID: <697e0e13-ed61-ec6c-b863-6959ac8e15cf@redhat.com>
Date: Mon, 25 Apr 2022 14:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 00/12] iotests: add enhanced debugging info to qemu-io
 failures
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220418211504.943969-1-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220418211504.943969-1-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.04.22 23:14, John Snow wrote:
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/iotests_qemu_io_diagnostics
>
> Howdy,
>
> This series does for qemu_io() what we've done for qemu_img() and makes
> it a function that checks the return code by default and raises an
> Exception when things do not go according to plan.
>
> This series removes qemu_io_pipe_and_status(), qemu_io_silent(), and
> qemu_io_silent_check() in favor of just qemu_io().
>
> V3:
>
> - Rebased
> - Squashed the patches that I said I would

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


