Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC449555B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:21:38 +0100 (CET)
Received: from localhost ([::1]:38804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdw9-0003te-M2
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:21:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAXeC-0002AA-Ne
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAXdl-0006XD-5Q
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642685881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Up2gH0yLl4TyxDK1pjCZixLlLwtXs1zPnEIUD78m+2o=;
 b=Vz72doPpxkslrZUmOknEayuTUxI+VojS8WBIFk8nJ+yI4wW5lJLwOr7l8mtbFMkXDljPqa
 q3rTXrpRK8WEVHMWBMSTDuCfXzDR/NUGo1zrnRcw6Yadw5iHFmZfYXOn8FI5FF8spfCHOO
 8qvLpJJu4EhHfSBge5HTjuoFbk/fNCE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-lpMMt_ALOKOABrEWXiugNA-1; Thu, 20 Jan 2022 08:37:59 -0500
X-MC-Unique: lpMMt_ALOKOABrEWXiugNA-1
Received: by mail-wm1-f70.google.com with SMTP id
 a189-20020a1c98c6000000b0034e32e18a21so559864wme.9
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 05:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Up2gH0yLl4TyxDK1pjCZixLlLwtXs1zPnEIUD78m+2o=;
 b=YB/Zr6ekPo30LNPoPKfd19yf+qe1xkjFLHUnaN1/WlV5GNX6WqPeGc6E0c810U+0ub
 x2bZ+ilF0xTNVCGsX7BQwHNdu6/+etEldZ2L9AFle5mt/Kp7tEURqAxVUu+xgc65S1iW
 0sPN4VwmSCQV/a2q7JL9Sqe2mtvWV8j4nf4WQeIKd3PWxfboV52m6D5noz9S3x/FqCUX
 MXkOKJzpeGpzye2Mlo6x8tc+HqNct5pYvSyqA6T9mNI/T+ZuWq4vmnA0ouijvxCobuiC
 YtIRHQbdmEs7fraZ52WpsBtBw9dUWYx2F+dZM/M9EBv0S9zpq5PN2w3wrNaGiOiP5dDJ
 zd0g==
X-Gm-Message-State: AOAM532NWHF7CM5mSOELgkT2cwomxYe5UpP9LJMTzMLvGME6BvU673IO
 lSpKR//J1P4tJ48CQO1U45pj+G3uQjgJ1ovxewp3QKNQegX2hkmHDl9qtHH5q834aUKk7i3eIJg
 m1yQ/AHOcBwvMAxA=
X-Received: by 2002:a7b:c317:: with SMTP id k23mr9231302wmj.20.1642685878463; 
 Thu, 20 Jan 2022 05:37:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIiPJoL/2fMa/i4KLHU654yBaVyaiZF8nITd62G4m56ZsjI4zQMeaa4RpxVUcr/83LkDC+tA==
X-Received: by 2002:a7b:c317:: with SMTP id k23mr9231264wmj.20.1642685878137; 
 Thu, 20 Jan 2022 05:37:58 -0800 (PST)
Received: from [192.168.42.76] (tmo-096-202.customers.d1-online.com.
 [80.187.96.202])
 by smtp.gmail.com with ESMTPSA id g11sm3573119wrd.53.2022.01.20.05.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 05:37:57 -0800 (PST)
Message-ID: <b00aee2c-2085-1849-f7d6-cb6d9d7926f6@redhat.com>
Date: Thu, 20 Jan 2022 14:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/6] drop libxml2 checks since libxml is not actually
 used (for parallels)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220120110545.263404-1-f4bug@amsat.org>
 <20220120110545.263404-5-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220120110545.263404-5-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Yonggang Luo <luoyonggang@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/2022 12.05, Philippe Mathieu-Daudé wrote:
> From: Michael Tokarev <mjt@tls.msk.ru>
> 
> For a long time, we assumed that libxml2 is neecessary for parallels
> block format support (block/parallels*). However, this format actually
> does not use libxml [*]. Since this is the only user of libxml2 in
> while qemu tree, we can drop all libxml2 checks and dependencies too.

s/while/whole/

> It is even more: --enable-parallels configure option was the only
> option which was silently ignored when it's (fake) dependency
> (libxml2) isn't installed.
> 
> Drop all mentions of libxml2.
> 
> [*] Actually the basis for libxml use were merged in commit 25bfd5a75
>      but the implementation was never merged:
>      https://lore.kernel.org/qemu-devel/70227bbd-a517-70e9-714f-e6e0ec431be9@openvz.org/

Commit ed279a06c53784 also add a hunk to scripts/checkpatch.pl ... you might 
want to remove that now, too.

  Thomas


