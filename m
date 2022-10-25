Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A4860D005
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:11:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLZw-0006CX-SO; Tue, 25 Oct 2022 11:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onLZk-0004nA-IK
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:10:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onLZi-0003D4-Bd
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666710639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhwd4Q7v5eH+pw/wMnlwRV2gQl1g0bZaUW/mwYv8oeI=;
 b=YcH8bOaHpx391kc+emRBu7RLtqro1oYTbtnNVYL/a8epRnBi89GFNGlm4TNSPL5sG5lUbq
 qhY/4CufuqdnawUk3NUEQiX2cqXblgGp1nrSqtUJ0jWEEY656wqmZBAUYmRIvpCZqI9YSO
 zzTPkHCwOBN0kTWmPr5dfqDAwPTUp6g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-aXEWpHcLNT-L1aqsu4p5cA-1; Tue, 25 Oct 2022 11:10:37 -0400
X-MC-Unique: aXEWpHcLNT-L1aqsu4p5cA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h18-20020adfa4d2000000b00236584fc8c7so4254267wrb.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rhwd4Q7v5eH+pw/wMnlwRV2gQl1g0bZaUW/mwYv8oeI=;
 b=kuJt5xcrpUYhxOauYREAYISMYZiA+lXAzCl905fywH8ErjuEr0TlWglrJQHiwMbyAo
 aE80Gi1vm7dCG2ZXaWA5Eo3jIU9J0yQKZ5R3vby87XbkaLFvkhgjRrRMeU4gOPVBecmT
 p7XcKWa5tQWH/NRruSiwOhCp3F+uQgXAAqHG2npk+cLjDBEHGXmgV9tv2VX8/OxK2TWF
 6+0rUkyYMBBevU9xH2NFSViFNRxXJstondPs1wwURH3yHbTYlZuzkp5CsaMBopcZX2wz
 TF4P/Pxv35XPufS0U98BKIDaMCUQ0i0eCPNZywt6faO8VtO+NgP0QOzXqvcTCbA2LTwa
 175Q==
X-Gm-Message-State: ACrzQf2YYU9Vqa5qxsw0HUWLCldw6f5HeU3/Hx69Bsq0tiYC9VUxLi3V
 NkkdeLUQJLdLT91f9Vroiff5mYot59IodaDyX40z/8dj7xDs8Ct4kNpDYUhurPoDdr/0vluADkU
 iKXlDYqUkJjlPZfs=
X-Received: by 2002:a5d:6d0b:0:b0:232:bd2e:1bf2 with SMTP id
 e11-20020a5d6d0b000000b00232bd2e1bf2mr25920151wrq.534.1666710636885; 
 Tue, 25 Oct 2022 08:10:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4bEAyaL8QvU4sIXqPT5FdrrwUKSBw/hloWev/ArFsLqlGYl6wPnvQwVXh0wUzM8+J/pwcXPg==
X-Received: by 2002:a5d:6d0b:0:b0:232:bd2e:1bf2 with SMTP id
 e11-20020a5d6d0b000000b00232bd2e1bf2mr25920130wrq.534.1666710636680; 
 Tue, 25 Oct 2022 08:10:36 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-58.web.vodafone.de.
 [109.43.176.58]) by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003c6b70a4d69sm2736206wmc.42.2022.10.25.08.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 08:10:36 -0700 (PDT)
Message-ID: <791d0182-e6ae-4db3-96f0-8b69cb33d06c@redhat.com>
Date: Tue, 25 Oct 2022 17:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] tests: Add sndio to the FreeBSD CI containers / VM
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org
References: <Yz/TeblRI77AIHJe@humpty.home.comstyle.com>
 <Y1f6dxjvD01DtXyG@humpty.home.comstyle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y1f6dxjvD01DtXyG@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/2022 17.02, Brad Smith wrote:
> tests: Add sndio to the FreeBSD CI containers / VM
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---

Thanks, queued to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas



