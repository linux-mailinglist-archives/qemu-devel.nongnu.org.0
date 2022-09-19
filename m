Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D955BCCB5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:14:19 +0200 (CEST)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGbJ-0006B5-AB
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaGSm-0001Uc-Nx
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaGSk-0003oG-N0
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663592725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afkzLuTgLgDMW1GgWiE0pKmudqANO9rjXmaeRA6010M=;
 b=ScKgvnEBqjUWDgA1xIBryIE5ck5+vPeJFfidUXU44YpB+Q9kJvO59I0HBtUE6cnFiKSz0L
 5LM7u5a1J9gELljVL8Tj06c17Nb9pHbXyzHDeqAnekIIlw4DUiTAD5lQyqB3Zn8xwBDZ7w
 BAIK5TNo5McCc2zLzDxboEWn0Hw95kM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-uZ9dGmhjMBO1DKWpWDjCqA-1; Mon, 19 Sep 2022 09:05:19 -0400
X-MC-Unique: uZ9dGmhjMBO1DKWpWDjCqA-1
Received: by mail-wm1-f70.google.com with SMTP id
 14-20020a05600c228e00b003b4d065282dso1184811wmf.8
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 06:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=afkzLuTgLgDMW1GgWiE0pKmudqANO9rjXmaeRA6010M=;
 b=j7kU1BZ5BheP4c0RcKaMoGcfO76+8yR7b7cB3m1mxKA8em5bW1xhRwIAZy492uN+LO
 SrATLaj+aM7nUSb2FcotGJIl33eRnw5ymxRvyl2ve2PGjqiSwF8xt+6Iw/kCsl/073dr
 /Vuztggvc9WalxJgfB6TF0R7NAz4JPlU/YlxwWkgmwZgrX5d7V6MSYwKBYICXgxtiddf
 dKzHhZnK0vwvBtwGyLbWy0pXC7ZPjrtokDmVP3HoH8HKlVCiflL/kZQpdeIJNA47Ik8j
 KxHNcdsHAMdTiq9r55GHkpEUSz2w22XDRm3jWrFMLXB7OVV8ajJgbMFNawr+Z16gPruN
 1iog==
X-Gm-Message-State: ACrzQf1mDtcM/qjd+PtNxmuQJhVNhxYqKcWjrHe2PsPRE9WPa+hfwINe
 U02NNOSj6D9CMP2dsiTV7Ye99430GPSdGr5Hf9pJ3DmIGpfD9IYhq31kcnxm3EzKero9/9NRr/6
 oX0EdtEL9oQEuf4U=
X-Received: by 2002:a05:600c:3515:b0:3b4:a0fa:c4e1 with SMTP id
 h21-20020a05600c351500b003b4a0fac4e1mr12382884wmq.191.1663592718583; 
 Mon, 19 Sep 2022 06:05:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM75pyMjHbawQtKd8Z7hUb+aNOi+359t+q3+CCbLr/3qsQclzCMU79QDPDKeUSgp2fH+zSzOOQ==
X-Received: by 2002:a05:600c:3515:b0:3b4:a0fa:c4e1 with SMTP id
 h21-20020a05600c351500b003b4a0fac4e1mr12382873wmq.191.1663592718402; 
 Mon, 19 Sep 2022 06:05:18 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-127.web.vodafone.de.
 [109.43.177.127]) by smtp.gmail.com with ESMTPSA id
 f17-20020a7bcd11000000b003a4efb794d7sm13822010wmj.36.2022.09.19.06.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 06:05:17 -0700 (PDT)
Message-ID: <23707701-c7a2-0f46-8146-71218b17534b@redhat.com>
Date: Mon, 19 Sep 2022 15:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tests/vm: update NetBSD to 9.3
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <YxacoSbT1cZR4SKr@humpty.home.comstyle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YxacoSbT1cZR4SKr@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.952, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06/09/2022 03.04, Brad Smith wrote:
> tests/vm: update NetBSD to 9.3
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>   tests/vm/netbsd | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
> index da6773ff59..aa54338dfa 100755
> --- a/tests/vm/netbsd
> +++ b/tests/vm/netbsd
> @@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
>       name = "netbsd"
>       arch = "x86_64"
>   
> -    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.2/images/NetBSD-9.2-amd64.iso"
> -    csum = "5ee0ea101f73386b9b424f5d1041e371db3c42fdd6f4e4518dc79c4a08f31d43091ebe93425c9f0dcaaed2b51131836fe6774f33f89030b58d64709b35fda72f"
> +    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.3/images/NetBSD-9.3-amd64.iso"
> +    csum = "2bfce544f762a579f61478e7106c436fc48731ff25cf6f79b392ba5752e6f5ec130364286f7471716290a5f033637cf56aacee7fedb91095face59adf36300c3"
>       size = "20G"
>       pkgs = [
>           # tools

Tested-by: Thomas Huth <thuth@redhat.com>

I can pick this up for my next "testing"-related pull request.


