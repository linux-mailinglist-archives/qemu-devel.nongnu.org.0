Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B1D60CF38
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 16:40:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onL30-0002Lf-7j; Tue, 25 Oct 2022 10:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onL2y-0002Kt-19
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 10:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onL2w-0005w2-Gs
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 10:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666708608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATF6Kc3YZD7oBiD20/4XA0RK19rj0UKalxg7Rq6Hyfs=;
 b=FKw7hMi2Z0pjOj7gdfKXnNI7WT0VbApmZZEmrijJ14Qf/wzM5boPVc2ygp7Mrpm+mD2OJf
 2AeuLznJeAoDiAacwX0Gh3XB+KRcZsTTUg1OVDR/5sMim0aTNTx9E3bYQrxF7vxUVIb16s
 jAaPYNGBZrFyg8QnYdz8SbWQ8iLz4Zg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-E1G8YScHOQCT2GM-qzg6vw-1; Tue, 25 Oct 2022 10:36:45 -0400
X-MC-Unique: E1G8YScHOQCT2GM-qzg6vw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso3486047wrb.18
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 07:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ATF6Kc3YZD7oBiD20/4XA0RK19rj0UKalxg7Rq6Hyfs=;
 b=KHRmEpMB2uBcf0lPK+vSeejTw1c/lirD/LWaEVmnTAefDLm8hYyRla192DQugMgok3
 tcxhASNUYHz4xi0sz5QM3piqPa1rcFjYy6aJcYnDV1W8g5VZiadRaGSrI4eryVtLVmjd
 1pOjbGAPdqxrEwLnevBSJHNFxzOYw4+FKq7SaE6JLwsDiq2juXiYIEUEBFKig8aBAe5y
 omvb3GycS4YNTbN3LXJHXqHdve8r/n6PGJv+3Lc+MBCmjyAxKx685uDdSCJlaeu6rM5j
 kjcP5UH8Rr/yNY8y9OdaGr9X4TgOh+k4Y9moe0qAZ3ZUCqlqWSRiqZHCXJ84XUFVgyy5
 t59g==
X-Gm-Message-State: ACrzQf1n+hSVdVFtMm1VrZU/RMjqyDn/X/Xaz6qpwS5AieQfoOmizuuX
 E/kCP9cNiGKfiv079PBf9loncUdjnXmkQyHF3FA55Jw4jVGiKS45jfrWCL7aFBg4w+xTGWYOdzr
 ZJkLTJ5rkuhq3QTE=
X-Received: by 2002:a05:6000:2a6:b0:22e:ddd1:d9ff with SMTP id
 l6-20020a05600002a600b0022eddd1d9ffmr24561805wry.447.1666708604680; 
 Tue, 25 Oct 2022 07:36:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4lU6BTbgCQAUQdo5SD5atsgX3OczSjeou/b4GexoHElqJ/M/KPQMhBOG+VJiKwlkpgwKbxPw==
X-Received: by 2002:a05:6000:2a6:b0:22e:ddd1:d9ff with SMTP id
 l6-20020a05600002a600b0022eddd1d9ffmr24561784wry.447.1666708604426; 
 Tue, 25 Oct 2022 07:36:44 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-58.web.vodafone.de.
 [109.43.176.58]) by smtp.gmail.com with ESMTPSA id
 p20-20020a1c5454000000b003a5f3f5883dsm11219420wmi.17.2022.10.25.07.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 07:36:43 -0700 (PDT)
Message-ID: <0c946fe0-930e-7cc9-0f72-b16f3b2587e3@redhat.com>
Date: Tue, 25 Oct 2022 16:36:42 +0200
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
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yz/TeblRI77AIHJe@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/10/2022 09.21, Brad Smith wrote:
> tests: Add sndio to the FreeBSD CI containers / VM
> 
> ---

Patch description is missing "Signed-off-by" line ... to follow our QEMU 
development process, could you please reply with such a line to this mail? 
Thanks!

  Thomas


